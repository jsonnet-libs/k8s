local config = import 'jsonnet/config.jsonnet';

config.new(
  name='crossplane-core',
  specs=[
    // Crossplane itself
    // Release support table: https://github.com/crossplane/crossplane#releases
    {
      output: 'crossplane/2.0',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v2.0.0'],
      localName: 'crossplane',
      patchDir: 'custom/crossplane',
    },

    // Common functions
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
      output: 'function-status-transformer/0.4',
      prefix: '^io\\.crossplane\\.fn\\.function-status-transformer\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/function-status-transformer/refs/tags/v0.4.0/package/input/function-status-transformer.fn.crossplane.io_statustransformations.yaml'],
      localName: 'function_status_transformer',
    },
    {
      output: 'function-go-templating/0.9',
      prefix: '^io\\.crossplane\\.fn\\.gotemplating\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/function-go-templating/refs/tags/v0.9.1/package/input/gotemplating.fn.crossplane.io_gotemplates.yaml'],
      localName: 'function_go_templating',
    },
  ]
)
