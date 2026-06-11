local config = import 'jsonnet/config.jsonnet';

local versions = [
  'v0.5.13',
];

config.new(
  name='cluster-api-control-plane-provider-talos',
  specs=[
    {
      output: version,
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.x-k8s\\.cluster\\.controlplane\\..*',
      crds: ['https://github.com/siderolabs/cluster-api-control-plane-provider-talos/releases/download/%(version)s/control-plane-components.yaml' % { version: version }],
      localName: 'cluster-api-control-plane-provider-talos',
    }
    for version in versions
  ]
)
