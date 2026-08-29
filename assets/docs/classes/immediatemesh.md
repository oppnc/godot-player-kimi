# ImmediateMesh

> class ImmediateMesh
> inherits ImmediateMesh Mesh

## Brief

Mesh optimized for creating geometry manually.

## Description

A mesh type optimized for creating geometry manually, similar to OpenGL 1.x immediate mode.
Here's a sample on how to generate a triangular face:

```gdscript
        var mesh = ImmediateMesh.new()
        mesh.surface_begin(Mesh.PRIMITIVE_TRIANGLES)
        mesh.surface_add_vertex(Vector3.LEFT)
        mesh.surface_add_vertex(Vector3.FORWARD)
        mesh.surface_add_vertex(Vector3.ZERO)
        mesh.surface_end()

```

```csharp
        var mesh = new ImmediateMesh();
        mesh.SurfaceBegin(Mesh.PrimitiveType.Triangles);
        mesh.SurfaceAddVertex(Vector3.Left);
        mesh.SurfaceAddVertex(Vector3.Forward);
        mesh.SurfaceAddVertex(Vector3.Zero);
        mesh.SurfaceEnd();

```

**Note:** Generating complex geometries with `ImmediateMesh` is highly inefficient. Instead, it is designed to generate simple geometry that changes often.

## Methods

> method clear_surfaces() -> void

Clear all surfaces.

> method surface_add_vertex(vertex: Vector3) -> void

Add a 3D vertex using the current attributes previously set.

> method surface_add_vertex_2d(vertex: Vector2) -> void

Add a 2D vertex using the current attributes previously set.

> method surface_begin(primitive: Mesh.PrimitiveType, material: Material = null) -> void

Begin a new surface.

> method surface_end() -> void

End and commit current surface. Note that surface being created will not be visible until this function is called.

> method surface_set_color(color: Color) -> void

Set the color attribute that will be pushed with the next vertex.

> method surface_set_normal(normal: Vector3) -> void

Set the normal attribute that will be pushed with the next vertex.

> method surface_set_tangent(tangent: Plane) -> void

Set the tangent attribute that will be pushed with the next vertex.
**Note:** Even though `tangent` is a `Plane`, it does not directly represent the tangent plane. Its `Plane.x`, `Plane.y`, and `Plane.z` represent the tangent vector and `Plane.d` should be either `-1` or `1`. See also `Mesh.ARRAY_TANGENT`.

> method surface_set_uv(uv: Vector2) -> void

Set the UV attribute that will be pushed with the next vertex.

> method surface_set_uv2(uv2: Vector2) -> void

Set the UV2 attribute that will be pushed with the next vertex.

## Tutorials
- [Using ImmediateMesh]($DOCS_URL/tutorials/3d/procedural_geometry/immediatemesh.html)
