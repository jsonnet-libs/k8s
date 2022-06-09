local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '1.13', version: '1.13.0' },
  { output: '1.16', version: '1.16.0' },
  { output: '1.21', version: '1.21.0' },
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
