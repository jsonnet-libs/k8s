# k8s-gen

Code generator for the Jsonnet Kubernetes library.

## Artifacts

Pre-generated artifacts of this software are provided at
https://github.com/jsonnet-libs/k8s-alpha. Check that repo for usage
instructions as well.

## Usage

`k8s-gen` loads `config.yml`, which maps `swagger.json` files to their respective Kubernetes versions.

```bash
# Generate for all versions
$ k8s-gen
Generating ...

# Only a subset (e.g. for development)
$ k8s-gen 1.18 1.17
```

## Customizing

Because the generator only creates the most minimal yet functional code, more
sophisticated utilities like constructors (`deployment.new(name, replicas, containers)`, etc) are not created.

For that, `k8s-gen` implements two methods for extending:

### `custom` patches

The [`custom/`](https://github.com/jsonnet-libs/k8s/tree/master/custom) directory contains a set of `.libsonnet` files, that are _automatically merged_ with the generated result in `main.libsonnet`, so they become part of the exported API.

Current Patches:

| Name                      | Description                                                                                             |
| ------------------------- | ------------------------------------------------------------------------------------------------------- |
| `core.libsonnet`          | Constructors for `core/v1`, ported from `ksonnet-gen`                                                   |
| `apps.libsonnet`          | Constructors for `apps/v1`, `apps/v1beta1`, ported from `ksonnet-gen`                                   |
| `mapContainers.libsonnet` | Adds `mapContainers` functions for fields that support them                                             |
| `types.libsonnet`         | Aliases some types as fields of others, to support `ksonnet-gen` assumptions. **Subject to be removed** |

### Extensions

Extensions serve a similar purpose as `custom/` patches, but are **not
automatically applied**. However they are still part of the final artifact, but
need to added by the user themselves.

Extensions can be applied as so:

```jsonnet
(import "github.com/jsonnet-libs/k8s/1.18/main.libsonnet")
+ (import "github.com/jsonnet-libs/k8s/extensions/<name>.libsonnet")
```

| Name                     | Description                                                                                                                                                                                                                                |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `kausal-shim.libsonnnet` | Implements some internals of the `ksonnet-lib` API, so that the `ksonnet-util/kausal.libsonnet` library continues to work without changes. Because this is very hacky, we should refactor `kausal.libsonnnet` as soon as possible instead. |
