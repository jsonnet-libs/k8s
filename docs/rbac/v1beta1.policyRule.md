
## policyRule
PolicyRule holds information that describes a policy rule, but does not contain information about who the rule applies to or which namespace the rule applies to.

**Functions:**

[`fn .withApiGroups`](#fn-withapigroups)  
[`fn .withNonResourceURLs`](#fn-withnonresourceurls)  
[`fn .withResourceNames`](#fn-withresourcenames)  
[`fn .withResources`](#fn-withresources)  
[`fn .withVerbs`](#fn-withverbs)  

---


### `fn .withApiGroups`
APIGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.
```jsonnet
{
  withApiGroups(apiGroups):: {}
}
```

### `fn .withNonResourceURLs`
NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path Since non-resource URLs are not namespaced, this field is only applicable for ClusterRoles referenced from a ClusterRoleBinding. Rules can either apply to API resources (such as "pods" or "secrets") or non-resource URL paths (such as "/api"),  but not both.
```jsonnet
{
  withNonResourceURLs(nonResourceURLs):: {}
}
```

### `fn .withResourceNames`
ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.
```jsonnet
{
  withResourceNames(resourceNames):: {}
}
```

### `fn .withResources`
Resources is a list of resources this rule applies to.  '*' represents all resources in the specified apiGroups. '*/foo' represents the subresource 'foo' for all resources in the specified apiGroups.
```jsonnet
{
  withResources(resources):: {}
}
```

### `fn .withVerbs`
Verbs is a list of Verbs that apply to ALL the ResourceKinds and AttributeRestrictions contained in this rule.  VerbAll represents all kinds.
```jsonnet
{
  withVerbs(verbs):: {}
}
```

