# BoxOccluder3D

> class BoxOccluder3D
> inherits BoxOccluder3D Occluder3D

## Brief

Cuboid shape for use with occlusion culling in `OccluderInstance3D`.

## Description

`BoxOccluder3D` stores a cuboid shape that can be used by the engine's occlusion culling system.
See `OccluderInstance3D`'s documentation for instructions on setting up occlusion culling.

## Properties

> property size : Vector3 ; default=Vector3(1, 1, 1) ; setter=set_size ; getter=get_size

The box's size in 3D units.

## Tutorials
- [Occlusion culling]($DOCS_URL/tutorials/3d/occlusion_culling.html)
