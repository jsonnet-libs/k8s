package docs

import (
	"bytes"
	"fmt"
	"sort"
	"strings"
	"text/template"

	"github.com/jsonnet-libs/k8s/pkg/model"
)

var kindTmpl = template.Must(template.New("").Parse(`
## {{.Name}}
{{.Help}}

**Functions:**
{{ range .Funcs }}
[` + "`fn {{.Name}}`" + `](#{{.HtmlID}})  {{ end }}

---

{{ range .Funcs }}
### ` + "`fn {{ .Name }}`" + `
{{ .Help }}
` + "```jsonnet" + `
{
  {{ .Signature }}
}
` + "```" + `
{{ end }}
`))

type Documentable struct {
	Name string
	Help string

	Funcs []Func
}

type Func struct {
	Name   string
	HtmlID string

	Help      string
	Signature string
}

// Kind returns markdown docs for the given kind.
func Kind(name string, kind model.Kind) string {
	d := Documentable{
		Name:  name,
		Help:  kind.Help,
		Funcs: []Func{},
	}

	if kind.New != nil {
		d.Funcs = append(d.Funcs,
			Func{
				Name:      "new",
				HtmlID:    "fn-new",
				Help:      kind.New.Help,
				Signature: signature("new", kind.New.Args, "{}"),
			},
		)
	}

	funcs := modifiers(kind.Modifiers)
	sort.SliceStable(funcs, func(i, j int) bool {
		return funcs[i].Name < funcs[j].Name
	})
	d.Funcs = append(d.Funcs, funcs...)

	buf := bytes.Buffer{}
	if err := kindTmpl.Execute(&buf, d); err != nil {
		panic(err)
	}
	return buf.String()
}

func modifiers(mods map[string]interface{}, prefix ...string) (funcs []Func) {
	for name, v := range mods {
		switch m := v.(type) {
		case model.Object:
			funcs = append(funcs, modifiers(m.Fields, append(prefix, name)...)...)
			break
		case model.Modifier:
			n := fmt.Sprintf("%s.%s", strings.Join(prefix, "."), name)
			funcs = append(funcs, Func{
				Name:   n,
				HtmlID: fmt.Sprintf("fn-%s", strings.ToLower(strings.Replace(n, ".", "", -1))),
				Help:   m.Help,
				Signature: signature(
					name,
					[]model.Parameter{m.Arg},
					"{}",
				),
			})
		}
	}
	return funcs
}

func signature(name string, args []model.Parameter, returns string) string {
	strArgs := make([]string, len(args))
	for i, a := range args {
		strArgs[i] = a.String()
	}

	return fmt.Sprintf("%s(%s):: %s", name, strings.Join(strArgs, ", "), returns)
}
