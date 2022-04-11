local config = import 'jsonnet/config.jsonnet';

local old_versions = [
  { output: '0.4', version: '0.4.4' },
];
local versions = [  // since 0.5
  { output: '0.5', version: '0.5.1' },
];

config.new(
  name='external-secrets',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/external-secrets/external-secrets/v%s/deploy/crds' % v.version,
      output: v.output,
      prefix: '^io\\.external-secrets\\..*',
      crds: [
        '%s/external-secrets.io_clustersecretstores.yaml' % url,
        '%s/external-secrets.io_externalsecrets.yaml' % url,
        '%s/external-secrets.io_secretstores.yaml' % url,
      ],
      localName: 'external_secrets',
    }
    for v in old_versions
  ] + [
    {
      local url = 'https://raw.githubusercontent.com/external-secrets/external-secrets/v%s/config/crds/bases' % v.version,
      output: v.output,
      prefix: '^io\\.external-secrets\\..*',
      crds: [
        '%s/external-secrets.io_clusterexternalsecrets.yaml' % url,
        '%s/external-secrets.io_clustersecretstores.yaml' % url,
        '%s/external-secrets.io_externalsecrets.yaml' % url,
        '%s/external-secrets.io_secretstores.yaml' % url,
      ],
      localName: 'external_secrets',
    }
    for v in versions
  ]
)
