# CircleShape2D

> class CircleShape2D
> inherits CircleShape2D Shape2D

## Brief

A 2D circle shape used for physics collision.

## Description

A 2D circle shape, intended for use in physics. Usually used to provide a shape for a `CollisionShape2D`.
**Performance:** `CircleShape2D` is fast to check collisions against. It is faster than `RectangleShape2D` and `CapsuleShape2D`.

## Properties

> property radius : float ; default=10.0 ; setter=set_radius ; getter=get_radius

The circle's radius.
