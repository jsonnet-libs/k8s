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
  name='k8s',
  specs=[
    {
      output: version,
      openapi: 'https://raw.githubusercontent.com/kubernetes/kubernetes/release-' + version + '/api/openapi-spec/swagger.json',
      prefix: '^io\\.k8s\\.api\\..*',
      patchDir: 'custom/core',
      extensionsDir: 'extensions/core',
      localName: 'k',
      description: 'Generated Jsonnet library for Kubernetes v' + version,
    }
    for version in versions
  ]
)
+ {

  mkdocs_config+: {
    plugins+: [{
      'exclude-search': {
        exclude: [
          version + '/*'
          for version in versions[1:]
        ],
      },
    }],
  },

  'skel/README.md': (importstr './README_root.md.tmpl') % {
    version: versions[0],
  },

  'skel/docs/README.md': (importstr './README_docs.md.tmpl') % {
    pages: std.join('\n', [
      '- [v%(version)s](%(version)s/README.md)' % { version: version }
      for version in versions
    ]),
  },
}
