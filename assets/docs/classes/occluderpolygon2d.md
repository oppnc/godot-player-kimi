# OccluderPolygon2D

> class OccluderPolygon2D
> inherits OccluderPolygon2D Resource

## Brief

Defines a 2D polygon for LightOccluder2D.

## Description

Editor facility that helps you draw a 2D polygon used as resource for `LightOccluder2D`.

## Properties

> property closed : bool ; default=true ; setter=set_closed ; getter=is_closed

If `true`, closes the polygon. A closed OccluderPolygon2D occludes the light coming from any direction. An opened OccluderPolygon2D occludes the light only at its outline's direction.

> property cull_mode : CullMode ; default=0 ; setter=set_cull_mode ; getter=get_cull_mode

The culling mode to use.

> property polygon : PackedVector2Array ; default=PackedVector2Array() ; setter=set_polygon ; getter=get_polygon

A `Vector2` array with the index for polygon's vertices positions.

## Enumerations

> enum CullMode

> enum_value CullMode.CULL_DISABLED = 0

Culling is disabled. See `cull_mode`.

> enum_value CullMode.CULL_CLOCKWISE = 1

Culling is performed in the clockwise direction. See `cull_mode`.

> enum_value CullMode.CULL_COUNTER_CLOCKWISE = 2

Culling is performed in the counterclockwise direction. See `cull_mode`.
