local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '2.6', version: '2.6.1' },
  { output: '2.7', version: '2.7.1' },
  { output: '2.8', version: '2.8.2' },
  { output: '2.9', version: '2.9.3' },
  { output: '2.10', version: '2.10.1' },
  { output: '2.11', version: '2.11.2' },
  { output: '2.12', version: '2.12.0' },
];

config.new(
  name='keda',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/kedacore/keda/v%s/config/crd/bases' % v.version,
      output: v.output,
      prefix: '^sh\\.keda\\..*',
      crds: [
        '%s/keda.sh_clustertriggerauthentications.yaml' % url,
        '%s/keda.sh_scaledjobs.yaml' % url,
        '%s/keda.sh_scaledobjects.yaml' % url,
        '%s/keda.sh_triggerauthentications.yaml' % url,
      ],
      localName: 'keda',
    }
    for v in versions
  ]
)
