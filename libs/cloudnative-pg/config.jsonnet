// libs/cloudnative-pg/config.jsonnet

local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.24.0' },  // released on 22 Aug, 2024
  { version: '1.23.4' },  // released on 22 Aug, 2024
];

config.new(
  name='cloudnative-pg',
  specs=[
    {

      local url = 'https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/config/crd/bases/',

      output: v.version,
      crds: [
        '%s/postgresql.cnpg.io_backups.yaml' % url,
        '%s/postgresql.cnpg.io_clusters.yaml' % url,
        '%s/postgresql.cnpg.io_clusterimagecatalogs.yaml' % url,
        '%s/postgresql.cnpg.io_imagecatalogs.yaml' % url,
        '%s/postgresql.cnpg.io_poolers.yaml' % url,
        '%s/postgresql.cnpg.io_scheduledbackups.yaml' % url,
      ],
      prefix: '^io\\.cnpg\\.postgresql\\..*',
      localName: 'cloudnative-pg',
    }
    for v in versions
  ]
)
