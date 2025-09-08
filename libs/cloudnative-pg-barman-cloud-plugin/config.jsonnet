// libs/cloudnative-pg-barman-cloud-plugin/config.jsonnet

local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: 'v0.6.0' },
];

config.new(
  name='cloudnative-pg-barman-cloud-plugin',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/cloudnative-pg/plugin-barman-cloud/config/crd/bases/',
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