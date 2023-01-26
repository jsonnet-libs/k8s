local config = import 'jsonnet/config.jsonnet';

config.new(
  name='crossplane',
  specs=[
    // Crossplane itself
    // Release support table: https://github.com/crossplane/crossplane#releases
    {
      output: 'crossplane/1.10',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.10.2'],
      localName: 'crossplane',
      patchDir: 'custom/crossplane',
    },
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

    // crossplane-contrib
    {
      output: 'provider-aws/0.36',
      prefix: '^io\\.crossplane\\.aws\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-aws@v0.36.1'],
      localName: 'crossplane_aws',
    },
    {
      output: 'provider-gcp/0.22',
      prefix: '^io\\.crossplane\\.gcp\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-gcp@v0.22.0'],
      localName: 'crossplane_gcp',
    },
    {
      output: 'provider-azure/0.20',
      prefix: '^io\\.crossplane\\.azure\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/provider-azure@v0.20.0'],
      localName: 'crossplane_azure',
    },
    {
      output: 'provider-sql/0.6',
      prefix: '^io\\.crossplane\\.sql\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-sql@v0.6.0'],
      localName: 'crossplane_sql',
    },
    {
      output: 'provider-kubernetes/0.6',
      prefix: '^io\\.crossplane\\.kubernetes\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-kubernetes@v0.6.0'],
      localName: 'crossplane_kubernetes',
    },
    {
      output: 'provider-helm/0.13',
      prefix: '^io\\.crossplane\\.helm\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-helm@v0.13.0'],
      localName: 'crossplane_helm',
    },
    {
      output: 'provider-jet-mongodbatlas/0.3',
      prefix: '^io\\.crossplane\\.jet\\.mongodbatlas\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-jet-mongodbatlas@v0.3.0'],
      localName: 'crossplane_jet_mongodbatlas',
    },

    // Grafana
    {
      output: 'provider-grafana/0.1',
      prefix: '^io\\.crossplane\\.grafana\\..*',
      crds: ['https://github.com/grafana/crossplane-provider-grafana/releases/download/v0.1.0/crds.yaml'],
      localName: 'crossplane_grafana',
    },

    // Upbound official providers
    // https://marketplace.upbound.io/
    {
      output: 'upbound-provider-aws/0.28',
      prefix: '^io\\.upbound\\.aws\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-aws@v0.28.0'],
      localName: 'upbound_aws',
    },
    {
      output: 'upbound-provider-azure/0.26',
      prefix: '^io\\.upbound\\.azure\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-azure@v0.26.0'],
      localName: 'upbound_azure',
    },
    {
      output: 'upbound-provider-gcp/0.26',
      prefix: '^io\\.upbound\\.gcp\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-gcp@v0.26.0'],
      localName: 'upbound_gcp',
    },
    {
      output: 'provider-terraform/0.4',
      prefix: '^io\\.upbound\\.tf\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-terraform@v0.4.0'],
      localName: 'crossplane_terraform',
    },
  ]
)
