
## runAsGroupStrategyOptions
RunAsGroupStrategyOptions defines the strategy type and any options used to create the strategy. Deprecated: use RunAsGroupStrategyOptions from policy API Group instead.

**Functions:**

[`fn .withRanges`](#fn-withranges)  
[`fn .withRule`](#fn-withrule)  

---


### `fn .withRanges`
ranges are the allowed ranges of gids that may be used. If you would like to force a single gid then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn .withRule`
rule is the strategy that will dictate the allowable RunAsGroup values that may be set.
```jsonnet
{
  withRule(rule):: {}
}
```

