local config = import 'jsonnet/config.jsonnet';

config.new(
  name='kube-prometheus',
  specs=[
    {
      output: '0.8',
      prefix: '^com\\.coreos\\.monitoring\\..*',
      crds: [
        'https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/v0.8.0/manifests/setup/prometheus-operator-0alertmanagerConfigCustomResourceDefinition.yaml',
        'https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/v0.8.0/manifests/setup/prometheus-operator-0alertmanagerCustomResourceDefinition.yaml',
        'https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/v0.8.0/manifests/setup/prometheus-operator-0podmonitorCustomResourceDefinition.yaml',
        'https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/v0.8.0/manifests/setup/prometheus-operator-0probeCustomResourceDefinition.yaml',
        'https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/v0.8.0/manifests/setup/prometheus-operator-0prometheusCustomResourceDefinition.yaml',
        'https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/v0.8.0/manifests/setup/prometheus-operator-0prometheusruleCustomResourceDefinition.yaml',
        'https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/v0.8.0/manifests/setup/prometheus-operator-0servicemonitorCustomResourceDefinition.yaml',
        'https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/v0.8.0/manifests/setup/prometheus-operator-0thanosrulerCustomResourceDefinition.yaml',
      ],
      localName: 'kube_prometheus',
    },
  ]
)
