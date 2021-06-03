local repository = 'github.com/jsonnet-libs/crossplane-lib';
local specs = [
  {
    output: 'crossplane/1.2',
    openapi: 'http://localhost:8001/openapi/v2',
    prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
    crd: 'https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.2.1',
    localName: 'crossplane',
    repository: 'github.com/jsonnet-libs/crossplane-lib',
  },
  {
    output: 'provider-aws/0.18',
    openapi: 'http://localhost:8001/openapi/v2',
    prefix: '^io\\.crossplane\\.aws\\..*',
    crd: 'https://doc.crds.dev/raw/github.com/crossplane/provider-aws@v0.18.1',
    localName: 'crossplane_aws',
    repository: 'github.com/jsonnet-libs/crossplane-lib',
  },
  {
    output: 'provider-gcp/0.17',
    openapi: 'http://localhost:8001/openapi/v2',
    prefix: '^io\\.crossplane\\.gcp\\..*',
    crd: 'https://doc.crds.dev/raw/github.com/crossplane/provider-gcp@v0.17.0',
    localName: 'crossplane_gcp',
    repository: 'github.com/jsonnet-libs/crossplane-lib',
  },
  {
    output: 'provider-azure/0.16',
    openapi: 'http://localhost:8001/openapi/v2',
    prefix: '^io\\.crossplane\\.azure\\..*',
    crd: 'https://doc.crds.dev/raw/github.com/crossplane/provider-azure@v0.16.1',
    localName: 'crossplane_azure',
    repository: 'github.com/jsonnet-libs/crossplane-lib',
  },
];

{
  'config.yml': std.manifestYamlDoc({
    repository: repository,
    specs: specs,
  }, true),

  'docs/README.md': (importstr 'README.md.tmpl') % {
    name: 'crossplane',
    pages: std.join('\n', [
      '- [%(output)s](%(output)s/README.md)' % spec
      for spec in specs
    ]),
  },
}
