# ResourceImporterSVG

> class ResourceImporterSVG
> inherits ResourceImporterSVG ResourceImporter

## Brief

Imports an SVG file as an automatically scalable texture for use in UI elements and 2D rendering.

## Description

This importer imports `DPITexture` resources. See also `ResourceImporterTexture` and `ResourceImporterImage`.

## Properties

> property base_scale : float ; default=1.0

Texture scale. `1.0` is the original SVG size. Higher values result in a larger image.

> property color_map : Dictionary ; default={}

If set, remaps texture colors according to `Color`-`Color` map.

> property compress : bool ; default=true

If `true`, uses lossless compression for the SVG source.

> property fix_alpha_border : bool ; default=false

If `true`, puts pixels of the same surrounding color in transition from transparent to opaque areas. For textures displayed with bilinear filtering, this helps to reduce the outline effect when exporting images from an image editor.

> property premult_alpha : bool ; default=false

An alternative to fixing darkened borders with `fix_alpha_border` is to use premultiplied alpha. By enabling this option, the texture will be converted to this format. A premultiplied alpha texture requires specific materials to be displayed correctly:
- In 2D, a `CanvasItemMaterial` will need to be created and configured to use the `CanvasItemMaterial.BLEND_MODE_PREMULT_ALPHA` blend mode on `CanvasItem`s that use this texture. In custom `canvas_item` shaders, `render_mode blend_premul_alpha;` should be used.
- In 3D, a `BaseMaterial3D` will need to be created and configured to use the `BaseMaterial3D.BLEND_MODE_PREMULT_ALPHA` blend mode on materials that use this texture. In custom `spatial` shaders, `render_mode blend_premul_alpha;` should be used.

> property saturation : float ; default=1.0

Overrides texture saturation.
