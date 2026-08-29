# Texture2DRD

> class Texture2DRD
> inherits Texture2DRD Texture2D

## Brief

Texture for 2D that is bound to a texture created on the `RenderingDevice`.

## Description

This texture class allows you to use a 2D texture created directly on the `RenderingDevice` as a texture for materials, meshes, etc.
**Note:** `Texture2DRD` is intended for low-level usage with `RenderingDevice`. For most use cases, use `Texture2D` instead.

## Properties

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

> property texture_rd_rid : RID ; setter=set_texture_rd_rid ; getter=get_texture_rd_rid

The RID of the texture object created on the `RenderingDevice`.

## Tutorials
- [Compute Texture demo](https://godotengine.org/asset-library/asset/2764)
