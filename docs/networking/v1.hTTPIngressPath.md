
## hTTPIngressPath
HTTPIngressPath associates a path regex with a backend. Incoming urls matching the path are forwarded to the backend.

**Functions:**

[`fn .withPath`](#fn-withpath)  
[`fn backend.withServiceName`](#fn-backendwithservicename)  
[`fn backend.withServicePort`](#fn-backendwithserviceport)  

---


### `fn .withPath`
Path is an extended POSIX regex as defined by IEEE Std 1003.1, (i.e this follows the egrep/unix syntax, not the perl syntax) matched against the path of an incoming request. Currently it can contain characters disallowed from the conventional "path" part of a URL as defined by RFC 3986. Paths must begin with a '/'. If unspecified, the path defaults to a catch all sending traffic to the backend.
```jsonnet
{
  withPath(path):: {}
}
```

### `fn backend.withServiceName`
Specifies the name of the referenced service.
```jsonnet
{
  withServiceName(serviceName):: {}
}
```

### `fn backend.withServicePort`
IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
```jsonnet
{
  withServicePort(servicePort):: {}
}
```

