# PhysicsDirectSpaceState3DExtension

> class PhysicsDirectSpaceState3DExtension
> inherits PhysicsDirectSpaceState3DExtension PhysicsDirectSpaceState3D

## Brief

Provides virtual methods that can be overridden to create custom `PhysicsDirectSpaceState3D` implementations.

## Description

This class extends `PhysicsDirectSpaceState3D` by providing additional virtual methods that can be overridden. When these methods are overridden, they will be called instead of the internal methods of the physics server.
Intended for use with GDExtension to create custom implementations of `PhysicsDirectSpaceState3D`.

## Methods

> method _cast_motion(shape_rid: RID, transform: Transform3D, motion: Vector3, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, r_closest_safe: float*, r_closest_unsafe: float*, r_info: PhysicsServer3DExtensionShapeRestInfo*) -> bool ; qualifiers=virtual required

> method _collide_shape(shape_rid: RID, transform: Transform3D, motion: Vector3, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, r_results: void*, max_results: int, r_result_count: int32_t*) -> bool ; qualifiers=virtual required

> method _get_closest_point_to_object_volume(object: RID, point: Vector3) -> Vector3 ; qualifiers=virtual required const

> method _intersect_point(position: Vector3, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, r_results: PhysicsServer3DExtensionShapeResult*, max_results: int) -> int ; qualifiers=virtual required

> method _intersect_ray(from: Vector3, to: Vector3, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, hit_from_inside: bool, hit_back_faces: bool, pick_ray: bool, r_result: PhysicsServer3DExtensionRayResult*) -> bool ; qualifiers=virtual required

> method _intersect_shape(shape_rid: RID, transform: Transform3D, motion: Vector3, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, r_result_count: PhysicsServer3DExtensionShapeResult*, max_results: int) -> int ; qualifiers=virtual required

> method _rest_info(shape_rid: RID, transform: Transform3D, motion: Vector3, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, r_rest_info: PhysicsServer3DExtensionShapeRestInfo*) -> bool ; qualifiers=virtual required

> method is_body_excluded_from_query(body: RID) -> bool ; qualifiers=const
