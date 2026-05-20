package payload

import "github.com/jauderho/dive/dive/image"

type Explore struct {
	Analysis image.Analysis
	Content  image.ContentReader
}
