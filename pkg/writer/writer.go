package writer

import (
	"github.com/jsonnet-libs/k8s/pkg/config"
	"github.com/jsonnet-libs/k8s/pkg/model"
)

type Writer interface {
	Render(dir string, group model.Groups, spec config.Spec) error
}
