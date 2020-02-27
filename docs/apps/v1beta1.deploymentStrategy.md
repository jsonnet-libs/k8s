
## deploymentStrategy
DeploymentStrategy describes how to replace existing pods with new ones.

**Functions:**

[`fn .withType`](#fn-withtype)  
[`fn rollingUpdate.withMaxSurge`](#fn-rollingupdatewithmaxsurge)  
[`fn rollingUpdate.withMaxUnavailable`](#fn-rollingupdatewithmaxunavailable)  

---


### `fn .withType`
Type of deployment. Can be "Recreate" or "RollingUpdate". Default is RollingUpdate.
```jsonnet
{
  withType(type):: {}
}
```

### `fn rollingUpdate.withMaxSurge`
IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
```jsonnet
{
  withMaxSurge(maxSurge):: {}
}
```

### `fn rollingUpdate.withMaxUnavailable`
IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
```jsonnet
{
  withMaxUnavailable(maxUnavailable):: {}
}
```

