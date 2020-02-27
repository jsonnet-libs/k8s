
## mutatingWebhook
MutatingWebhook describes an admission webhook and the resources and operations it applies to.

**Functions:**

[`fn .withAdmissionReviewVersions`](#fn-withadmissionreviewversions)  
[`fn .withFailurePolicy`](#fn-withfailurepolicy)  
[`fn .withMatchPolicy`](#fn-withmatchpolicy)  
[`fn .withName`](#fn-withname)  
[`fn .withReinvocationPolicy`](#fn-withreinvocationpolicy)  
[`fn .withRules`](#fn-withrules)  
[`fn .withSideEffects`](#fn-withsideeffects)  
[`fn .withTimeoutSeconds`](#fn-withtimeoutseconds)  
[`fn clientConfig.service.withName`](#fn-clientconfigservicewithname)  
[`fn clientConfig.service.withNamespace`](#fn-clientconfigservicewithnamespace)  
[`fn clientConfig.service.withPath`](#fn-clientconfigservicewithpath)  
[`fn clientConfig.service.withPort`](#fn-clientconfigservicewithport)  
[`fn clientConfig.withCaBundle`](#fn-clientconfigwithcabundle)  
[`fn clientConfig.withUrl`](#fn-clientconfigwithurl)  
[`fn namespaceSelector.withMatchExpressions`](#fn-namespaceselectorwithmatchexpressions)  
[`fn namespaceSelector.withMatchLabels`](#fn-namespaceselectorwithmatchlabels)  
[`fn objectSelector.withMatchExpressions`](#fn-objectselectorwithmatchexpressions)  
[`fn objectSelector.withMatchLabels`](#fn-objectselectorwithmatchlabels)  

---


### `fn .withAdmissionReviewVersions`
AdmissionReviewVersions is an ordered list of preferred `AdmissionReview` versions the Webhook expects. API server will try to use first version in the list which it supports. If none of the versions specified in this list supported by API server, validation will fail for this object. If a persisted webhook configuration specifies allowed versions and does not include any versions known to the API Server, calls to the webhook will fail and be subject to the failure policy. Default to `['v1beta1']`.
```jsonnet
{
  withAdmissionReviewVersions(admissionReviewVersions):: {}
}
```

### `fn .withFailurePolicy`
FailurePolicy defines how unrecognized errors from the admission endpoint are handled - allowed values are Ignore or Fail. Defaults to Ignore.
```jsonnet
{
  withFailurePolicy(failurePolicy):: {}
}
```

### `fn .withMatchPolicy`
matchPolicy defines how the "rules" list is used to match incoming requests. Allowed values are "Exact" or "Equivalent".

- Exact: match a request only if it exactly matches a specified rule. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, but "rules" only included `apiGroups:["apps"], apiVersions:["v1"], resources: ["deployments"]`, a request to apps/v1beta1 or extensions/v1beta1 would not be sent to the webhook.

- Equivalent: match a request if modifies a resource listed in rules, even via another API group or version. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, and "rules" only included `apiGroups:["apps"], apiVersions:["v1"], resources: ["deployments"]`, a request to apps/v1beta1 or extensions/v1beta1 would be converted to apps/v1 and sent to the webhook.

Defaults to "Exact"
```jsonnet
{
  withMatchPolicy(matchPolicy):: {}
}
```

### `fn .withName`
The name of the admission webhook. Name should be fully qualified, e.g., imagepolicy.kubernetes.io, where "imagepolicy" is the name of the webhook, and kubernetes.io is the name of the organization. Required.
```jsonnet
{
  withName(name):: {}
}
```

### `fn .withReinvocationPolicy`
reinvocationPolicy indicates whether this webhook should be called multiple times as part of a single admission evaluation. Allowed values are "Never" and "IfNeeded".

Never: the webhook will not be called more than once in a single admission evaluation.

IfNeeded: the webhook will be called at least one additional time as part of the admission evaluation if the object being admitted is modified by other admission plugins after the initial webhook call. Webhooks that specify this option *must* be idempotent, able to process objects they previously admitted. Note: * the number of additional invocations is not guaranteed to be exactly one. * if additional invocations result in further modifications to the object, webhooks are not guaranteed to be invoked again. * webhooks that use this option may be reordered to minimize the number of additional invocations. * to validate an object after all mutations are guaranteed complete, use a validating admission webhook instead.

Defaults to "Never".
```jsonnet
{
  withReinvocationPolicy(reinvocationPolicy):: {}
}
```

### `fn .withRules`
Rules describes what operations on what resources/subresources the webhook cares about. The webhook cares about an operation if it matches _any_ Rule. However, in order to prevent ValidatingAdmissionWebhooks and MutatingAdmissionWebhooks from putting the cluster in a state which cannot be recovered from without completely disabling the plugin, ValidatingAdmissionWebhooks and MutatingAdmissionWebhooks are never called on admission requests for ValidatingWebhookConfiguration and MutatingWebhookConfiguration objects.
```jsonnet
{
  withRules(rules):: {}
}
```

### `fn .withSideEffects`
SideEffects states whether this webhookk has side effects. Acceptable values are: Unknown, None, Some, NoneOnDryRun Webhooks with side effects MUST implement a reconciliation system, since a request may be rejected by a future step in the admission change and the side effects therefore need to be undone. Requests with the dryRun attribute will be auto-rejected if they match a webhook with sideEffects == Unknown or Some. Defaults to Unknown.
```jsonnet
{
  withSideEffects(sideEffects):: {}
}
```

### `fn .withTimeoutSeconds`
TimeoutSeconds specifies the timeout for this webhook. After the timeout passes, the webhook call will be ignored or the API call will fail based on the failure policy. The timeout value must be between 1 and 30 seconds. Default to 30 seconds.
```jsonnet
{
  withTimeoutSeconds(timeoutSeconds):: {}
}
```

### `fn clientConfig.service.withName`
`name` is the name of the service. Required
```jsonnet
{
  withName(name):: {}
}
```

### `fn clientConfig.service.withNamespace`
`namespace` is the namespace of the service. Required
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn clientConfig.service.withPath`
`path` is an optional URL path which will be sent in any request to this service.
```jsonnet
{
  withPath(path):: {}
}
```

### `fn clientConfig.service.withPort`
If specified, the port on the service that hosting webhook. Default to 443 for backward compatibility. `port` should be a valid port number (1-65535, inclusive).
```jsonnet
{
  withPort(port):: {}
}
```

### `fn clientConfig.withCaBundle`
`caBundle` is a PEM encoded CA bundle which will be used to validate the webhook's server certificate. If unspecified, system trust roots on the apiserver are used.
```jsonnet
{
  withCaBundle(caBundle):: {}
}
```

### `fn clientConfig.withUrl`
`url` gives the location of the webhook, in standard URL form (`scheme://host:port/path`). Exactly one of `url` or `service` must be specified.

The `host` should not refer to a service running in the cluster; use the `service` field instead. The host might be resolved via external DNS in some apiservers (e.g., `kube-apiserver` cannot resolve in-cluster DNS as that would be a layering violation). `host` may also be an IP address.

Please note that using `localhost` or `127.0.0.1` as a `host` is risky unless you take great care to run this webhook on all hosts which run an apiserver which might need to make calls to this webhook. Such installs are likely to be non-portable, i.e., not easy to turn up in a new cluster.

The scheme must be "https"; the URL must begin with "https://".

A path is optional, and if present may be any string permissible in a URL. You may use the path to pass an arbitrary string to the webhook, for example, a cluster identifier.

Attempting to use a user or basic auth e.g. "user:password@" is not allowed. Fragments ("#...") and query parameters ("?...") are not allowed, either.
```jsonnet
{
  withUrl(url):: {}
}
```

### `fn namespaceSelector.withMatchExpressions`
matchExpressions is a list of label selector requirements. The requirements are ANDed.
```jsonnet
{
  withMatchExpressions(matchExpressions):: {}
}
```

### `fn namespaceSelector.withMatchLabels`
matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.
```jsonnet
{
  withMatchLabels(matchLabels):: {}
}
```

### `fn objectSelector.withMatchExpressions`
matchExpressions is a list of label selector requirements. The requirements are ANDed.
```jsonnet
{
  withMatchExpressions(matchExpressions):: {}
}
```

### `fn objectSelector.withMatchLabels`
matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.
```jsonnet
{
  withMatchLabels(matchLabels):: {}
}
```

