local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '0.6', tag: 'v0.6.8' },
];

config.new(
  name='cluster-api-provider-tinkerbell',
  specs=[
    {
      output: v.version,
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.x-k8s\\.cluster\\.infrastructure\\..*',
      crds: [
        'https://github.com/tinkerbell/cluster-api-provider-tinkerbell/releases/download/%s/infrastructure-components.yaml' % v.tag,
      ],
      localName: 'cluster-api-provider-tinkerbell',
    }
    for v in versions
  ]
)
