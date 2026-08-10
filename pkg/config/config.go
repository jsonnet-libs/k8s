package config

import (
	"encoding/json"
	"os"
	"path/filepath"

	"github.com/creasty/defaults"
	"github.com/go-playground/validator/v10"
	"github.com/mdobak/go-xerrors"
)

// Target defines an API subset to generate
type Target struct {
	Output       string   `json:"output" validate:"required"`
	Crds         []string `json:"crds" validate:"required_without=Openapi,min=1,excluded_with=Openapi"`
	Openapi      string   `json:"openapi" validate:"required_without=Crds,excluded_with=Crds"`
	PatchDir     string   `json:"patchDir"`
	ExtensionDir string   `json:"extensionDir"`
}

// TargetGenerator defines repo info needed to generate targets
type TargetGenerator struct {
	Type            string   `json:"type" validate:"required,oneof=github"`
	Repo            string   `json:"repo" validate:"required,uri"`
	CrdPath         string   `json:"crdPath" validate:"required"`
	Prefix          string   `json:"prefix" validate:"required"`
	VersionLimit    *int     `json:"versionLimit" validate:"omitempty,min=1,excluded_with=Versions"`
	IncludeVersions string   `json:"includeVersions" default:"^v?\\d+\\.\\d+\\.\\d+$"`
	ExcludeVersions string   `json:"excludeVersions"`
	DedupeCrds      *bool    `json:"dedupeCrds" default:"true"`
	Versions        []string `json:"versions" validate:"excluded_with=VersionLimit"`
	VersionPrefix   *string  `json:"versionPrefix" default:"v"`
}

// Config holds settings for this generator
type Config struct {
	LibName       string          `json:"libName" validate:"required"`
	Description   string          `json:"description"`
	OutputDir     string          `json:"outputDir" default:"."`
	Specs         []Target        `json:"specs" validate:"omitempty,dive"`
	SpecGenerator TargetGenerator `json:"specGenerator" validate:"omitempty"`
}

func Validate(c *Config) error {
	validate := validator.New(validator.WithRequiredStructEnabled())

	err := validate.Struct(c)
	if err != nil {
		return xerrors.New("invalid config", err)
	}

	return nil
}

func Load(file string) (*Config, error) {
	data, err := os.ReadFile(file)
	if err != nil {
		return nil, xerrors.Newf("failed to read file %s: %w", file, err)
	}

	var cfg Config
	if err := json.Unmarshal(data, &cfg); err != nil {
		return nil, xerrors.New("failed to unmarshal", err)
	}

	// apply defaults
	if err := defaults.Set(&cfg); err != nil {
		return nil, xerrors.New("failed to apply defaults", err)
	}

	// resolve output dir relative to config file's directory
	cfg.OutputDir = filepath.Join(filepath.Dir(file), cfg.OutputDir)

	return &cfg, nil
}
