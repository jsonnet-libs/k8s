local config = import 'jsonnet/config.jsonnet';

config.new(
  name='argo-workflows',
  specs=[
    {
      output: '3.1',
      prefix: '^io\\.argoproj\\..*',
      openapi: 'https://raw.githubusercontent.com/argoproj/argo-workflows/v3.1.12/api/jsonschema/schema.json',
      localName: 'argo_workflows',
    },
    {
      output: '3.2',
      prefix: '^io\\.argoproj\\..*',
      openapi: 'https://raw.githubusercontent.com/argoproj/argo-workflows/v3.2.2/api/jsonschema/schema.json',
      localName: 'argo_workflows',
    },
  ]
)
