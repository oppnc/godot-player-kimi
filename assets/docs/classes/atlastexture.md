# AtlasTexture

> class AtlasTexture
> inherits AtlasTexture Texture2D

## Brief

A texture that crops out part of another Texture2D.

## Description

`Texture2D` resource that draws only part of its `atlas` texture, as defined by the `region`. An additional `margin` can also be set, which is useful for small adjustments.
Multiple `AtlasTexture` resources can be cropped from the same `atlas`. Packing many smaller textures into a singular large texture helps to optimize video memory costs and render calls.
**Note:** `AtlasTexture` cannot be used in an `AnimatedTexture`, and will not tile properly in nodes such as `TextureRect` or `Sprite2D`. To tile an `AtlasTexture`, modify its `region` instead.

## Properties

> property atlas : Texture2D ; setter=set_atlas ; getter=get_atlas

The texture that contains the atlas. Can be any type inheriting from `Texture2D`, including another `AtlasTexture`.

> property filter_clip : bool ; default=false ; setter=set_filter_clip ; getter=has_filter_clip

If `true`, the area outside of the `region` is clipped to avoid bleeding of the surrounding texture pixels.

> property margin : Rect2 ; default=Rect2(0, 0, 0, 0) ; setter=set_margin ; getter=get_margin

The margin around the `region`. Useful for small adjustments. If the `Rect2.size` of this property ("w" and "h" in the editor) is set, the drawn texture is resized to fit within the margin.

> property region : Rect2 ; default=Rect2(0, 0, 0, 0) ; setter=set_region ; getter=get_region

The region used to draw the `atlas`. If either dimension of the region's size is `0`, the value from `atlas` size will be used for that axis instead.
**Note:** The image size is always an integer, so the actual region size is rounded down.

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource
