local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '0.1.0' },
  { version: '0.2.0' },
  { version: '0.3.0' },
];

config.new(
  name='vault-secrets-operator',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/hashicorp/vault-secrets-operator/main/config/crd/bases',
      prefix: '^com\\.hashicorp\\.secrets\\..*',
      output: v.version,
      crds: [
        '%s/secrets.hashicorp.com_hcpauths.yaml' % url,
        '%s/secrets.hashicorp.com_hcpvaultsecretsapps.yaml' % url,
        '%s/secrets.hashicorp.com_vaultauths.yaml' % url,
        '%s/secrets.hashicorp.com_vaultconnections.yaml' % url,
        '%s/secrets.hashicorp.com_vaultdynamicsecrets.yaml' % url,
        '%s/secrets.hashicorp.com_vaultpkisecrets.yaml' % url,
        '%s/secrets.hashicorp.com_vaultstaticsecrets.yaml' % url,
      ],
      localName: 'vault-secrets-operator',
    }
    for v in versions
  ]
)
