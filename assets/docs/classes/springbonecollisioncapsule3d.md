# SpringBoneCollisionCapsule3D

> class SpringBoneCollisionCapsule3D
> inherits SpringBoneCollisionCapsule3D SpringBoneCollision3D

## Brief

A capsule shape collision that interacts with `SpringBoneSimulator3D`.

## Description

A capsule shape collision that interacts with `SpringBoneSimulator3D`.

## Properties

> property height : float ; default=0.5 ; setter=set_height ; getter=get_height

The capsule's full height, including the hemispheres.
**Note:** The `height` of a capsule must be at least twice its `radius`. Otherwise, the capsule becomes a sphere. If the `height` is less than twice the `radius`, the properties adjust to a valid value.

> property inside : bool ; default=false ; setter=set_inside ; getter=is_inside

If `true`, the collision acts to trap the joint within the collision.

> property mid_height : float ; setter=set_mid_height ; getter=get_mid_height

The capsule's height, excluding the hemispheres. This is the height of the central cylindrical part in the middle of the capsule, and is the distance between the centers of the two hemispheres. This is a wrapper for `height`.

> property radius : float ; default=0.1 ; setter=set_radius ; getter=get_radius

The capsule's radius.
**Note:** The `radius` of a capsule cannot be greater than half of its `height`. Otherwise, the capsule becomes a sphere. If the `radius` is greater than half of the `height`, the properties adjust to a valid value.
