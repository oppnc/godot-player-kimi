# PortableCompressedTexture2D

> class PortableCompressedTexture2D
> inherits PortableCompressedTexture2D Texture2D

## Brief

Provides a compressed texture for disk and/or VRAM in a way that is portable.

## Description

This class allows storing compressed textures as self contained (not imported) resources.
For 2D usage (compressed on disk, uncompressed on VRAM), the lossy and lossless modes are recommended. For 3D usage (compressed on VRAM) it depends on the target platform.
If you intend to only use desktop, S3TC or BPTC are recommended. For only mobile, ETC2 is recommended.
For portable, self contained 3D textures that work on both desktop and mobile, Basis Universal is recommended (although it has a small quality cost and longer compression time as a tradeoff).
This resource is intended to be created from code.

## Properties

> property keep_compressed_buffer : bool ; default=false ; setter=set_keep_compressed_buffer ; getter=is_keeping_compressed_buffer

If `true`, when running in the editor, this texture will keep the source-compressed data in memory, allowing the data to persist after loading. Otherwise, the source-compressed data is lost after loading and the texture can't be re-saved.
**Note:** This property must be set before `create_from_image` for this to work.

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

> property size_override : Vector2 ; default=Vector2(0, 0) ; setter=set_size_override ; getter=get_size_override

Allows overriding the texture's size (for 2D only).

## Methods

> method create_from_image(image: Image, compression_mode: CompressionMode, normal_map: bool = false, lossy_quality: float = 0.8) -> void

Initializes the compressed texture from a base image. The compression mode must be provided.
`normal_map` is recommended to ensure optimum quality if this image will be used as a normal map.
If lossy compression is requested, the quality setting can optionally be provided. This maps to Lossy WebP compression quality.

> method get_compression_mode() -> CompressionMode ; qualifiers=const

Return the compression mode used (valid after initialized).

> method is_keeping_all_compressed_buffers() -> bool ; qualifiers=static

Returns `true` if the flag is overridden for all textures of this type.

> method set_basisu_compressor_params(uastc_level: int, rdo_quality_loss: float) -> void

Sets the compressor parameters for Basis Universal compression. See also the settings in `ResourceImporterTexture`.
**Note:** This method must be called before `create_from_image` for this to work.

> method set_keep_all_compressed_buffers(keep: bool) -> void ; qualifiers=static

If `keep` is `true`, overrides the flag globally for all textures of this type. This is used primarily by the editor.

## Enumerations

> enum CompressionMode

> enum_value CompressionMode.COMPRESSION_MODE_LOSSLESS = 0

> enum_value CompressionMode.COMPRESSION_MODE_LOSSY = 1

> enum_value CompressionMode.COMPRESSION_MODE_BASIS_UNIVERSAL = 2

> enum_value CompressionMode.COMPRESSION_MODE_S3TC = 3

> enum_value CompressionMode.COMPRESSION_MODE_ETC2 = 4

> enum_value CompressionMode.COMPRESSION_MODE_BPTC = 5

> enum_value CompressionMode.COMPRESSION_MODE_ASTC = 6
