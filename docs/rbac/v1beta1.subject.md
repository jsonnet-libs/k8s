
## subject
Subject contains a reference to the object or user identities a role binding applies to.  This can either hold a direct API object reference, or a value for non-objects such as user and group names.

**Functions:**

[`fn .withApiGroup`](#fn-withapigroup)  
[`fn .withName`](#fn-withname)  
[`fn .withNamespace`](#fn-withnamespace)  

---


### `fn .withApiGroup`
APIGroup holds the API group of the referenced subject. Defaults to "" for ServiceAccount subjects. Defaults to "rbac.authorization.k8s.io" for User and Group subjects.
```jsonnet
{
  withApiGroup(apiGroup):: {}
}
```

### `fn .withName`
Name of the object being referenced.
```jsonnet
{
  withName(name):: {}
}
```

### `fn .withNamespace`
Namespace of the referenced object.  If the object kind is non-namespace, such as "User" or "Group", and this value is not empty the Authorizer should report an error.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

