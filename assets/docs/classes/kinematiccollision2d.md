# KinematicCollision2D

> class KinematicCollision2D
> inherits KinematicCollision2D RefCounted

## Brief

Holds collision data from the movement of a `PhysicsBody2D`.

## Description

Holds collision data from the movement of a `PhysicsBody2D`, usually from `PhysicsBody2D.move_and_collide`. When a `PhysicsBody2D` is moved, it stops if it detects a collision with another body. If a collision is detected, a `KinematicCollision2D` object is returned.
The collision data includes the colliding object, the remaining motion, and the collision position. This data can be used to determine a custom response to the collision.

## Methods

> method get_angle(up_direction: Vector2 = Vector2(0, -1)) -> float ; qualifiers=const

Returns the collision angle according to `up_direction`, which is `Vector2.UP` by default. This value is always positive.

> method get_collider() -> Object ; qualifiers=const

Returns the colliding body's attached `Object`.

> method get_collider_id() -> int ; qualifiers=const

Returns the unique instance ID of the colliding body's attached `Object`. See `Object.get_instance_id`.

> method get_collider_rid() -> RID ; qualifiers=const

Returns the colliding body's `RID` used by the `PhysicsServer2D`.

> method get_collider_shape() -> Object ; qualifiers=const

Returns the colliding body's shape.

> method get_collider_shape_index() -> int ; qualifiers=const

Returns the colliding body's shape index. See `CollisionObject2D`.

> method get_collider_velocity() -> Vector2 ; qualifiers=const

Returns the colliding body's velocity.

> method get_depth() -> float ; qualifiers=const

Returns the colliding body's length of overlap along the collision normal.

> method get_local_shape() -> Object ; qualifiers=const

Returns the moving object's colliding shape.

> method get_normal() -> Vector2 ; qualifiers=const

Returns the colliding body's shape's normal at the point of collision.

> method get_position() -> Vector2 ; qualifiers=const

Returns the point of collision in global coordinates.

> method get_remainder() -> Vector2 ; qualifiers=const

Returns the moving object's remaining movement vector.

> method get_travel() -> Vector2 ; qualifiers=const

Returns the moving object's travel before collision.
