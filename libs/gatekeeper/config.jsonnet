local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '3.12', version: '3.12.0' },
];

config.new(
  name='gatekeeper',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/open-policy-agent/gatekeeper/v%s/charts/gatekeeper/crds' % v.version,
      output: v.output,
      prefix: '^sh\\.gatekeeper\\..*',
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
