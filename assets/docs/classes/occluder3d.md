# Occluder3D

> class Occluder3D
> inherits Occluder3D Resource

## Brief

Occluder shape resource for use with occlusion culling in `OccluderInstance3D`.

## Description

`Occluder3D` stores an occluder shape that can be used by the engine's occlusion culling system.
See `OccluderInstance3D`'s documentation for instructions on setting up occlusion culling.

## Methods

> method get_indices() -> PackedInt32Array ; qualifiers=const

Returns the occluder shape's vertex indices.

> method get_vertices() -> PackedVector3Array ; qualifiers=const

Returns the occluder shape's vertex positions.

## Tutorials
- [Occlusion culling]($DOCS_URL/tutorials/3d/occlusion_culling.html)
