# RDShaderSPIRV

> class RDShaderSPIRV
> inherits RDShaderSPIRV Resource

## Brief

SPIR-V intermediate representation as part of an `RDShaderFile` (used by `RenderingDevice`).

## Description

`RDShaderSPIRV` represents an `RDShaderFile`'s [SPIR-V](https://www.khronos.org/spir/) code for various shader stages, as well as possible compilation error messages. SPIR-V is a low-level intermediate shader representation. This intermediate representation is not used directly by GPUs for rendering, but it can be compiled into binary shaders that GPUs can understand. Unlike compiled shaders, SPIR-V is portable across GPU models and driver versions.
This object is used by `RenderingDevice`.

## Properties

> property bytecode_any_hit : PackedByteArray ; default=PackedByteArray() ; setter=set_stage_bytecode ; getter=get_stage_bytecode

The SPIR-V bytecode for the any hit shader stage.

> property bytecode_closest_hit : PackedByteArray ; default=PackedByteArray() ; setter=set_stage_bytecode ; getter=get_stage_bytecode

The SPIR-V bytecode for the closest hit shader stage.

> property bytecode_compute : PackedByteArray ; default=PackedByteArray() ; setter=set_stage_bytecode ; getter=get_stage_bytecode

The SPIR-V bytecode for the compute shader stage.

> property bytecode_fragment : PackedByteArray ; default=PackedByteArray() ; setter=set_stage_bytecode ; getter=get_stage_bytecode

The SPIR-V bytecode for the fragment shader stage.

> property bytecode_intersection : PackedByteArray ; default=PackedByteArray() ; setter=set_stage_bytecode ; getter=get_stage_bytecode

The SPIR-V bytecode for the intersection shader stage.

> property bytecode_miss : PackedByteArray ; default=PackedByteArray() ; setter=set_stage_bytecode ; getter=get_stage_bytecode

The SPIR-V bytecode for the miss shader stage.

> property bytecode_raygen : PackedByteArray ; default=PackedByteArray() ; setter=set_stage_bytecode ; getter=get_stage_bytecode

The SPIR-V bytecode for the ray generation shader stage.

> property bytecode_tesselation_control : PackedByteArray ; default=PackedByteArray() ; setter=set_stage_bytecode ; getter=get_stage_bytecode

The SPIR-V bytecode for the tessellation control shader stage.

> property bytecode_tesselation_evaluation : PackedByteArray ; default=PackedByteArray() ; setter=set_stage_bytecode ; getter=get_stage_bytecode

The SPIR-V bytecode for the tessellation evaluation shader stage.

> property bytecode_vertex : PackedByteArray ; default=PackedByteArray() ; setter=set_stage_bytecode ; getter=get_stage_bytecode

The SPIR-V bytecode for the vertex shader stage.

> property compile_error_any_hit : String ; default="" ; setter=set_stage_compile_error ; getter=get_stage_compile_error

The compilation error message for the any hit shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.

> property compile_error_closest_hit : String ; default="" ; setter=set_stage_compile_error ; getter=get_stage_compile_error

The compilation error message for the closest hit shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.

> property compile_error_compute : String ; default="" ; setter=set_stage_compile_error ; getter=get_stage_compile_error

The compilation error message for the compute shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.

> property compile_error_fragment : String ; default="" ; setter=set_stage_compile_error ; getter=get_stage_compile_error

The compilation error message for the fragment shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.

> property compile_error_intersection : String ; default="" ; setter=set_stage_compile_error ; getter=get_stage_compile_error

The compilation error message for the intersection shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.

> property compile_error_miss : String ; default="" ; setter=set_stage_compile_error ; getter=get_stage_compile_error

The compilation error message for the miss shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.

> property compile_error_raygen : String ; default="" ; setter=set_stage_compile_error ; getter=get_stage_compile_error

The compilation error message for the ray generation shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.

> property compile_error_tesselation_control : String ; default="" ; setter=set_stage_compile_error ; getter=get_stage_compile_error

The compilation error message for the tessellation control shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.

> property compile_error_tesselation_evaluation : String ; default="" ; setter=set_stage_compile_error ; getter=get_stage_compile_error

The compilation error message for the tessellation evaluation shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.

> property compile_error_vertex : String ; default="" ; setter=set_stage_compile_error ; getter=get_stage_compile_error

The compilation error message for the vertex shader stage (set by the SPIR-V compiler and Godot). If empty, shader compilation was successful.

## Methods

> method get_stage_bytecode(stage: RenderingDevice.ShaderStage) -> PackedByteArray ; qualifiers=const

Equivalent to getting one of `bytecode_compute`, `bytecode_fragment`, `bytecode_tesselation_control`, `bytecode_tesselation_evaluation`, `bytecode_vertex`.

> method get_stage_compile_error(stage: RenderingDevice.ShaderStage) -> String ; qualifiers=const

Returns the compilation error message for the given shader `stage`. Equivalent to getting one of `compile_error_compute`, `compile_error_fragment`, `compile_error_tesselation_control`, `compile_error_tesselation_evaluation`, `compile_error_vertex`.

> method set_stage_bytecode(stage: RenderingDevice.ShaderStage, bytecode: PackedByteArray) -> void

Sets the SPIR-V `bytecode` for the given shader `stage`. Equivalent to setting one of `bytecode_compute`, `bytecode_fragment`, `bytecode_tesselation_control`, `bytecode_tesselation_evaluation`, `bytecode_vertex`.

> method set_stage_compile_error(stage: RenderingDevice.ShaderStage, compile_error: String) -> void

Sets the compilation error message for the given shader `stage` to `compile_error`. Equivalent to setting one of `compile_error_compute`, `compile_error_fragment`, `compile_error_tesselation_control`, `compile_error_tesselation_evaluation`, `compile_error_vertex`.
