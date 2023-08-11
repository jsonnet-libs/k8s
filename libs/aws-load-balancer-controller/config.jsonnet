local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '2.2', tag: 'v2.2.4'},
  { version: '2.3', tag: 'v2.3.1'},
  { version: '2.4', tag: 'v2.4.7'},
  { version: '2.5', tag: 'v2.5.4'},
  { version: '2.6', tag: 'v2.6.0'},
];

config.new(
  name='aws-load-balancer-controller',
  specs=[
    {
      output: v.version,
      prefix: '^aws\\.k8s\\.elbv2\\..*',
      crds: [
        'https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/%s/helm/aws-load-balancer-controller/crds/crds.yaml' % v.tag,
      ],
      localName: 'aws_load_balancer_controller',
    }
    for v in versions
  ]
)
