# CurveTexture

> class CurveTexture
> inherits CurveTexture Texture2D

## Brief

A 1D texture where pixel brightness corresponds to points on a curve.

## Description

A 1D texture where pixel brightness corresponds to points on a unit `Curve` resource, either in grayscale or in red. This visual representation simplifies the task of saving curves as image files.
If you need to store up to 3 curves within a single texture, use `CurveXYZTexture` instead. See also `GradientTexture1D` and `GradientTexture2D`.

## Properties

> property curve : Curve ; setter=set_curve ; getter=get_curve

The `Curve` that is rendered onto the texture. Should be a unit `Curve`.

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

> property texture_mode : TextureMode ; default=0 ; setter=set_texture_mode ; getter=get_texture_mode

The format the texture should be generated with. When passing a CurveTexture as an input to a `Shader`, this may need to be adjusted.

> property width : int ; default=256 ; setter=set_width ; getter=get_width

The width of the texture (in pixels). Higher values make it possible to represent high-frequency data better (such as sudden direction changes), at the cost of increased generation time and memory usage.

## Enumerations

> enum TextureMode

> enum_value TextureMode.TEXTURE_MODE_RGB = 0

Store the curve equally across the red, green and blue channels. This uses more video memory, but is more compatible with shaders that only read the green and blue values.

> enum_value TextureMode.TEXTURE_MODE_RED = 1

Store the curve only in the red channel. This saves video memory, but some custom shaders may not be able to work with this.
