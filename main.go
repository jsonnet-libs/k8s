package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"github.com/jsonnet-libs/k8s/pkg/docs"
	"github.com/jsonnet-libs/k8s/pkg/model"
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
	fmt.Println(docs.For("Service", groups["core"]["v1"].Kinds["service"]))

	// for name, group := range groups {
	// 	o := render.Group(name, group)

	// 	file := filepath.Join(*dir, name+".libsonnet")
	// 	if err := ioutil.WriteFile(file, []byte(o.String()), 0644); err != nil {
	// 		log.Fatalln(err)
	// 	}
	// }
}
