local config = import 'jsonnet/config.jsonnet';
local versions = [
  'v6.0.0',
  'v5.0.15',
  'v5.0.14',
  'v5.0.13',
  'v5.0.12',
  'v5.0.11'
];

config.new(
  name='minio-operator',
  specs=[
    {
      output: v,
      prefix: '^io\\.min\\..*',
      crds: [
        'https://raw.githubusercontent.com/minio/operator/%s/resources/base/crds/job.min.io_miniojobs.yaml' % v,
        'https://raw.githubusercontent.com/minio/operator/%s/resources/base/crds/minio.min.io_tenants.yaml' % v,
        'https://raw.githubusercontent.com/minio/operator/%s/resources/base/crds/sts.min.io_policybindings.yaml.yaml' % v,
      ],
      localName: 'minio-operator',
    }
    for v in versions
  ]
)

