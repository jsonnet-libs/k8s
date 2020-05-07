package main

import (
	"io/ioutil"
	"log"
	"os"
	"path/filepath"

	"github.com/go-clix/cli"
	"github.com/jsonnet-libs/k8s/pkg/model"
	"github.com/jsonnet-libs/k8s/pkg/render"
	"github.com/jsonnet-libs/k8s/pkg/swagger"
	"gopkg.in/yaml.v2"
)

type Config struct {
	Specs map[string]string `yaml:"specs"`
}

func main() {
	log.SetFlags(0)
	cmd := &cli.Command{
		Use:   "k8s-gen [versions]",
		Short: "k8s-gen generates the Jsonnet Kubernetes library from OpenAPI specs",
	}

	configFile := cmd.Flags().StringP("config", "c", "config.yml", "YAML configuration file")
	custom := cmd.Flags().String("custom", "custom", "path to patches")
	ext := cmd.Flags().String("ext", "extensions", "path to extensions")

	cmd.Run = func(cmd *cli.Command, args []string) error {
		config := loadConfig(*configFile)

		for dir, spec := range config.Specs {
			if len(args) > 0 && !hasStr(args, dir) {
				continue
			}

			log.Printf("Generating '%s' from '%s'", dir, spec)

			s, err := swagger.LoadHTTP(spec)
			if err != nil {
				return err
			}

			groups := model.Load(s)
			renderJsonnet(dir, groups, *custom, *ext)
		}

		return nil
	}

	if err := cmd.Execute(); err != nil {
		log.Fatalln(err)
	}
}

func hasStr(slice []string, s string) bool {
	for _, sl := range slice {
		if sl == s {
			return true
		}
	}

	return false
}

func loadConfig(file string) Config {
	data, err := ioutil.ReadFile(file)
	if err != nil {
		log.Fatalln(err)
	}

	var c Config
	if err := yaml.Unmarshal(data, &c); err != nil {
		log.Fatalln(err)
	}

	return c
}

func renderJsonnet(dir string, groups map[string]model.Group, customDir, extDir string) {
	if err := os.MkdirAll(dir, os.ModePerm); err != nil {
		log.Fatalln(err)
	}

	// gen.libsonnet
	index := render.Index(groups)
	indexFile := filepath.Join(dir, render.IndexFile)
	if err := ioutil.WriteFile(indexFile, []byte(index.String()), 0644); err != nil {
		log.Fatalln("writing gen.libsonnet:", err)
	}

	// _gen/<group>/<version>/<kind>.libsonnet
	gen := filepath.Join(dir, render.GenPrefix)
	if err := os.MkdirAll(gen, os.ModePerm); err != nil {
		log.Fatalln(err)
	}
	for name, group := range groups {
		g := render.Group(name, group)

		for fn, o := range g {
			file := filepath.Join(gen, name, fn)
			os.MkdirAll(filepath.Dir(file), os.ModePerm)
			if err := ioutil.WriteFile(file, []byte(o.String()), 0644); err != nil {
				log.Fatalln(err)
			}
		}
	}

	// custom patches
	adds, err := copyDirLibsonnet(customDir, filepath.Join(dir, render.CustomPrefix))
	if err != nil {
		log.Fatalln("Copying custom patches:", err)
	}

	if _, err := copyDirLibsonnet(extDir, filepath.Join(dir, render.ExtPrefix)); err != nil {
		log.Fatalln("Copying extensions:", err)
	}

	// main.libsonnet
	main := render.Main(adds)
	mainFile := filepath.Join(dir, render.MainFile)
	if err := ioutil.WriteFile(mainFile, []byte(main.String()), 0644); err != nil {
		log.Fatalln(err)
	}

}

func copyDirLibsonnet(dir, to string) ([]string, error) {
	// custom patches
	var adds []string
	filepath.Walk(dir, func(name string, fi os.FileInfo, err error) error {
		if fi.IsDir() {
			return nil
		}
		if filepath.Ext(name) != ".libsonnet" {
			return nil
		}

		adds = append(adds, name)
		return nil
	})

	for _, a := range adds {
		content, err := ioutil.ReadFile(a)
		if err != nil {
			return nil, err
		}

		a = filepath.Join(to, filepath.Base(a))
		os.MkdirAll(filepath.Dir(a), os.ModePerm)
		if err := ioutil.WriteFile(a, content, 0644); err != nil {
			return nil, err
		}
	}

	return adds, nil
}
