# PhysicsRayQueryParameters3D

> class PhysicsRayQueryParameters3D
> inherits PhysicsRayQueryParameters3D RefCounted

## Brief

Provides parameters for `PhysicsDirectSpaceState3D.intersect_ray`.

## Description

By changing various properties of this object, such as the ray position, you can configure the parameters for `PhysicsDirectSpaceState3D.intersect_ray`.

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

> property from : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_from ; getter=get_from

The starting point of the ray being queried for, in global coordinates.

> property hit_back_faces : bool ; default=true ; setter=set_hit_back_faces ; getter=is_hit_back_faces_enabled

If `true`, the query will hit back faces with concave polygon shapes with back face enabled or heightmap shapes.

> property hit_from_inside : bool ; default=false ; setter=set_hit_from_inside ; getter=is_hit_from_inside_enabled

If `true`, the query will detect a hit when starting inside shapes. In this case the collision normal will be `Vector3(0, 0, 0)`. Does not affect concave polygon shapes or heightmap shapes.

> property to : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_to ; getter=get_to

The ending point of the ray being queried for, in global coordinates.

## Methods

> method create(from: Vector3, to: Vector3, collision_mask: int = 4294967295, exclude: Array[RID] = []) -> PhysicsRayQueryParameters3D ; qualifiers=static

Returns a new, pre-configured `PhysicsRayQueryParameters3D` object. Use it to quickly create query parameters using the most common options.

```text
                var query = PhysicsRayQueryParameters3D.create(position, position + Vector3(0, -10, 0))
                var collision = get_world_3d().direct_space_state.intersect_ray(query)

```
