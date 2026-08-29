# Parallax2D

> class Parallax2D
> inherits Parallax2D Node2D

## Brief

A node used to create a parallax scrolling background.

## Description

A `Parallax2D` is used to create a parallax effect. It can move at a different speed relative to the camera movement using `scroll_scale`. This creates an illusion of depth in a 2D game. If manual scrolling is desired, the `Camera2D` position can be ignored with `ignore_camera_scroll`.
**Note:** Any changes to this node's position made after it enters the scene tree will be overridden if `ignore_camera_scroll` is `false` or `screen_offset` is modified.

## Properties

> property autoscroll : Vector2 ; default=Vector2(0, 0) ; setter=set_autoscroll ; getter=get_autoscroll

Velocity at which the offset scrolls automatically, in pixels per second.

> property follow_viewport : bool ; default=true ; setter=set_follow_viewport ; getter=get_follow_viewport

If `true`, this `Parallax2D` is offset by the current camera's position. If the `Parallax2D` is in a `CanvasLayer` separate from the current camera, it may be desired to match the value with `CanvasLayer.follow_viewport_enabled`.

> property ignore_camera_scroll : bool ; default=false ; setter=set_ignore_camera_scroll ; getter=is_ignore_camera_scroll

If `true`, `Parallax2D`'s position is not affected by the position of the camera.

> property limit_begin : Vector2 ; default=Vector2(-10000000, -10000000) ; setter=set_limit_begin ; getter=get_limit_begin

Top-left limits for scrolling to begin. If the camera is outside of this limit, the `Parallax2D` stops scrolling. Must be lower than `limit_end` minus the viewport size to work.

> property limit_end : Vector2 ; default=Vector2(10000000, 10000000) ; setter=set_limit_end ; getter=get_limit_end

Bottom-right limits for scrolling to end. If the camera is outside of this limit, the `Parallax2D` will stop scrolling. Must be higher than `limit_begin` and the viewport size combined to work.

> property physics_interpolation_mode : Node.PhysicsInterpolationMode ; default=2 ; setter=set_physics_interpolation_mode ; getter=get_physics_interpolation_mode ; overrides=Node

> property repeat_size : Vector2 ; default=Vector2(0, 0) ; setter=set_repeat_size ; getter=get_repeat_size

Repeats the `Texture2D` of each of this node's children and offsets them by this value. When scrolling, the node's position loops, giving the illusion of an infinite scrolling background if the values are larger than the screen size. If an axis is set to `0`, the `Texture2D` will not be repeated.

> property repeat_times : int ; default=1 ; setter=set_repeat_times ; getter=get_repeat_times

Overrides the amount of times the texture repeats. Each texture copy spreads evenly from the original by `repeat_size`. Useful for when zooming out with a camera.

> property screen_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_screen_offset ; getter=get_screen_offset

Offset used to scroll this `Parallax2D`. This value is updated automatically unless `ignore_camera_scroll` is `true`.

> property scroll_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_scroll_offset ; getter=get_scroll_offset

The `Parallax2D`'s offset. Similar to `screen_offset` and `Node2D.position`, but will not be overridden.
**Note:** Values will loop if `repeat_size` is set higher than `0`.

> property scroll_scale : Vector2 ; default=Vector2(1, 1) ; setter=set_scroll_scale ; getter=get_scroll_scale

Multiplier to the final `Parallax2D`'s offset. Can be used to simulate distance from the camera.
For example, a value of `1` scrolls at the same speed as the camera. A value greater than `1` scrolls faster, making objects appear closer. Less than `1` scrolls slower, making objects appear further, and a value of `0` stops the objects completely.

## Tutorials
- [2D Parallax]($DOCS_URL/tutorials/2d/2d_parallax.html)
