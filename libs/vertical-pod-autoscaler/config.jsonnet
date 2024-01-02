local config = import 'jsonnet/config.jsonnet';

config.new(
  name='vertical-pod-autoscaler',
  specs=[
    {
      output: '0.10',
      prefix: '^io\\.k8s\\.autoscaling\\..*',
      crds: [
        'https://raw.githubusercontent.com/kubernetes/autoscaler/vertical-pod-autoscaler-0.10.0/vertical-pod-autoscaler/deploy/vpa-v1-crd-gen.yaml',
      ],
      localName: 'vertical-pod-autoscaler',
      patchDir: 'custom/core',
    },
    {
      output: '0.11',
      prefix: '^io\\.k8s\\.autoscaling\\..*',
      crds: [
        'https://raw.githubusercontent.com/kubernetes/autoscaler/vertical-pod-autoscaler-0.11.0/vertical-pod-autoscaler/deploy/vpa-v1-crd-gen.yaml',
      ],
      localName: 'vertical-pod-autoscaler',
      patchDir: 'custom/core',
    },
    {
      output: '0.12',
      prefix: '^io\\.k8s\\.autoscaling\\..*',
      crds: [
        'https://raw.githubusercontent.com/kubernetes/autoscaler/vertical-pod-autoscaler-0.12.0/vertical-pod-autoscaler/deploy/vpa-v1-crd-gen.yaml',
      ],
      localName: 'vertical-pod-autoscaler',
      patchDir: 'custom/core',
    },
    {
      output: '0.14',
      prefix: '^io\\.k8s\\.autoscaling\\..*',
      crds: [
        'https://raw.githubusercontent.com/kubernetes/autoscaler/vertical-pod-autoscaler-0.14.0/vertical-pod-autoscaler/deploy/vpa-v1-crd-gen.yaml',
      ],
      localName: 'vertical-pod-autoscaler',
      patchDir: 'custom/core',
    },
    {
      output: '1.0.0',
      prefix: '^io\\.k8s\\.autoscaling\\..*',
      crds: [
        'https://raw.githubusercontent.com/kubernetes/autoscaler/vertical-pod-autoscaler-1.0.0/vertical-pod-autoscaler/deploy/vpa-v1-crd-gen.yaml',
      ],
      localName: 'vertical-pod-autoscaler',
      patchDir: 'custom/core',
    },
  ]
)
