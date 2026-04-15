local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '0.15', tag: 'v0.15.7' },
  { version: '0.16', tag: 'v0.16.9' },
  { version: '0.17', tag: 'v0.17.4' },
  { version: '0.18', tag: 'v0.18.3' },
];

config.new(
  name='node-feature-discovery',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.k8s-sigs\\.nfd\\..*',
      crds: ['https://raw.githubusercontent.com/kubernetes-sigs/node-feature-discovery/refs/tags/%s/deployment/base/nfd-crds/nfd-api-crds.yaml' % v.tag],
      localName: 'node-feature-discovery',
    }
    for v in versions
  ]
)
