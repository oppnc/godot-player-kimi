# ArrayOccluder3D

> class ArrayOccluder3D
> inherits ArrayOccluder3D Occluder3D

## Brief

3D polygon shape for use with occlusion culling in `OccluderInstance3D`.

## Description

`ArrayOccluder3D` stores an arbitrary 3D polygon shape that can be used by the engine's occlusion culling system. This is analogous to `ArrayMesh`, but for occluders.
See `OccluderInstance3D`'s documentation for instructions on setting up occlusion culling.

## Properties

> property indices : PackedInt32Array ; default=PackedInt32Array() ; setter=set_indices ; getter=get_indices

The occluder's index position. Indices determine which points from the `vertices` array should be drawn, and in which order.
**Note:** The occluder is always updated after setting this value. If creating occluders procedurally, consider using `set_arrays` instead to avoid updating the occluder twice when it's created.

> property vertices : PackedVector3Array ; default=PackedVector3Array() ; setter=set_vertices ; getter=get_vertices

The occluder's vertex positions in local 3D coordinates.
**Note:** The occluder is always updated after setting this value. If creating occluders procedurally, consider using `set_arrays` instead to avoid updating the occluder twice when it's created.

## Methods

> method set_arrays(vertices: PackedVector3Array, indices: PackedInt32Array) -> void

Sets `indices` and `vertices`, while updating the final occluder only once after both values are set.

## Tutorials
- [Occlusion culling]($DOCS_URL/tutorials/3d/occlusion_culling.html)
