local config = import 'jsonnet/config.jsonnet';
local versions = ['0.5.0'];
local manifests = ['cloud-sql-proxy-operator.yaml'];

config.new(
  name='google-cloud-sql-proxy-operator',
  specs=[
    {
      output: std.join('.', std.split(version, '.')[:2]),
      prefix: '^com\\.google\\.cloud\\.cloudsql\\..*',
      localName: 'google-cloud-sql-proxy-operator',
      crds: [
        'https://raw.githubusercontent.com/GoogleCloudPlatform/cloud-sql-proxy-operator/v%s/installer/%s' %
        [version, manifest]
        for manifest in manifests
      ],
    }
    for version in versions
  ]
)
