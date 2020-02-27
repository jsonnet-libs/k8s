
## networkPolicySpec
DEPRECATED 1.9 - This group version of NetworkPolicySpec is deprecated by networking/v1/NetworkPolicySpec.

**Functions:**

[`fn .withEgress`](#fn-withegress)  
[`fn .withIngress`](#fn-withingress)  
[`fn .withPolicyTypes`](#fn-withpolicytypes)  
[`fn podSelector.withMatchExpressions`](#fn-podselectorwithmatchexpressions)  
[`fn podSelector.withMatchLabels`](#fn-podselectorwithmatchlabels)  

---


### `fn .withEgress`
List of egress rules to be applied to the selected pods. Outgoing traffic is allowed if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic matches at least one egress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy limits all outgoing traffic (and serves solely to ensure that the pods it selects are isolated by default). This field is beta-level in 1.8
```jsonnet
{
  withEgress(egress):: {}
}
```

### `fn .withIngress`
List of ingress rules to be applied to the selected pods. Traffic is allowed to a pod if there are no NetworkPolicies selecting the pod OR if the traffic source is the pod's local node, OR if the traffic matches at least one ingress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy does not allow any traffic (and serves solely to ensure that the pods it selects are isolated by default).
```jsonnet
{
  withIngress(ingress):: {}
}
```

### `fn .withPolicyTypes`
List of rule types that the NetworkPolicy relates to. Valid options are "Ingress", "Egress", or "Ingress,Egress". If this field is not specified, it will default based on the existence of Ingress or Egress rules; policies that contain an Egress section are assumed to affect Egress, and all policies (whether or not they contain an Ingress section) are assumed to affect Ingress. If you want to write an egress-only policy, you must explicitly specify policyTypes [ "Egress" ]. Likewise, if you want to write a policy that specifies that no egress is allowed, you must specify a policyTypes value that include "Egress" (since such a policy would not include an Egress section and would otherwise default to just [ "Ingress" ]). This field is beta-level in 1.8
```jsonnet
{
  withPolicyTypes(policyTypes):: {}
}
```

### `fn podSelector.withMatchExpressions`
matchExpressions is a list of label selector requirements. The requirements are ANDed.
```jsonnet
{
  withMatchExpressions(matchExpressions):: {}
}
```

### `fn podSelector.withMatchLabels`
matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.
```jsonnet
{
  withMatchLabels(matchLabels):: {}
}
```

