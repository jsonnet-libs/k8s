package docs

import (
	"encoding/json"
	"strings"

	"github.com/google/go-jsonnet"
	j "github.com/jsonnet-libs/k8s/pkg/builder"
	"github.com/jsonnet-libs/k8s/pkg/model"
)

func MergeGroups(groups map[string]model.Group, adds []string) map[string]model.Group {
	vm := jsonnet.MakeVM()

	elems := []j.Type{}
	for _, a := range adds {
		elems = append(elems, j.Import("", a))
	}
	add := j.Add("", elems...)

	data, err := json.Marshal(groups)
	if err != nil {
		panic(err)
	}

	patch := string(data) + " + " + add.String()
	patch = strings.TrimSuffix(patch, " + ")

	patched, err := vm.EvaluateSnippet("model.libsonnet", patch)
	if err != nil {
		panic(err)
	}

	var out map[string]model.Group
	if err := json.Unmarshal([]byte(patched), &out); err != nil {
		panic(err)
	}

	return out
}
