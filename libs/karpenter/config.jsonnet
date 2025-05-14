local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.27', version: '0.27.0' },
  { output: '0.31', version: '0.31.3' },
  { output: '0.32', version: '0.32.0' },
  { output: '0.33', version: '0.33.0' },
  { output: '0.34', version: '0.34.0' },
  { output: '0.35', version: '0.35.0' },
  { output: '0.37', version: '0.37.0' },
  { output: '1.0', version: '1.0.0' },
];
local getURL(v) =
  if std.objectHas(v, 'url')
  then v.url
  else 'https://raw.githubusercontent.com/aws/karpenter-provider-aws/v%s/pkg/apis/crds' % v.version;

config.new(
  name='karpenter',
  specs=[
    {
      local url = getURL(v),
      output: v.output + '/aws',
      prefix: '^(aws\\.k8s\\.karpenter)\\..*',
      crds: [
        '%s/karpenter.k8s.aws_awsnodetemplates.yaml' % url,
        '%s/karpenter.k8s.aws_ec2nodeclasses.yaml' % url,
      ],
      localName: 'karpenter',
    }
    for v in versions
  ] + [
    {
      local url = getURL(v),
      output: v.output + '/sh',
      prefix: '^(sh\\.karpenter)\\..*',
      crds: [
        '%s/karpenter.sh_provisioners.yaml' % url,
        '%s/karpenter.sh_nodepools.yaml' % url,
        '%s/karpenter.sh_nodeclaims.yaml' % url,
      ],
      localName: 'karpenter',
    }
    for v in versions
  ]
)
