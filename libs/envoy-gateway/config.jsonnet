local config = import 'jsonnet/config.jsonnet';
local versions = [
  'v1.5.9',
  'v1.6.5',
  'v1.7.1',
];

config.new(
  name='envoy-gateway',
  specs=[
    {
      output: version,
      prefix: '^io\\.envoyproxy\\.gateway\\..*',
      crds: ['https://github.com/envoyproxy/gateway/releases/download/%s/install.yaml' % version],
      localName: 'envoy-gateway',
    }
    for version in versions
  ]
)
