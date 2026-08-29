# ReferenceRect

> class ReferenceRect
> inherits ReferenceRect Control

## Brief

A rectangular box for designing UIs.

## Description

A rectangular box that displays only a colored border around its rectangle (see `Control.get_rect`). It can be used to visualize the extents of a `Control` node, for testing purposes.

## Properties

> property border_color : Color ; default=Color(1, 0, 0, 1) ; setter=set_border_color ; getter=get_border_color

Sets the border color of the `ReferenceRect`.

> property border_width : float ; default=1.0 ; setter=set_border_width ; getter=get_border_width

Sets the border width of the `ReferenceRect`. The border grows both inwards and outwards with respect to the rectangle box.

> property editor_only : bool ; default=true ; setter=set_editor_only ; getter=get_editor_only

If `true`, the `ReferenceRect` will only be visible while in editor. Otherwise, `ReferenceRect` will be visible in the running project.
