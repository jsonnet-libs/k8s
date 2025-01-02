local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '2.10', version: '2.10.1' },
  { output: '2.11', version: '2.11.2' },
  { output: '2.12', version: '2.12.1' },
  { output: '2.13', version: '2.13.1' },
  { output: '2.14', version: '2.14.1' },
  { output: '2.15', version: '2.15.1' },
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
