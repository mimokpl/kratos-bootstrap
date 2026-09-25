package logger

import (
	"context"
	"fmt"
	"os"
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
