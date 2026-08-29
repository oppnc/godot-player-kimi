# ShapeCast3D

> class ShapeCast3D
> inherits ShapeCast3D Node3D

## Brief

A 3D shape that sweeps a region of space to detect `CollisionObject3D`s.

## Description

Shape casting allows to detect collision objects by sweeping its `shape` along the cast direction determined by `target_position`. This is similar to `RayCast3D`, but it allows for sweeping a region of space, rather than just a straight line. `ShapeCast3D` can detect multiple collision objects. It is useful for things like wide laser beams or snapping a simple shape to a floor.
Immediate collision overlaps can be done with the `target_position` set to `Vector3(0, 0, 0)` and by calling `force_shapecast_update` within the same physics frame. This helps to overcome some limitations of `Area3D` when used as an instantaneous detection area, as collision information isn't immediately available to it.
**Note:** Shape casting is more computationally expensive than ray casting.

## Properties

> property collide_with_areas : bool ; default=false ; setter=set_collide_with_areas ; getter=is_collide_with_areas_enabled

If `true`, collisions with `Area3D`s will be reported.

> property collide_with_bodies : bool ; default=true ; setter=set_collide_with_bodies ; getter=is_collide_with_bodies_enabled

If `true`, collisions with `PhysicsBody3D`s will be reported.

> property collision_mask : int ; default=1 ; setter=set_collision_mask ; getter=get_collision_mask

The shape's collision mask. Only objects in at least one collision layer enabled in the mask will be detected. See [Collision layers and masks]($DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks) in the documentation for more information.

> property collision_result : Array ; default=[] ; getter=get_collision_result

Returns the complete collision information from the collision sweep. The data returned is the same as in the `PhysicsDirectSpaceState3D.get_rest_info` method.

> property debug_shape_custom_color : Color ; default=Color(0, 0, 0, 1) ; setter=set_debug_shape_custom_color ; getter=get_debug_shape_custom_color

The custom color to use to draw the shape in the editor and at run-time if **Visible Collision Shapes** is enabled in the **Debug** menu. This color will be highlighted at run-time if the `ShapeCast3D` is colliding with something.
If set to `Color(0.0, 0.0, 0.0)` (by default), the color set in `ProjectSettings.debug/shapes/collision/shape_color` is used.

> property enabled : bool ; default=true ; setter=set_enabled ; getter=is_enabled

If `true`, collisions will be reported.

> property exclude_parent : bool ; default=true ; setter=set_exclude_parent_body ; getter=get_exclude_parent_body

If `true`, the parent node will be excluded from collision detection.

> property margin : float ; default=0.0 ; setter=set_margin ; getter=get_margin

The collision margin for the shape. A larger margin helps detecting collisions more consistently, at the cost of precision.

> property max_results : int ; default=32 ; setter=set_max_results ; getter=get_max_results

The number of intersections can be limited with this parameter, to reduce the processing time.

> property shape : Shape3D ; setter=set_shape ; getter=get_shape

The shape to be used for collision queries.

> property target_position : Vector3 ; default=Vector3(0, -1, 0) ; setter=set_target_position ; getter=get_target_position

The shape's destination point, relative to this node's `Node3D.position`.

## Methods

> method add_exception(node: CollisionObject3D) -> void

Adds a collision exception so the shape does not report collisions with the specified node.

> method add_exception_rid(rid: RID) -> void

Adds a collision exception so the shape does not report collisions with the specified `RID`.

> method clear_exceptions() -> void

Removes all collision exceptions for this shape.

> method force_shapecast_update() -> void

Updates the collision information for the shape immediately, without waiting for the next `_physics_process` call. Use this method, for example, when the shape or its parent has changed state.
**Note:** Setting `enabled` to `true` is not required for this to work.

> method get_closest_collision_safe_fraction() -> float ; qualifiers=const

Returns the fraction from this cast's origin to its `target_position` of how far the shape can move without triggering a collision, as a value between `0.0` and `1.0`.

> method get_closest_collision_unsafe_fraction() -> float ; qualifiers=const

Returns the fraction from this cast's origin to its `target_position` of how far the shape must move to trigger a collision, as a value between `0.0` and `1.0`.
In ideal conditions this would be the same as `get_closest_collision_safe_fraction`, however shape casting is calculated in discrete steps, so the precise point of collision can occur between two calculated positions.

> method get_collider(index: int) -> Object ; qualifiers=const

Returns the collided `Object` of one of the multiple collisions at `index`, or `null` if no object is intersecting the shape (i.e. `is_colliding` returns `false`).

> method get_collider_rid(index: int) -> RID ; qualifiers=const

Returns the `RID` of the collided object of one of the multiple collisions at `index`.

> method get_collider_shape(index: int) -> int ; qualifiers=const

Returns the shape ID of the colliding shape of one of the multiple collisions at `index`, or `0` if no object is intersecting the shape (i.e. `is_colliding` returns `false`).

> method get_collision_count() -> int ; qualifiers=const

The number of collisions detected at the point of impact. Use this to iterate over multiple collisions as provided by `get_collider`, `get_collider_shape`, `get_collision_point`, and `get_collision_normal` methods.

> method get_collision_mask_value(layer_number: int) -> bool ; qualifiers=const

Returns whether or not the specified layer of the `collision_mask` is enabled, given a `layer_number` between 1 and 32.

> method get_collision_normal(index: int) -> Vector3 ; qualifiers=const

Returns the normal of one of the multiple collisions at `index` of the intersecting object.

> method get_collision_point(index: int) -> Vector3 ; qualifiers=const

Returns the collision point of one of the multiple collisions at `index` where the shape intersects the colliding object.
**Note:** This point is in the **global** coordinate system.

> method is_colliding() -> bool ; qualifiers=const

Returns whether any object is intersecting with the shape's vector (considering the vector length).

> method remove_exception(node: CollisionObject3D) -> void

Removes a collision exception so the shape does report collisions with the specified node.

> method remove_exception_rid(rid: RID) -> void

Removes a collision exception so the shape does report collisions with the specified `RID`.

> method resource_changed(resource: Resource) -> void ; deprecated=Use `Resource.changed` instead.

This method does nothing.

> method set_collision_mask_value(layer_number: int, value: bool) -> void

Based on `value`, enables or disables the specified layer in the `collision_mask`, given a `layer_number` between 1 and 32.
