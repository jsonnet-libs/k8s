local config = import 'jsonnet/config.jsonnet';

local versions = [
  {output: '3.7', version:'3.7.0'},
  {output: '3.14', version:'3.14.3'},
  {output: '3.15', version:'3.15.2'},
];

config.new(
  name='securecodebox',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/secureCodeBox/secureCodeBox/v%s/operator/crds' % v.version,
      output: v.output,
      prefix: '^io\\.securecodebox\\..*',
      crds: [
        '%s/cascading.securecodebox.io_cascadingrules.yaml' % url,
        '%s/execution.securecodebox.io_parsedefinitions.yaml' % url,
        '%s/execution.securecodebox.io_scancompletionhooks.yaml' % url,
        '%s/execution.securecodebox.io_scans.yaml' % url,
        '%s/execution.securecodebox.io_scantypes.yaml' % url,
        '%s/execution.securecodebox.io_scheduledscans.yaml' % url,
      ],
      localName: 'securecodebox',
    }
    for v in versions
  ]
)
