package main

import (
	"io/ioutil"
	"log"
	"regexp"

	"github.com/jsonnet-libs/k8s/pkg/swagger"
	"github.com/sanity-io/litter"
)

const (
	ListMetaId   = "io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta"
	ObjectMetaId = "io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta"
)

var expr = regexp.MustCompile(`(?mU)(?P<domain>io\.k8s\.api)\.(?P<group>.*)\.(?P<version>.*)\.(?P<kind>.*)$`)
var modifierBlacklist = map[string]bool{
	"kind":       true,
	"apiVersion": true,
	"metadata":   true,
	"status":     true,
}

func main() {
	data, err := ioutil.ReadFile("swagger.json")
	if err != nil {
		log.Fatalln(err)
	}

	s, err := swagger.Load(data)
	if err != nil {
		log.Fatalln(err)
	}

	defs := s.Definitions.Filter(func(k string, v swagger.Schema) bool {
		if !expr.MatchString(k) {
			return false
		}

		meta := v.Props["metadata"]
		if meta == nil || meta.DollarRef == nil {
			return true
		}
		return meta.Ref() != ListMetaId
	})

	groups := defsToGroups(defs)
	litter.Dump(groups["core"]["v1"].Kinds["service"])
}
