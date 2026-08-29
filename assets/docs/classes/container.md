# Container

> class Container
> inherits Container Control

## Brief

Base class for all GUI containers.

## Description

Base class for all GUI containers. A `Container` automatically arranges its child controls in a certain way. This class can be inherited to make custom container types.

## Properties

> property accessibility_region : bool ; default=false ; setter=set_accessibility_region ; getter=is_accessibility_region

If `true`, this container is marked as a region for accessibility. Use `Control.accessibility_name` to give the region a descriptive name. Screen readers can navigate between regions using landmark navigation.

> property mouse_filter : Control.MouseFilter ; default=1 ; setter=set_mouse_filter ; getter=get_mouse_filter ; overrides=Control

> property propagate_maximum_size : bool ; default=true ; setter=set_propagate_maximum_size ; getter=is_propagating_maximum_size ; overrides=Control

## Methods

> method _get_allowed_size_flags_horizontal() -> PackedInt32Array ; qualifiers=virtual const

Implement to return a list of allowed horizontal `Control.SizeFlags` for child nodes. This doesn't technically prevent the usages of any other size flags, if your implementation requires that. This only limits the options available to the user in the Inspector dock.
**Note:** Having no size flags is equal to having `Control.SIZE_SHRINK_BEGIN`. As such, this value is always implicitly allowed.

> method _get_allowed_size_flags_vertical() -> PackedInt32Array ; qualifiers=virtual const

Implement to return a list of allowed vertical `Control.SizeFlags` for child nodes. This doesn't technically prevent the usages of any other size flags, if your implementation requires that. This only limits the options available to the user in the Inspector dock.
**Note:** Having no size flags is equal to having `Control.SIZE_SHRINK_BEGIN`. As such, this value is always implicitly allowed.

> method fit_child_in_rect(child: Control, rect: Rect2) -> void

Fit a child control in a given rect. This is mainly a helper for creating custom container classes.

> method queue_sort() -> void

Queue resort of the contained children. This is called automatically anyway, but can be called upon request.

## Signals

> signal pre_sort_children()

Emitted when children are going to be sorted.

> signal sort_children()

Emitted when sorting the children is needed.

## Constants

> constant NOTIFICATION_PRE_SORT_CHILDREN = 50

Notification just before children are going to be sorted, in case there's something to process beforehand.

> constant NOTIFICATION_SORT_CHILDREN = 51

Notification for when sorting the children, it must be obeyed immediately.

## Tutorials
- [Using Containers]($DOCS_URL/tutorials/ui/gui_containers.html)
