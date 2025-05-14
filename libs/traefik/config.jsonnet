// libs/traefik/config.jsonnet

local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '3.3.3', chartTag: 'v34.3.0' },
  { version: '2.11.2', chartTag: 'v27.0.2' },
  { version: '2.10.6', chartTag: 'v26.0.0' },
];

config.new(
  name='traefik',

  specs=[
    {
      local url = 'https://raw.githubusercontent.com/traefik/traefik-helm-chart/%s/traefik/crds' % v.chartTag,

      output: v.version,
      prefix: '^io\\.traefik\\..*',

      crds:
        if std.startsWith(v.version, '3') then
          [
            '%s/gateway-standard-install.yaml' % url,
            '%s/hub.traefik.io_accesscontrolpolicies.yaml' % url,
            '%s/hub.traefik.io_aiservices.yaml' % url,
            '%s/hub.traefik.io_apiaccesses.yaml' % url,
            '%s/hub.traefik.io_apibundles.yaml' % url,
            '%s/hub.traefik.io_apicatalogitems.yaml' % url,
            '%s/hub.traefik.io_apiplans.yaml' % url,
            '%s/hub.traefik.io_apiportals.yaml' % url,
            '%s/hub.traefik.io_apiratelimits.yaml' % url,
            '%s/hub.traefik.io_apis.yaml' % url,
            '%s/hub.traefik.io_apiversions.yaml' % url,
            '%s/hub.traefik.io_managedsubscriptions.yaml' % url,
            '%s/traefik.io_ingressroutes.yaml' % url,
            '%s/traefik.io_ingressroutetcps.yaml' % url,
            '%s/traefik.io_ingressrouteudps.yaml' % url,
            '%s/traefik.io_middlewares.yaml' % url,
            '%s/traefik.io_middlewaretcps.yaml' % url,
            '%s/traefik.io_serverstransports.yaml' % url,
            '%s/traefik.io_serverstransporttcps.yaml' % url,
            '%s/traefik.io_tlsoptions.yaml' % url,
            '%s/traefik.io_tlsstores.yaml' % url,
            '%s/traefik.io_traefikservices.yaml' % url,
          ]
        else
          [
            '%s/traefik.io_ingressroutes.yaml' % url,
            '%s/traefik.io_ingressroutetcps.yaml' % url,
            '%s/traefik.io_ingressrouteudps.yaml' % url,
            '%s/traefik.io_middlewares.yaml' % url,
            '%s/traefik.io_middlewaretcps.yaml' % url,
            '%s/traefik.io_serverstransports.yaml' % url,
            '%s/traefik.io_serverstransporttcps.yaml' % url,
            '%s/traefik.io_tlsoptions.yaml' % url,
            '%s/traefik.io_tlsstores.yaml' % url,
            '%s/traefik.io_traefikservices.yaml' % url,
          ],
      localName: 'traefik',
    }
    for v in versions
  ]
)
