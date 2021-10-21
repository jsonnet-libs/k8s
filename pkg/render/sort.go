package render

import (
	"sort"
	"strings"

	j "github.com/Cicatrice/cfn-gen/pkg/builder"
)

// SortFields sorts Jsonnet fields
func SortFields(fields []j.Type) {
	sort.SliceStable(fields, func(i, j int) bool {
		a := fields[i].Name()
		b := fields[j].Name()

		if local(fields[i], fields[j]) {
			return true
		}
		if local(fields[j], fields[i]) {
			return false
		}

		if a == trim(b) {
			return false
		}
		if b == trim(a) {
			return true
		}

		return trim(a) < trim(b)
	})
}

func trim(s string) string {
	return strings.TrimPrefix(s, "#")
}

func local(a, b j.Type) bool {
	_, aOk := a.(j.LocalType)
	_, bOk := b.(j.LocalType)
	return aOk && !bOk
}
