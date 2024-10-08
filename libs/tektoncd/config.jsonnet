local config = import 'jsonnet/config.jsonnet';

local urlTemplate = 'https://raw.githubusercontent.com/tektoncd/pipeline/v%(version)s/config/300-crds/300-%(crd)s.yaml';
local crds = [
  'clustertask',
  'customrun',
  'pipeline',
  'pipelinerun',
  'resolutionrequest',
  'task',
  'taskrun',
  'verificationpolicy',
];

local versions = ['0.62.1'];

config.new(
  name='tektoncd',
  specs=[
    {
      output: version,
      prefix: '^dev\\.tekton.*',
      crds: [
        urlTemplate % { crd: crd, version: version }
        for crd in crds
        ],
      localName: 'tektoncd',
    }
    for version in versions
  ]
)
