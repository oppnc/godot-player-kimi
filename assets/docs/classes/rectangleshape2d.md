# RectangleShape2D

> class RectangleShape2D
> inherits RectangleShape2D Shape2D

## Brief

A 2D rectangle shape used for physics collision.

## Description

A 2D rectangle shape, intended for use in physics. Usually used to provide a shape for a `CollisionShape2D`.
**Performance:** `RectangleShape2D` is fast to check collisions against. It is faster than `CapsuleShape2D`, but slower than `CircleShape2D`.

## Properties

> property size : Vector2 ; default=Vector2(20, 20) ; setter=set_size ; getter=get_size

The rectangle's width and height.

## Tutorials
- [2D Pong Demo](https://godotengine.org/asset-library/asset/2728)
- [2D Kinematic Character Demo](https://godotengine.org/asset-library/asset/2719)
