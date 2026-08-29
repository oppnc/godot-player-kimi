# SegmentShape2D

> class SegmentShape2D
> inherits SegmentShape2D Shape2D

## Brief

A 2D line segment shape used for physics collision.

## Description

A 2D line segment shape, intended for use in physics. Usually used to provide a shape for a `CollisionShape2D`.

## Properties

> property a : Vector2 ; default=Vector2(0, 0) ; setter=set_a ; getter=get_a

The segment's first point position.

> property b : Vector2 ; default=Vector2(0, 10) ; setter=set_b ; getter=get_b

The segment's second point position.
