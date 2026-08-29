# QuadOccluder3D

> class QuadOccluder3D
> inherits QuadOccluder3D Occluder3D

## Brief

Flat plane shape for use with occlusion culling in `OccluderInstance3D`.

## Description

`QuadOccluder3D` stores a flat plane shape that can be used by the engine's occlusion culling system. See also `PolygonOccluder3D` if you need to customize the quad's shape.
See `OccluderInstance3D`'s documentation for instructions on setting up occlusion culling.

## Properties

> property size : Vector2 ; default=Vector2(1, 1) ; setter=set_size ; getter=get_size

The quad's size in 3D units.

## Tutorials
- [Occlusion culling]($DOCS_URL/tutorials/3d/occlusion_culling.html)
