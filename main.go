package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"regexp"
	"strings"
	"unicode"

	"github.com/jsonnet-libs/k8s/pkg/swagger"
	"github.com/sanity-io/litter"
)

const (
	ListMetaId   = "io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta"
	ObjectMetaId = "io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta"
)

var expr = regexp.MustCompile(`io\.k8s\.api`)
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

	core := s.Definitions.Sub("io.k8s.api.core")

	v := newVersion(core.Sub("io.k8s.api.core.v1"))
	v.ApiVersion = "v1"

	litter.Dump(v.Kinds["service"])
}

type Version struct {
	ApiVersion string
	Kinds      map[string]Kind
}

func newVersion(d swagger.Definitions) Version {
	ver := Version{
		Kinds: make(map[string]Kind),
	}

	for k, v := range d {
		elems := strings.Split(k, ".")
		name := elems[len(elems)-1]

		ver.Kinds[strings.ToLower(name)] = newKind(*v, name)
	}
	return ver
}

func newKind(d swagger.Schema, name string) Kind {
	name = strings.ToLower(name)
	kind := Kind{
		Help: d.Desc,
		New: Function{
			Help: fmt.Sprintf("new returns an instance of %s", name),
		},
	}

	// named? add name to constructor
	meta := d.Props["metadata"]
	if meta != nil && meta.Ref() == ObjectMetaId {
		kind.New.Parameters = append(kind.New.Parameters, Parameter{Key: "name"})
		kind.Named = true
	}

	kind.Modifiers = modsForProps(d.Props)
	return kind
}

func modsForProps(props map[string]*swagger.Schema) map[string]interface{} {
	mods := make(map[string]interface{})
	for k, p := range props {
		if modifierBlacklist[k] {
			continue
		}
		name, mod := newModifier(k, p)
		mods[name] = mod
	}
	return mods
}

func newModifier(name string, p *swagger.Schema) (string, interface{}) {
	switch p.Type {
	case swagger.TypeObject:
		if len(p.Props) != 0 {
			o := Object{
				Help:   p.Desc,
				Fields: modsForProps(p.Props),
			}
			return name, o
		}
		fallthrough
	default:
		fn := Function{
			Help:       p.Desc,
			Parameters: []Parameter{{Key: lower(name)}},
		}
		return fmt.Sprintf("with%s", strings.Title(name)), fn
	}
	panic("shouldn't happen")
}

func lower(s string) string {
	a := []rune(s)
	a[0] = unicode.ToLower(a[0])
	return string(a)
}

type Kind struct {
	Help string

	// constructor
	New   Function
	Named bool

	// modifiers
	Modifiers map[string]interface{}
}

type Object struct {
	Help   string
	Fields map[string]interface{}
}

type Function struct {
	Help       string
	Parameters []Parameter
}

type Parameter struct {
	Key string
	Def interface{}
}

func load(file string) swagger.Swagger {
	data, err := ioutil.ReadFile("swagger.json")
	if err != nil {
		log.Fatalln(err)
	}

	var s swagger.Swagger
	json.Unmarshal(data, &s)

	for k, v := range s.Definitions {
		if !expr.MatchString(k) {
			delete(s.Definitions, k)
			continue
		}

		meta := v.Props["metadata"]
		if meta != nil && isList(*meta) {
			delete(s.Definitions, k)
			continue
		}
	}

	return s
}

func isList(p swagger.Schema) bool {
	return p.Ref() == ListMetaId
}
