
## resourceRule
ResourceRule is the list of actions the subject is allowed to perform on resources. The list ordering isn't significant, may contain duplicates, and possibly be incomplete.

**Functions:**

[`fn .withApiGroups`](#fn-withapigroups)  
[`fn .withResourceNames`](#fn-withresourcenames)  
[`fn .withResources`](#fn-withresources)  
[`fn .withVerbs`](#fn-withverbs)  

---


### `fn .withApiGroups`
APIGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.  "*" means all.
```jsonnet
{
  withApiGroups(apiGroups):: {}
}
```

### `fn .withResourceNames`
ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.  "*" means all.
```jsonnet
{
  withResourceNames(resourceNames):: {}
}
```

### `fn .withResources`
Resources is a list of resources this rule applies to.  "*" means all in the specified apiGroups.
 "*/foo" represents the subresource 'foo' for all resources in the specified apiGroups.
```jsonnet
{
  withResources(resources):: {}
}
```

### `fn .withVerbs`
Verb is a list of kubernetes resource API verbs, like: get, list, watch, create, update, delete, proxy.  "*" means all.
```jsonnet
{
  withVerbs(verbs):: {}
}
```

