
## nonResourceRule
NonResourceRule holds information that describes a rule for the non-resource

**Functions:**

[`fn .withNonResourceURLs`](#fn-withnonresourceurls)  
[`fn .withVerbs`](#fn-withverbs)  

---


### `fn .withNonResourceURLs`
NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path.  "*" means all.
```jsonnet
{
  withNonResourceURLs(nonResourceURLs):: {}
}
```

### `fn .withVerbs`
Verb is a list of kubernetes non-resource API verbs, like: get, post, put, delete, patch, head, options.  "*" means all.
```jsonnet
{
  withVerbs(verbs):: {}
}
```

