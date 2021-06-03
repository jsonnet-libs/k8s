{
  new(
    name,
    specs
  ):: {
    local this = self,

    repository:: 'github.com/jsonnet-libs/' + name + '-lib',
    branch:: 'main',
    site_url:: 'jsonnet-libs.github.io/' + name + '-lib',

    'skel/LICENSE': importstr '../LICENSE',

    'config.yml': std.manifestYamlDoc({
      repository: this.repository,
      specs: [
        spec { repository: this.repository }
        for spec in specs
      ],
    }, true),

    mkdocs_config:: {
      site_name: name + ' Jsonnet library',
      site_url: 'https://' + this.site_url,
      repo_url: 'https://' + this.repository,
      edit_uri: '',
      theme: 'material',
      plugins: [
        {
          search: {
            indexing: 'titles',
            prebuild_index: true,
            min_search_length: 2,
            separator: '[\\s\\-]+',
          },
        },
      ],
    },

    mkdocs_github_action:: {
      name: 'Publish docs via GitHub Pages',
      on: {
        push: {
          branches: [
            this.branch,
          ],
        },
      },
      jobs: {
        build: {
          name: 'Deploy docs',
          'runs-on': 'ubuntu-latest',
          steps: [
            {
              name: 'Checkout main',
              uses: 'actions/checkout@v2',
            },
            {
              name: 'Deploy docs',
              uses: 'mhausenblas/mkdocs-deploy-gh-pages@master',
              env: {
                GITHUB_TOKEN: '${{ secrets.GITHUB_TOKEN }}',
              },
            },
          ],
        },
      },
    },

    'skel/mkdocs.yml': std.manifestYamlDoc(this.mkdocs_config, true),
    'skel/.github/workflows/main.yml': std.manifestYamlDoc(this.mkdocs_github_action, true),
    'skel/requirements.txt': |||
      # For mkdocs
      # Use newer mkdocs so indexing can be done on titles only
      git+https://github.com/mkdocs/mkdocs.git@57b5ccd7d63e5b7067d37d0433111e9a5278fb6d
      # Exclude search to limit search to a subset
      mkdocs-exclude-search>=0.5
    |||,

    readme_template(name, data):: |||
      # %s Jsonnet library

      The Jsonnet Kubernetes library is a generated with
      [`k8s`](https://github.com/jsonnet-libs/k8s).

      %s
    ||| % [name, data],

    'skel/README.md': this.readme_template(
      name=name,
      data='[Docs](https://' + this.site_url + ')',
    ),

    'skel/docs/README.md': this.readme_template(
      name=name,
      data=std.join('\n', [
        '- [%(output)s](%(output)s/README.md)' % spec
        for spec in specs
      ]),
    ),
  },
}
