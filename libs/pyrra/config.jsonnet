local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.7', version: '0.7.7' },
  { output: '0.8', version: '0.8.4' },
  { output: '0.9', version: '0.9.5' },
  { output: '0.10', version: '0.10.0' },
];

config.new(
  name='pyrra',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/pyrra-dev/pyrra/v%s/examples/kubernetes/manifests/setup/pyrra-slo-CustomResourceDefinition.yaml' % v.version,
      output: v.output,
      prefix: '^dev\\.pyrra\\..*',
      crds: [url],
      localName: 'pyrra',
    }
    for v in versions
  ]
)
