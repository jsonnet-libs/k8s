local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.3', version: '0.3.9' },
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
    for v in versions
  ]
)
