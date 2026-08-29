# PhysicsDirectSpaceState2DExtension

> class PhysicsDirectSpaceState2DExtension
> inherits PhysicsDirectSpaceState2DExtension PhysicsDirectSpaceState2D

## Brief

Provides virtual methods that can be overridden to create custom `PhysicsDirectSpaceState2D` implementations.

## Description

This class extends `PhysicsDirectSpaceState2D` by providing additional virtual methods that can be overridden. When these methods are overridden, they will be called instead of the internal methods of the physics server.
Intended for use with GDExtension to create custom implementations of `PhysicsDirectSpaceState2D`.

## Methods

> method _cast_motion(shape_rid: RID, transform: Transform2D, motion: Vector2, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, r_closest_safe: float*, r_closest_unsafe: float*) -> bool ; qualifiers=virtual required

> method _collide_shape(shape_rid: RID, transform: Transform2D, motion: Vector2, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, r_results: void*, max_results: int, r_result_count: int32_t*) -> bool ; qualifiers=virtual required

> method _intersect_point(position: Vector2, canvas_instance_id: int, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, r_results: PhysicsServer2DExtensionShapeResult*, max_results: int) -> int ; qualifiers=virtual required

> method _intersect_ray(from: Vector2, to: Vector2, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, hit_from_inside: bool, r_result: PhysicsServer2DExtensionRayResult*) -> bool ; qualifiers=virtual required

> method _intersect_shape(shape_rid: RID, transform: Transform2D, motion: Vector2, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, r_result: PhysicsServer2DExtensionShapeResult*, max_results: int) -> int ; qualifiers=virtual required

> method _rest_info(shape_rid: RID, transform: Transform2D, motion: Vector2, margin: float, collision_mask: int, collide_with_bodies: bool, collide_with_areas: bool, r_rest_info: PhysicsServer2DExtensionShapeRestInfo*) -> bool ; qualifiers=virtual required

> method is_body_excluded_from_query(body: RID) -> bool ; qualifiers=const
