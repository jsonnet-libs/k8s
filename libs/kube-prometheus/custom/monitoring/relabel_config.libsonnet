local d = import 'doc-util/main.libsonnet';

local relabelConfig = {
  '#':: d.pkg(name='relabelConfig', url='', help='RelabelConfig is a help to build RelabelConfig objects for ServiceMonitors and PodMonitors'),

  '#withSourceLabels':: d.fn('The source labels select values from existing labels. Their content is concatenated using the configured separator and matched against the configured regular expression for the replace, keep, and drop actions.', [d.arg('labels', d.T.array)]),
  withSourceLabels(labels): { sourceLabels: labels },

  '#withSeparator':: d.fn('Separator placed between concatenated source label values. default is ‘;’.', [d.arg('separator', d.T.string)]),
  withSeparator(separator): { separator: separator },

  '#withTargetLabel':: d.fn('Label to which the resulting value is written in a replace action. It is mandatory for replace actions. Regex capture groups are available.', [d.arg('separator', d.T.string)]),
  withTargetLabel(label): { targetLabel: label },

  '#withRegex':: d.fn('Regular expression against which the extracted value is matched. Default is ‘(.*)’', [d.arg('separator', d.T.string)]),
  withRegex(regex): { regex: regex },

  '#withModulus':: d.fn('Modulus to take of the hash of the source label values.', [d.arg('modulus', d.T.number)]),
  withModulus(modulus): { modulus: modulus },

  '#withReplacement':: d.fn('Replacement value against which a regex replace is performed if the regular expression matches. Regex capture groups are available. Default is ‘$1’', [d.arg('separator', d.T.string)]),
  withReplacement(replacement): { replacement: replacement },

  '#withAction':: d.fn('Action to perform based on regex matching. Default is ‘replace’', [d.arg('separator', d.T.string)]),
  withAction(action): { action: action },

  '#mixin': 'ignore',
  mixin: self,
};

{
  monitoring+:: {
    v1+: {
      relabelConfig: relabelConfig,
    },
    v1alpha1+: {
      relabelConfig: relabelConfig,
    },
  },
}
