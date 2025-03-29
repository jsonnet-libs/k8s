local config = import 'jsonnet/config.jsonnet';

local old_versions = [
  { output: '0.4', version: '0.4.4' },
];

local versions = [  // since 0.5
  { output: '0.5', version: '0.5.9' },
  { output: '0.6', version: '0.6.1' },
  { output: '0.7', version: '0.7.3' },
  { output: '0.8', version: '0.8.12' },
  { output: '0.9', version: '0.9.12' },
];

local kustomization_versions = [ // since 0.15
  { output: '0.15', version: '0.15.1', kustomization: importstr './vendor/0.15/config/crds/bases/kustomization.yaml' },
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
        '%s/external-secrets.io_pushsecrets.yaml' % url,
        '%s/external-secrets.io_secretstores.yaml' % url,

        '%s/generators.external-secrets.io_acraccesstokens.yaml' % url,
        '%s/generators.external-secrets.io_ecrauthorizationtokens.yaml' % url,
        '%s/generators.external-secrets.io_fakes.yaml' % url,
        '%s/generators.external-secrets.io_gcraccesstokens.yaml' % url,
        '%s/generators.external-secrets.io_passwords.yaml' % url,
        '%s/generators.external-secrets.io_vaultdynamicsecrets.yaml' % url,
      ],
      localName: 'external_secrets',
    }
    for v in versions
  ] + [
    {
      local url = 'https://raw.githubusercontent.com/external-secrets/external-secrets/v%s/config/crds/bases' % v.version,
      output: v.output,
      prefix: '^io\\.external-secrets\\..*',
      crds: [
        '%s/%s' % [url, resource]
        for resource in std.parseYaml(v.kustomization)[0].resources
      ],
      localName: 'external_secrets',
    }
    for v in kustomization_versions
  ]
)
