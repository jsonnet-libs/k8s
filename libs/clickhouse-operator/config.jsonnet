local config = import 'jsonnet/config.jsonnet';
local versions = [
  { output: '0.23', version: 'release-0.23.5' },
  { output: '0.22', version: 'release-0.22.2' },
  { output: '0.21', version: 'release-0.21.3' },
];

config.new(
  name='clickhouse-operator',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/Altinity/clickhouse-operator/%s/deploy/operator/parts' % v.version,
      output: v.output,
      prefix: '^com\\.altinity\\.clickhouse\\..*',
      crds: [
        '%s/crd.yaml' % url,
      ],
      localName: 'clickhouse-operator',
    }
    for v in versions
  ]
)
