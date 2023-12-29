local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '0.13', tag: '0.13.6' },
];

config.new(
  name='external-dns',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.k8s\\.externaldns\\..*',
      crds: ['https://raw.githubusercontent.com/kubernetes-sigs/external-dns/v%s/docs/contributing/crd-source/crd-manifest.yaml' % v.tag],
      localName: 'external_dns',
    }
    for v in versions
  ]
)
