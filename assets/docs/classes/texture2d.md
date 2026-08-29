# Texture2D

> class Texture2D
> inherits Texture2D Texture

## Brief

Texture for 2D and 3D.

## Description

A texture works by registering an image in the video hardware, which then can be used in 3D models or 2D `Sprite2D` or GUI `Control`.
Textures are often created by loading them from a file. See `@GDScript.load`.
`Texture2D` is a base for other resources. It cannot be used directly.
**Note:** The maximum texture size is 16384×16384 pixels due to graphics hardware limitations. Larger textures may fail to import.

## Methods

> method _draw(to_canvas_item: RID, pos: Vector2, modulate: Color, transpose: bool) -> void ; qualifiers=virtual const

Called when the entire `Texture2D` is requested to be drawn over a `CanvasItem`, with the top-left offset specified in `pos`. `modulate` specifies a multiplier for the colors being drawn, while `transpose` specifies whether drawing should be performed in column-major order instead of row-major order (resulting in 90-degree clockwise rotation).
**Note:** This is only used in 2D rendering, not 3D.

> method _draw_rect(to_canvas_item: RID, rect: Rect2, tile: bool, modulate: Color, transpose: bool) -> void ; qualifiers=virtual const

Called when the `Texture2D` is requested to be drawn onto `CanvasItem`'s specified `rect`. `modulate` specifies a multiplier for the colors being drawn, while `transpose` specifies whether drawing should be performed in column-major order instead of row-major order (resulting in 90-degree clockwise rotation).
**Note:** This is only used in 2D rendering, not 3D.

> method _draw_rect_region(to_canvas_item: RID, rect: Rect2, src_rect: Rect2, modulate: Color, transpose: bool, clip_uv: bool) -> void ; qualifiers=virtual const

Called when a part of the `Texture2D` specified by `src_rect`'s coordinates is requested to be drawn onto `CanvasItem`'s specified `rect`. `modulate` specifies a multiplier for the colors being drawn, while `transpose` specifies whether drawing should be performed in column-major order instead of row-major order (resulting in 90-degree clockwise rotation).
**Note:** This is only used in 2D rendering, not 3D.

> method _get_format() -> Image.Format ; qualifiers=virtual const

Called when `get_format` is called.

> method _get_height() -> int ; qualifiers=virtual required const

Called when the `Texture2D`'s height is queried.

> method _get_image() -> Image ; qualifiers=virtual const

Called when `get_image` is called.

> method _get_mipmap_count() -> int ; qualifiers=virtual const

Called when `get_mipmap_count` is called.

> method _get_width() -> int ; qualifiers=virtual required const

Called when the `Texture2D`'s width is queried.

> method _has_alpha() -> bool ; qualifiers=virtual const

Called when the presence of an alpha channel in the `Texture2D` is queried.

> method _has_mipmaps() -> bool ; qualifiers=virtual const

Called when `has_mipmaps` is called.

> method _is_pixel_opaque(x: int, y: int) -> bool ; qualifiers=virtual const

Called when a pixel's opaque state in the `Texture2D` is queried at the specified `(x, y)` position.

> method create_placeholder() -> Resource ; qualifiers=const

Creates a placeholder version of this resource (`PlaceholderTexture2D`).

> method draw(canvas_item: RID, position: Vector2, modulate: Color = Color(1, 1, 1, 1), transpose: bool = false) -> void ; qualifiers=const

Draws the texture using a `CanvasItem` with the `RenderingServer` API at the specified `position`.

> method draw_rect(canvas_item: RID, rect: Rect2, tile: bool, modulate: Color = Color(1, 1, 1, 1), transpose: bool = false) -> void ; qualifiers=const

Draws the texture using a `CanvasItem` with the `RenderingServer` API.

> method draw_rect_region(canvas_item: RID, rect: Rect2, src_rect: Rect2, modulate: Color = Color(1, 1, 1, 1), transpose: bool = false, clip_uv: bool = true) -> void ; qualifiers=const

Draws a part of the texture using a `CanvasItem` with the `RenderingServer` API.

> method get_format() -> Image.Format ; qualifiers=const

Returns the image format of the texture.

> method get_height() -> int ; qualifiers=const

Returns the texture height in pixels.

> method get_image() -> Image ; qualifiers=const

Returns an `Image` that is a copy of data from this `Texture2D` (a new `Image` is created each time). `Image`s can be accessed and manipulated directly.
**Note:** This will return `null` if this `Texture2D` is invalid.
**Note:** This will fetch the texture data from the GPU, which might cause performance problems when overused. Avoid calling `get_image` every frame, especially on large textures.

> method get_mipmap_count() -> int ; qualifiers=const

Returns the number of mipmaps of the texture.

> method get_size() -> Vector2 ; qualifiers=const

Returns the texture size in pixels.

> method get_width() -> int ; qualifiers=const

Returns the texture width in pixels.

> method has_alpha() -> bool ; qualifiers=const

Returns `true` if this `Texture2D` has an alpha channel.

> method has_mipmaps() -> bool ; qualifiers=const

Returns `true` if the texture has mipmaps.
