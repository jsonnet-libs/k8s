local config = import 'jsonnet/config.jsonnet';

local versions = [
  ['3.15', '3.15.5'],
  ['3.16', '3.16.10'],
  ['3.17', '3.17.6'],
  ['3.18', '3.18.6'],
  ['3.19', '3.19.4'],
  ['3.20', '3.20.4'],
  ['3.21', '3.21.4'],
  ['3.22', '3.22.0'],
];

config.new(
  name='calico',
  specs=[
    {
      output: version[0],
      prefix: '^org\\.projectcalico\\.crd\\..*',
      crds: [
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_bgpconfigurations.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_bgppeers.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_blockaffinities.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_clusterinformations.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_felixconfigurations.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_globalnetworkpolicies.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_globalnetworksets.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_hostendpoints.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_ipamblocks.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_ipamconfigs.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_ipamhandles.yaml' % version[1],
        // IPPools resource is currently not included because the CRD breaks jsonnet by having a `-` within the deprecated key name `nat-outgoing`.
        // Once this has been removed, this file can be included and the comment removed.
        // 'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_ippools.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_kubecontrollersconfigurations.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_networkpolicies.yaml' % version[1],
        'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/crd.projectcalico.org_networksets.yaml' % version[1],
      ],
      localName: 'calico',
    }
    for version in versions
  ]
)
