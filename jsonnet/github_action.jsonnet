local jobs = [
  'cert-manager',
  'cnrm',
  'crossplane',
  'istio',
  'k8s-alpha',
];

{
  '.github/workflows/main.yml': std.manifestYamlDoc({
    on: [
      'push',
    ],
    jobs: {
      [job]: {
        name: 'Generate Jsonnet libraries and their docs',
        'runs-on': 'ubuntu-latest',
        steps: [
          {
            uses: 'actions/checkout@v2',
          },
          {
            run:
              'make run INPUT_DIR=${PWD}/libs/' + job,
          },
        ],
      }
      for job in jobs
    },
  }),
}
