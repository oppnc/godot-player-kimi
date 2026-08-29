# BlitMaterial

> class BlitMaterial
> inherits BlitMaterial Material

## Brief

A material that processes blit calls to a DrawableTexture.

## Description

A material resource that can be used by DrawableTextures when processing blit calls to draw.

## Properties

> property blend_mode : BlendMode ; default=0 ; setter=set_blend_mode ; getter=get_blend_mode

The manner in which the newly blitted texture is blended with the original DrawableTexture.

## Enumerations

> enum BlendMode

> enum_value BlendMode.BLEND_MODE_MIX = 0

Mix blending mode. Colors are assumed to be independent of the alpha (opacity) value.

> enum_value BlendMode.BLEND_MODE_ADD = 1

Additive blending mode.

> enum_value BlendMode.BLEND_MODE_SUB = 2

Subtractive blending mode.

> enum_value BlendMode.BLEND_MODE_MUL = 3

Multiplicative blending mode.

> enum_value BlendMode.BLEND_MODE_DISABLED = 4

No blending mode, direct color copy.
