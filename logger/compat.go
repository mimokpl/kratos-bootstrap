package logger

import (
	"log/slog"
	"context"
	"fmt"
	"os"
	"runtime"
	"time"
)

// ============================================================================
// 兼容 kratos v2 log 的包级便捷函数（历史代码迁移用）。
// 全部基于当前全局 Logger（SetLogger / GetLogger）。
// ============================================================================

// Debug 使用全局 Logger 输出 DEBUG 日志。
func Debug(args ...any) { GetLogger().Debug(context.Background(), fmt.Sprint(args...)) }

// Info 使用全局 Logger 输出 INFO 日志。
func Info(args ...any) { GetLogger().Info(context.Background(), fmt.Sprint(args...)) }

// Warn 使用全局 Logger 输出 WARN 日志。
func Warn(args ...any) { GetLogger().Warn(context.Background(), fmt.Sprint(args...)) }

// Error 使用全局 Logger 输出 ERROR 日志。
func Error(args ...any) { GetLogger().Error(context.Background(), fmt.Sprint(args...)) }

// Debugf 使用全局 Logger 格式化输出 DEBUG 日志。
func Debugf(format string, args ...any) {
	GetLogger().Debug(context.Background(), fmt.Sprintf(format, args...))
}

// Infof 使用全局 Logger 格式化输出 INFO 日志。
func Infof(format string, args ...any) {
	GetLogger().Info(context.Background(), fmt.Sprintf(format, args...))
}

// Warnf 使用全局 Logger 格式化输出 WARN 日志。
func Warnf(format string, args ...any) {
	GetLogger().Warn(context.Background(), fmt.Sprintf(format, args...))
}

// Errorf 使用全局 Logger 格式化输出 ERROR 日志。
func Errorf(format string, args ...any) {
	GetLogger().Error(context.Background(), fmt.Sprintf(format, args...))
}

// Fatal 输出 FATAL 日志并退出进程。
func Fatal(args ...any) { Error(args...); os.Exit(1) }

// Fatalf 格式化输出 FATAL 日志并退出进程。
func Fatalf(format string, args ...any) { Errorf(format, args...); os.Exit(1) }

// With 返回附加了 key-value 对的 Logger（兼容 kratos v2 log.With）。
func With(l Logger, keyvals ...any) Logger {
	if l == nil {
		l = GetLogger()
	}
	return l.With(keyvals...)
}

// DefaultLogger 兼容 kratos v2 的默认 Logger。
var DefaultLogger Logger = NewStdLogger()

// Fatalf 格式化输出 FATAL 日志并退出进程（Helper 版本）。
func (h *Helper) Fatalf(format string, args ...any) {
	h.Error(context.Background(), fmt.Sprintf(format, args...))
	os.Exit(1)
}

// Fatal 输出 FATAL 日志并退出进程（Helper 版本）。
func (h *Helper) Fatal(args ...any) {
	h.Error(context.Background(), fmt.Sprint(args...))
	os.Exit(1)
}


// ============================================================================
// 兼容 kratos v2 log 的其余符号
// ============================================================================

// Valuer 延迟求值的日志字段（兼容 kratos v2 log.Valuer）。
type Valuer func(ctx context.Context) any

// DefaultMessageKey 是消息体在 keyvals 中的默认 key（与 kratos v2 一致）。
const DefaultMessageKey = "msg"

// DefaultTimestamp 返回当前时间字符串。
var DefaultTimestamp = func(_ context.Context) any {
	return time.Now().Format("2006-01-02T15:04:05.000Z07:00")
}

// DefaultCaller 返回调用方文件:行号。
var DefaultCaller = func(_ context.Context) any {
	if _, file, line, ok := runtime.Caller(3); ok {
		return fmt.Sprintf("%s:%d", file, line)
	}
	return ""
}

