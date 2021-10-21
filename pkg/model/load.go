package model

import (
	"fmt"
	"regexp"

	"github.com/Cicatrice/cfn-gen/pkg/cloudformation"
)

var exprResourceTypes = regexp.MustCompile(`^(?P<realm>[A-Za-z0-9]+)::(?P<service>[A-Za-z0-9]+)::(?P<resource>[A-Za-z0-9]+)$`)
var expr = regexp.MustCompile(`^(?P<realm>[A-Za-z0-9]+)::(?P<service>[A-Za-z0-9]+)::(?P<resource>[A-Za-z0-9]+)$`)

// Short handles for longer types
const (
	ListMetaID   = "io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta"
	ObjectMetaID = "io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta"
)

type Resource struct {
	Help string `json:"help"`

	Service string `json:"service"`

	// constructor
	New *Constructor `json:"new"`

	// modifiers
	Modifiers modifiers `json:"modifiers,omitempty"`
}

// Load parses swagger definitions into the data model

/*
func Load(s *cloudformation.CloudFormationSpec, prefix string) map[string]Group {
	//var prefixExpr = regexp.MustCompile(prefix)

	//	rTypes := s.ResourceTypes

	//services := transform(rTypes)
	//fmt.Println("ids", ids)

	return s
}


func newResourceTypes(s cloudformation.CloudFormationSpec) map[string]Service {
	services := make(map[string]Service)

	for serviceName, service := range transform(s.ResourceTypes) {
		s := make(Service)

		for resourceName, resource := range service {
			// add dot to end to avoid partial matches.
			// also escape the dots
			xp := regexp.QuoteMeta(id + ".")

			fmt.Println(versionName, xp)
			s[resourceName] = resource
		}

		services[serviceName] = s
	}

	return groups
}
*/
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
func transform(defs cloudformation.ResourceTypes) IDs {
	services := make(IDs)

	for k := range defs {
		m := reSubMatchMap(exprResourceTypes, k)

		realmName := m["realm"]
		serviceName := m["service"]

		if services[realmName] == nil {
			services[realmName] = make(map[string]string)
		}

		services[realmName][serviceName] = fmt.Sprintf("%s.%s",
			m["realm"], m["service"],
		)
	}

	return services
}
