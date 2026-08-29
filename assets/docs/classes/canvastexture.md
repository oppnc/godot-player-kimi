# CanvasTexture

> class CanvasTexture
> inherits CanvasTexture Texture2D

## Brief

Texture with optional normal and specular maps for use in 2D rendering.

## Description

`CanvasTexture` is an alternative to `ImageTexture` for 2D rendering. It allows using normal maps and specular maps in any node that inherits from `CanvasItem`. `CanvasTexture` also allows overriding the texture's filter and repeat mode independently of the node's properties (or the project settings).
**Note:** `CanvasTexture` cannot be used in 3D. It will not display correctly when applied to any `VisualInstance3D`, such as `Sprite3D` or `Decal`. For physically-based materials in 3D, use `BaseMaterial3D` instead.

## Properties

> property diffuse_texture : Texture2D ; setter=set_diffuse_texture ; getter=get_diffuse_texture

The diffuse (color) texture to use. This is the main texture you want to set in most cases.

> property normal_texture : Texture2D ; setter=set_normal_texture ; getter=get_normal_texture

The normal map texture to use. Only has a visible effect if `Light2D`s are affecting this `CanvasTexture`.
**Note:** Godot expects the normal map to use X+, Y+, and Z+ coordinates. See [this page](http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates) for a comparison of normal map coordinates expected by popular engines.

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

> property specular_color : Color ; default=Color(1, 1, 1, 1) ; setter=set_specular_color ; getter=get_specular_color

The multiplier for specular reflection colors. The `Light2D`'s color is also taken into account when determining the reflection color. Only has a visible effect if `Light2D`s are affecting this `CanvasTexture`.

> property specular_shininess : float ; default=1.0 ; setter=set_specular_shininess ; getter=get_specular_shininess

The specular exponent for `Light2D` specular reflections. Higher values result in a more glossy/"wet" look, with reflections becoming more localized and less visible overall. The default value of `1.0` disables specular reflections entirely. Only has a visible effect if `Light2D`s are affecting this `CanvasTexture`.

> property specular_texture : Texture2D ; setter=set_specular_texture ; getter=get_specular_texture

The specular map to use for `Light2D` specular reflections. This should be a grayscale or colored texture, with brighter areas resulting in a higher `specular_shininess` value. Using a colored `specular_texture` allows controlling specular shininess on a per-channel basis. Only has a visible effect if `Light2D`s are affecting this `CanvasTexture`.

> property texture_filter : CanvasItem.TextureFilter ; default=0 ; setter=set_texture_filter ; getter=get_texture_filter

The texture filtering mode to use when drawing this `CanvasTexture`.

> property texture_repeat : CanvasItem.TextureRepeat ; default=0 ; setter=set_texture_repeat ; getter=get_texture_repeat

The texture repeat mode to use when drawing this `CanvasTexture`.

## Tutorials
- [2D Lights and Shadows]($DOCS_URL/tutorials/2d/2d_lights_and_shadows.html)
