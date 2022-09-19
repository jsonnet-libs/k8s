local config = import 'jsonnet/config.jsonnet';

local versions = [
  {output: '0.16', version: '0.16.1'},
];

config.new(
  name='karpenter',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/aws/karpenter/v%s/charts/karpenter/crds' % v.version,
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
