local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.3', tag: 'v1.3.0'},
];

config.new(
  name='harbor-operator',
  specs=[
    {
      output: v.version,
      prefix: '^goharbor\\.io\\..*',
      crds: ['https://raw.githubusercontent.com/goharbor/harbor-operator/'+v.tag+'/manifests/cluster/deployment.yaml'],
      localName: 'harbor-operator',
    }
    for v in versions
  ]
)
