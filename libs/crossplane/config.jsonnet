local config = import 'jsonnet/config.jsonnet';

config.new(
  name='crossplane',
  specs=[
    {
      output: 'crossplane/1.9',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.9.0'],
      localName: 'crossplane',
      patchDir: 'custom/crossplane',
    },
    {
      output: 'crossplane/1.8',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.8.0'],
      localName: 'crossplane',
      patchDir: 'custom/crossplane',
    },
    {
      output: 'crossplane/1.7',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.7.0'],
      localName: 'crossplane',
      patchDir: 'custom/crossplane',
    },
    {
      output: 'provider-aws/0.24',
      prefix: '^io\\.crossplane\\.aws\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-aws@v0.24.1'],
      localName: 'crossplane_aws',
    },
    {
      output: 'provider-gcp/0.21',
      prefix: '^io\\.crossplane\\.gcp\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-gcp@v0.21.0'],
      localName: 'crossplane_gcp',
    },
    {
      output: 'provider-jet-aws/0.5',
      prefix: '^io\\.crossplane\\.jet\\.aws\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-jet-aws@v0.5.0-preview'],
      localName: 'crossplane_jet_aws',
    },
    {
      output: 'provider-jet-gcp/0.2',
      prefix: '^io\\.crossplane\\.jet\\.gcp\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-jet-gcp@v0.2.0-preview'],
      localName: 'crossplane_jet_gcp',
    },
    {
      output: 'provider-jet-mongodbatlas/0.2',
      prefix: '^io\\.crossplane\\.jet\\.mongodbatlas\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-jet-mongodbatlas@v0.2.1'],
      localName: 'crossplane_jet_mongodbatlas',
    },
    {
      output: 'provider-azure/0.19',
      prefix: '^io\\.crossplane\\.azure\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-azure@v0.19.0'],
      localName: 'crossplane_azure',
    },
    {
      output: 'provider-sql/0.4',
      prefix: '^io\\.crossplane\\.sql\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-sql@v0.4.0'],
      localName: 'crossplane_sql',
    },
    {
      output: 'provider-kubernetes/0.3',
      prefix: '^io\\.crossplane\\.kubernetes\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-kubernetes@v0.3.0'],
      localName: 'crossplane_kubernetes',
    },
    {
      output: 'provider-grafana/0.0',
      prefix: '^io\\.crossplane\\.grafana\\..*',
      crds: ['https://github.com/grafana/crossplane-provider-grafana/releases/download/v0.0.10/crds.yaml'],
      localName: 'crossplane_grafana',
    },
    {
      output: 'provider-helm/0.10',
      prefix: '^io\\.crossplane\\.helm\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-helm@v0.10.0'],
      localName: 'crossplane_helm',
    },
    {
      output: 'provider-terraform/0.3',
      prefix: '^io\\.crossplane\\.tf\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-terraform@v0.3.0'],
      localName: 'crossplane_terraform',
    },

    // Upbound official providers
    // https://marketplace.upbound.io/
    {
      output: 'upbound-provider-aws/0.21',
      prefix: '^io\\.upbound\\.aws\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-aws@v0.21.0'],
      localName: 'upbound_aws',
    },
    {
      output: 'upbound-provider-azure/0.19',
      prefix: '^io\\.upbound\\.azure\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-azure@v0.19.0'],
      localName: 'upbound_azure',
    },
    {
      output: 'upbound-provider-gcp/0.19',
      prefix: '^io\\.upbound\\.gcp\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-gcp@v0.19.0'],
      localName: 'upbound_gcp',
    },
  ]
)
