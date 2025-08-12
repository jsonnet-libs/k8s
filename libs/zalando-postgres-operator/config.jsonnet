local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.14', tag: 'v1.14.0' },
  { version: '1.13', tag: 'v1.13.0' },
  { version: '1.12', tag: 'v1.12.2' },
  { version: '1.11', tag: 'v1.11.0' },
  { version: '1.8', tag: 'v1.8.2' },
];

config.new(
  name='zalando-postgres-operator',
  specs=[
    {
      output: v.version,
      prefix: '^do\\.zalan\\.acid\\..*',
      crds: [
        'https://github.com/zalando/postgres-operator/raw/' + v.tag + '/charts/postgres-operator/crds/operatorconfigurations.yaml',
        'https://github.com/zalando/postgres-operator/raw/' + v.tag + '/charts/postgres-operator/crds/postgresqls.yaml',
        'https://github.com/zalando/postgres-operator/raw/' + v.tag + '/charts/postgres-operator/crds/postgresteams.yaml',
      ],
      localName: 'zalando_postgres_operator',
    }
    for v in versions
  ]
)
