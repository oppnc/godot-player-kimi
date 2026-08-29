# GradientTexture1D

> class GradientTexture1D
> inherits GradientTexture1D Texture2D

## Brief

A 1D texture that uses colors obtained from a `Gradient`.

## Description

A 1D texture that obtains colors from a `Gradient` to fill the texture data. The texture is filled by sampling the gradient for each pixel. Therefore, the texture does not necessarily represent an exact copy of the gradient, as it may miss some colors if there are not enough pixels. See also `GradientTexture2D`, `CurveTexture` and `CurveXYZTexture`.

## Properties

> property gradient : Gradient ; setter=set_gradient ; getter=get_gradient

The `Gradient` used to fill the texture.

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

> property use_hdr : bool ; default=false ; setter=set_use_hdr ; getter=is_using_hdr

If `true`, the generated texture will support high dynamic range (`Image.FORMAT_RGBAF` format). This allows for glow effects to work if `Environment.glow_enabled` is `true`. If `false`, the generated texture will use low dynamic range; overbright colors will be clamped (`Image.FORMAT_RGBA8` format).

> property width : int ; default=256 ; setter=set_width ; getter=get_width

The number of color samples that will be obtained from the `Gradient`.
