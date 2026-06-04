local config = import 'jsonnet/config.jsonnet';

local versions = [
  'v1.13.2',
];

config.new(
  name='cluster-api',
  specs=[
    {
      output: version,
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.x-k8s\\.cluster\\..*',
      crds: ['https://github.com/kubernetes-sigs/cluster-api/releases/download/%(version)s/core-components.yaml' % { version: version}],
      localName: 'cluster-api',
    },
    for version in versions
  ]
)
