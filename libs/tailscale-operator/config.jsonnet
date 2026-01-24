local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '1.94', version: '1.94.0' },
];

config.new(
  name='tailscale-operator',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/tailscale/tailscale/refs/tags/v%s/cmd/k8s-operator/deploy/crds/' % v.version,
      output: v.output,
      crds: [
        '%s/tailscale.com_connectors.yaml' % url,
        '%s/tailscale.com_dnsconfigs.yaml' % url,
        '%s/tailscale.com_proxyclasses.yaml' % url,
        '%s/tailscale.com_proxygroups.yaml' % url,
        '%s/tailscale.com_recorders.yaml' % url,
      ],
      prefix: '^com\\.tailscale\\..*',
      localName: 'tailscale-operator',
    }
    for v in versions
  ]
)
