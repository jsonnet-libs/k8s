package swagger

import (
	"io"
	"net/http"
	"net/url"
	"os"

	"github.com/mdobak/go-xerrors"
	"resty.dev/v3"
)

type Loader interface {
	Load([]byte) (Definitions, error)
}

func Load(loader Loader, uri string) (Definitions, error) {
	var data []byte
	var err error
	if isURL(uri) {
		client := resty.New()
		defer client.Close()

		res, err := client.R().Get(uri)
		if err != nil {
			return nil, xerrors.Newf("http request %s failed: %w", uri, err)
		}
		if res.StatusCode() == http.StatusNotFound {
			return nil, xerrors.Newf("received 404 for %s", uri)
		}
		if res.IsStatusFailure() {
			return nil, xerrors.Newf("received non-2xx status %d for %s", res.StatusCode(), uri)
		}
		data, err = io.ReadAll(res.Body)
		if err != nil {
			return nil, xerrors.Newf("unable to read http response %s: %w", uri, err)
		}
	} else {
		data, err = os.ReadFile(uri)
		if err != nil {
			return nil, xerrors.Newf("unable to read file %s: %w", uri, err)
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
