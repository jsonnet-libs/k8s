
## daemonSetUpdateStrategy


**Functions:**

[`fn .withType`](#fn-withtype)  
[`fn rollingUpdate.withMaxUnavailable`](#fn-rollingupdatewithmaxunavailable)  

---


### `fn .withType`
Type of daemon set update. Can be "RollingUpdate" or "OnDelete". Default is OnDelete.
```jsonnet
{
  withType(type):: {}
}
```

### `fn rollingUpdate.withMaxUnavailable`
IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
```jsonnet
{
  withMaxUnavailable(maxUnavailable):: {}
}
```

