package swagger

import (
	"io/ioutil"
	"net/http"
)

type Loader interface {
	Load([]byte) (Definitions, error)
}

func Load(loader Loader, url string) (Definitions, error) {
	r, err := http.Get(url)
	if err != nil {
		return nil, err
	}

	data, err := ioutil.ReadAll(r.Body)
	if err != nil {
		return nil, err
	}

	return loader.Load(data)
}
