# Line2D

> class Line2D
> inherits Line2D Node2D

## Brief

A 2D polyline that can optionally be textured.

## Description

This node draws a 2D polyline, i.e. a shape consisting of several points connected by segments. `Line2D` is not a mathematical polyline, i.e. the segments are not infinitely thin. It is intended for rendering and it can be colored and optionally textured.
**Warning:** Certain configurations may be impossible to draw nicely, such as very sharp angles. In these situations, the node uses fallback drawing logic to look decent.
**Note:** `Line2D` is drawn using a 2D mesh.

## Properties

> property antialiased : bool ; default=false ; setter=set_antialiased ; getter=get_antialiased

If `true`, the polyline's border will be anti-aliased.
**Note:** `Line2D` is not accelerated by batching when being anti-aliased.

> property begin_cap_mode : LineCapMode ; default=0 ; setter=set_begin_cap_mode ; getter=get_begin_cap_mode

The style of the beginning of the polyline, if `closed` is `false`.

> property closed : bool ; default=false ; setter=set_closed ; getter=is_closed

If `true` and the polyline has more than 2 points, the last point and the first one will be connected by a segment.
**Note:** The shape of the closing segment is not guaranteed to be seamless if a `width_curve` is provided.
**Note:** The joint between the closing segment and the first segment is drawn first and it samples the `gradient` and the `width_curve` at the beginning. This is an implementation detail that might change in a future version.

> property default_color : Color ; default=Color(1, 1, 1, 1) ; setter=set_default_color ; getter=get_default_color

The color of the polyline. Will not be used if a gradient is set.

> property end_cap_mode : LineCapMode ; default=0 ; setter=set_end_cap_mode ; getter=get_end_cap_mode

The style of the end of the polyline, if `closed` is `false`.

> property gradient : Gradient ; setter=set_gradient ; getter=get_gradient

The gradient is drawn through the whole line from start to finish. The `default_color` will not be used if this property is set.

> property joint_mode : LineJointMode ; default=0 ; setter=set_joint_mode ; getter=get_joint_mode

The style of the connections between segments of the polyline.

> property points : PackedVector2Array ; default=PackedVector2Array() ; setter=set_points ; getter=get_points

The points of the polyline, interpreted in local 2D coordinates. Segments are drawn between the adjacent points in this array.

> property round_precision : int ; default=8 ; setter=set_round_precision ; getter=get_round_precision

The smoothness used for rounded joints and caps. Higher values result in smoother corners, but are more demanding to render and update.

> property sharp_limit : float ; default=2.0 ; setter=set_sharp_limit ; getter=get_sharp_limit

Determines the miter limit of the polyline. Normally, when `joint_mode` is set to `LINE_JOINT_SHARP`, sharp angles fall back to using the logic of `LINE_JOINT_BEVEL` joints to prevent very long miters. Higher values of this property mean that the fallback to a bevel joint will happen at sharper angles.

> property texture : Texture2D ; setter=set_texture ; getter=get_texture

The texture used for the polyline. Uses `texture_mode` for drawing style.

> property texture_mode : LineTextureMode ; default=0 ; setter=set_texture_mode ; getter=get_texture_mode

The style to render the `texture` of the polyline.

> property width : float ; default=10.0 ; setter=set_width ; getter=get_width

The polyline's width.

> property width_curve : Curve ; setter=set_curve ; getter=get_curve

The polyline's width curve. The width of the polyline over its length will be equivalent to the value of the width curve over its domain. The width curve should be a unit `Curve`.

## Methods

> method add_point(position: Vector2, index: int = -1) -> void

Adds a point with the specified `position` relative to the polyline's own position. If no `index` is provided, the new point will be added to the end of the points array.
If `index` is given, the new point is inserted before the existing point identified by index `index`. The indices of the points after the new point get increased by 1. The provided `index` must not exceed the number of existing points in the polyline. See `get_point_count`.

> method clear_points() -> void

Removes all points from the polyline, making it empty.

> method get_point_count() -> int ; qualifiers=const

Returns the number of points in the polyline.

> method get_point_position(index: int) -> Vector2 ; qualifiers=const

Returns the position of the point at index `index`.

> method remove_point(index: int) -> void

Removes the point at index `index` from the polyline.

> method set_point_position(index: int, position: Vector2) -> void

Overwrites the position of the point at the given `index` with the supplied `position`.

## Enumerations

> enum LineCapMode

> enum_value LineCapMode.LINE_CAP_NONE = 0

Draws no line cap.

> enum_value LineCapMode.LINE_CAP_BOX = 1

Draws the line cap as a box, slightly extending the first/last segment.

> enum_value LineCapMode.LINE_CAP_ROUND = 2

Draws the line cap as a semicircle attached to the first/last segment.

> enum LineJointMode

> enum_value LineJointMode.LINE_JOINT_SHARP = 0

Makes the polyline's joints pointy, connecting the sides of the two segments by extending them until they intersect. If the rotation of a joint is too big (based on `sharp_limit`), the joint falls back to `LINE_JOINT_BEVEL` to prevent very long miters.

> enum_value LineJointMode.LINE_JOINT_BEVEL = 1

Makes the polyline's joints bevelled/chamfered, connecting the sides of the two segments with a simple line.

> enum_value LineJointMode.LINE_JOINT_ROUND = 2

Makes the polyline's joints rounded, connecting the sides of the two segments with an arc. The detail of this arc depends on `round_precision`.

> enum LineTextureMode

> enum_value LineTextureMode.LINE_TEXTURE_NONE = 0

Takes the left pixels of the texture and renders them over the whole polyline.

> enum_value LineTextureMode.LINE_TEXTURE_TILE = 1

Tiles the texture over the polyline. `CanvasItem.texture_repeat` of the `Line2D` node must be `CanvasItem.TEXTURE_REPEAT_ENABLED` or `CanvasItem.TEXTURE_REPEAT_MIRROR` for it to work properly.

> enum_value LineTextureMode.LINE_TEXTURE_STRETCH = 2

Stretches the texture across the polyline. `CanvasItem.texture_repeat` of the `Line2D` node must be `CanvasItem.TEXTURE_REPEAT_DISABLED` for best results.

## Tutorials
- [Matrix Transform Demo](https://godotengine.org/asset-library/asset/2787)
- [2.5D Game Demo](https://godotengine.org/asset-library/asset/2783)
