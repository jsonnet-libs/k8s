local config = import 'jsonnet/config.jsonnet';

config.new(
  name='crossplane',
  specs=[
    {
      output: 'crossplane/1.6',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.6.3'],
      localName: 'crossplane',
    },
    {
      output: 'crossplane/1.5',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.5.1'],
      localName: 'crossplane',
    },
    {
      output: 'provider-aws/0.24',
      prefix: '^io\\.crossplane\\.aws\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-aws@v0.24.1'],
      localName: 'crossplane_aws',
    },
    {
      output: 'provider-gcp/0.20',
      prefix: '^io\\.crossplane\\.gcp\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-gcp@v0.20.0'],
      localName: 'crossplane_gcp',
    },
    {
      output: 'provider-jet-gcp/0.2',
      prefix: '^io\\.crossplane\\.jet\\.gcp\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-jet-gcp@v0.2.0-preview'],
      localName: 'crossplane_jet_gcp',
    },
    {
      output: 'provider-azure/0.18',
      prefix: '^io\\.crossplane\\.azure\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-azure@v0.18.1'],
      localName: 'crossplane_azure',
    },
    {
      output: 'provider-sql/0.3',
      prefix: '^io\\.crossplane\\.sql\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-sql@v0.3.0'],
      localName: 'crossplane_sql',
    },
    {
      output: 'provider-kubernetes/0.2',
      prefix: '^io\\.crossplane\\.kubernetes\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-kubernetes@v0.2.0'],
      localName: 'crossplane_kubernetes',
    },
  ]
)
