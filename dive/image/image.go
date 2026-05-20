package image

import (
	"github.com/jauderho/dive/dive/filetree"
)

type Image struct {
	Request string
	Trees   []*filetree.FileTree
	Layers  []*Layer
}
