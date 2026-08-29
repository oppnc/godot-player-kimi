# VisibleOnScreenNotifier2D

> class VisibleOnScreenNotifier2D
> inherits VisibleOnScreenNotifier2D Node2D

## Brief

A rectangular region of 2D space that detects whether it is visible on screen.

## Description

`VisibleOnScreenNotifier2D` represents a rectangular region of 2D space. When any part of this region becomes visible on screen or in a viewport, it will emit a `screen_entered` signal, and likewise it will emit a `screen_exited` signal when no part of it remains visible.
If you want a node to be enabled automatically when this region is visible on screen, use `VisibleOnScreenEnabler2D`.
**Note:** `VisibleOnScreenNotifier2D` uses the render culling code to determine whether it's visible on screen, so it won't function unless `CanvasItem.visible` is set to `true`.

## Properties

> property rect : Rect2 ; default=Rect2(-10, -10, 20, 20) ; setter=set_rect ; getter=get_rect

The VisibleOnScreenNotifier2D's bounding rectangle.

> property show_rect : bool ; default=true ; setter=set_show_rect ; getter=is_showing_rect

If `true`, shows the rectangle area of `rect` in the editor with a translucent magenta fill. Unlike changing the visibility of the VisibleOnScreenNotifier2D, this does not affect the screen culling detection.

## Methods

> method is_on_screen() -> bool ; qualifiers=const

If `true`, the bounding rectangle is on the screen.
**Note:** It takes one frame for the `VisibleOnScreenNotifier2D`'s visibility to be determined once added to the scene tree, so this method will always return `false` right after it is instantiated, before the draw pass.

## Signals

> signal screen_entered()

Emitted when the VisibleOnScreenNotifier2D enters the screen.

> signal screen_exited()

Emitted when the VisibleOnScreenNotifier2D exits the screen.

## Tutorials
- [2D Dodge The Creeps Demo](https://godotengine.org/asset-library/asset/2712)
