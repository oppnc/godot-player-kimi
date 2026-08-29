# RDPipelineRasterizationState

> class RDPipelineRasterizationState
> inherits RDPipelineRasterizationState RefCounted

## Brief

Pipeline rasterization state (used by `RenderingDevice`).

## Description

This object is used by `RenderingDevice`.

## Properties

> property cull_mode : RenderingDevice.PolygonCullMode ; default=0 ; setter=set_cull_mode ; getter=get_cull_mode

The cull mode to use when drawing polygons, which determines whether front faces or backfaces are hidden.

> property depth_bias_clamp : float ; default=0.0 ; setter=set_depth_bias_clamp ; getter=get_depth_bias_clamp

A limit for how much each depth value can be offset. If negative, it serves as a minimum value, but if positive, it serves as a maximum value.

> property depth_bias_constant_factor : float ; default=0.0 ; setter=set_depth_bias_constant_factor ; getter=get_depth_bias_constant_factor

A constant offset added to each depth value. Applied after `depth_bias_slope_factor`.

> property depth_bias_enabled : bool ; default=false ; setter=set_depth_bias_enabled ; getter=get_depth_bias_enabled

If `true`, each generated depth value will by offset by some amount. The specific amount is generated per polygon based on the values of `depth_bias_slope_factor` and `depth_bias_constant_factor`.

> property depth_bias_slope_factor : float ; default=0.0 ; setter=set_depth_bias_slope_factor ; getter=get_depth_bias_slope_factor

A constant scale applied to the slope of each polygons' depth. Applied before `depth_bias_constant_factor`.

> property discard_primitives : bool ; default=false ; setter=set_discard_primitives ; getter=get_discard_primitives

If `true`, primitives are discarded immediately before the rasterization stage.

> property enable_depth_clamp : bool ; default=false ; setter=set_enable_depth_clamp ; getter=get_enable_depth_clamp

If `true`, clamps depth values according to the minimum and maximum depth of the associated viewport.

> property front_face : RenderingDevice.PolygonFrontFace ; default=0 ; setter=set_front_face ; getter=get_front_face

The winding order to use to determine which face of a triangle is considered its front face.

> property line_width : float ; default=1.0 ; setter=set_line_width ; getter=get_line_width

The line width to use when drawing lines (in pixels). Thick lines may not be supported on all hardware.

> property patch_control_points : int ; default=1 ; setter=set_patch_control_points ; getter=get_patch_control_points

The number of control points to use when drawing a patch with tessellation enabled. Higher values result in higher quality at the cost of performance.

> property wireframe : bool ; default=false ; setter=set_wireframe ; getter=get_wireframe

If `true`, performs wireframe rendering for triangles instead of flat or textured rendering.
