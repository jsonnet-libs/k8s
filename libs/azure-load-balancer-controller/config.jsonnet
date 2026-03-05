local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.9', tag: '1.9.13' },
];

// CRDs are distributed via a container image rather than a public HTTP endpoint.
// They are extracted into crds/<version>/ by `make crds` and referenced as local files.
// The lib dir is always mounted at /config when the generator runs.
config.new(
  name='azure-load-balancer-controller',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.azure\\.networking\\.alb\\..*',
      crds: ['/config/crds/' + v.version + '/crds.yaml'],
      localName: 'alb',
      description: 'Generated Jsonnet library for Azure Application Gateway for Containers (ALB Controller) v' + v.version,
    }
    for v in versions
  ],
)
