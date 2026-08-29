# Sprite2D

> class Sprite2D
> inherits Sprite2D Node2D

## Brief

General-purpose sprite node.

## Description

A node that displays a 2D texture. The texture displayed can be a region from a larger atlas texture, or a frame from a sprite sheet animation.

## Properties

> property centered : bool ; default=true ; setter=set_centered ; getter=is_centered

If `true`, texture is centered.
**Note:** For games with a pixel art aesthetic, textures may appear deformed when centered. This is caused by their position being between pixels. To prevent this, set this property to `false`, or consider enabling `ProjectSettings.rendering/2d/snap/snap_2d_vertices_to_pixel` and `ProjectSettings.rendering/2d/snap/snap_2d_transforms_to_pixel`.

> property flip_h : bool ; default=false ; setter=set_flip_h ; getter=is_flipped_h

If `true`, texture is flipped horizontally.

> property flip_v : bool ; default=false ; setter=set_flip_v ; getter=is_flipped_v

If `true`, texture is flipped vertically.

> property frame : int ; default=0 ; setter=set_frame ; getter=get_frame

Current frame to display from sprite sheet. `hframes` or `vframes` must be greater than 1. This property is automatically adjusted when `hframes` or `vframes` are changed to keep pointing to the same visual frame (same column and row). If that's impossible, this value is reset to `0`.

> property frame_coords : Vector2i ; default=Vector2i(0, 0) ; setter=set_frame_coords ; getter=get_frame_coords

Coordinates of the frame to display from sprite sheet. This is as an alias for the `frame` property. `hframes` or `vframes` must be greater than 1.

> property hframes : int ; default=1 ; setter=set_hframes ; getter=get_hframes

The number of columns in the sprite sheet. When this property is changed, `frame` is adjusted so that the same visual frame is maintained (same row and column). If that's impossible, `frame` is reset to `0`.

> property offset : Vector2 ; default=Vector2(0, 0) ; setter=set_offset ; getter=get_offset

The texture's drawing offset.
**Note:** When you increase `offset`.y in Sprite2D, the sprite moves downward on screen (i.e., +Y is down).

> property region_enabled : bool ; default=false ; setter=set_region_enabled ; getter=is_region_enabled

If `true`, texture is cut from a larger atlas texture. See `region_rect`.
**Note:** When using a custom `Shader` on a `Sprite2D`, the `UV` shader built-in will refer to the entire texture space. Use the `REGION_RECT` built-in to get the currently visible region defined in `region_rect` instead. See [CanvasItem shaders]($DOCS_URL/tutorials/shaders/shader_reference/canvas_item_shader.html) for details.

> property region_filter_clip_enabled : bool ; default=false ; setter=set_region_filter_clip_enabled ; getter=is_region_filter_clip_enabled

If `true`, the area outside of the `region_rect` is clipped to avoid bleeding of the surrounding texture pixels. `region_enabled` must be `true`.

> property region_rect : Rect2 ; default=Rect2(0, 0, 0, 0) ; setter=set_region_rect ; getter=get_region_rect

The region of the atlas texture to display. `region_enabled` must be `true`.

> property texture : Texture2D ; setter=set_texture ; getter=get_texture

`Texture2D` object to draw.

> property vframes : int ; default=1 ; setter=set_vframes ; getter=get_vframes

The number of rows in the sprite sheet. When this property is changed, `frame` is adjusted so that the same visual frame is maintained (same row and column). If that's impossible, `frame` is reset to `0`.

## Methods

> method get_rect() -> Rect2 ; qualifiers=const

Returns a `Rect2` representing the Sprite2D's boundary in local coordinates.
**Example:** Detect if the Sprite2D was clicked:

```gdscript
                func _input(event):
                    if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
                        if get_rect().has_point(to_local(event.position)):
                            print("A click!")

```

```csharp
                public override void _Input(InputEvent @event)
                {
                    if (@event is InputEventMouseButton inputEventMouse)
                    {
                        if (inputEventMouse.Pressed && inputEventMouse.ButtonIndex == MouseButton.Left)
                        {
                            if (GetRect().HasPoint(ToLocal(inputEventMouse.Position)))
                            {
                                GD.Print("A click!");
                            }
                        }
                    }
                }

```

> method is_pixel_opaque(pos: Vector2) -> bool ; qualifiers=const

Returns `true` if the pixel at the given position is opaque, `false` otherwise. Also returns `false` if the given position is out of bounds or this sprite's `texture` is `null`. `pos` is in local coordinates.

## Signals

> signal frame_changed()

Emitted when the `frame` changes.

> signal texture_changed()

Emitted when the `texture` changes.

## Tutorials
- [Instancing Demo](https://godotengine.org/asset-library/asset/2716)
