{
  core+: {
    v1+: {
      list: {
        new(items):: {
          apiVersion: 'v1',
          kind: 'List',
        } + self.items(items),
        items(items):: if std.type(items) == 'array' then { items+: items } else { items+: [items] },
      },
    },
  },
}
