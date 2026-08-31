local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.4', version: '0.4.6' },
];

config.new(
  name='agent-sandbox',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/kubernetes-sigs/agent-sandbox/refs/tags/v%s/helm/crds' % v.version,
      output: v.output,
      prefix: '^io\\.x-k8s\\..*',
      crds: [
        '%s/agents.x-k8s.io_sandboxes.yaml' % url,
        '%s/extensions.agents.x-k8s.io_sandboxclaims.yaml' % url,
        '%s/extensions.agents.x-k8s.io_sandboxtemplates.yaml' % url,
        '%s/extensions.agents.x-k8s.io_sandboxwarmpools.yaml' % url,
      ],
      localName: 'agent_sandbox',
    }
    for v in versions
  ]
)
