local d = import 'doc-util/main.libsonnet';

{
  apiextensions+: {
    v1+: {
      xrd: self.compositeResourceDefinition,
      compositeResourceDefinition+: {

        '#new':: d.fn(help=|||
          new returns an instance of CompositeResourceDefinition=

          For example: xpostgresqlinstances.example.org

          - `kind`: XPostgreSQLInstance
          - `plural`: xpostgresqlinstances
          - `group`: example.org

          A common convention is that the XR (composite resource) are prefixed with 'X'
          while claim names are not. This lets app team members think of creating a claim
          as (e.g.) 'creating a PostgreSQLInstance'. Use `withClaimNames` to set this.
        |||, args=[
          d.arg('kind', d.T.string),
          d.arg('plural', d.T.string),
          d.arg('group', d.T.string),
        ]),
        new(kind, plural, group):
          super.new(plural + '.' + group)
          + super.metadata.withAnnotations({
            // Tell Tanka to not set metadata.namespace.
            'tanka.dev/namespaced': 'false',
          })
          + super.spec.withGroup(group)
          + super.spec.names.withKind(kind)
          + super.spec.names.withPlural(plural)
        ,

        '#withClaimNames':: d.fn(help=|||
          Sets the ClaimNames attribute.

          Example:
          - `kind`: PostgreSQLInstance
          - `plural`: postgresqlinstances

          A common convention is that the XR (composite resource) are prefixed with 'X'
          while claim names are not. This lets app team members think of creating a claim
          as (e.g.) 'creating a PostgreSQLInstance'.
        |||, args=[
          d.arg('kind', d.T.string),
          d.arg('plural', d.T.string),
        ]),
        withClaimNames(kind, plural):
          super.spec.claimNames.withKind(kind)
          + super.spec.claimNames.withPlural(plural),

        '#mapVersions':: d.fn(help=|||
          Sets the ClaimNames attribute.

          Example:
          - `kind`: PostgreSQLInstance
          - `plural`: postgresqlinstances

          A common convention is that the XR (composite resource) are prefixed with 'X'
          while claim names are not. This lets app team members think of creating a claim
          as (e.g.) 'creating a PostgreSQLInstance'.
        |||, args=[
          d.arg('kind', d.T.string),
          d.arg('plural', d.T.string),
        ]),
        mapVersions(f): {
          local versions = super.spec.versions,
          spec+: {
            versions: std.map(f, versions),
          },
        },
      },
    },
  },
}
