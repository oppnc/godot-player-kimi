# KinematicCollision3D

> class KinematicCollision3D
> inherits KinematicCollision3D RefCounted

## Brief

Holds collision data from the movement of a `PhysicsBody3D`.

## Description

Holds collision data from the movement of a `PhysicsBody3D`, usually from `PhysicsBody3D.move_and_collide`. When a `PhysicsBody3D` is moved, it stops if it detects a collision with another body. If a collision is detected, a `KinematicCollision3D` object is returned.
The collision data includes the colliding object, the remaining motion, and the collision position. This data can be used to determine a custom response to the collision.

## Methods

> method get_angle(collision_index: int = 0, up_direction: Vector3 = Vector3(0, 1, 0)) -> float ; qualifiers=const

Returns the collision angle according to `up_direction`, which is `Vector3.UP` by default. This value is always positive.

> method get_collider(collision_index: int = 0) -> Object ; qualifiers=const

Returns the colliding body's attached `Object` given a collision index (the deepest collision by default).

> method get_collider_id(collision_index: int = 0) -> int ; qualifiers=const

Returns the unique instance ID of the colliding body's attached `Object` given a collision index (the deepest collision by default). See `Object.get_instance_id`.

> method get_collider_rid(collision_index: int = 0) -> RID ; qualifiers=const

Returns the colliding body's `RID` used by the `PhysicsServer3D` given a collision index (the deepest collision by default).

> method get_collider_shape(collision_index: int = 0) -> Object ; qualifiers=const

Returns the colliding body's shape given a collision index (the deepest collision by default).

> method get_collider_shape_index(collision_index: int = 0) -> int ; qualifiers=const

Returns the colliding body's shape index given a collision index (the deepest collision by default). See `CollisionObject3D`.

> method get_collider_velocity(collision_index: int = 0) -> Vector3 ; qualifiers=const

Returns the colliding body's velocity given a collision index (the deepest collision by default).

> method get_collision_count() -> int ; qualifiers=const

Returns the number of detected collisions.

> method get_depth() -> float ; qualifiers=const

Returns the colliding body's length of overlap along the collision normal.

> method get_local_shape(collision_index: int = 0) -> Object ; qualifiers=const

Returns the moving object's colliding shape given a collision index (the deepest collision by default).

> method get_normal(collision_index: int = 0) -> Vector3 ; qualifiers=const

Returns the colliding body's shape's normal at the point of collision given a collision index (the deepest collision by default).

> method get_position(collision_index: int = 0) -> Vector3 ; qualifiers=const

Returns the point of collision in global coordinates given a collision index (the deepest collision by default).

> method get_remainder() -> Vector3 ; qualifiers=const

Returns the moving object's remaining movement vector.

> method get_travel() -> Vector3 ; qualifiers=const

Returns the moving object's travel before collision.
