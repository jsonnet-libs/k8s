package model

import (
	"encoding/json"
	"fmt"
	"regexp"
	"strings"

	"github.com/jsonnet-libs/k8s/pkg/swagger"
)

// Group represents a group, like "core" or "apps"
type Group map[string]Version
type IDs map[string]map[string]string

// newGroups creates all Groups from the swagger definitions
func newGroups(defs swagger.Definitions, ids IDs) map[string]Group {
	groups := make(map[string]Group)

	for groupName, group := range ids {
		g := make(Group)

		for versionName, id := range group {
			// add dot to end to avoid partial matches.
			// also escape the dots
			xp := regexp.QuoteMeta(id + ".")
			v := newVersion(defs.Sub(xp))

			v.ApiVersion = apiVersion(groupName, versionName)
			g[versionName] = v
		}

		groups[groupName] = g
	}

	return groups
}

// apiVersion formats group and version into the value used for `apiVersion:`
// fields
func apiVersion(group, version string) string {
	if group == "core" {
		return version
	}
	return fmt.Sprintf("%s/%s", group, version)
}

// Version represents a specific version of the API, like "apps/v1" or "core/v1"
type Version struct {
	ApiVersion string
	Kinds      map[string]Kind
}

func (v Version) MarshalJSON() ([]byte, error) {
	data := map[string]interface{}{
		"_apiVersion": v.ApiVersion,
	}
	for k, v := range v.Kinds {
		data[k] = v
	}
	return json.Marshal(data)
}

func (v *Version) UnmarshalJSON(d []byte) error {
	data := make(map[string]interface{})
	if err := json.Unmarshal(d, &data); err != nil {
		return err
	}

	if val, ok := data["_apiVersion"]; ok {
		v.ApiVersion = val.(string)
	}
	delete(data, "_apiVersion")

	return mapToStruct(data, &v.Kinds)
}

func mapToStruct(m map[string]interface{}, ptr interface{}) error {
	kinds, err := json.Marshal(m)
	if err != nil {
		return err
	}

	return json.Unmarshal(kinds, ptr)
}

// newVersion creates a new version from swagger definitions
func newVersion(d swagger.Definitions) Version {
	ver := Version{
		Kinds: make(map[string]Kind),
	}

	for k, v := range d {
		name := reSubMatchMap(expr, k)["kind"]
		ver.Kinds[CamelLower(name)] = newKind(*v, name)
	}
	return ver
}

// Kind represents both actual Kinds ("Deployment", "Version"), but also other
// parts of the API, like "Container" or "ServicePort".
type Kind struct {
	Help string `json:"help"`

	// constructor
	New *Constructor `json:"new"`

	// modifiers
	Modifiers modifiers `json:"modifiers"`
}

type modifiers map[string]interface{}

func (mPtr *modifiers) UnmarshalJSON(data []byte) error {
	if *mPtr == nil {
		*mPtr = make(modifiers)
	}
	m := *mPtr

	// handle object vs func
	tmp := make(map[string]interface{})
	if err := json.Unmarshal(data, &tmp); err != nil {
		return err
	}

	for k, i := range tmp {
		c, ok := i.(map[string]interface{})
		if !ok {
			continue
		}

		if _, ok := c["fields"]; ok {
			var obj Object
			if err := mapToStruct(c, &obj); err != nil {
				panic(err)
			}
			m[k] = obj
		} else {
			var mod Modifier
			if err := mapToStruct(c, &mod); err != nil {
				panic(err)
			}
			m[k] = mod
		}
	}

	return nil
}

// newKind creates a new kind from it's swagger schema, creating modifiers for
// all fields it has. If not a real kind (no ObjectMeta), no constructor will be
// created
func newKind(d swagger.Schema, name string) Kind {
	name = strings.ToLower(name)
	kind := Kind{
		// Help text: description
		Help: d.Desc,
	}

	// modifiers for properties
	kind.Modifiers = modsForProps(d.Props, "")

	// real resource? add constructor, remove withKind
	meta, ok := d.Props["metadata"]
	if ok && meta.Ref() == ObjectMetaId {
		delete(kind.Modifiers, "withKind")
		kind.New = &Constructor{
			Help: fmt.Sprintf("new returns an instance of %s", strings.Title(name)),
			Args: []Parameter{{Key: "name"}},
		}
	}

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
