# FoldableGroup

> class FoldableGroup ; keywords=expandable, collapsible, collapse
> inherits FoldableGroup Resource

## Brief

A group of foldable containers that doesn't allow more than one container to be expanded at a time.

## Description

A group of `FoldableContainer`-derived nodes. Only one container can be expanded at a time.

## Properties

> property allow_folding_all : bool ; default=false ; setter=set_allow_folding_all ; getter=is_allow_folding_all

If `true`, it is possible to fold all containers in this FoldableGroup.

> property resource_local_to_scene : bool ; default=true ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

## Methods

> method get_containers() -> Array[FoldableContainer] ; qualifiers=const

Returns an `Array` of `FoldableContainer`s that have this as their FoldableGroup (see `FoldableContainer.foldable_group`). This is equivalent to `ButtonGroup` but for FoldableContainers.

> method get_expanded_container() -> FoldableContainer ; qualifiers=const

Returns the current expanded container.

## Signals

> signal expanded(container: FoldableContainer)

Emitted when one of the containers of the group is expanded.
