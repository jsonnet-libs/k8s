local d = import 'doc-util/main.libsonnet';

{
  apiextensions+: {
    v1+: {
      composition+: {
        '#fromXRD':: d.fn(help=|||
          Create a Composition based on an XRD.

          Attributes:
          - `name` of the composition
          - `namespace` where connectionDetails are propagated too, commonly the the
            management namespace (ie. crossplane)
          - `provider` of the resources in this composition
          - `xrdRef` XRD object with which this composition is compatible
          - `xrdVersion` Version of XRD object with which this composition is compatible
        |||, args=[
          d.arg('name', d.T.string),
          d.arg('namespace', d.T.string),
          d.arg('provider', d.T.string),
          d.arg('xrdRef', d.T.object),
          d.arg('xrdVersion', d.T.string),
        ]),
        fromXRD(name, namespace, provider, xrdRef, xrdVersion):
          super.new(name)
          + super.metadata.withAnnotations({
            // Tell Tanka to not set metadata.namespace.
            'tanka.dev/namespaced': 'false',
          })
          + super.metadata.withLabels({
            // An optional convention is to include a label of the XRD. This allows easy
            // discovery of compatible Compositions.
            'crossplane.io/xrd': xrdRef.metadata.name,
            // Another optional convention is to include a label of the (most common)
            // provider for the resource(s) in this composition. This label can be used in
            // 'compositionSelector' in an XR or Claim.
            provider: provider,
          })

          // Each Composition must declare that it is compatible with a particular type of
          // Composite Resource using its 'compositeTypeRef' field. The referenced
          // version must be marked 'referenceable' in the XRD that defines the XR.
          + super.spec.compositeTypeRef.withApiVersion(xrdRef.spec.group + '/' + xrdVersion)
          + super.spec.compositeTypeRef.withKind(xrdRef.spec.names.kind)


          // When an XR is created in response to a claim Crossplane needs to know where it
          // should create the XR's connection secret. This is configured using the
          // 'writeConnectionSecretsToNamespace' field.
          + super.spec.withWriteConnectionSecretsToNamespace(namespace),
      },
    },
  },
}
