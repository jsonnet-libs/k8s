local config = import 'jsonnet/config.jsonnet';

local legacy_versions = [
  ['3.24', '3.24.1'],
  ['3.25', '3.25.0'],
];

local legacy_path = 'https://raw.githubusercontent.com/projectcalico/calico/v%s/_includes/charts/calico/crds/kdd/';

local versions = [
  ['3.28', '3.28.1'],
];

// The files in new versions were moved here:
local path = 'https://raw.githubusercontent.com/projectcalico/calico/v%s/libcalico-go/config/crd/';

config.new(
  name='calico',
  specs=[
    {
      output: version[0],
      prefix: '^org\\.projectcalico\\.crd\\..*',
      crds: [
        (path % version[1]) + 'crd.projectcalico.org_bgpconfigurations.yaml',
        (path % version[1]) + 'crd.projectcalico.org_bgpfilters.yaml',
        (path % version[1]) + 'crd.projectcalico.org_bgppeers.yaml',
        (path % version[1]) + 'crd.projectcalico.org_blockaffinities.yaml',
        (path % version[1]) + 'crd.projectcalico.org_caliconodestatuses.yaml',
        (path % version[1]) + 'crd.projectcalico.org_clusterinformations.yaml',
        (path % version[1]) + 'crd.projectcalico.org_felixconfigurations.yaml',
        (path % version[1]) + 'crd.projectcalico.org_globalnetworkpolicies.yaml',
        (path % version[1]) + 'crd.projectcalico.org_globalnetworksets.yaml',
        (path % version[1]) + 'crd.projectcalico.org_hostendpoints.yaml',
        (path % version[1]) + 'crd.projectcalico.org_ipamblocks.yaml',
        (path % version[1]) + 'crd.projectcalico.org_ipamconfigs.yaml',
        (path % version[1]) + 'crd.projectcalico.org_ipamhandles.yaml',
        (path % version[1]) + 'crd.projectcalico.org_ipreservations.yaml',
        // IPPools resource is currently not included because the CRD breaks jsonnet by having a `-` within the deprecated key name `nat-outgoing`.
        // Once this has been removed, this file can be included and the comment removed.
        // https://github.com/projectcalico/calico/issues/6638
        // (path % version[1]) + 'crd.projectcalico.org_ippools.yaml',
        (path % version[1]) + 'crd.projectcalico.org_kubecontrollersconfigurations.yaml',
        (path % version[1]) + 'crd.projectcalico.org_networkpolicies.yaml',
        (path % version[1]) + 'crd.projectcalico.org_networksets.yaml',
      ],
      localName: 'calico',
    }
    for version in versions
  ] + [
    {
      output: version[0],
      prefix: '^org\\.projectcalico\\.crd\\..*',
      crds: [
        (legacy_path % version[1]) + 'crd.projectcalico.org_bgpconfigurations.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_bgppeers.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_blockaffinities.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_clusterinformations.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_felixconfigurations.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_globalnetworkpolicies.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_globalnetworksets.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_hostendpoints.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_ipamblocks.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_ipamconfigs.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_ipamhandles.yaml',
        // IPPools resource is currently not included because the CRD breaks jsonnet by having a `-` within the deprecated key name `nat-outgoing`.
        // Once this has been removed, this file can be included and the comment removed.
        // (legacy_path % version[1]) + 'crd.projectcalico.org_ippools.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_kubecontrollersconfigurations.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_networkpolicies.yaml',
        (legacy_path % version[1]) + 'crd.projectcalico.org_networksets.yaml',
      ],
      localName: 'calico',
    }
    for version in legacy_versions
  ]
)
