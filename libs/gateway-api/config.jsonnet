local config = import 'jsonnet/config.jsonnet';

local versions = [
    {output: '0.8', version: '0.8.1'},
    {output: '1.0', version: '1.0.0'},
    {output: '1.1', version: '1.1.0'},
    {output: '1.2', version: '1.2.0'},
    {output: '1.3', version: '1.3.0'},
    {output: '1.4', version: '1.4.1'},
];

config.new(
  name='gateway-api',
  specs=[
    {
      output: v.output,
      prefix: '^io\\.k8s\\.networking\\.gateway\\..*',
	    crds: [
        'https://github.com/kubernetes-sigs/gateway-api/releases/download/v%(version)s/standard-install.yaml' % { version: v.version }
      ],
      localName: 'gateway-api',
    }
    for v in versions
  ] + [
    {
      output: v.output + "-experimental",
      prefix: '^io\\.(x-)?k8s\\.networking\\.gateway\\..*',
      crds: [
        'https://github.com/kubernetes-sigs/gateway-api/releases/download/v%(version)s/experimental-install.yaml' % { version: v.version }
      ],
      localName: 'gateway-api',
    }
    for v in versions
  ]
)
