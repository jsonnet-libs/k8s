package telemetry

import (
	"fmt"
	"log/slog"
)

func NewRestyLogger(l *slog.Logger) *RestyLogger {
	return &RestyLogger{slogLogger: l}
}

type RestyLogger struct {
	slogLogger *slog.Logger
}

func (l *RestyLogger) Errorf(format string, v ...any) {
	l.slogLogger.Error(fmt.Sprintf(format, v...))
}

func (l *RestyLogger) Warnf(format string, v ...any) {
	l.slogLogger.Warn(fmt.Sprintf(format, v...))
}

func (l *RestyLogger) Debugf(format string, v ...any) {
	l.slogLogger.Debug(fmt.Sprintf(format, v...))
}
