local config = import 'jsonnet/config.jsonnet';

local versions = [
  '2.2.1',
];

config.new(
  name='spark-operator',
  specs=[
    {
      crds: [
        'https://raw.githubusercontent.com/kubeflow/spark-operator/v%s/charts/spark-operator-chart/crds/sparkoperator.k8s.io_scheduledsparkapplications.yaml' %v,
        'https://raw.githubusercontent.com/kubeflow/spark-operator/v%s/charts/spark-operator-chart/crds/sparkoperator.k8s.io_sparkapplications.yaml' %v,
      ],
      localName: 'spark-operator',
      output: v,
      prefix: '^io\\.k8s\\.sparkoperator',
    }
    for v in versions
  ]
)
