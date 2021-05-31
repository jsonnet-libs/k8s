local name = 'istio';
local repository = 'github.com/jsonnet-libs/' + name + '-lib';
local specs = [
  {
    output: '1.8',
    openapi: 'http://localhost:8001/openapi/v2',
    prefix: '^io\\.istio\\..*',
    crd: 'https://raw.githubusercontent.com/istio/istio/1.8.1/manifests/charts/base/crds/crd-all.gen.yaml',
    localName: 'istio',
    repository: 'github.com/jsonnet-libs/istio-lib',
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
