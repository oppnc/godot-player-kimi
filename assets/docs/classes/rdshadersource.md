# RDShaderSource

> class RDShaderSource
> inherits RDShaderSource RefCounted

## Brief

Shader source code (used by `RenderingDevice`).

## Description

Shader source code in text form.
See also `RDShaderFile`. `RDShaderSource` is only meant to be used with the `RenderingDevice` API. It should not be confused with Godot's own `Shader` resource, which is what Godot's various nodes use for high-level shader programming.

## Properties

> property language : RenderingDevice.ShaderLanguage ; default=0 ; setter=set_language ; getter=get_language

The language the shader is written in.

> property source_any_hit : String ; default="" ; setter=set_stage_source ; getter=get_stage_source

Source code for the shader's any hit stage.

> property source_closest_hit : String ; default="" ; setter=set_stage_source ; getter=get_stage_source

Source code for the shader's closest hit stage.

> property source_compute : String ; default="" ; setter=set_stage_source ; getter=get_stage_source

Source code for the shader's compute stage.

> property source_fragment : String ; default="" ; setter=set_stage_source ; getter=get_stage_source

Source code for the shader's fragment stage.

> property source_intersection : String ; default="" ; setter=set_stage_source ; getter=get_stage_source

Source code for the shader's intersection stage.

> property source_miss : String ; default="" ; setter=set_stage_source ; getter=get_stage_source

Source code for the shader's miss stage.

> property source_raygen : String ; default="" ; setter=set_stage_source ; getter=get_stage_source

Source code for the shader's ray generation stage.

> property source_tesselation_control : String ; default="" ; setter=set_stage_source ; getter=get_stage_source

Source code for the shader's tessellation control stage.

> property source_tesselation_evaluation : String ; default="" ; setter=set_stage_source ; getter=get_stage_source

Source code for the shader's tessellation evaluation stage.

> property source_vertex : String ; default="" ; setter=set_stage_source ; getter=get_stage_source

Source code for the shader's vertex stage.

## Methods

> method get_stage_source(stage: RenderingDevice.ShaderStage) -> String ; qualifiers=const

Returns source code for the specified shader `stage`. Equivalent to getting one of `source_compute`, `source_fragment`, `source_tesselation_control`, `source_tesselation_evaluation` or `source_vertex`.

> method set_stage_source(stage: RenderingDevice.ShaderStage, source: String) -> void

Sets `source` code for the specified shader `stage`. Equivalent to setting one of `source_compute`, `source_fragment`, `source_tesselation_control`, `source_tesselation_evaluation` or `source_vertex`.
**Note:** If you set the compute shader source code using this method directly, remember to remove the Godot-specific hint `#[compute]`.
