local config = import 'jsonnet/config.jsonnet';

local upbound_aws_crds = import './upbound_aws_crds.libsonnet';
local upbound_gcp_crds = import './upbound_gcp_crds.libsonnet';
local upbound_azure_crds = import './upbound_azure_crds.libsonnet';

config.new(
  name='crossplane',
  specs=[
    // Crossplane itself
    // Release support table: https://github.com/crossplane/crossplane#releases
    {
      output: 'crossplane/1.15',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.15.0'],
      localName: 'crossplane',
      patchDir: 'custom/crossplane',
    },
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
      output: 'provider-grafana/0.18',
      prefix: '^io\\.crossplane\\.grafana\\..*',
      crds: ['https://github.com/grafana/crossplane-provider-grafana/releases/download/v0.18.0/crds.yaml'],
      localName: 'crossplane_grafana',
    },

    // Upbound official providers
    // https://marketplace.upbound.io/
    // WARNING: When bumping the version, ensure that you also update the 
    // version in the Makefile and run `make upbound_aws_crds.libsonnet` to update the CRDs list.
    {
      output: 'upbound-provider-aws/1.7',
      prefix: '^io\\.upbound\\.aws\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-aws/v1.7.0/package/crds/%s' % crd for crd in upbound_aws_crds],
      localName: 'upbound_aws',
    },
    // WARNING: When bumping the version, ensure that you also update the 
    // version in the Makefile and run `make upbound_azure_crds.libsonnet` to update the CRDs list.
    {
      output: 'upbound-provider-azure/1.3',
      prefix: '^io\\.upbound\\.azure\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-azure/v1.3.0/package/crds/%s' % crd for crd in upbound_azure_crds],
      localName: 'upbound_azure',
    },
    {
      output: 'upbound-provider-azuread/0.11',
      prefix: '^io\\.upbound\\.azuread\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-azuread@v0.11.0'],
      localName: 'upbound_azuread',
    },
    // WARNING: When bumping the version, ensure that you also update the 
    // version in the Makefile and run `make upbound_gcp_crds.libsonnet` to update the CRDs list.
    {
      output: 'upbound-provider-gcp/1.8',
      prefix: '^io\\.upbound\\.gcp\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-gcp/v1.8.3/package/crds/%s' % crd for crd in upbound_gcp_crds],
      localName: 'upbound_gcp',
    },
    {
      
      output: 'provider-terraform/0.10',
      prefix: '^io\\.upbound\\.tf\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-terraform@v0.10.0'],
      localName: 'upbound_terraform',
    },
    {
      output: 'provider-terraform/0.16',
      prefix: '^io\\.upbound\\.tf\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-terraform@v0.16.0'],
      localName: 'upbound_terraform',
    },
  ]
)
