# libs/<name>/config.jsonnet
local config = (import 'jsonnet/config.jsonnet');
local crdFiles = ['chaosengine_crd.yaml','chaosexperiment_crd.yaml','chaosresults_crd.yaml'];

local versions = [
  { version: '2.8', tag: 'v2.8.0'},
  { version: '2.9', tag: 'v2.9.0'},
  { version: '2.10', tag: 'v2.10.0'},
  { version: '2.11', tag: 'v2.11.0'},
  { version: '2.12', tag: 'v2.12.0'},
  { version: '2.13', tag: 'v2.13.1'},
  { version: '2.14', tag: 'v2.14.0'},
  { version: '3.0', tag: '3.0.0-beta3'},
];

config.new(
  name='litmus-chaos',
  specs=[
    {
      output: v.version,
      local baseUrl = 'https://raw.githubusercontent.com/litmuschaos/chaos-operator/%s/deploy/crds' % v.tag,
      crds: [ '%s/%s' % [baseUrl, crd] for crd in crdFiles],
      prefix: '^io\\.litmuschaos\\..*',
      localName: 'litmus-chaos',
    } 
    for v in versions
  ]
)