local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '3.1', tag: 'v3.1.12' },
  { version: '3.2', tag: 'v3.2.2' },
  { version: '3.3', tag: 'v3.3.3' },
  { version: '3.4', tag: 'v3.4.4' },
  { version: '3.5', tag: 'v3.5.2' },
];

config.new(
  name='argo-workflows',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.argoproj\\..*',
      openapi: 'https://raw.githubusercontent.com/argoproj/argo-workflows/%s/api/jsonschema/schema.json' % v.tag,
      localName: 'argo_workflows',
    }
    for v in versions
  ]
)
