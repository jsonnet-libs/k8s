local config = import 'jsonnet/config.jsonnet';

config.new(
  name='crossplane',
  specs=[
    // Crossplane itself
    // Release support table: https://github.com/crossplane/crossplane#releases
    {
      output: 'crossplane/1.14',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.14.4'],
      localName: 'crossplane',
      patchDir: 'custom/crossplane',
    },
    {
      output: 'crossplane/1.13',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.13.0'],
      localName: 'crossplane',
      patchDir: 'custom/crossplane',
    },
    {
      output: 'crossplane/1.12',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.12.0'],
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
      output: 'provider-sql/0.7',
      prefix: '^io\\.crossplane\\.sql\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-sql@v0.7.0'],
      localName: 'crossplane_sql',
    },
    {
      output: 'provider-kubernetes/0.9',
      prefix: '^io\\.crossplane\\.kubernetes\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-kubernetes@v0.9.0'],
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
    {
      output: 'provider-nop/0.2.0',
      prefix: '^io\\.crossplane\\.nop\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-nop@v0.2.0'],
      localName: 'crossplane_nop',
    },

    // Grafana
    {
      output: 'provider-grafana/0.7',
      prefix: '^io\\.crossplane\\.grafana\\..*',
      crds: ['https://github.com/grafana/crossplane-provider-grafana/releases/download/v0.7.0/crds.yaml'],
      localName: 'crossplane_grafana',
    },

    // Upbound official providers
    // https://marketplace.upbound.io/
    {
      output: 'upbound-provider-aws/0.40',
      prefix: '^io\\.upbound\\.aws\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-aws@v0.40.0'],
      localName: 'upbound_aws',
    },
    {
      output: 'upbound-provider-azure/0.29',
      prefix: '^io\\.upbound\\.azure\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-azure@v0.29.0'],
      localName: 'upbound_azure',
    },
    {
      output: 'upbound-provider-azuread/0.11',
      prefix: '^io\\.upbound\\.azuread\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-azuread@v0.11.0'],
      localName: 'upbound_azuread',
    },
    {
      output: 'upbound-provider-gcp/0.36',
      prefix: '^io\\.upbound\\.gcp\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-gcp@v0.36.0'],
      localName: 'upbound_gcp',
    },
    {
      output: 'provider-terraform/0.10',
      prefix: '^io\\.upbound\\.tf\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-terraform@v0.10.0'],
      localName: 'upbound_terraform',
    },
  ]
)
