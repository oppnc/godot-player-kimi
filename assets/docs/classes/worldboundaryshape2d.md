# WorldBoundaryShape2D

> class WorldBoundaryShape2D
> inherits WorldBoundaryShape2D Shape2D

## Brief

A 2D world boundary (half-plane) shape used for physics collision.

## Description

A 2D world boundary shape, intended for use in physics. `WorldBoundaryShape2D` works like an infinite straight line that forces all physics bodies to stay above it. The line's normal determines which direction is considered as "above" and in the editor, the smaller line over it represents this direction. It can for example be used for endless flat floors.

## Properties

> property distance : float ; default=0.0 ; setter=set_distance ; getter=get_distance

The distance from the origin to the line, expressed in terms of `normal` (according to its direction and magnitude). Actual absolute distance from the origin to the line can be calculated as `abs(distance) / normal.length()`.
In the scalar equation of the line `ax + by = d`, this is `d`, while the `(a, b)` coordinates are represented by the `normal` property.

> property normal : Vector2 ; default=Vector2(0, -1) ; setter=set_normal ; getter=get_normal

The line's normal, typically a unit vector. Its direction indicates the non-colliding half-plane. Can be of any length but zero. Defaults to `Vector2.UP`.
