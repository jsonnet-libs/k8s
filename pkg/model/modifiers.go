package model

import (
	"fmt"
	"strings"
	"unicode"

	"github.com/jsonnet-libs/k8s/pkg/swagger"
)

var modifierBlacklist = map[string]bool{
	"kind":       true,
	"apiVersion": true,
	"status":     true,
}

// Modifier is a function that returns a patch to modify the value at `Target`
type Modifier struct {
	Help       string
	Parameters []Parameter
	Target     string
}

// Object is the logical group for Modifiers that target fields of a nested
// object
type Object struct {
	Help   string
	Fields map[string]interface{}
}

// Parameter is a function parameter of a Modifier
type Parameter struct {
	Key string
	Def interface{}
}

// modsForProps generates Modifiers for a (nested) map of swagger properties
// (object fields)
func modsForProps(props map[string]*swagger.Schema, ctx string) map[string]interface{} {
	mods := make(map[string]interface{})
	for k, p := range props {
		if modifierBlacklist[k] {
			continue
		}
		name, mod := newModifier(k, p, ctx)
		mods[name] = mod
	}
	return mods
}

// newModifier returns a modifier for the given swagger Property.
// calls modsForProps in case of a nested object.
func newModifier(name string, p *swagger.Schema, ctx string) (string, interface{}) {
	name = strLower(name)
	switch p.Type {
	case swagger.TypeObject:
		if len(p.Props) != 0 {
			o := Object{
				Help:   p.Desc,
				Fields: modsForProps(p.Props, ctx+"."+name),
			}
			return name, o
		}
		fallthrough
	default:
		fn := Modifier{
			Help:       p.Desc,
			Parameters: []Parameter{{Key: fnArg(name)}},
			Target:     strings.TrimPrefix(ctx+"."+name, "."),
		}
		return fmt.Sprintf("with%s", strings.Title(name)), fn
	}
	panic("shouldn't happen")
}

func fnArg(name string) string {
	if name == "error" {
		return "err"
	}
	return name
}

// strLower returns the string with the first char lowercased.
func strLower(s string) string {
	a := []rune(s)
	a[0] = unicode.ToLower(a[0])
	return string(a)
}
