package docs

import (
	"bytes"
	"fmt"
	"sort"
	"strings"
	"text/template"

	"github.com/jsonnet-libs/k8s/pkg/model"

	j "github.com/jsonnet-libs/k8s/pkg/builder"
	"github.com/jsonnet-libs/k8s/pkg/render"
)

var kindTmpl = template.Must(template.New("").Parse(`
## {{.Name}}
{{.Help}}

<details>
<summary> Schema </summary>

` + "```typescript" + `
{{ .Schema }}
` + "```" + `

</details>


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

	Funcs  []Func
	Schema string
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
		Name:   name,
		Help:   kind.Help,
		Funcs:  []Func{},
		Schema: schema(name, kind),
	}

	if kind.New != nil {
		d.Funcs = append(d.Funcs,
			Func{
				Name:      "new",
				HtmlID:    "fn-new",
				Help:      kind.New.Help,
				Signature: signature("new", kind.New.Args, strings.Title(name)),
			},
		)
	}

	funcs := modifiers(kind.Modifiers)
	sort.SliceStable(funcs, func(i, j int) bool {
		iN, jN := funcs[i].Name, funcs[j].Name

		// put all with* first
		if strings.HasPrefix(iN, "with") && !strings.HasPrefix(jN, "with") {
			return true
		}
		if !strings.HasPrefix(iN, "with") && strings.HasPrefix(jN, "with") {
			return false
		}

		return iN < jN
	})

	d.Funcs = append(d.Funcs, funcs...)

	buf := bytes.Buffer{}
	if err := kindTmpl.Execute(&buf, d); err != nil {
		panic(err)
	}
	return buf.String()
}

func schema(name string, kind model.Kind) string {
	fields := []j.Type{}
	for k, v := range kind.Modifiers {
		fields = append(fields, sch(k, v))
	}

	render.SortFields(fields)

	k := j.Object(name, fields...)
	return j.Object("", k).String()
}

func sch(name string, mod interface{}) j.Type {
	if m, ok := mod.(model.Modifier); ok {
		n := strings.TrimPrefix(name, "with")
		n = model.CamelLower(n)

		t := m.Type
		if t == "integer" {
			t = "number"
		}
		return j.Ref(n, strings.Title(string(t)))
	}

	fields := []j.Type{}
	obj := mod.(model.Object)
	for k, v := range obj.Fields {
		fields = append(fields, sch(k, v))
	}

	render.SortFields(fields)

	return j.Object(name, fields...)
}

func modifiers(mods map[string]interface{}, prefix ...string) (funcs []Func) {
	for name, v := range mods {
		switch m := v.(type) {
		case model.Object:
			funcs = append(funcs, modifiers(m.Fields, append(prefix, name)...)...)
		case model.Modifier:
			n := fmt.Sprintf("%s.%s", strings.Join(prefix, "."), name)
			n = strings.TrimPrefix(n, ".")
			funcs = append(funcs, Func{
				Name:   n,
				HtmlID: fmt.Sprintf("fn-%s", strings.ToLower(strings.Replace(n, ".", "", -1))),
				Help:   m.Help,
				Signature: signature(
					name,
					[]model.Parameter{m.Arg},
					"Patch",
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
