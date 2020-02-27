
## subjectAccessReviewSpec
SubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set

**Functions:**

[`fn .withExtra`](#fn-withextra)  
[`fn .withGroup`](#fn-withgroup)  
[`fn .withUid`](#fn-withuid)  
[`fn .withUser`](#fn-withuser)  
[`fn nonResourceAttributes.withPath`](#fn-nonresourceattributeswithpath)  
[`fn nonResourceAttributes.withVerb`](#fn-nonresourceattributeswithverb)  
[`fn resourceAttributes.withGroup`](#fn-resourceattributeswithgroup)  
[`fn resourceAttributes.withName`](#fn-resourceattributeswithname)  
[`fn resourceAttributes.withNamespace`](#fn-resourceattributeswithnamespace)  
[`fn resourceAttributes.withResource`](#fn-resourceattributeswithresource)  
[`fn resourceAttributes.withSubresource`](#fn-resourceattributeswithsubresource)  
[`fn resourceAttributes.withVerb`](#fn-resourceattributeswithverb)  
[`fn resourceAttributes.withVersion`](#fn-resourceattributeswithversion)  

---


### `fn .withExtra`
Extra corresponds to the user.Info.GetExtra() method from the authenticator.  Since that is input to the authorizer it needs a reflection here.
```jsonnet
{
  withExtra(extra):: {}
}
```

### `fn .withGroup`
Groups is the groups you're testing for.
```jsonnet
{
  withGroup(group):: {}
}
```

### `fn .withUid`
UID information about the requesting user.
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn .withUser`
User is the user you're testing for. If you specify "User" but not "Group", then is it interpreted as "What if User were not a member of any groups
```jsonnet
{
  withUser(user):: {}
}
```

### `fn nonResourceAttributes.withPath`
Path is the URL path of the request
```jsonnet
{
  withPath(path):: {}
}
```

### `fn nonResourceAttributes.withVerb`
Verb is the standard HTTP verb
```jsonnet
{
  withVerb(verb):: {}
}
```

### `fn resourceAttributes.withGroup`
Group is the API Group of the Resource.  "*" means all.
```jsonnet
{
  withGroup(group):: {}
}
```

### `fn resourceAttributes.withName`
Name is the name of the resource being requested for a "get" or deleted for a "delete". "" (empty) means all.
```jsonnet
{
  withName(name):: {}
}
```

### `fn resourceAttributes.withNamespace`
Namespace is the namespace of the action being requested.  Currently, there is no distinction between no namespace and all namespaces "" (empty) is defaulted for LocalSubjectAccessReviews "" (empty) is empty for cluster-scoped resources "" (empty) means "all" for namespace scoped resources from a SubjectAccessReview or SelfSubjectAccessReview
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn resourceAttributes.withResource`
Resource is one of the existing resource types.  "*" means all.
```jsonnet
{
  withResource(resource):: {}
}
```

### `fn resourceAttributes.withSubresource`
Subresource is one of the existing resource types.  "" means none.
```jsonnet
{
  withSubresource(subresource):: {}
}
```

### `fn resourceAttributes.withVerb`
Verb is a kubernetes resource API verb, like: get, list, watch, create, update, delete, proxy.  "*" means all.
```jsonnet
{
  withVerb(verb):: {}
}
```

### `fn resourceAttributes.withVersion`
Version is the API Version of the Resource.  "*" means all.
```jsonnet
{
  withVersion(version):: {}
}
```

