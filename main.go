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
	dir := flag.String("dir", "k8s", "output path")
	flag.Parse()

	if err := os.MkdirAll(*dir, os.ModePerm); err != nil {
		log.Fatalln(err)
	}

	data, err := ioutil.ReadFile(*spec)
	if err != nil {
		log.Fatalln(err)
	}

	s, err := swagger.Load(data)
	if err != nil {
		log.Fatalln(err)
	}

	groups := model.Load(s)

	if err := genDocs(groups, *dir); err != nil {
		log.Fatalln(err)
	}
}

func genDocs(groups map[string]model.Group, dir string) error {
	for name, grp := range groups {

		path := filepath.Join(dir, name)
		if err := os.MkdirAll(path, os.ModePerm); err != nil {
			return err
		}

		overview := docs.Group(name, grp)
		if err := ioutil.WriteFile(filepath.Join(path, "README.md"), []byte(overview), 0644); err != nil {
			return err
		}

		for verName, ver := range grp {
			for name, kind := range ver.Kinds {
				kindMd := docs.Kind(name, kind)
				if err := ioutil.WriteFile(
					filepath.Join(path, verName+"."+name+".md"),
					[]byte(kindMd),
					0644,
				); err != nil {
					return err
				}
			}
		}
	}

	return nil
}

func jsonnet(groups map[string]model.Group, dir string) error {
	for name, group := range groups {
		o := render.Group(name, group)
		file := filepath.Join(dir, name+".libsonnet")
		if err := ioutil.WriteFile(file, []byte(o.String()), 0644); err != nil {
			return err
		}
	}
	return nil
}
