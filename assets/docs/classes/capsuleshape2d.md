# CapsuleShape2D

> class CapsuleShape2D
> inherits CapsuleShape2D Shape2D

## Brief

A 2D capsule shape used for physics collision.

## Description

A 2D capsule shape, intended for use in physics. Usually used to provide a shape for a `CollisionShape2D`.
**Performance:** `CapsuleShape2D` is fast to check collisions against, but it is slower than `RectangleShape2D` and `CircleShape2D`.

## Properties

> property height : float ; default=30.0 ; setter=set_height ; getter=get_height

The capsule's full height, including the semicircles.
**Note:** The `height` of a capsule must be at least twice its `radius`. Otherwise, the capsule becomes a circle. If the `height` is less than twice the `radius`, the properties adjust to a valid value.

> property mid_height : float ; setter=set_mid_height ; getter=get_mid_height

The capsule's height, excluding the semicircles. This is the height of the central rectangular part in the middle of the capsule, and is the distance between the centers of the two semicircles. This is a wrapper for `height`.

> property radius : float ; default=10.0 ; setter=set_radius ; getter=get_radius

The capsule's radius.
**Note:** The `radius` of a capsule cannot be greater than half of its `height`. Otherwise, the capsule becomes a circle. If the `radius` is greater than half of the `height`, the properties adjust to a valid value.
