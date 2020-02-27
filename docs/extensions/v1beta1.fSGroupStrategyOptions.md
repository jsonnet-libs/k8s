
## fSGroupStrategyOptions
FSGroupStrategyOptions defines the strategy type and options used to create the strategy. Deprecated: use FSGroupStrategyOptions from policy API Group instead.

**Functions:**

[`fn .withRanges`](#fn-withranges)  
[`fn .withRule`](#fn-withrule)  

---


### `fn .withRanges`
ranges are the allowed ranges of fs groups.  If you would like to force a single fs group then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn .withRule`
rule is the strategy that will dictate what FSGroup is used in the SecurityContext.
```jsonnet
{
  withRule(rule):: {}
}
```

