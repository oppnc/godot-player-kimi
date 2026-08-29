# BoxShape3D

> class BoxShape3D
> inherits BoxShape3D Shape3D

## Brief

A 3D box shape used for physics collision.

## Description

A 3D box shape, intended for use in physics. Usually used to provide a shape for a `CollisionShape3D`.
**Performance:** `BoxShape3D` is fast to check collisions against. It is faster than `CapsuleShape3D` and `CylinderShape3D`, but slower than `SphereShape3D`.

## Properties

> property size : Vector3 ; default=Vector3(1, 1, 1) ; setter=set_size ; getter=get_size

The box's width, height and depth.

## Tutorials
- [3D Physics Tests Demo](https://godotengine.org/asset-library/asset/2747)
- [3D Kinematic Character Demo](https://godotengine.org/asset-library/asset/2739)
- [3D Platformer Demo](https://godotengine.org/asset-library/asset/2748)
