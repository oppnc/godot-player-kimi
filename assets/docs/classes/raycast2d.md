# RayCast2D

> class RayCast2D
> inherits RayCast2D Node2D

## Brief

A ray in 2D space, used to find the first collision object it intersects.

## Description

A raycast represents a ray from its origin to its `target_position` that finds the closest object along its path, if it intersects any.
`RayCast2D` can ignore some objects by adding them to an exception list, by making its detection reporting ignore `Area2D`s (`collide_with_areas`) or `PhysicsBody2D`s (`collide_with_bodies`), or by configuring physics layers.
`RayCast2D` calculates intersection every physics frame, and it holds the result until the next physics frame. For an immediate raycast, or if you want to configure a `RayCast2D` multiple times within the same physics frame, use `force_raycast_update`.
To sweep over a region of 2D space, you can approximate the region with multiple `RayCast2D`s or use `ShapeCast2D`.

## Properties

> property collide_with_areas : bool ; default=false ; setter=set_collide_with_areas ; getter=is_collide_with_areas_enabled

If `true`, collisions with `Area2D`s will be reported.

> property collide_with_bodies : bool ; default=true ; setter=set_collide_with_bodies ; getter=is_collide_with_bodies_enabled

If `true`, collisions with `PhysicsBody2D`s will be reported.

> property collision_mask : int ; default=1 ; setter=set_collision_mask ; getter=get_collision_mask

The ray's collision mask. Only objects in at least one collision layer enabled in the mask will be detected. See [Collision layers and masks]($DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks) in the documentation for more information.

> property enabled : bool ; default=true ; setter=set_enabled ; getter=is_enabled

If `true`, collisions will be reported.

> property exclude_parent : bool ; default=true ; setter=set_exclude_parent_body ; getter=get_exclude_parent_body

If `true`, this raycast will not report collisions with its parent node. This property only has an effect if the parent node is a `CollisionObject2D`. See also `Node.get_parent` and `add_exception`.

> property hit_from_inside : bool ; default=false ; setter=set_hit_from_inside ; getter=is_hit_from_inside_enabled

If `true`, the ray will detect a hit when starting inside shapes. In this case the collision normal will be `Vector2(0, 0)`. Does not affect concave polygon shapes.

> property target_position : Vector2 ; default=Vector2(0, 50) ; setter=set_target_position ; getter=get_target_position

The ray's destination point, relative to this raycast's `Node2D.position`.

## Methods

> method add_exception(node: CollisionObject2D) -> void

Adds a collision exception so the ray does not report collisions with the specified `node`.

> method add_exception_rid(rid: RID) -> void

Adds a collision exception so the ray does not report collisions with the specified `RID`.

> method clear_exceptions() -> void

Removes all collision exceptions for this ray.

> method force_raycast_update() -> void

Updates the collision information for the ray immediately, without waiting for the next `_physics_process` call. Use this method, for example, when the ray or its parent has changed state.
**Note:** `enabled` does not need to be `true` for this to work.

> method get_collider() -> Object ; qualifiers=const

Returns the first object that the ray intersects, or `null` if no object is intersecting the ray (i.e. `is_colliding` returns `false`).
**Note:** This object is not guaranteed to be a `CollisionObject2D`. For example, if the ray intersects a `TileMapLayer`, the method will return a `TileMapLayer` instance.

> method get_collider_rid() -> RID ; qualifiers=const

Returns the `RID` of the first object that the ray intersects, or an empty `RID` if no object is intersecting the ray (i.e. `is_colliding` returns `false`).

> method get_collider_shape() -> int ; qualifiers=const

Returns the shape ID of the first object that the ray intersects, or `0` if no object is intersecting the ray (i.e. `is_colliding` returns `false`).
To get the intersected shape node, for a `CollisionObject2D` target, use:

```gdscript
                var target = get_collider() # A CollisionObject2D.
                var shape_id = get_collider_shape() # The shape index in the collider.
                var owner_id = target.shape_find_owner(shape_id) # The owner ID in the collider.
                var shape = target.shape_owner_get_owner(owner_id)

```

```csharp
                var target = (CollisionObject2D)GetCollider(); // A CollisionObject2D.
                var shapeId = GetColliderShape(); // The shape index in the collider.
                var ownerId = target.ShapeFindOwner(shapeId); // The owner ID in the collider.
                var shape = target.ShapeOwnerGetOwner(ownerId);

```

> method get_collision_mask_value(layer_number: int) -> bool ; qualifiers=const

Returns whether or not the specified layer of the `collision_mask` is enabled, given a `layer_number` between 1 and 32.

> method get_collision_normal() -> Vector2 ; qualifiers=const

Returns the normal of the intersecting object's shape at the collision point, or `Vector2(0, 0)` if the ray starts inside the shape and `hit_from_inside` is `true`.
**Note:** Check that `is_colliding` returns `true` before calling this method to ensure the returned normal is valid and up-to-date.

> method get_collision_point() -> Vector2 ; qualifiers=const

Returns the collision point at which the ray intersects the closest object, in the global coordinate system. If `hit_from_inside` is `true` and the ray starts inside of a collision shape, this function will return the origin point of the ray.
**Note:** Check that `is_colliding` returns `true` before calling this method to ensure the returned point is valid and up-to-date.

> method is_colliding() -> bool ; qualifiers=const

Returns whether any object is intersecting with the ray's vector (considering the vector length).

> method remove_exception(node: CollisionObject2D) -> void

Removes a collision exception so the ray can report collisions with the specified `node`.

> method remove_exception_rid(rid: RID) -> void

Removes a collision exception so the ray can report collisions with the specified `RID`.

> method set_collision_mask_value(layer_number: int, value: bool) -> void

Based on `value`, enables or disables the specified layer in the `collision_mask`, given a `layer_number` between 1 and 32.

## Tutorials
- [Ray-casting]($DOCS_URL/tutorials/physics/ray-casting.html)
