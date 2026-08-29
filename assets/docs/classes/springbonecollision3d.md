# SpringBoneCollision3D

> class SpringBoneCollision3D
> inherits SpringBoneCollision3D Node3D

## Brief

A base class of the collision that interacts with `SpringBoneSimulator3D`.

## Description

A collision can be a child of `SpringBoneSimulator3D`. If it is not a child of `SpringBoneSimulator3D`, it has no effect.
The colliding and sliding are done in the `SpringBoneSimulator3D`'s modification process in order of its collision list which is set by `SpringBoneSimulator3D.set_collision_path`. If `SpringBoneSimulator3D.are_all_child_collisions_enabled` is `true`, the order matches `SceneTree`.
If `bone` is set, it synchronizes with the bone pose of the ancestor `Skeleton3D`, which is done in before the `SpringBoneSimulator3D`'s modification process as the pre-process.
**Warning:** A scaled `SpringBoneCollision3D` will likely not behave as expected. Make sure that the parent `Skeleton3D` and its bones are not scaled.

## Properties

> property bone : int ; default=-1 ; setter=set_bone ; getter=get_bone

The index of the attached bone.

> property bone_name : String ; default="" ; setter=set_bone_name ; getter=get_bone_name

The name of the attached bone.

> property position_offset : Vector3 ; setter=set_position_offset ; getter=get_position_offset

The offset of the position from `Skeleton3D`'s `bone` pose position.

> property rotation_offset : Quaternion ; setter=set_rotation_offset ; getter=get_rotation_offset

The offset of the rotation from `Skeleton3D`'s `bone` pose rotation.

## Methods

> method get_skeleton() -> Skeleton3D ; qualifiers=const

Get parent `Skeleton3D` node of the parent `SpringBoneSimulator3D` if found.
