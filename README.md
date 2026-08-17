# k8s-gen

Code generator for Jsonnet Kubernetes libraries.

This repository contains the generator code and relevant bits to generate the jsonnet
libraries. It can generate libraries directly from OpenAPI spec v2 (Swagger) or by
providing CustomResourceDefinitions.

## Installation

### Docker

```bash
docker pull ghcr.io/jsonnet-libs/k8s:<version>
```

### Binary release

Download pre-built binaries from [GitHub Releases](https://github.com/jsonnet-libs/k8s/releases):

```bash
curl -sL https://github.com/jsonnet-libs/k8s/releases/latest/download/k8s-gen_linux_x86_64.tar.gz | tar xz
sudo mv k8s-gen /usr/local/bin/
```

### From source

```bash
go install github.com/jsonnet-libs/k8s@latest
```

## Usage

### Create a self-managed lib

Create a directory, ideally named after the project:

```bash
mkdir libs/cloudnative-pg
```

#### Approach 1: Auto-Discovery (Recommended)

Create a `config.json` with `specGenerator` to auto-discover CRDs from GitHub:

```json
{
  "libName": "cloudnative-pg",
  "description": "Generated Jsonnet library for CloudNativePG",
  "specGenerator": {
    "type": "github",
    "repo": "https://github.com/cloudnative-pg/cloudnative-pg",
    "crdPath": "config/crd/bases",
    "prefix": "^io\\.cnpg\\.postgresql\\..*",
    "dedupeCrds": true
  },
  "specs": []
}
```

Then run:

```bash
k8s-gen --config libs/cloudnative-pg/config.json
```

Note: Output defaults to the config file's directory. Set `outputDir` in config to change this (relative to config file).

The generator will:
1. Fetch tags from the GitHub repo
2. Parse the Git tree to find CRD files in `crdPath`
3. Skip consecutive versions whose CRD files are identical to the previous kept version
4. Generate specs for each remaining version automatically

By default, auto-discovery skips duplicate CRD versions (`dedupeCrds: true`). Set `dedupeCrds: false` in `specGenerator` to generate a library for every version.

Alternatively, pin the exact versions to generate by adding a `versions` list to `specGenerator`. `versions` and `versionLimit` are mutually exclusive; when `versions` is provided, tag discovery is skipped and `dedupeCrds` is ignored. A target is generated for every version in the list.

The `versionPrefix` field (default `"v"`) is prepended to each version in `versions` when resolving the GitHub ref/tag. Use `"versionPrefix": ""` if your versions already include the prefix (e.g. `v1.27.0`).

```json
{
  "libName": "cloudnative-pg",
  "description": "Generated Jsonnet library for CloudNativePG",
  "specGenerator": {
    "type": "github",
    "repo": "https://github.com/cloudnative-pg/cloudnative-pg",
    "crdPath": "config/crd/bases",
    "prefix": "^io\\.cnpg\\.postgresql\\..*",
    "versions": ["1.27.0", "1.30.0"]
  },
  "specs": []
}
```

**GitHub Token**: Set `GITHUB_TOKEN` environment variable to authenticate with GitHub. Without a token, you are limited to 60 requests/hour (unauthenticated rate limit). With a token, you get 5,000 requests/hour.

If you have the [GitHub CLI](https://cli.github.com/) installed, you can use it to get a token:

```bash
GITHUB_TOKEN=$(gh auth token) k8s-gen --config libs/cloudnative-pg/config.json
```

Or export it for the session:

```bash
export GITHUB_TOKEN=$(gh auth token)
k8s-gen --config libs/cloudnative-pg/config.json
```

#### Approach 2: Manual Specs

If you prefer to manually define versions and CRD URLs, omit `specGenerator` and populate `specs` directly:

```json
{
  "libName": "cloudnative-pg",
  "description": "Generated Jsonnet library for CloudNativePG",
  "specs": [
    {
      "output": "1.27.0",
      "prefix": "^io\\.cnpg\\.postgresql\\..*",
      "crds": [
        "https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/v1.27.0/config/crd/bases/postgresql.cnpg.io_backups.yaml",
        "https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/v1.27.0/config/crd/bases/postgresql.cnpg.io_clusters.yaml"
      ]
    },
    {
      "output": "1.30.0",
      "prefix": "^io\\.cnpg\\.postgresql\\..*",
      "crds": [
        "https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/v1.30.0/config/crd/bases/postgresql.cnpg.io_backups.yaml",
        "https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/v1.30.0/config/crd/bases/postgresql.cnpg.io_clusters.yaml"
      ]
    }
  ]
}
```

Note: When using manual specs, add a per-spec `prefix` if the CRD group cannot be inferred from the URLs alone.

| Feature | Auto-Discovery | Manual |
|---------|---------------|--------|
| `specGenerator` | Required | Omitted |
| `specs` | Empty `[]` | Populated with versions/CRDs |
| `prefix` | At `specGenerator` level | Not needed |
| `versionLimit` | Default `10` (mutually exclusive with `versions`) | Not applicable |
| `versions` | Optional exact list of clean versions (without prefix) | Not applicable |
| `versionPrefix` | Default `"v"` (prepended to `versions` for the Git ref) | Not applicable |
| `dedupeCrds` | Default `true` (skips duplicate CRD versions; ignored when `versions` is set) | Not applicable |
| Maintenance | Automatic on new releases | Manual updates required |

### Create or update a new lib

Create a folder in `libs/`:

```bash
mkdir libs/<name>
```

Create a `config.json` in the new folder. This example renders a lib from CRDs:

```json
{
  "libName": "<name>",
  "description": "Generated Jsonnet library for <name>",
  "specGenerator": {
    "type": "github",
    "repo": "https://github.com/<owner>/<name>",
    "crdPath": "config/crd/bases",
    "prefix": "^<prefix>\\.<name>\\..*",
    "dedupeCrds": false
  },
  "specs": []
}
```

Generate the library:

```bash
$ make libs/<name>
```

Or run the binary directly:

```bash
$ k8s-gen --config libs/<name>/config.json
```


## Customizing

Because the generator only creates the most minimal yet functional code, more
sophisticated utilities like constructors (`deployment.new(name, replicas,
containers)`, etc) are not created.

For that, there are two methods for extending:

### `custom` patches

The [`custom/`](https://github.com/jsonnet-libs/k8s/tree/master/libs/k8s/custom)
directory contains a set of `.libsonnet` files, that are _automatically merged_
with the generated result in `main.libsonnet`, so they become part of the
exported API.

For example the patches in `libs/k8s`:

```

libs/k8s/
├── config.json                      # Config to generate the k8s jsonnet libraries
└── custom
    └── core
      	├── apps.libsonnet           # Constructors for `core/v1`, ported from `ksonnet-gen` and `kausal.libsonnet`
        ├── autoscaling.libsonnet    # Extends `autoscaling/v2beta2`
      	├── batch.libsonnet          # Constructors for `batch/v1beta1`, `batch/v2alpha1`, ported from `kausal.libsonnet`
      	├── core.libsonnet           # Constructors for `apps/v1`, `apps/v1beta1`, ported from `ksonnet-gen` and `kausal.libsonnet`
        ├── list.libsonnet           # Adds `core.v1.List`
      	├── mapContainers.libsonnet  # Adds `mapContainers` functions for fields that support them
      	├── rbac.libsonnet           # Adds helper functions to rbac objects
        └── volumeMounts.libsonnet   # Adds helper functions to mount volumes
```

A reference for these must also be made in the `config.json`:

```json
{
  "libName": "k8s",
  "specs": [
    {
      "output": "<version>",
      "patchDir": "custom/core"
    }
  ]
}
```

### Extensions

Extensions serve a similar purpose as `custom/` patches, but are **not
automatically applied**. However, they are still part of the final artifact, but
need to added by the user themselves.

Extensions can be applied as so:

```jsonnet
(import "github.com/jsonnet-libs/k8s-libsonnet/1.21/main.libsonnet")
+ (import "github.com/jsonnet-libs/k8s-libsonnet/extensions/<name>.libsonnet")
```

A reference for these must also be made in the `config.json`:

```json
{
  "libName": "k8s",
  "specs": [
    {
      "output": "<version>",
      "extensionDir": "extensions/core"
    }
  ]
}
```
