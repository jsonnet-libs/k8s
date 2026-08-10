package targetgenerator

import (
	"encoding/json"
	"fmt"
	"io"
	"log/slog"
	"net/http"
	"net/url"
	"os"
	"regexp"
	"strings"

	"github.com/jsonnet-libs/k8s/pkg/config"
	"github.com/jsonnet-libs/k8s/pkg/telemetry"
	"github.com/mdobak/go-xerrors"
	"resty.dev/v3"
)

func stringPtr(s string) *string {
	return &s
}

var GithubTargetGeneratorType TargetGeneratorType = "github"

type GithubTargetGenerator struct {
	Repo            string   `json:"repo"`
	CrdPath         string   `json:"crdPath"`
	Prefix          string   `json:"prefix"`
	VersionLimit    int      `json:"versionLimit" default:"10"`
	IncludeVersions string   `json:"includeVersions"`
	DedupeCrds      bool
	Versions        []string
	VersionPrefix   *string
	client          *resty.Client
}

type GithubTargetGeneratorOptions struct {
	Repo            string
	CrdPath         string
	Prefix          string
	VersionLimit    int
	IncludeVersions string
	DedupeCrds      *bool
	Versions        []string
	VersionPrefix   *string
	Client          *resty.Client
}

func NewGithubTargetGenerator(opts GithubTargetGeneratorOptions) *GithubTargetGenerator {
	if opts.VersionLimit == 0 {
		opts.VersionLimit = 10
	}

	if opts.VersionPrefix == nil {
		opts.VersionPrefix = stringPtr("v")
	}

	dedupeCrds := true
	if opts.DedupeCrds != nil {
		dedupeCrds = *opts.DedupeCrds
	}

	return &GithubTargetGenerator{
		Repo:            opts.Repo,
		CrdPath:         opts.CrdPath,
		Prefix:          opts.Prefix,
		IncludeVersions: opts.IncludeVersions,
		VersionLimit:    opts.VersionLimit,
		DedupeCrds:      dedupeCrds,
		Versions:        opts.Versions,
		VersionPrefix:   opts.VersionPrefix,
		client:          opts.Client,
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

type treeResponse struct {
	SHA string `json:"sha"`
}

type versionInfo struct {
	name    string
	ref     string
	output  string
	treeSHA string
}

// crdTreeSHA returns the git tree SHA for the CRD directory at the given commit.
// A true notFound value indicates the directory does not exist in that commit.
func (tg *GithubTargetGenerator) crdTreeSHA(client *resty.Client, owner, repo, commitSHA, crdPath string) (string, bool, error) {
	path := strings.TrimPrefix(crdPath, "/")
	path = strings.TrimSuffix(path, "/")
	if path == "" {
		return "", false, xerrors.New("crdPath cannot be empty")
	}

	ref := fmt.Sprintf("%s:%s", commitSHA, url.PathEscape(path))
	u := fmt.Sprintf("https://api.github.com/repos/%s/%s/git/trees/%s", owner, repo, ref)

	res, err := client.R().Get(u)
	if err != nil {
		return "", false, xerrors.Newf("failed to get CRD tree for %s: %w", crdPath, err)
	}
	if res.StatusCode() == http.StatusNotFound {
		return "", true, nil
	}
	if res.IsStatusFailure() {
		return "", false, xerrors.Newf("received bad status code for CRD tree %s: %d", crdPath, res.StatusCode())
	}

	defer res.Body.Close()
	body, err := io.ReadAll(res.Body)
	if err != nil {
		return "", false, xerrors.New("failed to read CRD tree response body", err)
	}

	var tree treeResponse
	if err := json.Unmarshal(body, &tree); err != nil {
		return "", false, xerrors.New("failed to parse CRD tree response body", err)
	}
	if tree.SHA == "" {
		return "", false, xerrors.Newf("CRD tree for %s returned empty SHA", crdPath)
	}

	return tree.SHA, false, nil
}

func (tg *GithubTargetGenerator) GenerateTargets() ([]config.Target, error) {
	client := tg.client
	if client == nil {
		client = resty.New()
		client.SetLogger(telemetry.NewRestyLogger(slog.Default()))
		defer client.Close()
	}

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

	owner := result["owner"]
	repo := result["repo"]

	var versions []versionInfo
	var err error
	if len(tg.Versions) > 0 {
		versions = make([]versionInfo, len(tg.Versions))
		prefix := ""
		if tg.VersionPrefix != nil {
			prefix = *tg.VersionPrefix
		}
		for i, v := range tg.Versions {
			versions[i] = versionInfo{
				name:   v,
				ref:    prefix + v,
				output: strings.TrimPrefix(v, "v"),
			}
		}
	} else {
		if tg.DedupeCrds {
			versions, err = tg.collectUniqueVersions(client, owner, repo, crdPath)
		} else {
			versions, err = tg.collectVersions(client, owner, repo)
		}
		if err != nil {
			return nil, err
		}
	}

	if len(versions) == 0 {
		slog.Warn("no matching versions found")
		return []config.Target{}, nil
	}

	slog.Debug("retrieved versions",
		slog.Int("count", len(versions)),
		slog.String("highest_version", versions[0].name),
		slog.String("lowest_version", versions[len(versions)-1].name),
	)

	specs := []config.Target{}
	for _, v := range versions {
		spec, crdCount, err := tg.buildSpecForVersion(client, owner, repo, crdPath, v)
		if err != nil {
			return nil, err
		}
		if len(tg.Versions) > 0 && crdCount == 0 {
			slog.Error("no CRD files found for explicit version",
				slog.String("version", v.name),
				slog.String("crdPath", crdPath))
			return nil, xerrors.Newf("no CRD files found for version %s", v.name)
		}
		specs = append(specs, spec)
	}

	slog.Debug("retrieved all CRD file paths",
		slog.Int("versions", len(specs)),
	)

	return specs, nil
}

// buildSpecForVersion fetches the full recursive tree for a single version,
// filters the CRD files, and returns a config.Target plus the number of CRD
// files found.
func (tg *GithubTargetGenerator) buildSpecForVersion(client *resty.Client, owner, repo, crdPath string, v versionInfo) (config.Target, int, error) {
	treeURL := fmt.Sprintf("https://api.github.com/repos/%s/%s/git/trees/%s?recursive=1", owner, repo, v.ref)

	res, err := client.R().Get(treeURL)
	if err != nil {
		return config.Target{}, 0, xerrors.New("failed to get file tree from repo", err)
	}
	if res.IsStatusFailure() {
		return config.Target{}, 0, xerrors.Newf("received bad status code for file tree %s: %d", v.ref, res.StatusCode())
	}

	var fileTree FileTree
	defer res.Body.Close()
	body, err := io.ReadAll(res.Body)
	if err != nil {
		return config.Target{}, 0, xerrors.New("failed to read http response body")
	}
	if err := json.Unmarshal(body, &fileTree); err != nil {
		return config.Target{}, 0, xerrors.New("failed to parse http response body into struct", err)
	}

	if fileTree.Truncated {
		slog.Warn("file tree truncated, repo may have too many files", slog.String("version", v.name))
	}

	// filter for CRD files matching crdPath
	crdPaths := []string{}
	for _, entry := range fileTree.Tree {
		if entry.Type == "blob" && strings.HasPrefix(entry.Path, crdPath) && strings.HasSuffix(entry.Path, ".yaml") {
			crdPaths = append(crdPaths, entry.Path)
		}
	}

	slog.Debug("found CRD files",
		slog.String("version", v.name),
		slog.Int("count", len(crdPaths)),
	)

	// build raw GitHub URLs for each CRD
	crdURLs := []string{}
	for _, path := range crdPaths {
		rawURL := fmt.Sprintf("https://raw.githubusercontent.com/%s/%s/%s/%s", owner, repo, v.ref, path)
		crdURLs = append(crdURLs, rawURL)
	}

	return config.Target{
		Output: v.output,
		Crds:   crdURLs,
	}, len(crdPaths), nil
}

// collectVersions fetches matching tags from GitHub and returns the newest
// VersionLimit tags without any deduplication.
func (tg *GithubTargetGenerator) collectVersions(client *resty.Client, owner, repo string) ([]versionInfo, error) {
	versionRegex := regexp.MustCompile(tg.IncludeVersions)
	var versions []versionInfo

	url := fmt.Sprintf("https://api.github.com/repos/%s/%s/tags", owner, repo)
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

		for _, gt := range listGitTagsResponse {
			if !versionRegex.MatchString(gt.Name) {
				continue
			}
			versions = append(versions, versionInfo{
				name:   gt.Name,
				ref:    gt.Commit.Sha,
				output: strings.TrimPrefix(gt.Name, "v"),
			})
			if len(versions) >= tg.VersionLimit {
				break
			}
		}

		url = nextPageURL(res.Header().Get("link"))
	}

	// Enforce the configured version limit so a single page of tags cannot
	// push the number of generated targets past the limit.
	if len(versions) > tg.VersionLimit {
		versions = versions[:tg.VersionLimit]
	}

	return versions, nil
}

// collectUniqueVersions fetches matching tags from GitHub and skips tags whose
// CRD directory is identical to the previous kept version. It stops once
// VersionLimit unique versions have been found.
func (tg *GithubTargetGenerator) collectUniqueVersions(client *resty.Client, owner, repo, crdPath string) ([]versionInfo, error) {
	versionRegex := regexp.MustCompile(tg.IncludeVersions)
	var versions []versionInfo

	url := fmt.Sprintf("https://api.github.com/repos/%s/%s/tags", owner, repo)
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

		for _, gt := range listGitTagsResponse {
			if !versionRegex.MatchString(gt.Name) {
				continue
			}
			if len(versions) >= tg.VersionLimit {
				break
			}

			treeSHA, notFound, err := tg.crdTreeSHA(client, owner, repo, gt.Commit.Sha, crdPath)
			if err != nil {
				return nil, err
			}
			if notFound {
				slog.Warn("CRD path not found in version, skipping",
					slog.String("version", gt.Name),
					slog.String("crdPath", crdPath))
				continue
			}

			if len(versions) > 0 && treeSHA == versions[len(versions)-1].treeSHA {
				slog.Debug("skipping version with identical CRDs",
					slog.String("version", gt.Name))
				continue
			}

			versions = append(versions, versionInfo{
				name:    gt.Name,
				ref:     gt.Commit.Sha,
				output:  strings.TrimPrefix(gt.Name, "v"),
				treeSHA: treeSHA,
			})
		}

		url = nextPageURL(res.Header().Get("link"))
	}

	return versions, nil
}

// nextPageURL extracts the "next" URL from a GitHub Link header.
func nextPageURL(linkHeader string) string {
	links := strings.SplitSeq(linkHeader, ",")
	for link := range links {
		link = strings.TrimSpace(link)

		match := linkRegex.FindStringSubmatch(link)
		if match == nil {
			continue
		}

		names := linkRegex.SubexpNames()
		result := make(map[string]string)
		for i, name := range names {
			if i != 0 && name != "" {
				result[name] = match[i]
			}
		}

		if result["rel"] == "next" {
			return result["link"]
		}
	}
	return ""
}
