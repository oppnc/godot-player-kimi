# CompressedTextureLayered

> class CompressedTextureLayered
> inherits CompressedTextureLayered TextureLayered

## Brief

Base class for texture arrays that can optionally be compressed.

## Description

Base class for `CompressedTexture2DArray` and `CompressedTexture3D`. Cannot be used directly, but contains all the functions necessary for accessing the derived resource types. See also `TextureLayered`.

## Properties

> property load_path : String ; default="" ; setter=load ; getter=get_load_path

The path the texture should be loaded from.

## Methods

> method load(path: String) -> Error

Loads the texture at `path`.
