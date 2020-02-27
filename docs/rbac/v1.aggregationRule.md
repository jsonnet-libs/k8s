
## aggregationRule
AggregationRule describes how to locate ClusterRoles to aggregate into the ClusterRole

**Functions:**

[`fn .withClusterRoleSelectors`](#fn-withclusterroleselectors)  

---


### `fn .withClusterRoleSelectors`
ClusterRoleSelectors holds a list of selectors which will be used to find ClusterRoles and create the rules. If any of the selectors match, then the ClusterRole's permissions will be added
```jsonnet
{
  withClusterRoleSelectors(clusterRoleSelectors):: {}
}
```

