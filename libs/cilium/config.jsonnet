local config = import 'jsonnet/config.jsonnet';

local crdFiles = [
  'ciliumclusterwideenvoyconfigs.yaml',
  'ciliumclusterwidenetworkpolicies.yaml',
  'ciliumegressgatewaypolicies.yaml',
  'ciliumendpoints.yaml',
  'ciliumenvoyconfigs.yaml',
  'ciliumidentities.yaml',
  'ciliumlocalredirectpolicies.yaml',
  'ciliumnetworkpolicies.yaml',
  'ciliumnodeconfigs.yaml',
  'ciliumnodes.yaml',
];

// CRDs that moved to or were added in v2 with 1.18.
local v2From118 = [
  'ciliumbgpadvertisements.yaml',
  'ciliumbgpclusterconfigs.yaml',
  'ciliumbgpnodeconfigoverrides.yaml',
  'ciliumbgpnodeconfigs.yaml',
  'ciliumbgppeerconfigs.yaml',
  'ciliumcidrgroups.yaml',
  'ciliumloadbalancerippools.yaml',
];

local versions = [
  // ciliumexternalworkloads was removed in 1.18.
  { version: '1.16', tag: 'v1.16.18', extraFiles: ['ciliumexternalworkloads.yaml'] },
  { version: '1.17', tag: 'v1.17.11', extraFiles: ['ciliumexternalworkloads.yaml'] },
  { version: '1.18', tag: 'v1.18.16', extraFiles: v2From118 },
  { version: '1.19', tag: 'v1.19.10', extraFiles: v2From118 },
  { version: '1.20', tag: 'v1.20.4', extraFiles: v2From118 },
];

local pathPrefix = 'https://raw.githubusercontent.com/cilium/cilium/%s/pkg/k8s/apis/cilium.io/client/crds/v2/';

config.new(
  name='cilium',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.cilium\\..*',
      crds: [
        (pathPrefix % v.tag) + crdFile
        for crdFile in std.sort(crdFiles + v.extraFiles)
      ],
      localName: 'cilium',
    }
    for v in versions
  ]
)
