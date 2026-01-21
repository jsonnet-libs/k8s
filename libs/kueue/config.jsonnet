local config = import 'jsonnet/config.jsonnet';

local versions = [
    "0.14.3",
    "0.15.3",
];

config.new(
  name='kueue',
  specs=[
    {
      output: version,
      crds: ['https://github.com/kubernetes-sigs/kueue/releases/download/v%(version)s/manifests.yaml' % { version: version }],
      prefix: '^io\\.x-k8s\\.kueue\\..*',
      localName: 'kueue',
    }
    for version in versions
  ]
)
