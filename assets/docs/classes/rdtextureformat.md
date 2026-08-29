# RDTextureFormat

> class RDTextureFormat
> inherits RDTextureFormat RefCounted

## Brief

Texture format (used by `RenderingDevice`).

## Description

This object is used by `RenderingDevice`.

## Properties

> property array_layers : int ; default=1 ; setter=set_array_layers ; getter=get_array_layers

The number of layers in the texture. Only relevant for 2D texture arrays.

> property depth : int ; default=1 ; setter=set_depth ; getter=get_depth

The texture's depth (in pixels). This is always `1` for 2D textures.

> property format : RenderingDevice.DataFormat ; default=8 ; setter=set_format ; getter=get_format

The texture's pixel data format.

> property height : int ; default=1 ; setter=set_height ; getter=get_height

The texture's height (in pixels).

> property is_discardable : bool ; default=false ; setter=set_is_discardable ; getter=get_is_discardable

If a texture is discardable, its contents do not need to be preserved between frames. This flag is only relevant when the texture is used as target in a draw list.
This information is used by `RenderingDevice` to figure out if a texture's contents can be discarded, eliminating unnecessary writes to memory and boosting performance.

> property is_resolve_buffer : bool ; default=false ; setter=set_is_resolve_buffer ; getter=get_is_resolve_buffer

The texture will be used as the destination of a resolve operation.

> property mipmaps : int ; default=1 ; setter=set_mipmaps ; getter=get_mipmaps

The number of mipmaps available in the texture.

> property samples : RenderingDevice.TextureSamples ; default=0 ; setter=set_samples ; getter=get_samples

The number of samples used when sampling the texture.

> property texture_type : RenderingDevice.TextureType ; default=1 ; setter=set_texture_type ; getter=get_texture_type

The texture type.

> property usage_bits : BitField[RenderingDevice.TextureUsageBits] ; default=0 ; setter=set_usage_bits ; getter=get_usage_bits

The texture's usage bits, which determine what can be done using the texture.

> property width : int ; default=1 ; setter=set_width ; getter=get_width

The texture's width (in pixels).

## Methods

> method add_shareable_format(format: RenderingDevice.DataFormat) -> void

Adds `format` as a valid format for the corresponding `RDTextureView`'s `RDTextureView.format_override` property. If any format is added as shareable, then the main `format` must also be added.

> method remove_shareable_format(format: RenderingDevice.DataFormat) -> void

Removes `format` from the list of valid formats that the corresponding `RDTextureView`'s `RDTextureView.format_override` property can be set to.
