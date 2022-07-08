# libs/<name>/config.jsonnet
local config = (import 'jsonnet/config.jsonnet');
local versions = ['2.8.0', '2.9.0', '2.10.0'];
local crdFiles = ['chaosengine_crd.yaml','chaosexperiment_crd.yaml','chaosresults_crd.yaml'];

config.new(
  name='litmus-chaos',
  specs=[
    {
      local baseUrl = 'https://raw.githubusercontent.com/litmuschaos/chaos-operator/%s/deploy/crds' % version,
      output: version,
      crds: [ '%s/%s' % [baseUrl, crd] for crd in crdFiles],
      prefix: '^io\\.litmuschaos\\..*',
      localName: 'litmus-chaos',
    } 
    for version in versions
  ]
)