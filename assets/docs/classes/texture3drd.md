# Texture3DRD

> class Texture3DRD
> inherits Texture3DRD Texture3D

## Brief

Texture for 3D that is bound to a texture created on the `RenderingDevice`.

## Description

This texture class allows you to use a 3D texture created directly on the `RenderingDevice` as a texture for materials, meshes, etc.
**Note:** `Texture3DRD` is intended for low-level usage with `RenderingDevice`. For most use cases, use `Texture3D` instead.

## Properties

> property texture_rd_rid : RID ; setter=set_texture_rd_rid ; getter=get_texture_rd_rid

The RID of the texture object created on the `RenderingDevice`.

## Tutorials
- [Compute Texture demo](https://godotengine.org/asset-library/asset/2764)
