local config = import 'jsonnet/config.jsonnet';

local versions = ['1.16.0', '1.15.2', '1.14.2', '1.13.1', '1.12.3', '1.11.6'];

config.new(
  name='knative-serving',
  specs=[
    {
      output: v,
      crds: ['https://github.com/knative/serving/releases/download/knative-v%s/serving-crds.yaml' % v],
      prefix: '^dev\\.knative\\..*',
      patchDir: 'custom/serving',
      localName: 'knative-serving',
    },
    for v in versions
  ]
)