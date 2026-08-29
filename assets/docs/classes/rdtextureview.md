# RDTextureView

> class RDTextureView
> inherits RDTextureView RefCounted

## Brief

Texture view (used by `RenderingDevice`).

## Description

This object is used by `RenderingDevice`.

## Properties

> property format_override : RenderingDevice.DataFormat ; default=232 ; setter=set_format_override ; getter=get_format_override

Optional override for the data format to return sampled values in. The corresponding `RDTextureFormat` must have had this added as a shareable format. The default value of `RenderingDevice.DATA_FORMAT_MAX` does not override the format.

> property swizzle_a : RenderingDevice.TextureSwizzle ; default=6 ; setter=set_swizzle_a ; getter=get_swizzle_a

The channel to sample when sampling the alpha channel.

> property swizzle_b : RenderingDevice.TextureSwizzle ; default=5 ; setter=set_swizzle_b ; getter=get_swizzle_b

The channel to sample when sampling the blue color channel.

> property swizzle_g : RenderingDevice.TextureSwizzle ; default=4 ; setter=set_swizzle_g ; getter=get_swizzle_g

The channel to sample when sampling the green color channel.

> property swizzle_r : RenderingDevice.TextureSwizzle ; default=3 ; setter=set_swizzle_r ; getter=get_swizzle_r

The channel to sample when sampling the red color channel.
