local config = import 'jsonnet/config.jsonnet';
local versions = ['v0.6.0', 'v1.0.1', 'v1.1.0'];

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
