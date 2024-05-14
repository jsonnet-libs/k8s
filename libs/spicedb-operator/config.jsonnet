local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.14', tag: 'v1.14.0' },
];

config.new(
  name='spicedb-operator',
  specs=[
    {
      output: v.version,
      prefix: '^com\\.authzed\\..*',
      crds: ['https://raw.githubusercontent.com/authzed/spicedb-operator/%(tag)s/config/crds/authzed.com_spicedbclusters.yaml' % v],
      localName: 'spicedb-operator',
    }
    for v in versions
  ]
)
