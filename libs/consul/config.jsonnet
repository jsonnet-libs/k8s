local config = import 'jsonnet/config.jsonnet';

local old_versions = [
  {output: '0.34', version:'0.34.1'}
];

local versions = [
  {output: '1.3', version:'1.3.1'}
];

local url = 'https://raw.githubusercontent.com/hashicorp/consul-k8s/v%s/control-plane/config/crd/bases' % v.version;

config.new(
  name='consul',
  specs=[
    {
      output: v.output,
      prefix: '^com\\.hashicorp\\.consul\\..*',
      crds: [
        '%s/consul.hashicorp.com_ingressgateways.yaml' % url,
        '%s/consul.hashicorp.com_meshes.yaml' % url,
        '%s/consul.hashicorp.com_proxydefaults.yaml' % url,
        '%s/consul.hashicorp.com_servicedefaults.yaml' % url,
        '%s/consul.hashicorp.com_serviceintentions.yaml' % url,
        '%s/consul.hashicorp.com_serviceresolvers.yaml' % url,
        '%s/consul.hashicorp.com_servicerouters.yaml' % url,
        '%s/consul.hashicorp.com_servicesplitters.yaml' % url,
        '%s/consul.hashicorp.com_terminatinggateways.yaml' % url,
      ],
      localName: 'consul',
    }
    for v in old_versions
  ] + [
    {
      output: v.output,
      prefix: '^com\\.hashicorp\\.consul\\..*',
      crds: [
        '%s/consul.hashicorp.com_controlplanerequestlimits.yaml' % url,
        '%s/consul.hashicorp.com_exportedservices.yaml' % url,
        '%s/consul.hashicorp.com_gatewayclassconfigs.yaml' % url,
        '%s/consul.hashicorp.com_gatewaypolicies.yaml' % url,
        '%s/consul.hashicorp.com_ingressgateways.yaml' % url,
        '%s/consul.hashicorp.com_jwtproviders.yaml' % url,
        '%s/consul.hashicorp.com_meshes.yaml' % url,
        '%s/consul.hashicorp.com_meshservices.yaml' % url,
        '%s/consul.hashicorp.com_peeringacceptors.yaml' % url,
        '%s/consul.hashicorp.com_peeringdialers.yaml' % url,
        '%s/consul.hashicorp.com_proxydefaults.yaml' % url,
        '%s/consul.hashicorp.com_routeauthfilters.yaml' % url,
        '%s/consul.hashicorp.com_routeretryfilters.yaml' % url,
        '%s/consul.hashicorp.com_routetimeoutfilters.yaml' % url,
        '%s/consul.hashicorp.com_samenessgroups.yaml' % url,
        '%s/consul.hashicorp.com_servicedefaults.yaml' % url,
        '%s/consul.hashicorp.com_serviceintentions.yaml' % url,
        '%s/consul.hashicorp.com_serviceresolvers.yaml' % url,
        '%s/consul.hashicorp.com_servicerouters.yaml' % url,
        '%s/consul.hashicorp.com_servicesplitters.yaml' % url,
        '%s/consul.hashicorp.com_terminatinggateways.yaml' % url,
      ],
      localName: 'consul',
    }
    for v in versions
  ]
)
