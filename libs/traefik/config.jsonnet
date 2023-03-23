local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '2.8.0', chartTag: 'v10.24.0' }, # A rather old version I'm still using, and should update
  { version: '2.9.8', chartTag: 'v21.2.0' },
];

config.new(
  name='traefik',
  specs=[
    {
      output: v.version,
      crds: [
        'https://raw.githubusercontent.com/traefik/traefik-helm-chart/' + v.chartTag + '/traefik/crds/ingressroute.yaml',
        'https://raw.githubusercontent.com/traefik/traefik-helm-chart/' + v.chartTag + '/traefik/crds/ingressroutetcp.yaml',
        'https://raw.githubusercontent.com/traefik/traefik-helm-chart/' + v.chartTag + '/traefik/crds/ingressrouteudp.yaml',
        'https://raw.githubusercontent.com/traefik/traefik-helm-chart/' + v.chartTag + '/traefik/crds/middlewares.yaml',
        'https://raw.githubusercontent.com/traefik/traefik-helm-chart/' + v.chartTag + '/traefik/crds/middlewarestcp.yaml',
        'https://raw.githubusercontent.com/traefik/traefik-helm-chart/' + v.chartTag + '/traefik/crds/serverstransports.yaml',
        'https://raw.githubusercontent.com/traefik/traefik-helm-chart/' + v.chartTag + '/traefik/crds/tlsoptions.yaml',
        'https://raw.githubusercontent.com/traefik/traefik-helm-chart/' + v.chartTag + '/traefik/crds/tlsstores.yaml',
        'https://raw.githubusercontent.com/traefik/traefik-helm-chart/' + v.chartTag + '/traefik/crds/traefikservices.yaml',
      ],
      prefix: '^us\\.containo\\.traefik\\..*',
      localName: 'traefik',
    }
    for v in versions
  ]
)
