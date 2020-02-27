
## resourceAttributes
ResourceAttributes includes the authorization attributes available for resource requests to the Authorizer interface

**Functions:**

[`fn .withGroup`](#fn-withgroup)  
[`fn .withName`](#fn-withname)  
[`fn .withNamespace`](#fn-withnamespace)  
[`fn .withResource`](#fn-withresource)  
[`fn .withSubresource`](#fn-withsubresource)  
[`fn .withVerb`](#fn-withverb)  
[`fn .withVersion`](#fn-withversion)  

---


### `fn .withGroup`
Group is the API Group of the Resource.  "*" means all.
```jsonnet
{
  withGroup(group):: {}
}
```

### `fn .withName`
Name is the name of the resource being requested for a "get" or deleted for a "delete". "" (empty) means all.
```jsonnet
{
  withName(name):: {}
}
```

### `fn .withNamespace`
Namespace is the namespace of the action being requested.  Currently, there is no distinction between no namespace and all namespaces "" (empty) is defaulted for LocalSubjectAccessReviews "" (empty) is empty for cluster-scoped resources "" (empty) means "all" for namespace scoped resources from a SubjectAccessReview or SelfSubjectAccessReview
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn .withResource`
Resource is one of the existing resource types.  "*" means all.
```jsonnet
{
  withResource(resource):: {}
}
```

### `fn .withSubresource`
Subresource is one of the existing resource types.  "" means none.
```jsonnet
{
  withSubresource(subresource):: {}
}
```

### `fn .withVerb`
Verb is a kubernetes resource API verb, like: get, list, watch, create, update, delete, proxy.  "*" means all.
```jsonnet
{
  withVerb(verb):: {}
}
```

### `fn .withVersion`
Version is the API Version of the Resource.  "*" means all.
```jsonnet
{
  withVersion(version):: {}
}
```

