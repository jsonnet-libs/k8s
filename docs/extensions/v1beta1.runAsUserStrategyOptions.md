
## runAsUserStrategyOptions
RunAsUserStrategyOptions defines the strategy type and any options used to create the strategy. Deprecated: use RunAsUserStrategyOptions from policy API Group instead.

**Functions:**

[`fn .withRanges`](#fn-withranges)  
[`fn .withRule`](#fn-withrule)  

---


### `fn .withRanges`
ranges are the allowed ranges of uids that may be used. If you would like to force a single uid then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn .withRule`
rule is the strategy that will dictate the allowable RunAsUser values that may be set.
```jsonnet
{
  withRule(rule):: {}
}
```

