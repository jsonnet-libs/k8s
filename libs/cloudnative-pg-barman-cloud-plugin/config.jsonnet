// libs/cloudnative-pg-barman-cloud-plugin/config.jsonnet

local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: 'v0.16.0' },
  { version: 'v0.15.1' },
  { version: 'v0.6.0' },
];

config.new(
  name='cloudnative-pg-barman-cloud-plugin',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/cloudnative-pg/plugin-barman-cloud/%s/config/crd/bases' % v.version,
      output: v.version,
      crds:
        [
            '%s/barmancloud.cnpg.io_objectstores.yaml' % url,
        ],
      prefix: '^io\\.cnpg\\.barmancloud\\..*',
      localName: 'cloudnative-pg-barman-cloud-plugin',
    }
    for v in versions
  ]
)
