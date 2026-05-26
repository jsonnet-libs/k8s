local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.30.0' },
];

config.new(
  name='cassandra-operator',
  specs=[
    {
      output: v.version,
      prefix: '^com\\.datastax\\..*',
      crds: [
        'https://raw.githubusercontent.com/k8ssandra/cass-operator/v' + v.version + '/config/crd/bases/cassandra.datastax.com_cassandradatacenters.yaml',
        'https://raw.githubusercontent.com/k8ssandra/cass-operator/v' + v.version + '/config/crd/bases/control.k8ssandra.io_cassandratasks.yaml',
        'https://raw.githubusercontent.com/k8ssandra/cass-operator/v' + v.version + '/config/crd/bases/control.k8ssandra.io_scheduledtasks.yaml',
      ],
      localName: 'cassandra_operator',
    }
    for v in versions
  ]
)
