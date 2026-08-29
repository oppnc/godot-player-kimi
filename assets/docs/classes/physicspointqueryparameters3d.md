# PhysicsPointQueryParameters3D

> class PhysicsPointQueryParameters3D
> inherits PhysicsPointQueryParameters3D RefCounted

## Brief

Provides parameters for `PhysicsDirectSpaceState3D.intersect_point`.

## Description

By changing various properties of this object, such as the point position, you can configure the parameters for `PhysicsDirectSpaceState3D.intersect_point`.

## Properties

> property collide_with_areas : bool ; default=false ; setter=set_collide_with_areas ; getter=is_collide_with_areas_enabled

If `true`, the query will take `Area3D`s into account.

> property collide_with_bodies : bool ; default=true ; setter=set_collide_with_bodies ; getter=is_collide_with_bodies_enabled

If `true`, the query will take `PhysicsBody3D`s into account.

> property collision_mask : int ; default=4294967295 ; setter=set_collision_mask ; getter=get_collision_mask

The physics layers the query will detect (as a bitmask). By default, all collision layers are detected. See [Collision layers and masks]($DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks) in the documentation for more information.

> property exclude : Array[RID] ; default=[] ; setter=set_exclude ; getter=get_exclude

The list of object `RID`s that will be excluded from collisions. Use `CollisionObject3D.get_rid` to get the `RID` associated with a `CollisionObject3D`-derived node.
**Note:** The returned array is copied and any changes to it will not update the original property value. To update the value you need to modify the returned array, and then assign it to the property again.

> property position : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_position ; getter=get_position

The position being queried for, in global coordinates.
