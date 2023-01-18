local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '3.17.10', version: '3.17.10' },
];

local crds = [
  'logging.banzaicloud.io_flows.yaml', 
  'logging.banzaicloud.io_clusterflows.yaml', 
  'logging.banzaicloud.io_clusteroutputs.yaml', 
  'logging.banzaicloud.io_outputs.yaml',
];

config.new(
  name='banzai-logging',
  specs=[
    {
      output: v.output,
      prefix: '^io\\.banzaicloud\\.logging\\..*',
      crds: ['https://raw.githubusercontent.com/banzaicloud/logging-operator/chart/logging-operator-logging/%s/charts/logging-operator/crds/%s' % [v.version, c] 
	     for c in crds],
      localName: 'banzai-logging',
    }
    for v in versions
  ]
)
