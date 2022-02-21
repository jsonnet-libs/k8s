package model

import (
	"fmt"
	"regexp"

	"github.com/jsonnet-libs/k8s/pkg/swagger"
)

var expr = regexp.MustCompile(`(?mU)(?P<domain>.+)\.((?P<group>\w*)\.)?(?P<version>\w*)\.(?P<kind>\w*)$`)

// Short handles for longer types
const (
	ListMetaID   = "io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta"
	ObjectMetaID = "io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta"
)

// Load parses swagger definitions into the data model
func Load(definitions *swagger.Definitions, prefix string) map[string]Group {
	prefixExpr := regexp.MustCompile(prefix)
	defs := definitions.Filter(func(k string, v swagger.Schema) bool {
		if !expr.MatchString(k) {
			return false
		}

		meta := v.Props["metadata"]
		if meta == nil || meta.DollarRef == nil {
			// Check if domain is in the prefix regex
			return prefixExpr.MatchString(k)
		}
		return meta.Ref() != ListMetaID
	})

	ids := transform(defs)
	return newGroups(defs, ids)
}

// transform creates an ID-table that maps our structure to the one of the
// swagger spec:
//
//    "apps": map[string]string{
//      "v1": "io.k8s.api.apps.v1",
//      "v1beta1": "io.k8s.api.apps.v1beta1",
//      "v1beta2": "io.k8s.api.apps.v1beta2",
//    },
//
// These are used in newGroups to match the all kinds for a given version
func transform(defs swagger.Definitions) IDs {
	groups := make(IDs)
	for k := range defs {
		m := reSubMatchMap(expr, k)

		groupName := m["group"]
		versionName := m["version"]

		if groupName == "" {
			groupName = "nogroup"
			if groups[groupName] == nil {
				groups[groupName] = make(map[string]string)
			}
			groups[groupName][versionName] = fmt.Sprintf("%s.%s",
				m["domain"], m["version"],
			)
			continue
		}

		if groups[groupName] == nil {
			groups[groupName] = make(map[string]string)
		}

		groups[groupName][versionName] = fmt.Sprintf("%s.%s.%s",
			m["domain"], m["group"], m["version"],
		)
	}

	return groups
}
