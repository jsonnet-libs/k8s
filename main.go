package main

import (
	"flag"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"

	"github.com/jsonnet-libs/k8s/pkg/docs"
	"github.com/jsonnet-libs/k8s/pkg/model"
	"github.com/jsonnet-libs/k8s/pkg/render"
	"github.com/jsonnet-libs/k8s/pkg/swagger"
)

func main() {
	spec := flag.String("spec", "swagger.json", "path to openapi spec")
	jsonnet := flag.String("jsonnet", "k8s", "path for .jsonnet sources")
	docs := flag.String("docs", "", "path for .md docs")
	adds := flagStringSlice("add", nil, "files to add to main.libsonnet")
	flag.Parse()

	// load swagger model
	data, err := ioutil.ReadFile(*spec)
	if err != nil {
		log.Fatalln(err)
	}

	s, err := swagger.Load(data)
	if err != nil {
		log.Fatalln(err)
	}

	groups := model.Load(s)

	if *jsonnet != "" {
		renderJsonnet(*jsonnet, groups, *adds)
	}

	if *docs != "" {
		renderDocs(*docs, groups, *adds)
	}
}

func renderDocs(dir string, gs map[string]model.Group, adds []string) {
	groups := docs.MergeGroups(gs, adds)

	for name, grp := range groups {

		path := filepath.Join(dir, name)
		if err := os.MkdirAll(path, os.ModePerm); err != nil {
			log.Fatalln(err)
		}

		overview := docs.Group(name, grp)
		if err := ioutil.WriteFile(filepath.Join(path, "README.md"), []byte(overview), 0644); err != nil {
			log.Fatalf("writing %s/README.md: %s", name, err)
		}

		for verName, ver := range grp {
			for name, kind := range ver.Kinds {
				kindMd := docs.Kind(name, kind)
				if err := ioutil.WriteFile(
					filepath.Join(path, verName+"."+name+".md"),
					[]byte(kindMd),
					0644,
				); err != nil {
					log.Fatalln(err)
				}
			}
		}
	}
}

func renderJsonnet(dir string, groups map[string]model.Group, adds []string) {
	gen := filepath.Join(dir, render.GenPrefix)

	if err := os.MkdirAll(gen, os.ModePerm); err != nil {
		log.Fatalln(err)
	}

	// gen.libsonnet
	index := render.Index(groups)
	indexFile := filepath.Join(dir, render.IndexFile)
	if err := ioutil.WriteFile(indexFile, []byte(index.String()), 0644); err != nil {
		log.Fatalln("writing gen.libsonnet:", err)
	}

	// _gen/<group>/<version>/<kind>.libsonnet
	for name, group := range groups {
		g := render.Group(name, group)

		for fn, o := range g {
			file := filepath.Join(dir, render.GenPrefix, name, fn)
			os.MkdirAll(filepath.Dir(file), os.ModePerm)
			if err := ioutil.WriteFile(file, []byte(o.String()), 0644); err != nil {
				log.Fatalln(err)
			}
		}
	}

	// custom patches
	for _, a := range adds {
		content, err := ioutil.ReadFile(a)
		if err != nil {
			log.Fatalln(err)
		}

		a = filepath.Join(dir, filepath.Base(a))
		if err := ioutil.WriteFile(a, content, 0644); err != nil {
			log.Fatalln(err)
		}
	}

	// main.libsonnet
	main := render.Main(adds)
	mainFile := filepath.Join(dir, render.MainFile)
	if err := ioutil.WriteFile(mainFile, []byte(main.String()), 0644); err != nil {
		log.Fatalln(err)
	}

}
