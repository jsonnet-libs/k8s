package model

import (
	"fmt"
	"regexp"
	"strings"

	"github.com/jsonnet-libs/k8s/pkg/swagger"
)

type Group map[string]Version
type IDs map[string]map[string]string

func newGroups(defs swagger.Definitions, ids IDs) map[string]Group {
	groups := make(map[string]Group)

	for groupName, group := range ids {
		g := make(Group)

		for versionName, id := range group {
			v := newVersion(defs.Sub(id))
			v.ApiVersion = fmt.Sprintf("%s/%s", groupName, versionName)
			g[versionName] = v
		}

		groups[groupName] = g
	}

	return groups
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
		name := reSubMatchMap(expr, k)["kind"]
		ver.Kinds[strLower(name)] = newKind(*v, name)
	}
	return ver
}

type Kind struct {
	Help string

	// constructor
	New *Modifier

	// modifiers
	Modifiers map[string]interface{}
}

func newKind(d swagger.Schema, name string) Kind {
	name = strings.ToLower(name)
	kind := Kind{
		Help: d.Desc,
	}

	// real resource? add constructor
	meta, ok := d.Props["metadata"]
	if ok && meta.Ref() == ObjectMetaId {
		kind.New = &Modifier{
			Help:       fmt.Sprintf("new returns an instance of %s", strings.Title(name)),
			Parameters: []Parameter{{Key: "name"}},
		}
	}

	kind.Modifiers = modsForProps(d.Props, "")
	return kind
}

func reSubMatchMap(r *regexp.Regexp, str string) map[string]string {
	match := r.FindStringSubmatch(str)
	subMatchMap := make(map[string]string)
	for i, name := range r.SubexpNames() {
		if i != 0 {
			subMatchMap[name] = match[i]
		}
	}

	return subMatchMap
}
