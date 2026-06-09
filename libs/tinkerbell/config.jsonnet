local config = import 'jsonnet/config.jsonnet';

// Run `make` to get the latest version and regenerate `crds.libsonnet`
local version = std.stripChars(importstr './version', ' \n');
local crds = import './crds.libsonnet';

// Major.minor of the upstream tag (e.g. v0.23.0 -> 0.23) used as the output dir.
local output = std.join('.', std.split(std.lstripChars(version, 'v'), '.')[0:2]);

config.new(
  name='tinkerbell',
  specs=[
    {
      output: output,
      prefix: '^org\\.tinkerbell\\..*',
      crds: ['https://raw.githubusercontent.com/tinkerbell/tinkerbell/%s/crd/bases/%s' % [version, crd] for crd in crds],
      localName: 'tinkerbell',
    },
  ],
)
