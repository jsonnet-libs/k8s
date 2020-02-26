package model

import (
	"fmt"
	"regexp"

	"github.com/jsonnet-libs/k8s/pkg/swagger"
)

var expr = regexp.MustCompile(`(?mU)(?P<domain>io\.k8s\.api)\.(?P<group>.*)\.(?P<version>.*)\.(?P<kind>.*)$`)

const (
	ListMetaId   = "io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta"
	ObjectMetaId = "io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta"
)

func Load(swag *swagger.Swagger) map[string]Group {
	defs := swag.Definitions.Filter(func(k string, v swagger.Schema) bool {
		if !expr.MatchString(k) {
			return false
		}

		meta := v.Props["metadata"]
		if meta == nil || meta.DollarRef == nil {
			return true
		}
		return meta.Ref() != ListMetaId
	})

	ids := transform(defs)
	return newGroups(defs, ids)
}

func transform(defs swagger.Definitions) IDs {
	groups := make(IDs)
	for k := range defs {
		m := reSubMatchMap(expr, k)

		groupName := m["group"]
		versionName := m["version"]

		if groups[groupName] == nil {
			groups[groupName] = make(map[string]string)
		}

		groups[groupName][versionName] = fmt.Sprintf("%s.%s.%s",
			m["domain"], m["group"], m["version"],
		)
	}

	return groups
}
