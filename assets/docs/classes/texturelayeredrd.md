# TextureLayeredRD

> class TextureLayeredRD
> inherits TextureLayeredRD TextureLayered

## Brief

Abstract base class for layered texture RD types.

## Description

Base class for `Texture2DArrayRD`, `TextureCubemapRD` and `TextureCubemapArrayRD`. Cannot be used directly, but contains all the functions necessary for accessing the derived resource types.
**Note:** `TextureLayeredRD` is intended for low-level usage with `RenderingDevice`. For most use cases, use `TextureLayered` instead.

## Properties

> property texture_rd_rid : RID ; setter=set_texture_rd_rid ; getter=get_texture_rd_rid

The RID of the texture object created on the `RenderingDevice`.

## Tutorials
- [Compute Texture demo](https://godotengine.org/asset-library/asset/2764)
