
## serviceReference
ServiceReference holds a reference to Service.legacy.k8s.io

**Functions:**

[`fn .withName`](#fn-withname)  
[`fn .withNamespace`](#fn-withnamespace)  
[`fn .withPath`](#fn-withpath)  
[`fn .withPort`](#fn-withport)  

---


### `fn .withName`
`name` is the name of the service. Required
```jsonnet
{
  withName(name):: {}
}
```

### `fn .withNamespace`
`namespace` is the namespace of the service. Required
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn .withPath`
`path` is an optional URL path which will be sent in any request to this service.
```jsonnet
{
  withPath(path):: {}
}
```

### `fn .withPort`
If specified, the port on the service that hosting webhook. Default to 443 for backward compatibility. `port` should be a valid port number (1-65535, inclusive).
```jsonnet
{
  withPort(port):: {}
}
```

