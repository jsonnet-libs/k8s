local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.1', version: '0.1.0' },
  { output: '0.2', version: '0.2.0' },
  { output: '0.3', version: '0.3.4' },
  { output: '0.4', version: '0.4.4' },
  { output: '0.5', version: '0.5.7' },
  { output: '0.6', version: '0.6.4' },
  { output: '0.7', version: '0.7.7' },
];

config.new(
  name='pyrra',
  specs=[
    {
      // in version 0.7, the CRD was moved from 'config/crd/bases' into 'examples/kubernetes/manifests/setup'
      local url = if std.parseInt(std.split(v.output, '.')[1]) <= 6 then
        'https://raw.githubusercontent.com/pyrra-dev/pyrra/v%s/config/crd/bases/pyrra.dev_servicelevelobjectives.yaml' % v.version
      else
        'https://raw.githubusercontent.com/pyrra-dev/pyrra/v%s/examples/kubernetes/manifests/setup/pyrra-slo-CustomResourceDefinition.yaml' % v.version,
      output: v.output,
      prefix: '^dev\\.pyrra\\..*',
      crds: [url],
      localName: 'pyrra',
    }
    for v in versions
  ]
)
