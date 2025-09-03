# libs/<name>/config.jsonnet
local config = (import 'jsonnet/config.jsonnet');
local versions = ['2.8.0', '2.9.0', '2.10.0', '3.20.0'];
local crdFilesOperator = ['chaosengine_crd.yaml','chaosexperiment_crd.yaml','chaosresults_crd.yaml'];
local crdFilesScheduler = ['chaosschedule_crd.yaml'];

config.new(
  name='litmus-chaos',
  specs=[
    {
      local baseUrlOperator = 'https://raw.githubusercontent.com/litmuschaos/chaos-operator/%s/deploy/crds' % version,
      local baseUrlScheduler = 'https://raw.githubusercontent.com/litmuschaos/chaos-scheduler/%s/deploy/crds' % version,
      output: version,
      crds:
      [ '%s/%s' % [baseUrlOperator, crd] for crd in crdFilesOperator] +
      [ '%s/%s' % [baseUrlScheduler, crd] for crd in crdFilesScheduler],
      prefix: '^io\\.litmuschaos\\..*',
      localName: 'litmus-chaos',
    } 
    for version in versions
  ]
)