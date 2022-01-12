local config = import 'jsonnet/config.jsonnet';

config.new(
  name='aws-load-balancer-controller',
  specs=[
    {
      output: '2.2',
      prefix: '^aws\\.k8s\\.elbv2\\..*',
      crds: [
        'https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.4/helm/aws-load-balancer-controller/crds/crds.yaml',
      ],
      localName: 'aws_load_balancer_controller',
    },
    {
      output: '2.3',
      prefix: '^aws\\.k8s\\.elbv2\\..*',
      crds: [
        'https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.3.1/helm/aws-load-balancer-controller/crds/crds.yaml',
      ],
      localName: 'aws_load_balancer_controller',
    },
    {
      output: '2.4',
      prefix: '^aws\\.k8s\\.elbv2\\..*',
      crds: [
        'https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.4.1/helm/aws-load-balancer-controller/crds/crds.yaml',
      ],
      localName: 'aws_load_balancer_controller',
    },
  ]
)
