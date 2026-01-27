local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '1.17', version: '1.17.0' },
];

config.new(
  name='onepassword-connect',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/1Password/connect-helm-charts/connect-%s/charts/connect/crds' % v.version,
      output: v.output,
      prefix: '^com\\.onepassword\\..*',
      crds: [
        '%s/onepassworditem-crd.yaml' % url,
      ],
      localName: 'onepassword-connect',
    }
    for v in versions
  ]
)
