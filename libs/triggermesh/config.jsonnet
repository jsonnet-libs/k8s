local config = import 'jsonnet/config.jsonnet';

local versions = ['1.27.0'];

config.new(
  name='triggermesh',
  specs=[
    {
      output: v,
      crds: ['https://github.com/triggermesh/triggermesh/releases/download/v%s/triggermesh-crds.yaml' % v],
      prefix: '^io\\.triggermesh\\..*',
      localName: 'triggermesh',
    },
    for v in versions
  ]
)