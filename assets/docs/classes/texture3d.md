# Texture3D

> class Texture3D
> inherits Texture3D Texture

## Brief

Base class for 3-dimensional textures.

## Description

Base class for `ImageTexture3D` and `CompressedTexture3D`. Cannot be used directly, but contains all the functions necessary for accessing the derived resource types. `Texture3D` is the base class for all 3-dimensional texture types. See also `TextureLayered`.
All images need to have the same width, height and number of mipmap levels.
To create such a texture file yourself, reimport your image files using the Godot Editor import presets.

## Methods

> method _get_data() -> Array[Image] ; qualifiers=virtual required const

Called when the `Texture3D`'s data is queried.

> method _get_depth() -> int ; qualifiers=virtual required const

Called when the `Texture3D`'s depth is queried.

> method _get_format() -> Image.Format ; qualifiers=virtual required const

Called when the `Texture3D`'s format is queried.

> method _get_height() -> int ; qualifiers=virtual required const

Called when the `Texture3D`'s height is queried.

> method _get_width() -> int ; qualifiers=virtual required const

Called when the `Texture3D`'s width is queried.

> method _has_mipmaps() -> bool ; qualifiers=virtual required const

Called when the presence of mipmaps in the `Texture3D` is queried.

> method create_placeholder() -> Resource ; qualifiers=const

Creates a placeholder version of this resource (`PlaceholderTexture3D`).

> method get_data() -> Array[Image] ; qualifiers=const

Returns the `Texture3D`'s data as an array of `Image`s. Each `Image` represents a *slice* of the `Texture3D`, with different slices mapping to different depth (Z axis) levels.

> method get_depth() -> int ; qualifiers=const

Returns the `Texture3D`'s depth in pixels. Depth is typically represented by the Z axis (a dimension not present in `Texture2D`).

> method get_format() -> Image.Format ; qualifiers=const

Returns the current format being used by this texture.

> method get_height() -> int ; qualifiers=const

Returns the `Texture3D`'s height in pixels. Width is typically represented by the Y axis.

> method get_width() -> int ; qualifiers=const

Returns the `Texture3D`'s width in pixels. Width is typically represented by the X axis.

> method has_mipmaps() -> bool ; qualifiers=const

Returns `true` if the `Texture3D` has generated mipmaps.
