
## tokenReviewStatus
TokenReviewStatus is the result of the token authentication request.

**Functions:**

[`fn .withAudiences`](#fn-withaudiences)  
[`fn .withAuthenticated`](#fn-withauthenticated)  
[`fn .withError`](#fn-witherror)  
[`fn user.withExtra`](#fn-userwithextra)  
[`fn user.withGroups`](#fn-userwithgroups)  
[`fn user.withUid`](#fn-userwithuid)  
[`fn user.withUsername`](#fn-userwithusername)  

---


### `fn .withAudiences`
Audiences are audience identifiers chosen by the authenticator that are compatible with both the TokenReview and token. An identifier is any identifier in the intersection of the TokenReviewSpec audiences and the token's audiences. A client of the TokenReview API that sets the spec.audiences field should validate that a compatible audience identifier is returned in the status.audiences field to ensure that the TokenReview server is audience aware. If a TokenReview returns an empty status.audience field where status.authenticated is "true", the token is valid against the audience of the Kubernetes API server.
```jsonnet
{
  withAudiences(audiences):: {}
}
```

### `fn .withAuthenticated`
Authenticated indicates that the token was associated with a known user.
```jsonnet
{
  withAuthenticated(authenticated):: {}
}
```

### `fn .withError`
Error indicates that the token couldn't be checked
```jsonnet
{
  withError(err):: {}
}
```

### `fn user.withExtra`
Any additional information provided by the authenticator.
```jsonnet
{
  withExtra(extra):: {}
}
```

### `fn user.withGroups`
The names of groups this user is a part of.
```jsonnet
{
  withGroups(groups):: {}
}
```

### `fn user.withUid`
A unique value that identifies this user across time. If this user is deleted and another user by the same name is added, they will have different UIDs.
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn user.withUsername`
The name that uniquely identifies this user among all active users.
```jsonnet
{
  withUsername(username):: {}
}
```

