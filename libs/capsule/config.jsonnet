local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.15', version: 'v0.15.2' },
];

local crdFiles = [
  'capsule.clastix.io_capsuleconfigurations.yaml',
  'capsule.clastix.io_customquotas.yaml',
  'capsule.clastix.io_globalcustomquotas.yaml',
  'capsule.clastix.io_globalresourcequotas.yaml',
  'capsule.clastix.io_globaltenantresources.yaml',
  'capsule.clastix.io_quantityledgers.yaml',
  'capsule.clastix.io_resourcepoolclaims.yaml',
  'capsule.clastix.io_resourcepools.yaml',
  'capsule.clastix.io_rulestatuses.yaml',
  'capsule.clastix.io_tenantowners.yaml',
  'capsule.clastix.io_tenantresources.yaml',
  'capsule.clastix.io_tenants.yaml',
];

config.new(
  name='capsule',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/projectcapsule/capsule/%s/charts/capsule/crds' % v.version,
      output: v.output,
      prefix: '^io\\.clastix\\.capsule\\..*',
      crds: ['%s/%s' % [url, crdFile] for crdFile in crdFiles],
      localName: 'capsule',
    }
    for v in versions
  ]
)
