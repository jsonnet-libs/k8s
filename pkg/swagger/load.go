package swagger

import (
	"io/ioutil"
	"log/slog"
	"net/http"
	"net/url"

	"github.com/mdobak/go-xerrors"
)

type Loader interface {
	Load([]byte) (Definitions, error)
}

func Load(loader Loader, uri string) (Definitions, error) {
	slog.SetLogLoggerLevel(slog.LevelDebug)
	var data []byte
	var err error
	if isURL(uri) {
		r, err := http.Get(uri)
		if err != nil {
			return nil, xerrors.Newf("http request %s failed: %w ", uri, err)
		}
		if r.StatusCode == http.StatusNotFound {
			return nil, xerrors.Newf("received 404 for %s", uri)
		}
		data, err = ioutil.ReadAll(r.Body)
		if err != nil {
			return nil, xerrors.Newf("unable to read http response %s: %w", uri, err)
		}
	} else {
		data, err = ioutil.ReadFile(uri)
		if err != nil {
			return nil, xerrors.Newf("unable to read http response %s: %w", uri, err)
		}
	}
	return loader.Load(data)
}

func isURL(uri string) bool {
	endpoint, err := url.Parse(uri)
	if err != nil {
		return false
	}

	return len(endpoint.Scheme) > 0
}
