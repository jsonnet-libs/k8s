function(libs, pages=true) {
  'tf/main.tf.json':
    std.manifestJsonEx(
      {
        '//': 'Generated by `make configure`, please do not edit manually.',
        terraform: {
          required_providers: {
            github: {
              source: 'integrations/github',
              version: '~>4.0',
            },
          },
          backend: {
            remote: {
              organization: 'jsonnet-libs',
              workspaces: {
                name: 'jsonnet-libs',
              },
            },
          },
        },
        provider: {
          github: { owner: 'jsonnet-libs' },
        },
      }
      + std.foldl(
        function(acc, lib)
          acc {
            resource+:
              [{
                github_repository_deploy_key: {
                  [lib.name]: {
                    title: 'jsonnet-libs/k8s deploy key',
                    repository: '${github_repository.' + lib.name + '.name}',
                    key: importstr './files/id_rsa.pub',
                    read_only: false,
                  },
                },
                github_repository: {
                  [lib.name]: {
                    name: lib.name + lib.suffix,
                    description: lib.description,
                    homepage_url: lib.site_url,
                    auto_init: true,
                    has_downloads: false,
                    has_issues: false,
                    has_projects: false,
                    has_wiki: false,
                    allow_merge_commit: false,
                    allow_rebase_merge: false,
                  } + (
                    if pages
                    then {
                      pages:
                        {
                          source:
                            {
                              branch: 'gh-pages',
                              path: '/',
                            },
                        },
                    }
                    else {}
                  ),
                },
              }],
          },
        libs,
        {}
      )
      , '  '
    ),
}
