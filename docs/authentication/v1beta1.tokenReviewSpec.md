
## tokenReviewSpec
TokenReviewSpec is a description of the token authentication request.

**Functions:**

[`fn .withAudiences`](#fn-withaudiences)  
[`fn .withToken`](#fn-withtoken)  

---


### `fn .withAudiences`
Audiences is a list of the identifiers that the resource server presented with the token identifies as. Audience-aware token authenticators will verify that the token was intended for at least one of the audiences in this list. If no audiences are provided, the audience will default to the audience of the Kubernetes apiserver.
```jsonnet
{
  withAudiences(audiences):: {}
}
```

### `fn .withToken`
Token is the opaque bearer token.
```jsonnet
{
  withToken(token):: {}
}
```

