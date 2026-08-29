# RDPipelineShader

> class RDPipelineShader ; experimental=This class may be changed or removed in future versions.
> inherits RDPipelineShader RefCounted

## Brief

Pipeline shader (used by `RenderingDevice`).

## Description

Wraps a shader resource and allows specialization constants to be applied at pipeline creation time.
Used by `RenderingDevice.raytracing_pipeline_create` for ray generation, miss, and hit shaders. The pipeline selects the required shader stage automatically.

## Properties

> property shader : RID ; default=RID() ; setter=set_shader ; getter=get_shader

Shader resource. The required stage is selected by the pipeline.

> property specialization_constants : Array[RDPipelineSpecializationConstant] ; default=[] ; setter=set_specialization_constants ; getter=get_specialization_constants

Specialization constants applied to the selected shader stage at pipeline creation time.
