# libs/<name>/config.jsonnet
local config = import 'jsonnet/config.jsonnet';
local versions = [
  { tag: "v0.63.0", version: "0.63" },
  { tag: "v0.50.0", version: "0.50" },
  { tag: "v0.49.1", version: "0.49" },
  { tag: "v0.48.4", version: "0.48" },
  { tag: "v0.47.3", version: "0.47" },
  { tag: "v0.46.4", version: "0.46" }
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
