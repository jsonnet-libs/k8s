
## ingressBackend
IngressBackend describes all endpoints for a given service and port.

**Functions:**

[`fn .withServiceName`](#fn-withservicename)  
[`fn .withServicePort`](#fn-withserviceport)  

---


### `fn .withServiceName`
Specifies the name of the referenced service.
```jsonnet
{
  withServiceName(serviceName):: {}
}
```

### `fn .withServicePort`
IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
```jsonnet
{
  withServicePort(servicePort):: {}
}
```

