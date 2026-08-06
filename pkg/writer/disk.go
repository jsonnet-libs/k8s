package writer

import (
	"log/slog"
	"os"
	"path/filepath"

	"github.com/google/go-jsonnet/formatter"
	"github.com/jsonnet-libs/k8s/pkg/config"
	"github.com/jsonnet-libs/k8s/pkg/model"
	"github.com/jsonnet-libs/k8s/pkg/render"
	"github.com/mdobak/go-xerrors"
)

type DiskWriter struct{}

func (w *DiskWriter) Render(dir string, groups model.Groups, spec config.Spec) error {
	if err := os.MkdirAll(dir, os.ModePerm); err != nil {
		slog.Error("unable to create dir with permissions", slog.String("dir", dir), slog.String("perms", os.ModePerm.String()))
		os.Exit(1)
	}
	slog.Debug("created dir", slog.String("dir", dir))

	// gen.libsonnet
	index := render.Index(groups, spec.LocalName, spec.Repository, spec.Output, spec.Description)
	indexFile := filepath.Join(dir, render.IndexFile)
	if err := w.writeJsonnet(indexFile, index.String()); err != nil {
		slog.Error("failed to write gen.libsonnet", slog.Any("err", err), slog.String("file", indexFile))
		os.Exit(1)
	}
	slog.Debug("written gen.libsonnet", slog.String("path", indexFile))

	// _gen/<group>/<version>/<kind>.libsonnet
	gen := filepath.Join(dir, render.GenPrefix)
	if err := os.MkdirAll(gen, os.ModePerm); err != nil {
		slog.Error("failed to create _gen dir", slog.Any("err", err), slog.String("file", gen))
		os.Exit(1)
	}
	for name, group := range groups {
		g := render.Group(name, group)

		for fn, o := range g {
			file := filepath.Join(gen, name, fn)
			os.MkdirAll(filepath.Dir(file), os.ModePerm)
			if err := w.writeJsonnet(file, o.String()); err != nil {
				slog.Error("failed to generate libsonnet file", slog.Any("err", err), slog.String("file", file))
				os.Exit(1)
			}
			slog.Debug("written libsonnet file", slog.String("file", file))
		}
	}

	var adds []string
	var err error

	customDirStat, err := os.Stat(spec.PatchDir)
	if err == nil && customDirStat.IsDir() {
		// custom patches
		adds, err = w.copyDirLibsonnet(spec.PatchDir, filepath.Join(dir, render.CustomPrefix))
		if err != nil {
			slog.Error("failed to copy patches", slog.Any("error", err))
			os.Exit(1)
		}
	}

	extDirStat, err := os.Stat(spec.ExtensionDir)
	if err == nil && extDirStat.IsDir() {
		if _, err := w.copyDirLibsonnet(spec.ExtensionDir, filepath.Join(dir, render.ExtPrefix)); err != nil {
			slog.Error("failed to copy extensions", slog.Any("error", err))
			os.Exit(1)
		}
	}

	// main.libsonnet
	main := render.Main(adds)
	mainFile := filepath.Join(dir, render.MainFile)
	if err := w.writeJsonnet(mainFile, main.String()); err != nil {
		slog.Error("failed to write main.jsonnet", slog.String("file", mainFile), slog.Any("error", err))
		os.Exit(1)
	}

	return nil
}

func (w *DiskWriter) writeJsonnet(to, data string) error {
	s, err := formatter.Format("", data, formatter.DefaultOptions())
	if err != nil {
		return xerrors.Newf("failed to write jsonnet file: %w", err)
	}

	return os.WriteFile(to, []byte(s), 0o644)
}

func (w *DiskWriter) copyDirLibsonnet(dir, to string) ([]string, error) {
	// custom patches
	var adds []string
	if _, err := os.Stat(dir); err != nil {
		return nil, xerrors.Newf("%s does not exist: %w", dir, err)
	}
	filepath.Walk(dir, func(name string, fi os.FileInfo, err error) error {
		if fi.IsDir() {
			return nil
		}
		if filepath.Ext(name) != ".libsonnet" {
			return nil
		}

		adds = append(adds, name)
		return nil
	})

	for _, a := range adds {
		content, err := os.ReadFile(a)
		if err != nil {
			return nil, xerrors.New("failed to read file %s: %w", a, err)
		}

		// Run patch/extension files through the same formatter as
		// generated files so the resulting library is consistently
		// formatted regardless of how the source happens to be checked
		// in. See writeJsonnet for the parallel call.
		formatted, err := formatter.Format(a, string(content), formatter.DefaultOptions())
		if err != nil {
			return nil, xerrors.New("failed to format file %s: %w", a, err)
		}

		a = filepath.Join(to, filepath.Base(a))
		if err := os.MkdirAll(filepath.Dir(a), os.ModePerm); err != nil {
			return nil, xerrors.New("failed to create directory for file %s: %w", a, err)
		}

		if err := os.WriteFile(a, []byte(formatted), 0o644); err != nil {
			return nil, xerrors.New("failed to create file %s: %w", a, err)
		}
	}

	return adds, nil
}

func NewDiskWriter() *DiskWriter {
	return &DiskWriter{}
}
