# k8s-gen

Code generator for Jsonnet Kubernetes libraries.

This repository contains the generator code and relevant bits to generate the jsonnet
libraries. It can generate libraries directly from OpenAPI spec v2 or by providing CRDs.
The latter are then loaded into `k3s`, which serves them back in OpenAPI spec v2.

The CI job is set up to generate and update the content of a corresponding Github
repository for each library. The management of these repositories is done through
Terraform.

## Usage

### Create or update a new lib

Create a folder in `libs/`:

```bash
mkdir libs/<name>
```

Setup `config.jsonnet`, this example is for rendering a lib from CRDs:

```jsonnet
# libs/<name>/config.jsonnet
local config = import 'jsonnet/config.jsonnet';

config.new(
  name='<name>',
  specs=[
    {
      # output directory, usually the version of the upstream application/CRD
      output: '<version>',

      # openapi spec v2 endpoint
      # Use the localhost k3s endpoint in case `crds` is defined
      openapi: 'http://localhost:8001/openapi/v2',

      # prefix Regex that should match the reverse of the CRDs spec.group
      # for example `group: networking.istio.io`
      # would become ^io\\.istio\\.networking\\..*"
      prefix: '^<prefix>\\.<name>\\..*',

      # crds Endpoints of the CRD manifests, should be omitted if there is an openapi spec
      crds: ['https://url.to.crd.manifest/<version>/manifests/crd-all.gen.yaml'],

      # localName used in the docs for the example(s)
      localName: '<name>',
    },
  ]
)
```

Dry run the generate process:

```bash
$ make build        # Build the image
$ make libs/<name>  # Generate the library
```

Set up CI and Terraform code:

```
$ make configure
```

That is it, commit the changes to a branch and make a PR to get things rolling. A
jsonnet-libs community member should be able to execute the Terraform to create the
corresponding repository and CI should take care of the rest.


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
├── config.jsonnet                   # Config to generate the k8s jsonnet libraries
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

A reference for these must also be made in the `config.jsonnet`:

```jsonnet
# libs/k8s/config.jsonnet
local config = import 'jsonnet/config.jsonnet';

config.new(
  name='k8s',
  specs=[
    {
        ...
        patchDir: 'custom/core',
    },
  ]
)
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

A reference for these must also be made in the `config.jsonnet`:

```jsonnet
# libs/k8s/config.jsonnet
local config = import 'jsonnet/config.jsonnet';

config.new(
  name='k8s',
  specs=[
    {
        ...
        extensionsDir: 'extensions/core',
    },
  ]
)
```
