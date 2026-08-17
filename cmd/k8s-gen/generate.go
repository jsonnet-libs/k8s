package cmd

import (
	"context"
	"fmt"
	"net/url"
	"os"

	"github.com/google/go-jsonnet/formatter"
	"github.com/jsonnet-libs/k8s/pkg/builder"
	"github.com/mdobak/go-xerrors"
	"github.com/santhosh-tekuri/jsonschema/v6"
	"github.com/stoewer/go-strcase"
	"github.com/urfave/cli/v3"
)

func newGenerateCommand() *cli.Command {
	cmd := &cli.Command{
		Name:  "generate",
		Usage: "generate jsonnet libraries from crds, openapi, jsonschema, helmvalues",
	}

	cmd.Commands = append(cmd.Commands, newJsonSchemaGenerateCommand())
	return cmd
}

func newJsonSchemaGenerateCommand() *cli.Command {
	cmd := &cli.Command{
		Name:        "jsonschema",
		Description: "generate jsonnet libraries from jsonschema",
	}

	cmd.Flags = append(cmd.Flags, &cli.StringFlag{
		Name:  "schema",
		Value: "schema.json",
		Usage: "jsonschema file. can be url or filepath",
		Validator: func(s string) error {
			if s == "" {
				return xerrors.New("schema not provided")
			}

			url, urlErr := url.Parse(s)
			var isUrl bool
			if urlErr == nil && (url.Scheme == "http" || url.Scheme == "https") {
				isUrl = true
			}

			fileInfo, fileErr := os.Stat(s)
			var isFile bool
			if fileErr == nil && !fileInfo.IsDir() {
				isFile = true
			}

			if !isFile && !isUrl {
				return xerrors.New("schema is neiher a url nor a file that exists")
			}

			return nil
		},
		Required: true,
	})

	cmd.Flags = append(cmd.Flags, &cli.StringFlag{
		Name:  "output",
		Usage: "libsonnet file",
	})

	cmd.Flags = append(cmd.Flags, &cli.StringFlag{
		Name:     "library-name",
		Usage:    "library name",
		Required: true,
	})

	cmd.Action = func(ctx context.Context, c *cli.Command) error {
		jsonschemaFile := c.String("schema")

		// jsonschema reader
		comp := jsonschema.NewCompiler()

		// setup loader
		comp.UseLoader(jsonschema.FileLoader{})

		sch, err := comp.Compile(jsonschemaFile)
		if err != nil {
			return err
		}

		libsonnetFile := genLibsonnet(sch, c.String("library-name"), []string{})

		// format libsonnet file
		formattedLibsonnetFile, err := formatter.Format("", libsonnetFile.(builder.ObjectType).String(), formatter.DefaultOptions())
		if err != nil {
			return err
		}

		if c.String("output") == "" {
			fmt.Print(formattedLibsonnetFile)
		} else {

			err = os.WriteFile(c.String("output"), []byte(formattedLibsonnetFile), 0o644)
			if err != nil {
				return err
			}

		}
		return nil
	}

	return cmd
}

func genAdditiveObjWrapper(in builder.Type, path []string) builder.Type {
	if len(path) == 0 {
		return in
	}

	return builder.Merge(builder.Object(path[0], genAdditiveObjWrapper(in, path[1:])))
}

func genLibsonnet(s *jsonschema.Schema, name string, curPath []string) builder.Type {
	if s.Ref != nil {
		s = s.Ref
	}

	propTypes := []builder.Type{}
	for pName, p := range s.Properties {
		newPath := make([]string, len(curPath))
		copy(newPath, curPath)
		newPath = append(newPath, pName)

		if p.Ref != nil {
			p = p.Ref
		}

		var pT string
		if p.Types != nil {
			pT = p.Types.ToStrings()[0]
		} else {
			if p.Enum != nil {
				pT = "string"
			} else if len(p.AnyOf) > 0 {
				pT = "string"
			}
		}

		switch pT {
		// case "array":
		// 	propType := builder.Object(strcase.LowerCamelCase(pName))
		// 	propTypes = append(propTypes, propType)
		case "object":
			propType := genLibsonnet(p, strcase.LowerCamelCase(pName), newPath)
			propTypes = append(propTypes, propType)
		default:
			funcName := fmt.Sprintf("with%s", strcase.UpperCamelCase(pName))
			propType := builder.Func(
				funcName,
				builder.Args(
					builder.Required(builder.SafeString(strcase.LowerCamelCase(pName), "")),
				),
				builder.Object(strcase.LowerCamelCase(pName),
					genAdditiveObjWrapper(
						builder.Ref(pName, builder.SafeIdentifier(strcase.LowerCamelCase(pName))),
						curPath,
					),
				))
			propTypes = append(propTypes, propType)
		}
	}

	return builder.Object(name, propTypes...)
}
