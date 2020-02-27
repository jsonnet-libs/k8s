
## supplementalGroupsStrategyOptions
SupplementalGroupsStrategyOptions defines the strategy type and options used to create the strategy.

**Functions:**

[`fn .withRanges`](#fn-withranges)  
[`fn .withRule`](#fn-withrule)  

---


### `fn .withRanges`
ranges are the allowed ranges of supplemental groups.  If you would like to force a single supplemental group then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn .withRule`
rule is the strategy that will dictate what supplemental groups is used in the SecurityContext.
```jsonnet
{
  withRule(rule):: {}
}
```

