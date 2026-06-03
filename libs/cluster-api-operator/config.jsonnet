local config = import 'jsonnet/config.jsonnet';

local versions = [
  'v0.27.0',
];

config.new(
  name='cluster-api-operator',
  specs=[
    {
      output: version,
      prefix: '^io\\.x-k8s\\.cluster\\.operator\\..*',
      crds: ['https://github.com/kubernetes-sigs/cluster-api-operator/releases/download/%(version)s/operator-components.yaml' % { version: version }],
      localName: 'cluster-api-operator',
    }
    for version in versions
  ]
)
