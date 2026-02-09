local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.16.8', tag: 'v1.16.8' }, 
];

config.new(
  name='dapr',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.dapr\\..*',
      crds: [
        'https://raw.githubusercontent.com/dapr/dapr/%s/charts/dapr/crds/components.yaml' % [v.tag],
        'https://raw.githubusercontent.com/dapr/dapr/%s/charts/dapr/crds/configuration.yaml' % [v.tag],
        'https://raw.githubusercontent.com/dapr/dapr/%s/charts/dapr/crds/httpendpoints.yaml' % [v.tag],
        'https://raw.githubusercontent.com/dapr/dapr/%s/charts/dapr/crds/resiliency.yaml' % [v.tag],
        'https://raw.githubusercontent.com/dapr/dapr/%s/charts/dapr/crds/subscription.yaml' % [v.tag],
      ],
      localName: 'dapr',
    }
    for v in versions
  ]
)
