# Sprite3D

> class Sprite3D
> inherits Sprite3D SpriteBase3D

## Brief

2D sprite node in a 3D world.

## Description

A node that displays a 2D texture in a 3D environment. The texture displayed can be a region from a larger atlas texture, or a frame from a sprite sheet animation. See also `SpriteBase3D` where properties such as the billboard mode are defined.

## Properties

> property frame : int ; default=0 ; setter=set_frame ; getter=get_frame

Current frame to display from sprite sheet. `hframes` or `vframes` must be greater than 1. This property is automatically adjusted when `hframes` or `vframes` are changed to keep pointing to the same visual frame (same column and row). If that's impossible, this value is reset to `0`.

> property frame_coords : Vector2i ; default=Vector2i(0, 0) ; setter=set_frame_coords ; getter=get_frame_coords

Coordinates of the frame to display from sprite sheet. This is as an alias for the `frame` property. `hframes` or `vframes` must be greater than 1.

> property hframes : int ; default=1 ; setter=set_hframes ; getter=get_hframes

The number of columns in the sprite sheet. When this property is changed, `frame` is adjusted so that the same visual frame is maintained (same row and column). If that's impossible, `frame` is reset to `0`.

> property region_enabled : bool ; default=false ; setter=set_region_enabled ; getter=is_region_enabled

If `true`, the sprite will use `region_rect` and display only the specified part of its texture.

> property region_rect : Rect2 ; default=Rect2(0, 0, 0, 0) ; setter=set_region_rect ; getter=get_region_rect

The region of the atlas texture to display. `region_enabled` must be `true`.

> property texture : Texture2D ; setter=set_texture ; getter=get_texture

`Texture2D` object to draw. If `GeometryInstance3D.material_override` is used, this will be overridden. The size information is still used.

> property vframes : int ; default=1 ; setter=set_vframes ; getter=get_vframes

The number of rows in the sprite sheet. When this property is changed, `frame` is adjusted so that the same visual frame is maintained (same row and column). If that's impossible, `frame` is reset to `0`.

## Signals

> signal frame_changed()

Emitted when the `frame` changes.

> signal texture_changed()

Emitted when the `texture` changes.
