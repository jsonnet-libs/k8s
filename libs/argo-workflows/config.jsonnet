local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '3.5', tag: 'v3.5.2' },
  { version: '3.6', tag: 'v3.6.16' },
  { version: '3.7', tag: 'v3.7.7' },
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
