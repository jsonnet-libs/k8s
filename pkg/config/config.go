package config

import (
	"encoding/json"
	"os"

	"github.com/mdobak/go-xerrors"
)

// Spec defines an API subset to generate
type Spec struct {
	Output       string   `json:"output"`
	Crds         []string `json:"crds"`
	Openapi      string   `json:"openapi"`
	Prefix       string   `json:"prefix"`
	PatchDir     string   `json:"patchDir"`
	ExtensionDir string   `json:"extensionDir"`
	LocalName    string   `json:"localName"`
	Repository   string   `json:"repository"`
	Description  string   `json:"description"`
}

// Config holds settings for this generator
type Config struct {
	Specs []Spec `json:"specs"`
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

	return &cfg, nil
}
