# GridContainer

> class GridContainer
> inherits GridContainer Container

## Brief

A container that arranges its child controls in a grid layout.

## Description

`GridContainer` arranges its child controls in a grid layout. The number of columns is specified by the `columns` property, whereas the number of rows depends on how many are needed for the child controls. The number of rows and columns is preserved for every size of the container.
**Note:** `GridContainer` only works with child nodes inheriting from `Control`. It won't rearrange child nodes inheriting from `Node2D`.

## Properties

> property columns : int ; default=1 ; setter=set_columns ; getter=get_columns

The number of columns in the `GridContainer`. If modified, `GridContainer` reorders its Control-derived children to accommodate the new layout.

## Theme Properties

> theme_property h_separation : int ; data=constant ; default=4

The horizontal separation of child nodes.

> theme_property v_separation : int ; data=constant ; default=4

The vertical separation of child nodes.

## Tutorials
- [Using Containers]($DOCS_URL/tutorials/ui/gui_containers.html)
- [Operating System Testing Demo](https://godotengine.org/asset-library/asset/2789)
