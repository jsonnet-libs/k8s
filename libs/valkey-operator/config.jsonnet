local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.9', version: '0.9.0' },
];

config.new(
  name='valkey-operator',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/valkey-io/valkey-operator/refs/tags/v%s/config/crd/bases/' % v.version,
      output: v.output,
      prefix: '^io\\.valkey\\..*',
      crds: [
        '%s/valkey.io_valkeyclusters.yaml' % url,
        '%s/valkey.io_valkeynodes.yaml' % url,
      ],
      localName: 'valkey-operator',
    }
    for v in versions
  ]
)
