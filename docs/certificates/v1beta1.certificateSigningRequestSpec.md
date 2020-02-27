
## certificateSigningRequestSpec
This information is immutable after the request is created. Only the Request and Usages fields can be set on creation, other fields are derived by Kubernetes and cannot be modified by users.

**Functions:**

[`fn .withExtra`](#fn-withextra)  
[`fn .withGroups`](#fn-withgroups)  
[`fn .withRequest`](#fn-withrequest)  
[`fn .withUid`](#fn-withuid)  
[`fn .withUsages`](#fn-withusages)  
[`fn .withUsername`](#fn-withusername)  

---


### `fn .withExtra`
Extra information about the requesting user. See user.Info interface for details.
```jsonnet
{
  withExtra(extra):: {}
}
```

### `fn .withGroups`
Group information about the requesting user. See user.Info interface for details.
```jsonnet
{
  withGroups(groups):: {}
}
```

### `fn .withRequest`
Base64-encoded PKCS#10 CSR data
```jsonnet
{
  withRequest(request):: {}
}
```

### `fn .withUid`
UID information about the requesting user. See user.Info interface for details.
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn .withUsages`
allowedUsages specifies a set of usage contexts the key will be valid for. See: https://tools.ietf.org/html/rfc5280#section-4.2.1.3
     https://tools.ietf.org/html/rfc5280#section-4.2.1.12
```jsonnet
{
  withUsages(usages):: {}
}
```

### `fn .withUsername`
Information about the requesting user. See user.Info interface for details.
```jsonnet
{
  withUsername(username):: {}
}
```

