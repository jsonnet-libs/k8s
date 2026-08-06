package targetgenerator

import (
	"encoding/json"
	"fmt"
	"io"
	"log/slog"
	"os"
	"regexp"
	"strings"

	"github.com/jsonnet-libs/k8s/pkg/config"
	"github.com/jsonnet-libs/k8s/pkg/telemetry"
	"github.com/mdobak/go-xerrors"
	"resty.dev/v3"
)

var GithubTargetGeneratorType TargetGeneratorType = "github"

type GithubTargetGenerator struct {
	Repo            string `json:"repo"`
	CrdPath         string `json:"crdPath"`
	Prefix          string `json:"prefix"`
	VersionLimit    int    `json:"versionLimit" default:"10"`
	IncludeVersions string `json:"includeVersions"`
}

type GithubTargetGeneratorOptions struct {
	Repo            string
	CrdPath         string
	Prefix          string
	VersionLimit    int
	IncludeVersions string
}

func NewGithubTargetGenerator(opts GithubTargetGeneratorOptions) *GithubTargetGenerator {
	if opts.VersionLimit == 0 {
		opts.VersionLimit = 10
	}
	return &GithubTargetGenerator{
		Repo:            opts.Repo,
		CrdPath:         opts.CrdPath,
		Prefix:          opts.Prefix,
		IncludeVersions: opts.IncludeVersions,
		VersionLimit:    opts.VersionLimit,
	}
}

var (
	repoRegex = regexp.MustCompile(`(?:https?://)?github\.com/(?P<owner>.+)/(?P<repo>.+)`)
	linkRegex = regexp.MustCompile(`<(?P<link>.+)>; rel="(?P<rel>.+)"`)
)

type Commit struct {
	Sha string `json:"sha"`
}

type GitTag struct {
	Name       string `json:"name"`
	ZipballUrl string `json:"zipball_url"`
	TarballUrl string `json:"tarball_url"`
	Commit     Commit `json:"commit"`
}
type (
	GitTags             []GitTag
	ListGitTagsResponse GitTags
)

type TreeEntry struct {
	Path string `json:"path"`
	Type string `json:"type"`
	SHA  string `json:"sha"`
}

type FileTree struct {
	SHA       string      `json:"sha"`
	Truncated bool        `json:"truncated"`
	Tree      []TreeEntry `json:"tree"`
}

func (tg *GithubTargetGenerator) GenerateTargets() ([]config.Target, error) {
	client := resty.New()
	client.SetLogger(telemetry.NewRestyLogger(slog.Default()))
	defer client.Close()

	// set GitHub token if available
	if token := os.Getenv("GITHUB_TOKEN"); token != "" {
		client.SetAuthToken(token)
		slog.Debug("using GitHub token from GITHUB_TOKEN env var")
	} else {
		slog.Warn("no GitHub token found, using unauthenticated requests (60 req/hr limit)")
	}

	// parse repo url
	match := repoRegex.FindStringSubmatch(tg.Repo)
	names := repoRegex.SubexpNames()
	result := make(map[string]string)
	for i, name := range names {
		if i != 0 && name != "" {
			result[name] = match[i]
		}
	}
	slog.Debug("parsed repo",
		slog.String("owner", result["owner"]),
		slog.String("repo", result["repo"]),
	)

	// normalize crdPath with trailing slash
	crdPath := strings.TrimSuffix(tg.CrdPath, "/") + "/"

	// get versions
	versions := []string{}
	url := fmt.Sprintf("https://api.github.com/repos/%s/%s/tags", result["owner"], result["repo"])

	for url != "" && len(versions) < tg.VersionLimit {
		res, err := client.R().Get(url)
		if err != nil {
			return nil, xerrors.New("failed to get versions from repo", err)
		}
		if res.IsStatusFailure() {
			return nil, xerrors.New("received bad status code", err)
		}

		var listGitTagsResponse ListGitTagsResponse
		defer res.Body.Close()
		body, err := io.ReadAll(res.Body)
		if err != nil {
			return nil, xerrors.New("failed to read http response body")
		}
		if err := json.Unmarshal(body, &listGitTagsResponse); err != nil {
			return nil, xerrors.New("failed to parse http response body into struct", err)
		}

		versionRegex := regexp.MustCompile(tg.IncludeVersions)

		for _, gt := range listGitTagsResponse {
			if versionRegex.MatchString(gt.Name) {
				versions = append(versions, gt.Name)
			}
		}

		url = ""
		links := strings.SplitSeq(res.Header().Get("link"), ",")
		for link := range links {
			link = strings.TrimSpace(link)

			match := linkRegex.FindStringSubmatch(link)
			names := linkRegex.SubexpNames()
			result := make(map[string]string)
			for i, name := range names {
				if i != 0 && name != "" {
					result[name] = match[i]
				}
			}

			if result["rel"] == "next" {
				url = result["link"]
			}
		}
	}

	slog.Debug("retrived versions",
		slog.Int("count", len(versions)),
		slog.String("highest_version", versions[0]),
		slog.String("lowest_version", versions[len(versions)-1]),
	)

	// get all files in repo with crd file path filter
	specs := []config.Target{}
	for _, version := range versions {
		url = fmt.Sprintf("https://api.github.com/repos/%s/%s/git/trees/%s?recursive=1", result["owner"], result["repo"], version)

		res, err := client.R().Get(url)
		if err != nil {
			return nil, xerrors.New("failed to get file tree from repo", err)
		}
		if res.IsStatusFailure() {
			return nil, xerrors.New("received bad status code for file tree")
		}

		var fileTree FileTree
		defer res.Body.Close()
		body, err := io.ReadAll(res.Body)
		if err != nil {
			return nil, xerrors.New("failed to read http response body")
		}
		if err := json.Unmarshal(body, &fileTree); err != nil {
			return nil, xerrors.New("failed to parse http response body into struct", err)
		}

		if fileTree.Truncated {
			slog.Warn("file tree truncated, repo may have too many files", slog.String("version", version))
		}

		// filter for CRD files matching crdPath
		crdPaths := []string{}
		for _, entry := range fileTree.Tree {
			if entry.Type == "blob" && strings.HasPrefix(entry.Path, crdPath) && strings.HasSuffix(entry.Path, ".yaml") {
				crdPaths = append(crdPaths, entry.Path)
			}
		}

		slog.Debug("found CRD files",
			slog.String("version", version),
			slog.Int("count", len(crdPaths)),
		)

		// build raw GitHub URLs for each CRD
		crdURLs := []string{}
		for _, path := range crdPaths {
			rawURL := fmt.Sprintf("https://raw.githubusercontent.com/%s/%s/%s/%s", result["owner"], result["repo"], version, path)
			crdURLs = append(crdURLs, rawURL)
		}

		output := strings.TrimPrefix(version, "v")
		specs = append(specs, config.Target{
			Output: output,
			Crds:   crdURLs,
		})
	}

	slog.Debug("retrieved all CRD file paths",
		slog.Int("versions", len(specs)),
	)

	return specs, nil
}
