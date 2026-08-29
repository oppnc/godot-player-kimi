# PhysicsPointQueryParameters2D

> class PhysicsPointQueryParameters2D
> inherits PhysicsPointQueryParameters2D RefCounted

## Brief

Provides parameters for `PhysicsDirectSpaceState2D.intersect_point`.

## Description

By changing various properties of this object, such as the point position, you can configure the parameters for `PhysicsDirectSpaceState2D.intersect_point`.

## Properties

> property canvas_instance_id : int ; default=0 ; setter=set_canvas_instance_id ; getter=get_canvas_instance_id

If different from `0`, restricts the query to a specific canvas layer specified by its instance ID. See `Object.get_instance_id`.
If `0`, restricts the query to the Viewport's default canvas layer.

> property collide_with_areas : bool ; default=false ; setter=set_collide_with_areas ; getter=is_collide_with_areas_enabled

If `true`, the query will take `Area2D`s into account.

> property collide_with_bodies : bool ; default=true ; setter=set_collide_with_bodies ; getter=is_collide_with_bodies_enabled

If `true`, the query will take `PhysicsBody2D`s into account.

> property collision_mask : int ; default=4294967295 ; setter=set_collision_mask ; getter=get_collision_mask

The physics layers the query will detect (as a bitmask). By default, all collision layers are detected. See [Collision layers and masks]($DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks) in the documentation for more information.

> property exclude : Array[RID] ; default=[] ; setter=set_exclude ; getter=get_exclude

The list of object `RID`s that will be excluded from collisions. Use `CollisionObject2D.get_rid` to get the `RID` associated with a `CollisionObject2D`-derived node.
**Note:** The returned array is copied and any changes to it will not update the original property value. To update the value you need to modify the returned array, and then assign it to the property again.

> property position : Vector2 ; default=Vector2(0, 0) ; setter=set_position ; getter=get_position

The position being queried for, in global coordinates.
