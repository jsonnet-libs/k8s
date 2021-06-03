# k8s-gen

Code generator for the Jsonnet Kubernetes library.

## Artifacts

Pre-generated artifacts of this software are provided at
https://github.com/jsonnet-libs/k8s-alpha. Check that repo for usage
instructions as well.

## Usage

`k8s-gen` loads `config.yml`, which maps `swagger.json` files to their
respective Kubernetes versions.

```bash
# Generate for all versions
$ k8s-gen -c libs/k8s-alpha/config.yml
Generating ...

# Only a subset (e.g. for development)
$ k8s-gen -c libs/k8s-alpha/config.yml 1.18 1.17
```

### Generating from CRDs

With [k3s](https://k3s.io/), it is possible to generate jsonnet libraries from
CRDs.This can be executed with a makefile target to run it in a container:

```bash
$ make run INPUT_DIR=libs/istio/
```


## Customizing

Because the generator only creates the most minimal yet functional code, more
sophisticated utilities like constructors (`deployment.new(name, replicas,
containers)`, etc) are not created.

For that, `k8s-gen` implements two methods for extending:

### `custom` patches

The [`custom/`](https://github.com/jsonnet-libs/k8s/tree/master/libs/k8s-alpha/custom)
directory contains a set of `.libsonnet` files, that are _automatically merged_
with the generated result in `main.libsonnet`, so they become part of the
exported API.

Current Patches:

```

libs/k8s-alpha/
├── config.jsonnet                   # Config to generate the k8s-alpha jsonnet libraries
├── config.yml                       # Generated from config.jsonnet
├── README.md.tmpl                   # Template for the index of the generated docs
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

### Extensions

Extensions serve a similar purpose as `custom/` patches, but are **not
automatically applied**. However, they are still part of the final artifact, but
need to added by the user themselves.

Extensions can be applied as so:

```jsonnet
(import "github.com/jsonnet-libs/k8s-alpha/1.21/main.libsonnet")
+ (import "github.com/jsonnet-libs/k8s-alpha/extensions/<name>.libsonnet")
```

There are currently no extension patches.
