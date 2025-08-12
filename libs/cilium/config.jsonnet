local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.14', tag: 'v1.14.19' },
  { version: '1.15', tag: 'v1.15.16' },
  { version: '1.16', tag: 'v1.16.9' },
  { version: '1.17', tag: 'v1.17.3' },
  { version: '1.18', tag: 'v1.18.0' }
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
  'ciliumnodeconfigs.yaml',
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
