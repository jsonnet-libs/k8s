
## metricIdentifier
MetricIdentifier defines the name and optionally selector for a metric

**Functions:**

[`fn .withName`](#fn-withname)  
[`fn selector.withMatchExpressions`](#fn-selectorwithmatchexpressions)  
[`fn selector.withMatchLabels`](#fn-selectorwithmatchlabels)  

---


### `fn .withName`
name is the name of the given metric
```jsonnet
{
  withName(name):: {}
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

