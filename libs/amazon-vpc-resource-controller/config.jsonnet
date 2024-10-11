local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.2', tag: 'v1.2.2' },
  { version: '1.3', tag: 'v1.3.4' },
  { version: '1.4', tag: 'v1.4.7' },
  { version: '1.5', tag: 'v1.5.0' },
  { version: '1.6', tag: 'v1.6.0' },
];

config.new(
  name='amazon-vpc-resource-controller',
  specs=[
    {
      output: v.version,
      prefix: '^aws\\.k8s\\.vpcresources\\..*',
      crds: [
        'https://raw.githubusercontent.com/aws/amazon-vpc-resource-controller-k8s/%s/config/crd/bases/vpcresources.k8s.aws_cninodes.yaml' % v.tag,
        'https://raw.githubusercontent.com/aws/amazon-vpc-resource-controller-k8s/%s/config/crd/bases/vpcresources.k8s.aws_securitygrouppolicies.yaml' % v.tag,
      ],
      localName: 'amazon_vpc_resource_controller',
    }
    for v in versions
  ]
)
