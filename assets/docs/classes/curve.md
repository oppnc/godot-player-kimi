# Curve

> class Curve
> inherits Curve Resource

## Brief

A mathematical curve.

## Description

This resource describes a mathematical curve by defining a set of points and tangents at each point. By default, it ranges between `0` and `1` on the X and Y axes, but these ranges can be changed.
Please note that many resources and nodes assume they are given *unit curves*. A unit curve is a curve whose domain (the X axis) is between `0` and `1`. Some examples of unit curve usage are `CPUParticles2D.angle_curve` and `Line2D.width_curve`.

## Properties

> property bake_resolution : int ; default=100 ; setter=set_bake_resolution ; getter=get_bake_resolution

The number of points to include in the baked (i.e. cached) curve data.

> property max_domain : float ; default=1.0 ; setter=set_max_domain ; getter=get_max_domain

The maximum domain (x-coordinate) that points can have.

> property max_value : float ; default=1.0 ; setter=set_max_value ; getter=get_max_value

The maximum value (y-coordinate) that points can have. Tangents can cause higher values between points.

> property min_domain : float ; default=0.0 ; setter=set_min_domain ; getter=get_min_domain

The minimum domain (x-coordinate) that points can have.

> property min_value : float ; default=0.0 ; setter=set_min_value ; getter=get_min_value

The minimum value (y-coordinate) that points can have. Tangents can cause lower values between points.

> property point_count : int ; default=0 ; setter=set_point_count ; getter=get_point_count

The number of points describing the curve.

> property point_{index}/left_mode : int ; default=0

The left `TangentMode` for the point at `index`.
**Note:** `index` is a value in the `0 .. point_count - 1` range.

> property point_{index}/left_tangent : float ; default=0.0

The left tangent angle (in degrees) for the point at `index`.
**Note:** `index` is a value in the `0 .. point_count - 1` range.

> property point_{index}/position : Vector2 ; default=Vector2(0, 0)

The position of the point at `index`.
**Note:** `index` is a value in the `0 .. point_count - 1` range.

> property point_{index}/right_mode : int ; default=0

The right `TangentMode` for the point at `index`.
**Note:** `index` is a value in the `0 .. point_count - 1` range.

> property point_{index}/right_tangent : float ; default=0.0

The right tangent angle (in degrees) for the point at `index`.
**Note:** `index` is a value in the `0 .. point_count - 1` range.

## Methods

> method add_point(position: Vector2, left_tangent: float = 0, right_tangent: float = 0, left_mode: TangentMode = 0, right_mode: TangentMode = 0) -> int

Adds a point to the curve. For each side, if the `*_mode` is `TANGENT_LINEAR`, the `*_tangent` angle (in degrees) uses the slope of the curve halfway to the adjacent point. Allows custom assignments to the `*_tangent` angle if `*_mode` is set to `TANGENT_FREE`.

> method bake() -> void

Recomputes the baked cache of points for the curve.

> method clean_dupes() -> void

Removes duplicate points, i.e. points that are less than 0.00001 units (engine epsilon value) away from their neighbor on the curve.

> method clear_points() -> void

Removes all points from the curve.

> method get_domain_range() -> float ; qualifiers=const

Returns the difference between `min_domain` and `max_domain`.

> method get_point_left_mode(index: int) -> TangentMode ; qualifiers=const

Returns the left `TangentMode` for the point at `index`.

> method get_point_left_tangent(index: int) -> float ; qualifiers=const

Returns the left tangent angle (in degrees) for the point at `index`.

> method get_point_position(index: int) -> Vector2 ; qualifiers=const

Returns the curve coordinates for the point at `index`.

> method get_point_right_mode(index: int) -> TangentMode ; qualifiers=const

Returns the right `TangentMode` for the point at `index`.

> method get_point_right_tangent(index: int) -> float ; qualifiers=const

Returns the right tangent angle (in degrees) for the point at `index`.

> method get_value_range() -> float ; qualifiers=const

Returns the difference between `min_value` and `max_value`.

> method remove_point(index: int) -> void

Removes the point at `index` from the curve.

> method sample(offset: float) -> float ; qualifiers=const

Returns the Y value for the point that would exist at the X position `offset` along the curve.

> method sample_baked(offset: float) -> float ; qualifiers=const

Returns the Y value for the point that would exist at the X position `offset` along the curve using the baked cache. Bakes the curve's points if not already baked.

> method set_point_left_mode(index: int, mode: TangentMode) -> void

Sets the left `TangentMode` for the point at `index` to `mode`.

> method set_point_left_tangent(index: int, tangent: float) -> void

Sets the left tangent angle for the point at `index` to `tangent`.

> method set_point_offset(index: int, offset: float) -> int

Assigns the horizontal position `offset` to the point at `index`.

> method set_point_right_mode(index: int, mode: TangentMode) -> void

Sets the right `TangentMode` for the point at `index` to `mode`.

> method set_point_right_tangent(index: int, tangent: float) -> void

Sets the right tangent angle for the point at `index` to `tangent`.

> method set_point_value(index: int, y: float) -> void

Assigns the vertical position `y` to the point at `index`.

## Signals

> signal domain_changed()

Emitted when `max_domain` or `min_domain` is changed.

> signal range_changed()

Emitted when `max_value` or `min_value` is changed.

## Enumerations

> enum TangentMode

> enum_value TangentMode.TANGENT_FREE = 0

The tangent on this side of the point is user-defined.

> enum_value TangentMode.TANGENT_LINEAR = 1

The curve calculates the tangent on this side of the point as the slope halfway towards the adjacent point.

> enum_value TangentMode.TANGENT_MODE_COUNT = 2

The total number of available tangent modes.
