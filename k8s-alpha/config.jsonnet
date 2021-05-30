std.manifestYamlDoc({
  specs: [
    {
      output: 'k8s-alpha/' + version,
      openapi: 'https://raw.githubusercontent.com/kubernetes/kubernetes/release-' + version + '/api/openapi-spec/swagger.json',
      prefix: '^io\\.k8s\\.api\\..*',
      patchDir: 'k8s-alpha/custom/core',
      extensionsDir: 'k8s-alpha/extensions/core',
      localName: 'k',
      repository: 'github.com/jsonnet-libs/k8s-alpha',
      description: 'Generated Jsonnet library for Kubernetes v' + version,
    }
    for version in [
      '1.14',
      '1.15',
      '1.16',
      '1.17',
      '1.18',
      '1.19',
      '1.20',
      '1.21',
    ]
  ],
}, true)