// Log 使用全局 Logger 按 level 输出 keyvals。
func Log(level Level, keyvals ...any) {
	l := GetLogger()
	msg, rest := splitMsg(keyvals)
	switch level {
	case LevelDebug:
		l.Debug(context.Background(), msg, rest...)
	case LevelInfo:
		l.Info(context.Background(), msg, rest...)
	case LevelWarn:
		l.Warn(context.Background(), msg, rest...)
	case LevelError:
		l.Error(context.Background(), msg, rest...)
	case LevelFatal:
		l.Error(context.Background(), msg, rest...)
		os.Exit(1)
	default:
		l.Info(context.Background(), msg, rest...)
	}
}

// Errorw 使用全局 Logger 输出 ERROR 级别的 keyvals。
func Errorw(keyvals ...any) { Log(LevelError, keyvals...) }

// Warnw 使用全局 Logger 输出 WARN 级别的 keyvals。
func Warnw(keyvals ...any) { Log(LevelWarn, keyvals...) }

// Infow 使用全局 Logger 输出 INFO 级别的 keyvals。
func Infow(keyvals ...any) { Log(LevelInfo, keyvals...) }

// Debugw 使用全局 Logger 输出 DEBUG 级别的 keyvals。
func Debugw(keyvals ...any) { Log(LevelDebug, keyvals...) }

// Fatalw 使用全局 Logger 输出 FATAL 级别的 keyvals 并退出。
func Fatalw(keyvals ...any) { Log(LevelFatal, keyvals...) }

// splitMsg 从 keyvals 中提取 msg 与剩余字段。
func splitMsg(keyvals []any) (string, []any) {
	msg := ""
	rest := make([]any, 0, len(keyvals))
	for i := 0; i+1 < len(keyvals); i += 2 {
		if k, ok := keyvals[i].(string); ok && k == DefaultMessageKey {
			if s, ok := keyvals[i+1].(string); ok {
				msg = s
			}
			continue
		}
		rest = append(rest, keyvals[i], keyvals[i+1])
	}
	if msg == "" && len(keyvals) > 0 {
		msg = fmt.Sprint(keyvals...)
		rest = rest[:0]
	}
	return msg, rest
}


// ============================================================================
// 项目 Logger → *slog.Logger（供 kratos v3 的 App / middleware 使用）
// ============================================================================

type slogAdapter struct {
	l     Logger
	attrs []any
}

var _ slog.Handler = (*slogAdapter)(nil)

func (h *slogAdapter) Enabled(context.Context, slog.Level) bool { return true }

func (h *slogAdapter) Handle(ctx context.Context, r slog.Record) error {
	kvs := make([]any, 0, len(h.attrs)+r.NumAttrs()*2)
	kvs = append(kvs, h.attrs...)
	r.Attrs(func(a slog.Attr) bool {
		kvs = append(kvs, a.Key, a.Value.Any())
		return true
	})
	switch {
	case r.Level >= slog.LevelError:
		h.l.Error(ctx, r.Message, kvs...)
	case r.Level >= slog.LevelWarn:
		h.l.Warn(ctx, r.Message, kvs...)
	case r.Level >= slog.LevelInfo:
		h.l.Info(ctx, r.Message, kvs...)
	default:
		h.l.Debug(ctx, r.Message, kvs...)
	}
	return nil
}

func (h *slogAdapter) WithAttrs(attrs []slog.Attr) slog.Handler {
	next := &slogAdapter{l: h.l, attrs: append([]any{}, h.attrs...)}
	for _, a := range attrs {
		next.attrs = append(next.attrs, a.Key, a.Value.Any())
	}
	return next
}

func (h *slogAdapter) WithGroup(string) slog.Handler { return h }

// AsSlogLogger 将项目 Logger 适配为 *slog.Logger（用于 kratos v3）。
func AsSlogLogger(l Logger) *slog.Logger {
	if l == nil {
		return slog.Default()
	}
	if s, ok := l.(*stdLogger); ok && s.l != nil {
		return s.l
	}
	return slog.New(&slogAdapter{l: l})
}
