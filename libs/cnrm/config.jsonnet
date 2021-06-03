local name = 'cnrm';
local repository = 'github.com/jsonnet-libs/' + name + '-lib';
local specs = [
  {
    output: '1.33',
    openapi: 'http://localhost:8001/openapi/v2',
    prefix: '^com\\.google\\.cloud\\.cnrm\\..*',
    crd: 'https://raw.githubusercontent.com/GoogleCloudPlatform/k8s-config-connector/1.33.0/install-bundles/install-bundle-workload-identity/crds.yaml',
    localName: 'cnrm',
    repository: 'github.com/jsonnet-libs/cnrm-lib',
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
