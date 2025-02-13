local config = import 'jsonnet/config.jsonnet';

local versions = ['1.17.0', '1.16.0', '1.15.0'];

config.new(
  name='knative-eventing',
  specs=[
    {
      output: v,
      crds: ['https://github.com/knative/eventing/releases/download/knative-v%s/eventing-crds.yaml' % v],
      prefix: '^dev\\.knative\\..*',
      localName: 'knative-eventing',
    },
    for v in versions
  ]
)