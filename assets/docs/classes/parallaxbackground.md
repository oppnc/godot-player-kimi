# ParallaxBackground

> class ParallaxBackground ; deprecated=Use the `Parallax2D` node instead.
> inherits ParallaxBackground CanvasLayer

## Brief

A node used to create a parallax scrolling background.

## Description

A ParallaxBackground uses one or more `ParallaxLayer` child nodes to create a parallax effect. Each `ParallaxLayer` can move at a different speed using `ParallaxLayer.motion_offset`. This creates an illusion of depth in a 2D game. If not used with a `Camera2D`, you must manually calculate the `scroll_offset`.
**Note:** Each `ParallaxBackground` is drawn on one specific `Viewport` and cannot be shared between multiple `Viewport`s, see `CanvasLayer.custom_viewport`. When using multiple `Viewport`s, for example in a split-screen game, you need create an individual `ParallaxBackground` for each `Viewport` you want it to be drawn on.

## Properties

> property layer : int ; default=-100 ; setter=set_layer ; getter=get_layer ; overrides=CanvasLayer

> property scroll_base_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_scroll_base_offset ; getter=get_scroll_base_offset

The base position offset for all `ParallaxLayer` children.

> property scroll_base_scale : Vector2 ; default=Vector2(1, 1) ; setter=set_scroll_base_scale ; getter=get_scroll_base_scale

The base motion scale for all `ParallaxLayer` children.

> property scroll_ignore_camera_zoom : bool ; default=false ; setter=set_ignore_camera_zoom ; getter=is_ignore_camera_zoom

If `true`, elements in `ParallaxLayer` child aren't affected by the zoom level of the camera.

> property scroll_limit_begin : Vector2 ; default=Vector2(0, 0) ; setter=set_limit_begin ; getter=get_limit_begin

Top-left limits for scrolling to begin. If the camera is outside of this limit, the background will stop scrolling. Must be lower than `scroll_limit_end` to work.

> property scroll_limit_end : Vector2 ; default=Vector2(0, 0) ; setter=set_limit_end ; getter=get_limit_end

Bottom-right limits for scrolling to end. If the camera is outside of this limit, the background will stop scrolling. Must be higher than `scroll_limit_begin` to work.

> property scroll_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_scroll_offset ; getter=get_scroll_offset

The ParallaxBackground's scroll value. Calculated automatically when using a `Camera2D`, but can be used to manually manage scrolling when no camera is present.
