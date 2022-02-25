package swagger

import (
	"regexp"
)

type Definitions map[string]*Schema

func (ds Definitions) Filter(f func(k string, v Schema) bool) Definitions {
	out := make(Definitions)
	for k, v := range ds {
		if f(k, *v) {
			out[k] = v
		}
	}
	return out
}

func (ds Definitions) Sub(exp string) Definitions {
	rg := regexp.MustCompile(exp)
	return ds.Filter(func(k string, v Schema) bool {
		return rg.MatchString(k)
	})
}

