local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.12', tag: 'v1.12.19' },
  { version: '1.13', tag: 'v1.13.12' },
  { version: '1.14', tag: 'v1.14.7' },
  { version: '1.15', tag: 'v1.15.1' },
];

local pathPrefix = 'https://raw.githubusercontent.com/cilium/cilium/%s/pkg/k8s/apis/cilium.io/client/crds/v2/';
local crdFiles = [
  'ciliumclusterwideenvoyconfigs.yaml',
  'ciliumclusterwidenetworkpolicies.yaml',
  'ciliumegressgatewaypolicies.yaml',
  'ciliumendpoints.yaml',
  'ciliumenvoyconfigs.yaml',
  'ciliumexternalworkloads.yaml',
  'ciliumidentities.yaml',
  'ciliumlocalredirectpolicies.yaml',
  'ciliumnetworkpolicies.yaml',
  'ciliumnodes.yaml',
];

config.new(
  name='cilium',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.cilium\\..*',
      crds: [
        (pathPrefix % v.tag) + crdFile
        for crdFile in crdFiles
      ],
      localName: 'cilium',
    }
    for v in versions
  ]
)
