local config = import 'jsonnet/config.jsonnet';

local versions = [
  {output: '0.26', version: '0.26.0', legacy: true},
  {output: '0.27', version: '0.27.4', legacy: true},
  {output: '0.4', version: 'gha-runner-scale-set-0.4.0'},
  {output: '0.5', version: 'gha-runner-scale-set-0.5.0'},
];

config.new(
  name='actions-runner-controller',
  specs=[
    {
      local url =
        if std.objectHas(v, 'legacy') then
          'https://raw.githubusercontent.com/actions/actions-runner-controller/v%s/charts/actions-runner-controller/crds' % v.version
        else
          'https://raw.githubusercontent.com/actions/actions-runner-controller/%s/charts/gha-runner-scale-set-controller/crds' % v.version,

      output: v.output,
      prefix: if std.objectHas(v, 'legacy') then '^dev\\.summerwind\\.actions\\..*' else '^com\\.github\\.actions\\..*',
      crds:
        if std.objectHas(v, 'legacy') then
          [
            '%s/actions.summerwind.dev_horizontalrunnerautoscalers.yaml' % url,
            '%s/actions.summerwind.dev_runnerdeployments.yaml' % url,
            '%s/actions.summerwind.dev_runnerreplicasets.yaml' % url,
            '%s/actions.summerwind.dev_runners.yaml' % url,
            '%s/actions.summerwind.dev_runnersets.yaml' % url,
          ]
        else
          [
            '%s/actions.github.com_autoscalinglisteners.yaml' % url,
            '%s/actions.github.com_autoscalingrunnersets.yaml' % url,
            '%s/actions.github.com_ephemeralrunners.yaml' % url,
            '%s/actions.github.com_ephemeralrunnersets.yaml' % url,
          ],
      localName: 'actions-runner-controller',
    }
    for v in versions
  ]
)
