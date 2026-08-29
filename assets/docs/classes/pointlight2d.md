# PointLight2D

> class PointLight2D ; keywords=omni, spot
> inherits PointLight2D Light2D

## Brief

Positional 2D light source.

## Description

Casts light in a 2D environment. This light's shape is defined by a (usually grayscale) texture.

## Properties

> property height : float ; default=0.0 ; setter=set_height ; getter=get_height

The height of the light. Used with 2D normal mapping. The units are in pixels, e.g. if the height is 100, then it will illuminate an object 100 pixels away at a 45° angle to the plane.

> property offset : Vector2 ; default=Vector2(0, 0) ; setter=set_texture_offset ; getter=get_texture_offset

The offset of the light's `texture`.

> property texture : Texture2D ; setter=set_texture ; getter=get_texture

`Texture2D` used for the light's appearance.

> property texture_scale : float ; default=1.0 ; setter=set_texture_scale ; getter=get_texture_scale

The `texture`'s scale factor.

## Tutorials
- [2D lights and shadows]($DOCS_URL/tutorials/2d/2d_lights_and_shadows.html)
