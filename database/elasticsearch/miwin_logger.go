package elasticsearch

import (
	"context"

	"github.com/mimokpl/kratos-bootstrap/logger"
	miwinlog "github.com/mimokpl/miwin/log"
)

// miwinLogger 把项目 logger.Logger 适配为 go-crud 依赖的 miwin/log.Logger。
type miwinLogger struct{ l logger.Logger }

func asMiwinLogger(l logger.Logger) miwinlog.Logger {
	if l == nil {
		return miwinlog.GetLogger()
	}
	return miwinLogger{l: l}
}

func (m miwinLogger) Debug(ctx context.Context, msg string, args ...any) { m.l.Debug(ctx, msg, args...) }
func (m miwinLogger) Info(ctx context.Context, msg string, args ...any)  { m.l.Info(ctx, msg, args...) }
func (m miwinLogger) Warn(ctx context.Context, msg string, args ...any)  { m.l.Warn(ctx, msg, args...) }
func (m miwinLogger) Error(ctx context.Context, msg string, args ...any) { m.l.Error(ctx, msg, args...) }
func (m miwinLogger) Enabled(miwinlog.Level) bool                        { return true }
func (m miwinLogger) With(args ...any) miwinlog.Logger                   { return miwinLogger{l: m.l.With(args...)} }
