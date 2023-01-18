local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.2', tag: 'v1.2.0'},
  { version: '1.3', tag: 'v1.3.0'},
  { version: '1.4', tag: 'v1.4.1'},
  { version: '1.5', tag: 'v1.5.2'},
  { version: '2.0', tag: 'v2.0.2'},
];

config.new(
  name='cluster-api-provider-aws',
  specs=[
    {
      output: v.version,
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.x-k8s\\.cluster\\..*',
      crds: [
        'https://github.com/kubernetes-sigs/cluster-api-provider-aws/releases/download/%s/infrastructure-components.yaml' % v.tag
      ],
      localName: 'cluster-api-provider-aws',
    }
    for v in versions
  ]
)
