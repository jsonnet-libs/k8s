package targetgenerator

import (
	"github.com/jsonnet-libs/k8s/pkg/config"
	"github.com/mdobak/go-xerrors"
)

type TargetGeneratorType string

const (
	GithubType TargetGeneratorType = "github"
)

type TargetGenerator interface {
	GenerateTargets() ([]config.Target, error)
}

func New(cfg config.TargetGenerator) (TargetGenerator, error) {
	switch TargetGeneratorType(cfg.Type) {
	case GithubType:
		return NewGithubTargetGenerator(GithubTargetGeneratorOptions{
			Repo:            cfg.Repo,
			CrdPath:         cfg.CrdPath,
			Prefix:          cfg.Prefix,
			IncludeVersions: cfg.IncludeVersions,
			VersionLimit:    cfg.VersionLimit,
		}), nil
	default:
		return nil, xerrors.Newf("unknown target generator type: %s", cfg.Type)
	}
}
