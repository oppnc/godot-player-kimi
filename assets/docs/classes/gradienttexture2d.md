# GradientTexture2D

> class GradientTexture2D
> inherits GradientTexture2D Texture2D

## Brief

A 2D texture that creates a pattern with colors obtained from a `Gradient`.

## Description

A 2D texture that obtains colors from a `Gradient` to fill the texture data. This texture is able to transform a color transition into different patterns such as a linear or a radial gradient. The texture is filled by interpolating colors starting from `fill_from` to `fill_to` offsets by default, but the gradient fill can be repeated to cover the entire texture.
The gradient is sampled individually for each pixel so it does not necessarily represent an exact copy of the gradient (see `width` and `height`). See also `GradientTexture1D`, `CurveTexture` and `CurveXYZTexture`.

## Properties

> property fill : Fill ; default=0 ; setter=set_fill ; getter=get_fill

The gradient's fill type.

> property fill_from : Vector2 ; default=Vector2(0, 0) ; setter=set_fill_from ; getter=get_fill_from

The initial offset used to fill the texture specified in UV coordinates.

> property fill_to : Vector2 ; default=Vector2(1, 0) ; setter=set_fill_to ; getter=get_fill_to

The final offset used to fill the texture specified in UV coordinates.

> property gradient : Gradient ; setter=set_gradient ; getter=get_gradient

The `Gradient` used to fill the texture.

> property height : int ; default=64 ; setter=set_height ; getter=get_height

The number of vertical color samples that will be obtained from the `Gradient`, which also represents the texture's height.

> property repeat : Repeat ; default=0 ; setter=set_repeat ; getter=get_repeat

The gradient's repeat type.

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

> property use_hdr : bool ; default=false ; setter=set_use_hdr ; getter=is_using_hdr

If `true`, the generated texture will support high dynamic range (`Image.FORMAT_RGBAF` format). This allows for glow effects to work if `Environment.glow_enabled` is `true`. If `false`, the generated texture will use low dynamic range; overbright colors will be clamped (`Image.FORMAT_RGBA8` format).

> property width : int ; default=64 ; setter=set_width ; getter=get_width

The number of horizontal color samples that will be obtained from the `Gradient`, which also represents the texture's width.

## Enumerations

> enum Fill

> enum_value Fill.FILL_LINEAR = 0

The colors are linearly interpolated in a straight line.

> enum_value Fill.FILL_RADIAL = 1

The colors are linearly interpolated in a circular pattern.

> enum_value Fill.FILL_SQUARE = 2

The colors are linearly interpolated in a square pattern.

> enum_value Fill.FILL_CONIC = 3

The colors are linearly interpolated in a cone pattern.

> enum Repeat

> enum_value Repeat.REPEAT_NONE = 0

The gradient fill is restricted to the range defined by `fill_from` to `fill_to` offsets.

> enum_value Repeat.REPEAT = 1

The texture is filled starting from `fill_from` to `fill_to` offsets, repeating the same pattern in both directions.

> enum_value Repeat.REPEAT_MIRROR = 2

The texture is filled starting from `fill_from` to `fill_to` offsets, mirroring the pattern in both directions.
