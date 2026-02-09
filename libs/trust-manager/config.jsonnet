local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '0.20', tag: 'v0.20.2' },
];

config.new(
  name='trust-manager',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.(cert-manager\\.trust|trust-manager)\\..*',
      crds: [
        'https://raw.githubusercontent.com/cert-manager/trust-manager/refs/tags/' + v.tag + '/deploy/crds/trust-manager.io_clusterbundles.yaml',
        'https://raw.githubusercontent.com/cert-manager/trust-manager/refs/tags/' + v.tag + '/deploy/crds/trust.cert-manager.io_bundles.yaml',
      ],
      localName: 'trust_manager',
    }
    for v in versions
  ]
)
