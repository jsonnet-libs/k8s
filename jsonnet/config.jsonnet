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

    mkdocs_config:: {
      site_name: name + ' Jsonnet library',
      site_url: 'https://' + this.site_url,
      repo_url: 'https://' + this.repository,
      repo_name: std.strReplace(this.repository, 'github.com/', ''),
      edit_uri: '',
      extra_css: ['stylesheets/extra.css'],
      theme: {
        name: 'material',
        palette: [
          {
            scheme: 'default',
            primary: 'indigo',
            accent: 'indigo',
            media: '(prefers-color-scheme: light)',
            toggle: {
              icon: 'material/toggle-switch-off-outline',
              name: 'Switch to dark mode',
            },
          },
          {
            scheme: 'slate',
            primary: 'red',
            accent: 'red',
            media: '(prefers-color-scheme: dark)',
            toggle: {
              icon: 'material/toggle-switch',
              name: 'Switch to light mode',
            },
          },
        ],
      },
      plugins: [
        {
          search: {
            indexing: 'titles',
            prebuild_index: true,
            min_search_length: 2,
            separator: '[\\s\\-\\.]+',
          },
        },
        {
          minify: {
            minify_html: true,
          },
        },
      ],
      markdown_extensions: [
        'pymdownx.highlight',
        'pymdownx.superfences',
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
              with: {
                'fetch-depth': 0,
              },
            },
            { uses: 'actions/setup-python@v2' },
            { run: 'pip install -r requirements.txt' },
            { run: "git config user.name 'github-actions[bot]' && git config user.email 'github-actions[bot]@users.noreply.github.com'" },
            {
              name: 'Publish docs',
              run: 'mkdocs gh-deploy --force',
            },
          ],
        },
      },
    },

    'skel/mkdocs.yml': std.manifestYamlDoc(this.mkdocs_config, true),

    'skel/.github/workflows/main.yml': std.manifestYamlDoc(this.mkdocs_github_action, true),
    'skel/docs/stylesheets/extra.css': |||
      .md-nav__link:first-letter { text-transform: lowercase; }
    |||,

    'skel/requirements.txt': |||
      # For mkdocs

      # Use newer mkdocs so indexing can be done on titles only
      git+https://github.com/mkdocs/mkdocs.git@57b5ccd7d63e5b7067d37d0433111e9a5278fb6d

      # To limit search to a subset
      mkdocs-exclude-search>=0.5

      # To minify the HTML
      mkdocs-minify-plugin>=0.3

      # Include the theme
      mkdocs-material>=7.1.6
    |||,
  },
}
