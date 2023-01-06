local d = import 'doc-util/main.libsonnet';

local patch = {
  local matchMixin = {
    local headersPatch = {
      '#withExact': d.fn(
        '`withExact` matches the header in an exact string',
        [d.arg('header', d.T.string), d.arg('value', d.T.string)]
      ),
      withExact(header, value):
        { [header]: { exact: value } },

      '#withPrefix': d.fn(
        '`withPrefix` matches the header in an prefix-based',
        [d.arg('header', d.T.string), d.arg('value', d.T.string)]
      ),
      withPrefix(header, value):
        { [header]: { prefix: value } },

      '#withRegex': d.fn(
        '`withRegex` matches the header in an RE2 style regex-based',
        [d.arg('header', d.T.string), d.arg('value', d.T.string)]
      ),
      withRegex(header, value):
        { [header]: { regex: value } },

      '#withExactMixin': d.fn(
        '`withExact` matches the header in an exact string',
        [d.arg('header', d.T.string), d.arg('value', d.T.string)]
      ),
      withExactMixin(header, value):
        { [header]+: { exact: value } },

      '#withPrefixMixin': d.fn(
        '`withPrefix` matches the header in an prefix-based',
        [d.arg('header', d.T.string), d.arg('value', d.T.string)]
      ),
      withPrefixMixin(header, value):
        { [header]+: { prefix: value } },

      '#withRegexMixin': d.fn(
        '`withRegex` matches the header in an RE2 style regex-based',
        [d.arg('header', d.T.string), d.arg('value', d.T.string)]
      ),
      withRegexMixin(header, value):
        { [header]+: { regex: value } },
    },

    // headers+: headersPatch,
    headers: headersPatch,
    withoutHeaders+: headersPatch,

    queryParams+: {
      '#withExact': d.fn(
        '`withExact` matches the header in an exact string',
        [d.arg('key', d.T.string), d.arg('value', d.T.string)]
      ),
      withExact(key, value):
        { [key]: { exact: value } },

      '#withRegex': d.fn(
        '`withRegex` matches the header in an RE2 style regex-based',
        [d.arg('key', d.T.string), d.arg('value', d.T.string)]
      ),
      withRegex(key, value):
        { [key]: { regex: value } },

      '#withExactMixin': d.fn(
        '`withExact` matches the header in an exact string',
        [d.arg('key', d.T.string), d.arg('value', d.T.string)]
      ),
      withExactMixin(key, value):
        { [key]+: { exact: value } },

      '#withRegexMixin': d.fn(
        '`withRegex` matches the header in an RE2 style regex-based',
        [d.arg('key', d.T.string), d.arg('value', d.T.string)]
      ),
      withRegexMixin(key, value):
        { [key]+: { regex: value } },
    },
  },

  virtualService+: {
    spec+: {
      http+: {
        match+: matchMixin,
      },
    },
  },
};

{
  networking+: {
    v1beta1+: patch,
    v1alpha3+: patch,
  },
}
