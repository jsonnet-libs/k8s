local config = import 'jsonnet/config.jsonnet';

local versions = [
  {output: '2.1.1', version: '8.2.0-2.1.1'}
];

config.new(
  name='mysql-operator',
  specs=[
    {
      output: v.output,
      prefix: '^com\\.oracle\\.mysql\\..*',
      crds: ['https://raw.githubusercontent.com/mysql/mysql-operator/%s/helm/mysql-operator/crds/crd.yaml' % v.version],
    }
    for v in versions
  ]
)
