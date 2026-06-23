# libs/<name>/config.jsonnet
local config = import 'jsonnet/config.jsonnet';
local versions = [
  { tag: "v0.8.1", version: "0.8" },
  { tag: "v0.7.2", version: "0.7" },
  { tag: "v0.6.1", version: "0.6" },
  { tag: "v0.5.7", version: "0.5" },
  { tag: "v0.2.36", version: "0.2" },
  { tag: "v0.1.1", version: "0.1" },
  { tag: "v0.0.9", version: "0.0" },
];

config.new(
  name='openfeature',
  specs=[
    {
      output: v.version,
      crds: ['https://github.com/open-feature/open-feature-operator/releases/download/%s/release.yaml' % v.tag] ,
      prefix: '^dev\\.openfeature\\.core\\..*',
      localName: 'openfeature',
    },
    for v in versions
  ]
)
