local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.0', tag: 'v1.0.2'},
  { version: '1.1', tag: 'v1.1.6'},
  { version: '1.2', tag: 'v1.2.9'},
  { version: '1.3', tag: 'v1.3.2'},
];

config.new(
  name='cluster-api',
  specs=[
    {
      output: v.version,
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.x-k8s\\.cluster\\..*',
      crds: ['https://github.com/kubernetes-sigs/cluster-api/releases/download/%s/core-components.yaml' % v.tag],
      localName: 'cluster-api',
    }
    for v in versions
  ]
)
