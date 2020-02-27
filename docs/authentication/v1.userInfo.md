
## userInfo
UserInfo holds the information about the user needed to implement the user.Info interface.

**Functions:**

[`fn .withExtra`](#fn-withextra)  
[`fn .withGroups`](#fn-withgroups)  
[`fn .withUid`](#fn-withuid)  
[`fn .withUsername`](#fn-withusername)  

---


### `fn .withExtra`
Any additional information provided by the authenticator.
```jsonnet
{
  withExtra(extra):: {}
}
```

### `fn .withGroups`
The names of groups this user is a part of.
```jsonnet
{
  withGroups(groups):: {}
}
```

### `fn .withUid`
A unique value that identifies this user across time. If this user is deleted and another user by the same name is added, they will have different UIDs.
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn .withUsername`
The name that uniquely identifies this user among all active users.
```jsonnet
{
  withUsername(username):: {}
}
```

