local d = import 'doc-util/main.libsonnet';

{
  core+: {
    v1+: {
      list: {
        '#new': d.fn(
          '`new` returns an instance of List.',
          [d.arg('items', d.T.array)]
        ),
        new(items):: {
          apiVersion: 'v1',
          kind: 'List',
        } + self.withItems(items),
        '#withItems': d.fn(
          '`withItems` List of items to populate the items in a list.',
          [d.arg('items', d.T.array)]
        ),
        withItems(items)::
          if std.isArray(v=items)
          then { items+: items }
          else { items+: [items] },
      },
    },
  },
}
