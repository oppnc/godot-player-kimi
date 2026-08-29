# CylinderShape3D

> class CylinderShape3D
> inherits CylinderShape3D Shape3D

## Brief

A 3D cylinder shape used for physics collision.

## Description

A 3D cylinder shape, intended for use in physics. Usually used to provide a shape for a `CollisionShape3D`.
**Note:** There are several known bugs with cylinder collision shapes. Using `CapsuleShape3D` or `BoxShape3D` instead is recommended.
**Performance:** `CylinderShape3D` is fast to check collisions against, but it is slower than `CapsuleShape3D`, `BoxShape3D`, and `SphereShape3D`.

## Properties

> property height : float ; default=2.0 ; setter=set_height ; getter=get_height

The cylinder's height.

> property radius : float ; default=0.5 ; setter=set_radius ; getter=get_radius

The cylinder's radius.

## Tutorials
- [Third Person Shooter (TPS) Demo](https://godotengine.org/asset-library/asset/2710)
- [3D Physics Tests Demo](https://godotengine.org/asset-library/asset/2747)
- [3D Voxel Demo](https://godotengine.org/asset-library/asset/2755)
