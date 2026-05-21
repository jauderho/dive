package image

import context0 "context"

type Resolver interface {
	Name() string
	Fetch(ctx context0.Context, id string) (*Image, error)
	Build(ctx context0.Context, options []string) (*Image, error)
	ContentReader
}

type ContentReader interface {
	Extract(ctx context0.Context, id string, layer string, path string) error
}
