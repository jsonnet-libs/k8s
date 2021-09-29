local config = import 'jsonnet/config.jsonnet';

local versions = ['0.20.1'];

config.new(
  name='actions-runner-controller',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/actions-runner-controller/actions-runner-controller/v%s/charts/actions-runner-controller/crds' % version,
      output: version,
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
    for version in versions
  ]
)
