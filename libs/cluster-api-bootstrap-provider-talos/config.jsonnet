local config = import 'jsonnet/config.jsonnet';

local versions = [
  'v0.6.12',
];

config.new(
  name='cluster-api-bootstrap-provider-talos',
  specs=[
    {
      output: version,
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.x-k8s\\.cluster\\.bootstrap\\..*',
      crds: ['https://github.com/siderolabs/cluster-api-bootstrap-provider-talos/releases/download/%(version)s/bootstrap-components.yaml' % { version: version }],
      localName: 'cluster-api-bootstrap-provider-talos',
    }
    for version in versions
  ]
)
