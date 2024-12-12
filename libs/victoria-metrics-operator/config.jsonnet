# libs/<name>/config.jsonnet
local config = import 'jsonnet/config.jsonnet';
local versions = [
  { tag: "v0.50.0", version: "0.50" },
  { tag: "v0.49.1", version: "0.49" },
  { tag: "v0.48.4", version: "0.48" },
  { tag: "v0.47.3", version: "0.47" },
  { tag: "v0.46.4", version: "0.46" },
  { tag: "v0.45.0", version: "0.45" },
  { tag: "v0.44.0", version: "0.44" },
  { tag: "v0.42.4", version: "0.42" },
  { tag: "v0.41.2", version: "0.41" },
  { tag: "v0.40.0", version: "0.40" },
  { tag: "v0.39.4", version: "0.39" },
  { tag: "v0.38.0", version: "0.38" },
  { tag: "v0.37.1", version: "0.37" },
  { tag: "v0.36.1", version: "0.36" },
  { tag: "v0.35.1", version: "0.35" },
  { tag: "v0.34.1", version: "0.34" },
  { tag: "v0.33.0", version: "0.33" },
  { tag: "v0.32.1", version: "0.32" },
  { tag: "v0.31.0", version: "0.31" },
  { tag: "v0.30.4", version: "0.30" },
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
