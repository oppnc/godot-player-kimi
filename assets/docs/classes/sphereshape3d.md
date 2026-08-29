# SphereShape3D

> class SphereShape3D
> inherits SphereShape3D Shape3D

## Brief

A 3D sphere shape used for physics collision.

## Description

A 3D sphere shape, intended for use in physics. Usually used to provide a shape for a `CollisionShape3D`.
**Performance:** `SphereShape3D` is fast to check collisions against. It is faster than `BoxShape3D`, `CapsuleShape3D`, and `CylinderShape3D`.

## Properties

> property radius : float ; default=0.5 ; setter=set_radius ; getter=get_radius

The sphere's radius. The shape's diameter is double the radius.

## Tutorials
- [3D Physics Tests Demo](https://godotengine.org/asset-library/asset/2747)
