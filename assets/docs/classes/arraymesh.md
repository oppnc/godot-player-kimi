# ArrayMesh

> class ArrayMesh
> inherits ArrayMesh Mesh

## Brief

`Mesh` type that provides utility for constructing a surface from arrays.

## Description

The `ArrayMesh` is used to construct a `Mesh` by specifying the attributes as arrays.
The most basic example is the creation of a single triangle:

```gdscript
        var vertices = PackedVector3Array()
        vertices.push_back(Vector3(0, 1, 0))
        vertices.push_back(Vector3(1, 0, 0))
        vertices.push_back(Vector3(0, 0, 1))

        # Initialize the ArrayMesh.
        var arr_mesh = ArrayMesh.new()
        var arrays = []
        arrays.resize(Mesh.ARRAY_MAX)
        arrays[Mesh.ARRAY_VERTEX] = vertices

        # Create the Mesh.
        arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
        var m = MeshInstance3D.new()
        m.mesh = arr_mesh

```

```csharp
        Vector3[] vertices =
        [
            new Vector3(0, 1, 0),
            new Vector3(1, 0, 0),
            new Vector3(0, 0, 1),
        ];

        // Initialize the ArrayMesh.
        var arrMesh = new ArrayMesh();
        Godot.Collections.Array arrays = [];
        arrays.Resize((int)Mesh.ArrayType.Max);
        arrays[(int)Mesh.ArrayType.Vertex] = vertices;

        // Create the Mesh.
        arrMesh.AddSurfaceFromArrays(Mesh.PrimitiveType.Triangles, arrays);
        var m = new MeshInstance3D();
        m.Mesh = arrMesh;

```

