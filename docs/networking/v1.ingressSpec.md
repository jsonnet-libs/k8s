
## ingressSpec
IngressSpec describes the Ingress the user wishes to exist.

**Functions:**

[`fn .withRules`](#fn-withrules)  
[`fn .withTls`](#fn-withtls)  
[`fn backend.withServiceName`](#fn-backendwithservicename)  
[`fn backend.withServicePort`](#fn-backendwithserviceport)  

---


### `fn .withRules`
A list of host rules used to configure the Ingress. If unspecified, or no rule matches, all traffic is sent to the default backend.
```jsonnet
{
  withRules(rules):: {}
}
```

### `fn .withTls`
TLS configuration. Currently the Ingress only supports a single TLS port, 443. If multiple members of this list specify different hosts, they will be multiplexed on the same port according to the hostname specified through the SNI TLS extension, if the ingress controller fulfilling the ingress supports SNI.
```jsonnet
{
  withTls(tls):: {}
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

