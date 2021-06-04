local name = 'zalando-postgres';
local repository = 'github.com/jsonnet-libs/' + name + '-lib';
local specs = [
  {
    output: '1.6',
    openapi: 'http://localhost:8001/openapi/v2',
    prefix: '^do\\.zalan\\.acid\\..*',
    crd: 'https://github.com/zalando/postgres-operator/raw/v1.6.3/manifests/postgresql.crd.yaml',
    localName: 'zalando-postgres',
    repository: 'github.com/jsonnet-libs/zalando-postgres-lib',
  },
  {
    output: '1.6',
    openapi: 'http://localhost:8001/openapi/v2',
    prefix: '^do\\.zalan\\.acid\\..*',
    crd: 'https://github.com/zalando/postgres-operator/raw/v1.6.3/manifests/postgresteam.crd.yaml',
    localName: 'zalando-postgres',
    repository: 'github.com/jsonnet-libs/zalando-postgres-lib',
  },
  {
    output: '1.6',
    openapi: 'http://localhost:8001/openapi/v2',
    prefix: '^do\\.zalan\\.acid\\..*',
    crd: 'https://github.com/zalando/postgres-operator/raw/v1.6.3/manifests/operatorconfiguration.crd.yaml',
    localName: 'zalando-postgres',
    repository: 'github.com/jsonnet-libs/zalando-postgres-lib',
  },
];

{
  'config.yml': std.manifestYamlDoc({
    repository: repository,
    specs: specs,
  }, true),

  'docs/README.md': (importstr 'README.md.tmpl') % {
    name: name,
    pages: std.join('\n', [
      '- [%(output)s](%(output)s/README.md)' % spec
      for spec in specs
    ]),
  },
}