The `MeshInstance3D` is ready to be added to the `SceneTree` to be shown.
See also `ImmediateMesh`, `MeshDataTool` and `SurfaceTool` for procedural geometry generation.
**Note:** Godot uses clockwise [winding order](https://learnopengl.com/Advanced-OpenGL/Face-culling) for front faces of triangle primitive modes.

## Properties

> property blend_shape_mode : Mesh.BlendShapeMode ; default=1 ; setter=set_blend_shape_mode ; getter=get_blend_shape_mode

The blend shape mode.

> property custom_aabb : AABB ; default=AABB(0, 0, 0, 0, 0, 0) ; setter=set_custom_aabb ; getter=get_custom_aabb

Overrides the `AABB` with one defined by user for use with frustum culling. Especially useful to avoid unexpected culling when using a shader to offset vertices.

> property shadow_mesh : ArrayMesh ; setter=set_shadow_mesh ; getter=get_shadow_mesh

An optional mesh which can be used for rendering shadows and the depth prepass. Can be used to increase performance by supplying a mesh with fused vertices and only vertex position data (without normals, UVs, colors, etc.).
**Note:** This mesh must have exactly the same vertex positions as the source mesh (including the source mesh's LODs, if present). If vertex positions differ, then the mesh will not draw correctly.

## Methods

> method add_blend_shape(name: StringName) -> void

Adds name for a blend shape that will be added with `add_surface_from_arrays`. Must be called before surface is added.

> method add_surface_from_arrays(primitive: Mesh.PrimitiveType, arrays: Array, blend_shapes: Array[Array] = [], lods: Dictionary = {}, flags: BitField[Mesh.ArrayFormat] = 0) -> void

Creates a new surface. `Mesh.get_surface_count` will become the `surf_idx` for this new surface.
Surfaces are created to be rendered using a `primitive`, which may be any of the values defined in `Mesh.PrimitiveType`.
The `arrays` argument is an array of arrays. Each of the `Mesh.ARRAY_MAX` elements contains an array with some of the mesh data for this surface as described by the corresponding member of `Mesh.ArrayType` or `null` if it is not used by the surface. For example, `arrays[0]` is the array of vertices. That first vertex sub-array is always required; the others are optional. Adding an index array puts this surface into "index mode" where the vertex and other arrays become the sources of data and the index array defines the vertex order. All sub-arrays must have the same length as the vertex array (or be an exact multiple of the vertex array's length, when multiple elements of a sub-array correspond to a single vertex) or be empty, except for `Mesh.ARRAY_INDEX` if it is used.
The `blend_shapes` argument is an array of vertex data for each blend shape. Each element is an array of the same structure as `arrays`, but `Mesh.ARRAY_VERTEX`, `Mesh.ARRAY_NORMAL`, and `Mesh.ARRAY_TANGENT` are set if and only if they are set in `arrays` and all other entries are `null`.
The `lods` argument is a dictionary with `float` keys and `PackedInt32Array` values. Each entry in the dictionary represents an LOD level of the surface, where the value is the `Mesh.ARRAY_INDEX` array to use for the LOD level and the key is roughly proportional to the distance at which the LOD stats being used. I.e., increasing the key of an LOD also increases the distance that the objects has to be from the camera before the LOD is used.
The `flags` argument is the bitwise OR of, as required: One value of `Mesh.ArrayCustomFormat` left shifted by `ARRAY_FORMAT_CUSTOMn_SHIFT` for each custom channel in use, `Mesh.ARRAY_FLAG_USE_DYNAMIC_UPDATE`, `Mesh.ARRAY_FLAG_USE_8_BONE_WEIGHTS`, or `Mesh.ARRAY_FLAG_USES_EMPTY_VERTEX_ARRAY`.
**Note:** When using indices, it is recommended to only use points, lines, or triangles.

> method clear_blend_shapes() -> void

Removes all blend shapes from this `ArrayMesh`.

> method clear_surfaces() -> void

Removes all surfaces from this `ArrayMesh`.

> method get_blend_shape_count() -> int ; qualifiers=const

Returns the number of blend shapes that the `ArrayMesh` holds.

> method get_blend_shape_name(index: int) -> StringName ; qualifiers=const

Returns the name of the blend shape at this index.

> method lightmap_unwrap(transform: Transform3D, texel_size: float) -> Error

Performs a UV unwrap on the `ArrayMesh` to prepare the mesh for lightmapping.

> method regen_normal_maps() -> void

Regenerates tangents for each of the `ArrayMesh`'s surfaces.

> method set_blend_shape_name(index: int, name: StringName) -> void

Sets the name of the blend shape at this index.

> method surface_find_by_name(name: String) -> int ; qualifiers=const

Returns the index of the first surface with this name held within this `ArrayMesh`. If none are found, -1 is returned.

> method surface_get_array_index_len(surf_idx: int) -> int ; qualifiers=const

Returns the length in indices of the index array in the requested surface (see `add_surface_from_arrays`).

> method surface_get_array_len(surf_idx: int) -> int ; qualifiers=const

Returns the length in vertices of the vertex array in the requested surface (see `add_surface_from_arrays`).

> method surface_get_format(surf_idx: int) -> BitField[Mesh.ArrayFormat] ; qualifiers=const

Returns the format mask of the requested surface (see `add_surface_from_arrays`).

> method surface_get_name(surf_idx: int) -> String ; qualifiers=const

Gets the name assigned to this surface.

> method surface_get_primitive_type(surf_idx: int) -> Mesh.PrimitiveType ; qualifiers=const

Returns the primitive type of the requested surface (see `add_surface_from_arrays`).

> method surface_remove(surf_idx: int) -> void

Removes the surface at the given index from the Mesh, shifting surfaces with higher index down by one.

> method surface_set_name(surf_idx: int, name: String) -> void

Sets a name for a given surface.

> method surface_update_attribute_region(surf_idx: int, offset: int, data: PackedByteArray) -> void

Updates the attribute buffer of this mesh's surface with the given `data`. The expected data per attribute is 12 or 8 bytes (4 bytes per float, 2 floats per `Vector2`, and 3 floats per `Vector3`) depending on if the mesh is using `Vector3` or `Vector2` vertices. This value can be determined with `RenderingServer.mesh_surface_get_format_attribute_stride`.
The starting point of the updates can be changed with `offset`. The value of `offset` should be a multiple of 12 bytes in most cases to align to each attribute.
A `PackedVector3Array` of attribute locations can be converted into a `PackedByteArray` using `PackedVector3Array.to_byte_array` for use in `data`.

> method surface_update_skin_region(surf_idx: int, offset: int, data: PackedByteArray) -> void

Updates the skin buffer of this mesh's surface with the given `data`. The expected data per skin is 12 or 8 bytes (4 bytes per float, 2 floats per `Vector2`, and 3 floats per `Vector3`) depending on if the mesh is using `Vector3` or `Vector2` vertices. This value can be determined with `RenderingServer.mesh_surface_get_format_skin_stride`.
The starting point of the updates can be changed with `offset`. The value of `offset` should be a multiple of 12 bytes in most cases to align to each skin.
A `PackedVector3Array` of skin locations can be converted into a `PackedByteArray` using `PackedVector3Array.to_byte_array` for use in `data`.

> method surface_update_vertex_region(surf_idx: int, offset: int, data: PackedByteArray) -> void

Updates the vertex buffer of this mesh's surface with the given `data`. The expected data per vertex is 12 or 8 bytes (4 bytes per float, 2 floats per `Vector2`, and 3 floats per `Vector3`) depending on if the mesh is using `Vector3` or `Vector2` vertices. This value can be determined with `RenderingServer.mesh_surface_get_format_vertex_stride`.
The starting point of the updates can be changed with `offset`. The value of `offset` should be a multiple of 12 bytes in most cases to align to each vertex.
A `PackedVector3Array` of vertex locations can be converted into a `PackedByteArray` using `PackedVector3Array.to_byte_array` for use in `data`.

## Tutorials
- [Procedural geometry using the ArrayMesh]($DOCS_URL/tutorials/3d/procedural_geometry/arraymesh.html)
