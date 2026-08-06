package cmd

import (
	"context"
	"log/slog"
	"maps"
	"os"
	"path/filepath"

	"github.com/jsonnet-libs/k8s/pkg/config"
	"github.com/jsonnet-libs/k8s/pkg/model"
	"github.com/jsonnet-libs/k8s/pkg/swagger"
	"github.com/jsonnet-libs/k8s/pkg/telemetry"
	"github.com/jsonnet-libs/k8s/pkg/util"
	"github.com/jsonnet-libs/k8s/pkg/writer"
	"github.com/mdobak/go-xerrors"
	"github.com/urfave/cli/v3"
)

func NewRootCommand() *cli.Command {
	// command
	cmd := &cli.Command{
		Name:        "k8s-gen",
		Usage:       "k8s-gen [versions] --config <config.yml> --output <output-dir>",
		Description: "k8s-gen generates the Jsonnet Kubernetes library from OpenAPI specs",
	}

	// flags
	cmd.Flags = append(cmd.Flags, &cli.StringFlag{
		Name:  "config",
		Value: "config.json",
		Usage: "json config file",
	})
	cmd.Flags = append(cmd.Flags, &cli.StringFlag{
		Name:  "output",
		Value: ".",
		Usage: "output directory for generated libraries",
	})
	cmd.Flags = append(cmd.Flags, &cli.BoolFlag{
		Name:  "debug",
		Value: false,
		Usage: "debug logging",
	})

	// before: set logger
	cmd.Before = func(ctx context.Context, c *cli.Command) (context.Context, error) {
		// logging
		opts := slog.HandlerOptions{
			AddSource: false,
			Level:     telemetry.NewLoggingLevel(c.Bool("debug")),
		}
		l := slog.New(slog.NewTextHandler(os.Stdout, &opts))
		slog.SetDefault(l)

		return ctx, nil
	}

	// action
	cmd.Action = func(ctx context.Context, c *cli.Command) error {
		// parse config
		configFile := c.String("config")
		config, err := config.Load(configFile)
		if err != nil {
			panic(err)
		}
		slog.Debug("loaded config file", slog.String("file", configFile))

		// inform user of filtering
		if len(c.Arguments) > 0 {
			slog.Info("filtering generation to listed versions", slog.Any("versions", c.Arguments[0]))
		}

		// generate all specs in config
		for _, t := range config.Specs {
			if len(c.Arguments) > 0 && !util.HasStr(c.Arguments, t.Output) {
				slog.Debug("skipping version", slog.String("version", t.Output))
				continue
			}

			swaggerDefs := make(swagger.Definitions)
			if len(t.Crds) > 0 {
				for _, url := range t.Crds {
					slog.Info("generating spec",
						slog.String("version", t.Output),
						slog.String("spec", url),
						slog.String("prefix", t.Prefix),
					)

					loadedDefs, err := swagger.Load(&swagger.CRDLoader{}, url)
					if err != nil {
						return xerrors.New("unable to load spec", err)
					}
					maps.Copy(swaggerDefs, loadedDefs)
				}
			} else {
				slog.Info("generating spec",
					slog.String("version", t.Output),
					slog.String("spec", t.Openapi),
					slog.String("prefix", t.Prefix),
				)

				loadedDefs, err := swagger.Load(&swagger.SwaggerLoader{}, t.Openapi)
				if err != nil {
					return xerrors.New("unable to load spec", err)
				}
				swaggerDefs = loadedDefs
			}

			groups := model.Load(&swaggerDefs, t.Prefix)
			path := filepath.Join(c.String("output"), t.Output)

			// write libsonnet files to disk
			diskWriter := writer.NewDiskWriter()
			if err := diskWriter.Render(path, groups, t); err != nil {
				return xerrors.New("failed to write libsonnet files", err)
			}
		}

		return nil
	}

	return cmd
}
