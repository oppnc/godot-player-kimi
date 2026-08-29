# LightOccluder2D

> class LightOccluder2D
> inherits LightOccluder2D Node2D

## Brief

Occludes light cast by a Light2D, casting shadows.

## Description

Occludes light cast by a Light2D, casting shadows. The LightOccluder2D must be provided with an `OccluderPolygon2D` in order for the shadow to be computed.

## Properties

> property occluder : OccluderPolygon2D ; setter=set_occluder_polygon ; getter=get_occluder_polygon

The `OccluderPolygon2D` used to compute the shadow.

> property occluder_light_mask : int ; default=1 ; setter=set_occluder_light_mask ; getter=get_occluder_light_mask

The LightOccluder2D's occluder light mask. The LightOccluder2D will cast shadows only from Light2D(s) that have the same light mask(s).

> property sdf_collision : bool ; default=true ; setter=set_as_sdf_collision ; getter=is_set_as_sdf_collision

If enabled, the occluder will be part of a real-time generated signed distance field that can be used in custom shaders.

## Tutorials
- [2D lights and shadows]($DOCS_URL/tutorials/2d/2d_lights_and_shadows.html)
