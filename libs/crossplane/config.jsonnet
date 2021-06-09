local config = import 'jsonnet/config.jsonnet';

config.new(
  name='crossplane',
  specs=[
    {
      output: 'crossplane/1.2',
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.2.1'],
      localName: 'crossplane',
    },
    {
      output: 'provider-aws/0.18',
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.crossplane\\.aws\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-aws@v0.18.1'],
      localName: 'crossplane_aws',
    },
    {
      output: 'provider-gcp/0.17',
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.crossplane\\.gcp\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-gcp@v0.17.0'],
      localName: 'crossplane_gcp',
    },
    {
      output: 'provider-azure/0.16',
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.crossplane\\.azure\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-azure@v0.16.1'],
      localName: 'crossplane_azure',
    },
  ]
)
