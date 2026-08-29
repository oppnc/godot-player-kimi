# PhysicsTestMotionResult2D

> class PhysicsTestMotionResult2D
> inherits PhysicsTestMotionResult2D RefCounted

## Brief

Describes the motion and collision result from `PhysicsServer2D.body_test_motion`.

## Description

Describes the motion and collision result from `PhysicsServer2D.body_test_motion`.

## Methods

> method get_collider() -> Object ; qualifiers=const

Returns the colliding body's attached `Object`, if a collision occurred.

> method get_collider_id() -> int ; qualifiers=const

Returns the unique instance ID of the colliding body's attached `Object`, if a collision occurred. See `Object.get_instance_id`.

> method get_collider_rid() -> RID ; qualifiers=const

Returns the colliding body's `RID` used by the `PhysicsServer2D`, if a collision occurred.

> method get_collider_shape() -> int ; qualifiers=const

Returns the colliding body's shape index, if a collision occurred. See `CollisionObject2D`.

> method get_collider_velocity() -> Vector2 ; qualifiers=const

Returns the colliding body's velocity, if a collision occurred.

> method get_collision_depth() -> float ; qualifiers=const

Returns the length of overlap along the collision normal, if a collision occurred.

> method get_collision_local_shape() -> int ; qualifiers=const

Returns the moving object's colliding shape, if a collision occurred.

> method get_collision_normal() -> Vector2 ; qualifiers=const

Returns the colliding body's shape's normal at the point of collision, if a collision occurred.

> method get_collision_point() -> Vector2 ; qualifiers=const

Returns the point of collision in global coordinates, if a collision occurred.

> method get_collision_safe_fraction() -> float ; qualifiers=const

Returns the maximum fraction of the motion that can occur without a collision, between `0` and `1`.

> method get_collision_unsafe_fraction() -> float ; qualifiers=const

Returns the minimum fraction of the motion needed to collide, if a collision occurred, between `0` and `1`.

> method get_remainder() -> Vector2 ; qualifiers=const

Returns the moving object's remaining movement vector.

> method get_travel() -> Vector2 ; qualifiers=const

Returns the moving object's travel before collision.
