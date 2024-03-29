local config = import 'jsonnet/config.jsonnet';

local versions = ['1.13.1', '1.12.4', '1.11.10'];

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