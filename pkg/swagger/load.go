package swagger

import (
	"io/ioutil"
	"net/http"
    "net/url"
)

type Loader interface {
	Load([]byte) (Definitions, error)
}

func Load(loader Loader, uri string) (Definitions, error) {
	var data []byte
	var err error
    if isURL(uri) {
        r, err := http.Get(uri)
        if err != nil {
            return nil, err
        }
		data, err = ioutil.ReadAll(r.Body)
		if err != nil {
			return nil, err
		}
    } else {
		data, err = ioutil.ReadFile(uri)
		if err != nil {
			return nil, err
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
