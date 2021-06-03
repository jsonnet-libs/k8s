local config = import 'jsonnet/config.jsonnet';
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

config.new(
  name='k8s-alpha',
  specs=[
    {
      output: version,
      openapi: 'https://raw.githubusercontent.com/kubernetes/kubernetes/release-' + version + '/api/openapi-spec/swagger.json',
      prefix: '^io\\.k8s\\.api\\..*',
      patchDir: 'libs/k8s-alpha/custom/core',
      extensionsDir: 'libs/k8s-alpha/extensions/core',
      localName: 'k',
      description: 'Generated Jsonnet library for Kubernetes v' + version,
    }
    for version in versions
  ]
)
+ {

  repository:: 'github.com/jsonnet-libs/k8s-alpha',
  branch:: 'master',
  site_url:: 'jsonnet-libs.github.io/k8s-alpha',

  'skel/README.md': (importstr './README_root.md.tmpl') % {
    version: versions[0],
  },

  'skel/docs/README.md': (importstr './README_docs.md.tmpl') % {
    pages: std.join('\n', [
      '- [%(version)s](%(version)s/README.md)' % { version: version }
      for version in versions
    ]),
  },
}
