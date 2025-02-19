// libs/traefik/config.jsonnet

local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '3.3.3', chartTag: 'v34.3.0' },
  { version: '2.11.2', chartTag: 'v27.0.2' },
  { version: '2.10.5', chartTag: 'v27.0.0' },
  { version: '2.10.5', chartTag: 'v25.0.0' },
  { version: '2.10.4', chartTag: 'v24.0.0' },
  { version: '2.10.4', chartTag: 'v23.2.0' },
  { version: '2.10.0', chartTag: 'v22.3.0' },  // breaking change with Traefik v2.9.10
  { version: '2.9.10', chartTag: 'v22.2.0', legacy: true },
  { version: '2.9.8', chartTag: 'v21.2.1', legacy: true },
  { version: '2.8.0', chartTag: 'v10.24.0', legacy: true },  // A rather old version I'm still using, and should update
];

config.new(
  name='traefik',

  specs=[
    {
      local url = 'https://raw.githubusercontent.com/traefik/traefik-helm-chart/%s/traefik/crds' % v.chartTag,

      output: v.version,
      prefix:
        if std.objectHas(v, 'legacy') then
          '^us\\.containo\\.traefik\\..*'
        else '^io\\.traefik\\..*',

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
        else if std.objectHas(v, 'legacy') then
          [
            '%s/ingressroute.yaml' % url,
            '%s/ingressroutetcp.yaml' % url,
            '%s/ingressrouteudp.yaml' % url,
            '%s/middlewares.yaml' % url,
            '%s/middlewarestcp.yaml' % url,
            '%s/serverstransports.yaml' % url,
            '%s/tlsoptions.yaml' % url,
            '%s/tlsstores.yaml' % url,
            '%s/traefikservices.yaml' % url,
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
