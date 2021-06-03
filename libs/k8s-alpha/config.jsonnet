local repository = 'github.com/jsonnet-libs/k8s-alpha';
local versions = [
  '1.21',
  '1.20',
  '1.19',
  '1.18',
  '1.17',
  '1.16',
  '1.15',
  '1.14',
];

local specs = [
  {
    output: version,
    openapi: 'https://raw.githubusercontent.com/kubernetes/kubernetes/release-' + version + '/api/openapi-spec/swagger.json',
    prefix: '^io\\.k8s\\.api\\..*',
    patchDir: 'k8s-alpha/custom/core',
    extensionsDir: 'k8s-alpha/extensions/core',
    localName: 'k',
    repository: repository,
    description: 'Generated Jsonnet library for Kubernetes v' + version,
  }
  for version in versions
];

{
  'config.yml': std.manifestYamlDoc({
    repository: repository,
    specs: specs,
  }, true),

  'docs/README.md': (importstr 'README.md.tmpl') % {
    pages: std.join('\n', [
      '- [v%(version)s](%(version)s/README.md)' % { version: version }
      for version in versions
    ]),
  },
}
