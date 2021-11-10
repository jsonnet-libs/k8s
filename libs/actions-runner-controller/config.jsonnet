local config = import 'jsonnet/config.jsonnet';

local versions = [
  {output: '0.20', version: '0.20.3'}
];

config.new(
  name='actions-runner-controller',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/actions-runner-controller/actions-runner-controller/v%s/charts/actions-runner-controller/crds' % v.version,
      output: v.output,
      prefix: '^dev\\.summerwind\\.actions\\..*',
      crds: [
        '%s/actions.summerwind.dev_horizontalrunnerautoscalers.yaml' % url,
        '%s/actions.summerwind.dev_runnerdeployments.yaml' % url,
        '%s/actions.summerwind.dev_runnerreplicasets.yaml' % url,
        '%s/actions.summerwind.dev_runners.yaml' % url,
        '%s/actions.summerwind.dev_runnersets.yaml' % url,
      ],
      localName: 'actions-runner-controller',
    }
    for v in versions
  ]
)
