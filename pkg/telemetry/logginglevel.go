package telemetry

import "log/slog"

type LoggingLevel struct {
	debug *bool
}

func (l *LoggingLevel) Level() slog.Level {
	if *l.debug {
		return slog.LevelDebug
	}
	return slog.LevelInfo
}

func NewLoggingLevel(debug bool) *LoggingLevel {
	return &LoggingLevel{debug: &debug}
}
