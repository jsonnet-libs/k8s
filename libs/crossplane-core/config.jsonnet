local config = import 'jsonnet/config.jsonnet';

config.new(
  name='crossplane-core',
  specs=[
    // Crossplane itself
    // Release support table: https://github.com/crossplane/crossplane#releases
    {
      output: 'crossplane/1.17',
      prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.17.0'],
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
  ]
)
