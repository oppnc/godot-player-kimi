# PhysicsTestMotionParameters3D

> class PhysicsTestMotionParameters3D
> inherits PhysicsTestMotionParameters3D RefCounted

## Brief

Provides parameters for `PhysicsServer3D.body_test_motion`.

## Description

By changing various properties of this object, such as the motion, you can configure the parameters for `PhysicsServer3D.body_test_motion`.

## Properties

> property collide_separation_ray : bool ; default=false ; setter=set_collide_separation_ray_enabled ; getter=is_collide_separation_ray_enabled

If set to `true`, shapes of type `PhysicsServer3D.SHAPE_SEPARATION_RAY` are used to detect collisions and can stop the motion. Can be useful when snapping to the ground.
If set to `false`, shapes of type `PhysicsServer3D.SHAPE_SEPARATION_RAY` are only used for separation when overlapping with other bodies. That's the main use for separation ray shapes.

> property exclude_bodies : Array[RID] ; default=[] ; setter=set_exclude_bodies ; getter=get_exclude_bodies

Optional array of body `RID` to exclude from collision. Use `CollisionObject3D.get_rid` to get the `RID` associated with a `CollisionObject3D`-derived node.

> property exclude_objects : Array[int] ; default=[] ; setter=set_exclude_objects ; getter=get_exclude_objects

Optional array of object unique instance ID to exclude from collision. See `Object.get_instance_id`.

> property from : Transform3D ; default=Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0) ; setter=set_from ; getter=get_from

Transform in global space where the motion should start. Usually set to `Node3D.global_transform` for the current body's transform.

> property margin : float ; default=0.001 ; setter=set_margin ; getter=get_margin

Increases the size of the shapes involved in the collision detection.

> property max_collisions : int ; default=1 ; setter=set_max_collisions ; getter=get_max_collisions

Maximum number of returned collisions, between `1` and `32`. Always returns the deepest detected collisions.

> property motion : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_motion ; getter=get_motion

Motion vector to define the length and direction of the motion to test.

> property recovery_as_collision : bool ; default=false ; setter=set_recovery_as_collision_enabled ; getter=is_recovery_as_collision_enabled

If set to `true`, any depenetration from the recovery phase is reported as a collision; this is used e.g. by `CharacterBody3D` for improving floor detection during floor snapping.
If set to `false`, only collisions resulting from the motion are reported, which is generally the desired behavior.
