
## podDisruptionBudgetSpec
PodDisruptionBudgetSpec is a description of a PodDisruptionBudget.

**Functions:**

[`fn .withMaxUnavailable`](#fn-withmaxunavailable)  
[`fn .withMinAvailable`](#fn-withminavailable)  
[`fn selector.withMatchExpressions`](#fn-selectorwithmatchexpressions)  
[`fn selector.withMatchLabels`](#fn-selectorwithmatchlabels)  

---


### `fn .withMaxUnavailable`
IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
```jsonnet
{
  withMaxUnavailable(maxUnavailable):: {}
}
```

### `fn .withMinAvailable`
IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
```jsonnet
{
  withMinAvailable(minAvailable):: {}
}
```

### `fn selector.withMatchExpressions`
matchExpressions is a list of label selector requirements. The requirements are ANDed.
```jsonnet
{
  withMatchExpressions(matchExpressions):: {}
}
```

### `fn selector.withMatchLabels`
matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.
```jsonnet
{
  withMatchLabels(matchLabels):: {}
}
```

