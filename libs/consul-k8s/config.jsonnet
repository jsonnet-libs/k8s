local config = import 'jsonnet/config.jsonnet';

local versions = ['0.34.1'];

config.new(
  name='consul-k8s',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/hashicorp/consul-k8s/v%s/control-plane/config/crd/bases' % version,
      output: version,
      prefix: '^com\\.hashicorp\\.consul\\..*',
      crds: [
        '%s/consul.hashicorp.com_ingressgateways.yaml' % url,
        '%s/consul.hashicorp.com_servicedefaults.yaml' % url,
        '%s/consul.hashicorp.com_servicerouters.yaml' % url,
        '%s/consul.hashicorp.com_meshes.yaml' % url,
        '%s/consul.hashicorp.com_serviceintentions.yaml' % url,
        '%s/consul.hashicorp.com_servicesplitters.yaml' % url,
        '%s/consul.hashicorp.com_proxydefaults.yaml' % url,
        '%s/consul.hashicorp.com_serviceresolvers.yaml' % url,
        '%s/consul.hashicorp.com_terminatinggateways.yaml' % url,
      ],
      localName: 'consul-k8s',
    }
    for version in versions
  ]
)
