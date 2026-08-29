# RDHitGroup

> class RDHitGroup ; experimental=This class may be changed or removed in future versions.
> inherits RDHitGroup RefCounted

## Brief

Hit group (used by `RenderingDevice`).

## Description

Defines a hit group for use with `RenderingDevice.raytracing_pipeline_create`.
A hit group combines shaders that are executed when a ray intersects geometry. It may include a closest-hit shader, any-hit shader, and intersection shader.
Hit groups are referenced by index when populating hit shader binding tables using `RenderingDevice.hit_sbt_range_update`.

## Properties

> property any_hit_shader : RDPipelineShader ; setter=set_any_hit_shader ; getter=get_any_hit_shader

Any-hit shader for this hit group. Executed for each potential intersection. Can be `null`.

> property closest_hit_shader : RDPipelineShader ; setter=set_closest_hit_shader ; getter=get_closest_hit_shader

Closest-hit shader for this hit group. Executed for the closest intersection. Can be `null`.

> property intersection_shader : RDPipelineShader ; setter=set_intersection_shader ; getter=get_intersection_shader

Intersection shader for this hit group. Required for non-triangle geometry. Must be `null` when using for triangle geometry.
