# libs/<name>/config.jsonnet
local config = import 'jsonnet/config.jsonnet';
local versions = [
  { tag: "v0.50.0", version: "0.50" },
];

config.new(
  name='victoria-metrics-operator',
  specs=[
    {
      output: v.version,
      crds: ['https://github.com/VictoriaMetrics/operator/releases/download/%s/crd.yaml' % v.tag] ,
      prefix: '^com\\.victoriametrics\\.operator\\..*',
      localName: 'victoriametrics',
    },
    for v in versions
  ]
)
