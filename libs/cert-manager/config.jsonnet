local name = 'cert-manager';
local repository = 'github.com/jsonnet-libs/' + name + '-lib';
local specs = [
  {
    output: '1.3',
    openapi: 'http://localhost:8001/openapi/v2',
    prefix: '^io\\.cert-manager\\..*',
    crd: 'https://github.com/jetstack/cert-manager/releases/download/v1.3.1/cert-manager.crds.yaml',
    localName: 'cert_manager',
    repository: 'github.com/jsonnet-libs/cert-manager-lib',
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
