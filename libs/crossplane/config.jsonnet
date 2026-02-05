local config = import 'jsonnet/config.jsonnet';

config.new(
  name='crossplane',
  specs=[
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
      output: 'provider-kubernetes/0.15',
      prefix: '^io\\.crossplane\\.kubernetes\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane-contrib/provider-kubernetes@v0.15.0'],
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

    // Upbound official providers
    // https://marketplace.upbound.io/
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
    {
      output: 'function-patch-and-transform/0.7',
      prefix: '^io\\.crossplane\\.fn\\.pt\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/function-patch-and-transform/refs/tags/v0.7.0/package/input/pt.fn.crossplane.io_resources.yaml'],
      localName: 'function_patch_and_transform',
    },
    {
      output: 'function-cel-filter/0.1',
      prefix: '^io\\.crossplane\\.fn\\.cel\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/function-cel-filter/refs/tags/v0.1.1/package/input/cel.fn.crossplane.io_filters.yaml'],
      localName: 'function_cel_filter',
    },
    {
      output: 'function-kcl/0.11',
      prefix: '^io\\.crossplane\\.fn\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/function-kcl/refs/tags/v0.11.4/package/input/template.fn.crossplane.io_kclinputs.yaml'],
      localName: 'function_kcl',
    },
  ]
)
