# SeparationRayShape2D

> class SeparationRayShape2D
> inherits SeparationRayShape2D Shape2D

## Brief

A 2D ray shape used for physics collision that tries to separate itself from any collider.

## Description

A 2D ray shape, intended for use in physics. Usually used to provide a shape for a `CollisionShape2D`. When a `SeparationRayShape2D` collides with an object, it tries to separate itself from it by moving its endpoint to the collision point. For example, a `SeparationRayShape2D` next to a character can allow it to instantly move up when touching stairs.

## Properties

> property length : float ; default=20.0 ; setter=set_length ; getter=get_length

The ray's length.

> property slide_on_slope : bool ; default=false ; setter=set_slide_on_slope ; getter=get_slide_on_slope

If `false` (default), the shape always separates and returns a normal along its own direction.
If `true`, the shape can return the correct normal and separate in any direction, allowing sliding motion on slopes.
