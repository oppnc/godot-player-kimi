# DPITexture

> class DPITexture ; experimental=This class may be changed or removed in future versions.
> inherits DPITexture Texture2D

## Brief

An automatically scalable `Texture2D` based on an SVG image.

## Description

An automatically scalable `Texture2D` based on an SVG image. `DPITexture`s are used to automatically re-rasterize icons and other texture based UI theme elements to match viewport scale and font oversampling. See also `ProjectSettings.display/window/stretch/mode` ("canvas_items" mode) and `Viewport.oversampling_override`.

## Properties

> property base_scale : float ; default=1.0 ; setter=set_base_scale ; getter=get_base_scale

Texture scale. `1.0` is the original SVG size. Higher values result in a larger image.

> property color_map : Dictionary ; default={} ; setter=set_color_map ; getter=get_color_map

If set, remaps texture colors according to `Color`-`Color` map.

> property fix_alpha_border : bool ; default=false ; setter=set_fix_alpha_border ; getter=get_fix_alpha_border

If `true`, puts pixels of the same surrounding color in transition from transparent to opaque areas. For textures displayed with bilinear filtering, this helps to reduce the outline effect when exporting images from an image editor.

> property premult_alpha : bool ; default=false ; setter=set_premult_alpha ; getter=get_premult_alpha

An alternative to fixing darkened borders with `fix_alpha_border` is to use premultiplied alpha. By enabling this option, the texture will be converted to this format. A premultiplied alpha texture requires specific materials to be displayed correctly:
- In 2D, a `CanvasItemMaterial` will need to be created and configured to use the `CanvasItemMaterial.BLEND_MODE_PREMULT_ALPHA` blend mode on `CanvasItem`s that use this texture. In custom `canvas_item` shaders, `render_mode blend_premul_alpha;` should be used.
- In 3D, a `BaseMaterial3D` will need to be created and configured to use the `BaseMaterial3D.BLEND_MODE_PREMULT_ALPHA` blend mode on materials that use this texture. In custom `spatial` shaders, `render_mode blend_premul_alpha;` should be used.

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

> property saturation : float ; default=1.0 ; setter=set_saturation ; getter=get_saturation

Overrides texture saturation.

## Methods

> method create_from_string(source: String, scale: float = 1.0, saturation: float = 1.0, color_map: Dictionary = {}) -> DPITexture ; qualifiers=static

Creates a new `DPITexture` and initializes it by allocating and setting the SVG data to `source`.

> method get_scaled_rid() -> RID ; qualifiers=const

Returns the `RID` of the texture rasterized to match the oversampling of the currently drawn canvas item.

> method get_source() -> String ; qualifiers=const

Returns this SVG texture's source code.

> method set_size_override(size: Vector2i) -> void

Resizes the texture to the specified dimensions.

> method set_source(source: String) -> void

Sets this SVG texture's source code.
