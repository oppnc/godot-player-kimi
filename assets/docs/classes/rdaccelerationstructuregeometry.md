# RDAccelerationStructureGeometry

> class RDAccelerationStructureGeometry ; experimental=This class may be changed or removed in future versions.
> inherits RDAccelerationStructureGeometry RefCounted

## Brief

Acceleration structure geometry (used by `RenderingDevice`).

## Description

`RDAccelerationStructureGeometry` describes a set of triangles used as raytracing geometry in the `RenderingDevice.blas_create` method.
The geometry is always in triangle list form, either indexed or non-indexed. Triangle strips are not supported.

## Properties

> property flags : BitField[RenderingDevice.AccelerationStructureGeometryFlagBits] ; default=0 ; setter=set_flags ; getter=get_flags

Flags for the geometry.

> property index_buffer : RID ; default=RID() ; setter=set_index_buffer ; getter=get_index_buffer

Buffer containing vertex indices. If `null`, triangles are non-indexed.

> property index_count : int ; default=0 ; setter=set_index_count ; getter=get_index_count

Number of indices used by this geometry in `index_buffer`.

> property index_offset : int ; default=0 ; setter=set_index_offset ; getter=get_index_offset

Byte offset of the first index in `index_buffer`.

> property vertex_buffer : RID ; default=RID() ; setter=set_vertex_buffer ; getter=get_vertex_buffer

Buffer containing vertices.

> property vertex_count : int ; default=0 ; setter=set_vertex_count ; getter=get_vertex_count

Number of vertices used by this geometry in `vertex_buffer`.

> property vertex_format : RenderingDevice.DataFormat ; default=232 ; setter=set_vertex_format ; getter=get_vertex_format

Format of the vertices in `vertex_buffer`.

> property vertex_offset : int ; default=0 ; setter=set_vertex_offset ; getter=get_vertex_offset

Byte offset of the first vertex in `vertex_buffer`.

> property vertex_stride : int ; default=0 ; setter=set_vertex_stride ; getter=get_vertex_stride

Number of bytes between each vertex in `vertex_buffer`.
