# PhysicsServer3DRenderingServerHandler

> class PhysicsServer3DRenderingServerHandler
> inherits PhysicsServer3DRenderingServerHandler Object

## Brief

A class used to provide `PhysicsServer3DExtension._soft_body_update_rendering_server` with a rendering handler for soft bodies.

## Methods

> method _set_aabb(aabb: AABB) -> void ; qualifiers=virtual required

Called by the `PhysicsServer3D` to set the bounding box for the `SoftBody3D`.

> method _set_normal(vertex_id: int, normal: Vector3) -> void ; qualifiers=virtual required

Called by the `PhysicsServer3D` to set the normal for the `SoftBody3D` vertex at the index specified by `vertex_id`.
**Note:** The `normal` parameter used to be of type `const void*` prior to Godot 4.2.

> method _set_vertex(vertex_id: int, vertex: Vector3) -> void ; qualifiers=virtual required

Called by the `PhysicsServer3D` to set the position for the `SoftBody3D` vertex at the index specified by `vertex_id`.
**Note:** The `vertex` parameter used to be of type `const void*` prior to Godot 4.2.

> method set_aabb(aabb: AABB) -> void

Sets the bounding box for the `SoftBody3D`.

> method set_normal(vertex_id: int, normal: Vector3) -> void

Sets the normal for the `SoftBody3D` vertex at the index specified by `vertex_id`.

> method set_vertex(vertex_id: int, vertex: Vector3) -> void

Sets the position for the `SoftBody3D` vertex at the index specified by `vertex_id`.
