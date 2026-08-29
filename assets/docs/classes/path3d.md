# Path3D

> class Path3D
> inherits Path3D Node3D

## Brief

Contains a `Curve3D` path for `PathFollow3D` nodes to follow.

## Description

Can have `PathFollow3D` child nodes moving along the `Curve3D`. See `PathFollow3D` for more information on the usage.
Note that the path is considered as relative to the moved nodes (children of `PathFollow3D`). As such, the curve should usually start with a zero vector `(0, 0, 0)`.

## Properties

> property curve : Curve3D ; setter=set_curve ; getter=get_curve

A `Curve3D` describing the path.

> property debug_custom_color : Color ; default=Color(0, 0, 0, 1) ; setter=set_debug_custom_color ; getter=get_debug_custom_color

The custom color used to draw the path in the editor. If set to `Color.BLACK` (as by default), the color set in `ProjectSettings.debug/shapes/paths/geometry_color` is used.

## Signals

> signal curve_changed()

Emitted when the `curve` changes.

> signal debug_color_changed()

Emitted when the `debug_custom_color` changes.
