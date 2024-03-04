local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '3.7', tag: '3.7.2' },
  { version: '3.8', tag: '3.8.2' },
  { version: '3.9', tag: '3.9.1' },
];

config.new(
  name='emissary',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.getambassador\\..*',
      crds: ['https://app.getambassador.io/yaml/emissary/%s/emissary-crds.yaml' % v.tag],
      localName: 'emissary',
    }
    for v in versions
  ]
)
