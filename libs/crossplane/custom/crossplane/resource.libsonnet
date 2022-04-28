local d = import 'doc-util/main.libsonnet';
{
  local this = self,

  util+: {
    '#':: d.pkg(name='util', url='', help='A util library for Crossplane.'),

    resource: {
      '#':: d.pkg(name='resource', url='', help='Create resources for Compositions.'),

      '#new':: d.fn(help=|||
        Create a new instance of a resource for a Composition, where `name` is a unique
        name within of the resource within the Composition resource list and `resource` is
        the jsonnet library for this resource (for example:
        `(import 'provider-sql/0.4/main.libsonnet').mysql.v1alpha1.database`)
      |||, args=[
        d.arg('name', d.T.string),
        d.arg('resource', d.T.object),
      ]),
      new(name, resource):
        {
          // Unique name within the composition
          name: name,
          // Expose the resource internally for use in withBaseMixin
          resource:: resource,
        }
        + self.withBaseMixin(
          function(resource)
            // Call new to set apiVersion/Kind
            resource.new('')
            // Remove metadata as this is not relevant for a composition
            + { metadata:: '' },
        ),

      '#withBaseMixin':: d.fn(help=|||
        Extend the resource base, this expects a function with the resource library as its
        argument:
        ```
        + util.resource.withBaseMixin(
          function(resource) resource.spec.withAttribute('value'),
        )
        ```
      |||, args=[
        d.arg('baseFunc', d.T.func),
      ]),
      withBaseMixin(baseFunc):: {
        base+: baseFunc(self.resource),
      },

      '#withPatchesMixin':: d.fn(help=|||
        Add patches that can be applied to this resource.
      |||, args=[
        d.arg('patches', d.T.array),
      ]),
      withPatchesMixin(patches):: {
        patches+: patches,
      },

      '#withConnectionDetailsMixin':: d.fn(help=|||
        Add connectionDetails that will be provided by this resource.

        This also configures the writeConnectionSecretToRef to properly propagate the
        connectionDetails. The `namespace` attribute conventionally matches the Crossplane
        system namespace.
      |||, args=[
        d.arg('namespace', d.T.string),
        d.arg('connectionDetails', d.T.array),
      ]),
      withConnectionDetailsMixin(namespace, connectionDetails):: {
        local resource = super.resource,
        local m = { resource:: resource } + this.util.resource.withConnectionSecretMixin(super.name, namespace),
        base+: m.base,
        patches+: m.patches,

        connectionDetails+: connectionDetails,
      },

      // Here are a few common base/patch combinations

      '#withConnectionSecretMixin':: d.fn(help=|||
        withConnectionSecretMixin ensures connectionSecrets are propagated to the
        management (ie. crossplane) namespace, the name of the secret will be
        &lt;metadata.uid&gt;-&lt;suffix&gt;.
      |||, args=[
        d.arg('suffix', d.T.string),
        d.arg('namespace', d.T.string),
      ]),
      withConnectionSecretMixin(suffix, namespace)::
        self.withBaseMixin(
          function(resource)
            resource.spec.writeConnectionSecretToRef.withNamespace(namespace),
        )
        + self.withPatchesMixin([
          this.util.patch.fromCompositeFieldPath(
            'metadata.uid',
            'spec.writeConnectionSecretToRef.name'
          ) + {
            transforms: [{
              type: 'string',
              string: {
                fmt: '%s-' + suffix,
              },
            }],
          },
        ]),

      '#withDeleteProtectionPatch':: d.fn(help=|||
        withDeleteProtectionPatch provides protection mechanism for unwanted removal
        of resources, it defaults to keep resources around.
      |||, args=[
        d.arg('default', d.T.string, 'Orphan'),
      ]),
      withDeleteProtectionPatch(default='Orphan')::
        self.withBaseMixin(
          function(instance)
            instance.spec.withDeletionPolicy(default)
        )
        + self.withPatchesMixin([
          this.util.patch.fromCompositeFieldPath(
            'spec.parameters.deleteProtection',
            'spec.deletionPolicy',
          )
          + this.util.patch.transforms.bool(
            true_value='Orphan',
            false_value='Delete',
          ),
        ]),

      '#withExternalNamePatch':: d.fn(help=|||
        withExternalNamePatch is commonly used by providers to name the upstream
        resource or to import existing resources
      |||),
      withExternalNamePatch()::
        self.withPatchesMixin([
          this.util.patch.fromCompositeFieldPath(
            'spec.parameters.externalName',
            'metadata.annotations["crossplane.io/external-name"]',
          ),
        ]),
    },

    patch: {
      '#':: d.pkg(name='patch', url='', help='Create patches for Composition resources.'),

      '#fromCompositeFieldPath':: d.fn(help=|||
        This type patches from a field within the XR to a field within the composed
        resource. It’s commonly used to expose a composed resource spec field as an XR
        spec field.
      |||, args=[
        d.arg('from', d.T.string),
        d.arg('to', d.T.string),
      ]),
      fromCompositeFieldPath(from, to): {
        type: 'FromCompositeFieldPath',
        fromFieldPath: from,
        toFieldPath: to,
      },

      '#toCompositeFieldPath':: d.fn(help=|||
        The inverse of FromCompositeFieldPath. This type patches from a field within the
        composed resource to a field within the XR. It’s commonly used to derive an XR
        status field from a composed resource status field.
      |||, args=[
        d.arg('from', d.T.string),
        d.arg('to', d.T.string),
      ]),
      toCompositeFieldPath(from, to): {
        type: 'ToCompositeFieldPath',
        fromFieldPath: from,
        toFieldPath: to,
      },

      policy: {
        '#fromFieldPath':: d.fn(help=|||
          By default Crossplane will skip the patch until all of the variables to be
          combined have values. Set the fromFieldPath policy to 'Required' to instead
          abort composition and return an error if a variable has no value.
        |||, args=[
          d.arg('value', d.T.string),
        ]),
        fromFieldPath(value): {
          policy: {
            fromFieldPath: value,
          },
        },

        '#withMergeOptions':: d.fn(help=|||
          You can patch entire objects or arrays from one resource to another. By default
          the 'to' object or array will be overwritten, not merged. Use the 'mergeOptions'
          field to override this behaviour. Note that these fields accidentally leak Go
          terminology - 'slice' means 'array'. 'map' means 'map' in YAML or 'object' in
          JSON.
        |||, args=[
          d.arg('appendSlice', d.T.bool),
          d.arg('keepMapValues', d.T.bool),
        ]),
        withMergeOptions(appendSlice, keepMapValues): {
          policy: {
            mergeOptions: {
              appendSlice: appendSlice,
              keepMapValues: keepMapValues,
            },
          },
        },
      },

      transforms: {
        '#bool':: d.fn(help=|||
          Transform strings to booleans.
          Example: `bool(true_value='Orphan', false_value='Delete')`
        |||, args=[
          d.arg('true_value', d.T.string),
          d.arg('false_value', d.T.string),
        ]),
        bool(true_value, false_value): {
          transforms+: [
            {
              type: 'convert',
              convert: { toType: 'string' },
            },
            {
              type: 'map',
              map: {
                'true': true_value,
                'false': false_value,
              },
            },
          ],
        },
        '#map':: d.fn(help=|||
          Use a Map to transform keys into values.
        |||, args=[
          d.arg('map', d.T.object),
        ]),
        map(map={}): {
          transforms+: [
            {
              type: 'map',
              map: map,
            },
          ],
        },
      },
    },

    connectionDetail: {
      '#':: d.pkg(name='connectionDetail', url='', help='Create connectionDetails for Compositions.'),

      '#fromConnectionSecretKey':: d.fn(help=|||
        Derive the XR's connection detail field `name` from the `key` of the composed
        resource's connection secret. The argument `name` defaults to the value of `key`.
      |||, args=[
        d.arg('key', d.T.string),
        d.arg('name', d.T.string, '-same as key-'),
      ]),
      fromConnectionSecretKey(key, name=''): {
        name: if name == '' then key else name,
        fromConnectionSecretKey: key,
      },

      '#fromFieldPath':: d.fn(help=|||
        Derive the XR's connection detail field `name` from the `key` field path of the
        composed resource.
      |||, args=[
        d.arg('key', d.T.string),
        d.arg('name', d.T.string),
      ]),
      fromFieldPath(key, name): {
        type: 'FromFieldPath',
        name: name,
        fromFieldPath: key,
      },

      '#fromValue':: d.fn(help=|||
        Always sets the XR's connection detail field `name` to `value`.
      |||, args=[
        d.arg('value', d.T.string),
        d.arg('name', d.T.string),
      ]),
      fromValue(value, name): {
        type: 'FromFieldPath',
        name: name,
        fromValue: value,
      },
    },

    version: {
      '#':: d.pkg(name='version', url='', help='Create versions for CompositeResourceDefinitions.'),

      '#new':: d.fn(help=|||
        Create a new `version` (e.g. v1alpha1, v1beta1 and v1) schema for an XRD.

        `served` specifies that XRs should be served at this version. It can be set to
        false to temporarily disable a version, for example to test whether doing so
        breaks anything before a version is removed wholesale.

        `referenceable` denotes the version of a type of XR that Compositions may use.
        Only one version may be referenceable.
      |||, args=[
        d.arg('version', d.T.string),
        d.arg('served', d.T.bool, 'true'),
        d.arg('referenceable', d.T.bool, 'true'),
      ]),
      new(version, served=true, referenceable=true): {
        name: version,
        served: served,
        referenceable: referenceable,
        schema: {
          openAPIV3Schema: {
            type: 'object',
            properties: {
              apiVersion: {
                type: 'string',
              },
              kind: {
                type: 'string',
              },
              metadata: {
                type: 'object',
              },
              spec: {
                type: 'object',
                // See addParameterProperty helper function below
                //properties: {
                //  parameters: {
                //    type: 'object',
                //  },
                //},
                //required: [
                //  'parameters',
                //],
              },
            },
          },
        },
      },

      '#withPropertiesMixin':: d.fn(help=|||
        Extend Schema with properties.

        Schema is an OpenAPI schema just like the one used by Kubernetes CRDs. It
        determines what fields your XR and claim will have. Note that Crossplane will
        automatically extend with some additional Crossplane machinery.
      |||, args=[
        d.arg('properties', d.T.object),
      ]),
      withPropertiesMixin(properties): {
        schema+: {
          openAPIV3Schema+: {
            properties+: properties,
          },
        },
      },

      '#addParameterProperty':: d.fn(help=|||
        Add properties to the Schema.

        This shortcut enables to quickly extend the 'parameters' property of a version.

        Attributes:

        - `name` of the property
        - `type` eg. string, number, array, object
        - `description` for documentation
        - `required` is this a required property?
        - `mixin` can be used to add enums or the type of an array member for validation.
      |||, args=[
        d.arg('name', d.T.string),
        d.arg('type', d.T.string, 'string|number|array|object'),
        d.arg('description', d.T.string, ''),
        d.arg('required', d.T.bool),
        d.arg('mixin', d.T.object),
      ]),
      addParameterProperty(name, type, description='', required=false, mixin={}):
        self.withPropertiesMixin({
          spec+: {
            properties+: {
              parameters+: {
                type: 'object',
                properties+: {
                  [name]: {
                    type: type,
                    [if description != '' then 'description']: description,
                  } + mixin,
                },
                required+:
                  if required
                  then [name]
                  else [],
              },
            },
          },
        }),
    },
  },
}
