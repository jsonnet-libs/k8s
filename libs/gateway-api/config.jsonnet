local config = import 'jsonnet/config.jsonnet';

config.new(
  name='gateway-api',
  specs=[
    {
      output: 'v0.7.1',
      prefix: '^io\\.k8s\\.networking\\.gateway\\..*',
	  crds: ['https://github.com/kubernetes-sigs/gateway-api/releases/download/v0.7.1/standard-install.yaml'],
      localName: 'gateway-api',
    },
  ]
)
