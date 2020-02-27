package docs

import (
	"bytes"
	"text/template"

	"github.com/jsonnet-libs/k8s/pkg/model"
)

var overviewTmpl = template.Must(template.New("").Parse(`
{{ range $v, $ver := . }}
#### {{ .ApiVersion }}

{{ range $name, $k :=  .Kinds }}
[` + "`{{ $name }}`" + `]({{$v}}.{{$name}}.md)  {{ end }}

{{ end }}
`))

func Group(name string, group model.Group) string {
	var buf bytes.Buffer
	if err := overviewTmpl.Execute(&buf, group); err != nil {
		panic(err)
	}
	return buf.String()
}
