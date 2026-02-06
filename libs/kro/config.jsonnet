local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.8', version: '0.8.4' },
];

config.new(
  name='kro',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/kubernetes-sigs/kro/refs/tags/v%s/helm/crds/' % v.version,
      output: v.output,
      crds: [
        '%s/kro.run_resourcegraphdefinitions.yaml' % url,
      ],
      prefix: '^run\\.kro\\..*',
      localName: 'kro',
    }
    for v in versions
  ]
)
