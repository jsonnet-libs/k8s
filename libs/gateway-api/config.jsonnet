local config = import 'jsonnet/config.jsonnet';
local versions = ['v0.7.1', 'v1.0.0'];

config.new(
  name='gateway-api',
  specs=[
    {
      output: version,
      prefix: '^io\\.k8s\\.networking\\.gateway\\..*',
	  crds: ['https://github.com/kubernetes-sigs/gateway-api/releases/download/%s/standard-install.yaml' % version],
      localName: 'gateway-api',
    },
    for version in versions
  ]
)
