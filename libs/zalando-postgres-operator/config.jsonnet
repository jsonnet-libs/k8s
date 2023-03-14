local config = import 'jsonnet/config.jsonnet';
local versions = [
  {version: '1.8', tag: 'v1.8.2' },
  {version: '1.7', tag: 'v1.7.1' },
  {version: '1.6', tag: 'v1.6.3' },
];

config.new(
  name='zalando-postgres-operator',
  specs=[
    {
      output: v.version,
      prefix: '^do\\.zalan\\.acid\\..*',
      crds: [
        'https://github.com/zalando/postgres-operator/raw/'+v.tag+'/charts/postgres-operator/crds/operatorconfigurations.yaml',
        'https://github.com/zalando/postgres-operator/raw/'+v.tag+'/charts/postgres-operator/crds/postgresqls.yaml',
        'https://github.com/zalando/postgres-operator/raw/'+v.tag+'/charts/postgres-operator/crds/postgresteams.yaml',
      ],
      localName: 'zalando_postgres_operator',
    }
    for v in versions
  ]
)
