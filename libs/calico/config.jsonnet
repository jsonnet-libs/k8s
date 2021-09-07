local config = import 'jsonnet/config.jsonnet';

local versions = ['3.15','3.16','3.17','3.18','3.19','3.20'];

config.new(
  name='calico',
  specs=[
    {
      output: version,
      prefix: '^org\\.projectcalico\\.crd\\..*',
      crds: [
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_bgpconfigurations.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_bgppeers.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_blockaffinities.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_clusterinformations.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_felixconfigurations.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_globalnetworkpolicies.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_globalnetworksets.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_hostendpoints.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_ipamblocks.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_ipamconfigs.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_ipamhandles.yaml' % version,
        // IPPools resource is currently not included because the CRD breaks jsonnet by having a `-` within the deprecated key name `nat-outgoing`.
        // Once this has been removed, this file can be included and the comment removed.
        // 'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_ippools.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_kubecontrollersconfigurations.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_networkpolicies.yaml' % version,
        'https://raw.githubusercontent.com/projectcalico/calico/v%s.0/_includes/charts/calico/crds/kdd/crd.projectcalico.org_networksets.yaml' % version,
      ],
      localName: 'calico',
    }
    for version in versions
  ]
)
