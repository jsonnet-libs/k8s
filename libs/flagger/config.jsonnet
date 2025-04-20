local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '1.38', version: '1.38.0' },
  { output: '1.39', version: '1.39.0' },
  { output: '1.40', version: '1.40.0' },
  { output: '1.41', version: '1.41.0' },
];

config.new(
  name='flagger',
  specs=[
    {
      output: v.output,
      prefix: '^app\\.flagger\\..*',
      crds: ['https://raw.githubusercontent.com/fluxcd/flagger/v%s/charts/flagger/crds/crd.yaml' % v.version],
      localName: 'flagger',
    }
    for v in versions
  ]
)
