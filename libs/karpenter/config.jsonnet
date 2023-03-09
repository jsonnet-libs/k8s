local config = import 'jsonnet/config.jsonnet';

local versions = [
  {output: '0.16', version: '0.16.1', url: 'https://raw.githubusercontent.com/aws/karpenter/v0.16.1/charts/karpenter/crds' },
  {output: '0.19', version: '0.19.0'},
  {output: '0.27', version: '0.27.0'},
];

config.new(
  name='karpenter',
  specs=[
    {
      local url = if std.objectHas(v, 'url') then v.url else 'https://raw.githubusercontent.com/aws/karpenter/v%s/pkg/apis/crds' % v.version,
      output: v.output,
      prefix: '^(aws\\.k8s\\.karpenter|sh\\.karpenter)\\..*',
      crds: [
        '%s/karpenter.k8s.aws_awsnodetemplates.yaml' % url,
        '%s/karpenter.sh_provisioners.yaml' % url,
      ],
      localName: 'karpenter',
    }
    for v in versions
  ]
)
