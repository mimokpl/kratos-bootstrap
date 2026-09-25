package logger

import (
	"fmt"
	"sort"
	"strings"

	conf "github.com/mimokpl/kratos-bootstrap/api/gen/go/conf/v1"
)

// NewLogger 动态创建日志实例，返回项目 Logger 接口。
//
// 内部通过工厂注册表查找后端（zap/logrus/fluent 等）。
func NewLogger(cfg *conf.Logger) (Logger, error) {
	if cfg == nil {
		return nil, nil
	}

	if cfg.GetType() == "" || cfg.GetType() == string(Std) {
		return NewStdLogger(), nil
	}

	// normalize to lower case for lookup
	typ := Type(strings.ToLower(cfg.GetType()))

	f, ok := GetFactory(typ)
	if !ok {
		available := ListFactories()
		strs := make([]string, 0, len(available))
		for _, t := range available {
			strs = append(strs, string(t))
		}
		sort.Strings(strs)
		return nil, fmt.Errorf("unsupported logger type: %s; available: %v", typ, strs)
	}

	lg, err := f(cfg)
	if err != nil {
		return nil, fmt.Errorf("create logger %s: %w", typ, err)
	}
	if lg == nil {
		return nil, fmt.Errorf("logger factory %s returned nil logger", typ)
	}
	return lg, nil
}

// NewLoggerProvider 创建一个新的日志记录器提供者，返回项目 Logger 接口。
// 它会从 cfg 创建具体 logger（通过 NewLogger），并为 logger 附加一组标准字段
// （service.*, ts, caller）。
// 实现是防御性的：当 cfg 或 appInfo 为空或 NewLogger 返回 nil/err 时，
// 会回退到标准控制台 logger。
func NewLoggerProvider(cfg *conf.Logger, appInfo *conf.AppInfo) Logger {
	var l Logger
	if cfg == nil || cfg.GetType() == "" {
		l = NewStdLogger()
	} else {
		if lg, err := NewLogger(cfg); err == nil && lg != nil {
			l = lg
		} else {
			l = NewStdLogger()
		}
	}

	fields := []any{
		"ts", DefaultTimestamp,
		"caller", DefaultCaller,
	}

	if appInfo != nil {
		fields = append([]any{
			"service.id", appInfo.GetAppId(),
			"service.instance", appInfo.GetInstanceId(),
			"service.version", appInfo.GetVersion(),
		}, fields...)
	}

	l = l.With(fields...)

	// 自动注入 trace_id / span_id（从 Logger 接口的 ctx 参数提取）
	return WrapTrace(l)
}
