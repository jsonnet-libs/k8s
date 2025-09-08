// libs/cloudnative-pg/config.jsonnet

local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.27.0' },
  { version: '1.26.1' },
  { version: '1.26.0' },
  { version: '1.25.3' },
];

config.new(
  name='cloudnative-pg',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/config/crd/bases/',
      output: v.version,
      crds:
        [
          '%s/postgresql.cnpg.io_backups.yaml' % url,
          '%s/postgresql.cnpg.io_clusterimagecatalogs.yaml' % url,
          '%s/postgresql.cnpg.io_clusters.yaml' % url,
          '%s/postgresql.cnpg.io_imagecatalogs.yaml' % url,
          '%s/postgresql.cnpg.io_poolers.yaml' % url,
          '%s/postgresql.cnpg.io_scheduledbackups.yaml' % url,
        ]
        + (
          if (v.version >= '1.25.0')
          then [
            '%s/postgresql.cnpg.io_databases.yaml' % url,
            '%s/postgresql.cnpg.io_publications.yaml' % url,
            '%s/postgresql.cnpg.io_subscriptions.yaml' % url,
          ]
          else []
        )
        + (
          if (v.version >= '1.27.0')
          then [
            '%s/postgresql.cnpg.io_failoverquorums.yaml' % url,
          ]
          else []
        ),
      prefix: '^io\\.cnpg\\.postgresql\\..*',
      localName: 'cloudnative-pg',
    }
    for v in versions
  ]
)
