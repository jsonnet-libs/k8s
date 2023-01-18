local config = import 'jsonnet/config.jsonnet';
local versions = [
  {output: '1.4', version:'1.4.14'},
  {output: '1.5', version:'1.5.10'},
  {output: '1.6', version:'1.6.7'},
  {output: '1.7', version:'1.7.0'},
];
config.new(
  name='kubevela',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/kubevela/kubevela/v%s/charts/vela-core/crds' % v.version,
      output: v.output,
      prefix: '^dev\\.oam\\..*',
      crds: [
        '%s/core.oam.dev_applicationrevisions.yaml' % url,
        '%s/core.oam.dev_applications.yaml' % url,
        '%s/core.oam.dev_componentdefinitions.yaml' % url,
        '%s/core.oam.dev_definitionrevisions.yaml' % url,
        '%s/core.oam.dev_envbindings.yaml' % url,
        '%s/core.oam.dev_healthscopes.yaml' % url,
        '%s/core.oam.dev_manualscalertraits.yaml' % url,
        '%s/core.oam.dev_policies.yaml' % url,
        '%s/core.oam.dev_policydefinitions.yaml' % url,
        '%s/core.oam.dev_resourcetrackers.yaml' % url,
        '%s/core.oam.dev_scopedefinitions.yaml' % url,
        '%s/core.oam.dev_traitdefinitions.yaml' % url,
        '%s/core.oam.dev_workflows.yaml' % url,
        '%s/core.oam.dev_workflowstepdefinitions.yaml' % url,
        '%s/core.oam.dev_workloaddefinitions.yaml' % url,
        '%s/standard.oam.dev_rollouts.yaml' % url,
      ],
      localName: 'kubevela',
    }
    for v in versions
  ]
)
