local config = import 'jsonnet/config.jsonnet';

config.new(
  name='argo-workflows',
  specs=[
    {
      output: '3.1',
      prefix: '^io\\.argoproj\\..*',
      openapi: 'https://raw.githubusercontent.com/argoproj/argo-workflows/v3.1.15/api/jsonschema/schema.json',
      localName: 'argo_workflows',
    },
    {
      output: '3.2',
      prefix: '^io\\.argoproj\\..*',
      openapi: 'https://raw.githubusercontent.com/argoproj/argo-workflows/v3.2.11/api/jsonschema/schema.json',
      localName: 'argo_workflows',
    },
    {
      output: '3.3',
      prefix: '^io\\.argoproj\\..*',
      openapi: 'https://raw.githubusercontent.com/argoproj/argo-workflows/v3.3.5/api/jsonschema/schema.json',
      localName: 'argo_workflows',
    },
  ]
)
