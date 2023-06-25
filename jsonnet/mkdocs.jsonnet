{
  config:: {
    site_name: error 'must define site_name',
    site_url: error 'must define site_url',
    repo_url: error 'must define repo_url',
    repo_name: std.strReplace(self.repo_url, 'https://github.com/', ''),
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

  action:: {
    local this = self,
    branch:: error 'must define branch',
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
            uses: 'actions/checkout@v3',
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
}
