local config = import 'jsonnet/config.jsonnet';

local versions = [
    "0.14.3",
    "0.14.8",
    "0.15.3",
    "0.15.5",
    "0.16.2",
    "0.17.3",
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
