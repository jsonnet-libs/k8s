local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '3.12', version: '3.12.0' },
];

config.new(
  name='gatekeeper',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/open-policy-agent/gatekeeper/v%s/charts/gatekeeper/crds' % v.version,
      output: v.output,
      prefix: '^sh\\.gatekeeper\\..*',
      crds: [
        '%s/%s' % [url, crd]

        for crd in [
          'assign-customresourcedefinition.yaml',
          'assignimage-customresourcedefinition.yaml',
          'assignmetadata-customresourcedefinition.yaml',
          'config-customresourcedefinition.yaml',
          'constraintpodstatus-customresourcedefinition.yaml',
          'constrainttemplate-customresourcedefinition.yaml',
          'constrainttemplatepodstatus-customresourcedefinition.yaml',
          'expansiontemplate-customresourcedefinition.yaml',
          'modifyset-customresourcedefinition.yaml',
          'mutatorpodstatus-customresourcedefinition.yaml',
          'provider-customresourcedefinition.yaml',
        ]
      ],
      localName: 'external_secrets',
    }
    for v in versions
  ]
)
