
## sELinuxStrategyOptions
SELinuxStrategyOptions defines the strategy type and any options used to create the strategy. Deprecated: use SELinuxStrategyOptions from policy API Group instead.

**Functions:**

[`fn .withRule`](#fn-withrule)  
[`fn seLinuxOptions.withLevel`](#fn-selinuxoptionswithlevel)  
[`fn seLinuxOptions.withRole`](#fn-selinuxoptionswithrole)  
[`fn seLinuxOptions.withType`](#fn-selinuxoptionswithtype)  
[`fn seLinuxOptions.withUser`](#fn-selinuxoptionswithuser)  

---


### `fn .withRule`
rule is the strategy that will dictate the allowable labels that may be set.
```jsonnet
{
  withRule(rule):: {}
}
```

### `fn seLinuxOptions.withLevel`
Level is SELinux level label that applies to the container.
```jsonnet
{
  withLevel(level):: {}
}
```

### `fn seLinuxOptions.withRole`
Role is a SELinux role label that applies to the container.
```jsonnet
{
  withRole(role):: {}
}
```

### `fn seLinuxOptions.withType`
Type is a SELinux type label that applies to the container.
```jsonnet
{
  withType(type):: {}
}
```

### `fn seLinuxOptions.withUser`
User is a SELinux user label that applies to the container.
```jsonnet
{
  withUser(user):: {}
}
```

