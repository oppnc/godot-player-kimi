# Path2D

> class Path2D
> inherits Path2D Node2D

## Brief

Contains a `Curve2D` path for `PathFollow2D` nodes to follow.

## Description

Can have `PathFollow2D` child nodes moving along the `Curve2D`. See `PathFollow2D` for more information on usage.
**Note:** The path is considered as relative to the moved nodes (children of `PathFollow2D`). As such, the curve should usually start with a zero vector (`(0, 0)`).

## Properties

> property curve : Curve2D ; setter=set_curve ; getter=get_curve

A `Curve2D` describing the path.
