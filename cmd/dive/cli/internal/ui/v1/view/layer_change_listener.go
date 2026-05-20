package view

import (
	"github.com/jauderho/dive/cmd/dive/cli/internal/ui/v1/viewmodel"
)

type LayerChangeListener func(viewmodel.LayerSelection) error
