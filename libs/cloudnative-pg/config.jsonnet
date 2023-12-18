// libs/cloudnative-pg/config.jsonnet

local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.21.1' }, // released on November 3, 2023
  { version: '1.20.4' }, // released on November 3, 2023
  { version: '1.19.6' }, // released on November 3, 2023
  { version: '1.18.5' }  // released on June 12, 2023
];

config.new(
  name='cloudnative-pg',
  specs=[
    {

      local url = 'https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/config/crd/bases/' ,

      output: v.version,
      crds: [
        '%s/postgresql.cnpg.io_backups.yaml' % url,
        '%s/postgresql.cnpg.io_clusters.yaml' % url,
        '%s/postgresql.cnpg.io_poolers.yaml' % url,
        '%s/postgresql.cnpg.io_scheduledbackups.yaml' % url,
      ],
      prefix: '^io\\.cnpg\\.postgresql\\..*',
      localName: 'cloudnative-pg',
    }
    for v in versions
  ]
)
