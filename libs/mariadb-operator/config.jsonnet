local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '25.10', version: '25.10.2' },
];

config.new(
  name='mariadb-operator',
  specs=[
    {
      output: v.output,
      prefix: '^com\\.mariadb\\.k8s\\..*',
      crds: ['https://raw.githubusercontent.com/mariadb-operator/mariadb-operator/refs/tags/v%s/deploy/crds/crds.yaml' % v.version],
    }
    for v in versions
  ]
)
