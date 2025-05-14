local config = import 'jsonnet/config.jsonnet';

config.new(
  'upbound-provider-opentofu',
  [
    {
      output: 'provider-opentofu/0.2',
      prefix: '^io\\.upbound\\.opentofu\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-opentofu@v0.2.3'],
      localName: 'upbound_opentofu',
    },
  ]
)
