package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"

	"github.com/go-clix/cli"
	"github.com/google/go-jsonnet/formatter"
	"github.com/jsonnet-libs/k8s/pkg/model"
	"github.com/jsonnet-libs/k8s/pkg/render"
	"github.com/jsonnet-libs/k8s/pkg/swagger"
	"gopkg.in/yaml.v2"
)

// Target defines an API subset to generate
type Target struct {
	Output       string   `yaml:"output"`
	Crds         []string `yaml:"crds"`
	Openapi      string   `yaml:"openapi"`
	Prefix       string   `yaml:"prefix"`
	PatchDir     string   `yaml:"patchDir"`
	ExtensionDir string   `yaml:"extensionDir"`
	LocalName    string   `yaml:"localName"`
	Repository   string   `yaml:"repository"`
	Description  string   `yaml:"description"`
}

// Config holds settings for this generator
type Config struct {
	Specs []Target `yaml:"specs"`
}

func main() {
	log.SetFlags(0)
	cmd := &cli.Command{
		Use:   "k8s-gen [versions]",
		Short: "k8s-gen generates the Jsonnet Kubernetes library from OpenAPI specs",
	}

	configFile := cmd.Flags().StringP("config", "c", "config.yml", "YAML configuration file")
	output := cmd.Flags().StringP("output", "o", ".", "directory to put artifacts into")

	cmd.Run = func(cmd *cli.Command, args []string) error {
		config := loadConfig(*configFile)

		os.Chdir(filepath.Dir(*configFile))

		for _, t := range config.Specs {
			if len(args) > 0 && !hasStr(args, t.Output) {
				continue
			}

			definitions := make(swagger.Definitions)

			if len(t.Crds) > 0 {
				for _, url := range t.Crds {
					log.Printf("Generating '%s' from '%s, %s'", t.Output, url, t.Prefix)

					defs, err := swagger.Load(&swagger.CRDLoader{}, url)
					if err != nil {
						return err
					}
					for k, v := range defs {
						definitions[k] = v
					}
				}

			} else {
				log.Printf("Generating '%s' from '%s, %s'", t.Output, t.Openapi, t.Prefix)

				d, err := swagger.Load(&swagger.SwaggerLoader{}, t.Openapi)
				if err != nil {
					return err
				}
				definitions = d
			}

			groups := model.Load(&definitions, t.Prefix)
			path := filepath.Join(*output, t.Output)
			renderJsonnet(path, groups, t)
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

func renderJsonnet(dir string, groups map[string]model.Group, target Target) {
	if err := os.MkdirAll(dir, os.ModePerm); err != nil {
		log.Fatalln(err)
	}

	// gen.libsonnet
	index := render.Index(groups, target.LocalName, target.Repository, target.Output, target.Description)
	indexFile := filepath.Join(dir, render.IndexFile)
	if err := writeJsonnet(indexFile, index.String()); err != nil {
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
			if err := writeJsonnet(file, o.String()); err != nil {
				log.Fatalln(err)
			}
		}
	}

	var adds []string
	var err error

	customDirStat, err := os.Stat(target.PatchDir)
	if err == nil && customDirStat.IsDir() {
		// custom patches
		adds, err = copyDirLibsonnet(target.PatchDir, filepath.Join(dir, render.CustomPrefix))
		if err != nil {
			log.Fatalln("Copying custom patches:", err)
		}
	}

	extDirStat, err := os.Stat(target.ExtensionDir)
	if err == nil && extDirStat.IsDir() {
		if _, err := copyDirLibsonnet(target.ExtensionDir, filepath.Join(dir, render.ExtPrefix)); err != nil {
			log.Fatalln("Copying extensions:", err)
		}
	}

	// main.libsonnet
	main := render.Main(adds)
	mainFile := filepath.Join(dir, render.MainFile)
	if err := writeJsonnet(mainFile, main.String()); err != nil {
		log.Fatalln(err)
	}

}

func writeJsonnet(to, data string) error {
	s, err := formatter.Format("", data, formatter.DefaultOptions())
	if err != nil {
		return fmt.Errorf("%s: %s", err, data)
	}

	return ioutil.WriteFile(to, []byte(s), 0644)
}

func copyDirLibsonnet(dir, to string) ([]string, error) {
	// custom patches
	var adds []string
	if _, err := os.Stat(dir); err != nil {
		return nil, fmt.Errorf("%s does not exist", dir)
	}
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
