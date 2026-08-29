# RDShaderFile

> class RDShaderFile
> inherits RDShaderFile Resource

## Brief

Compiled shader file in SPIR-V form (used by `RenderingDevice`). Not to be confused with Godot's own `Shader`.

## Description

Compiled shader file in SPIR-V form.
See also `RDShaderSource`. `RDShaderFile` is only meant to be used with the `RenderingDevice` API. It should not be confused with Godot's own `Shader` resource, which is what Godot's various nodes use for high-level shader programming.

## Properties

> property base_error : String ; default="" ; setter=set_base_error ; getter=get_base_error

The base compilation error message, which indicates errors not related to a specific shader stage if non-empty. If empty, shader compilation is not necessarily successful (check `RDShaderSPIRV`'s error message members).

## Methods

> method get_spirv(version: StringName = &"") -> RDShaderSPIRV ; qualifiers=const

Returns the SPIR-V intermediate representation for the specified shader `version`.

> method get_version_list() -> Array[StringName] ; qualifiers=const

Returns the list of compiled versions for this shader.

> method set_bytecode(bytecode: RDShaderSPIRV, version: StringName = &"") -> void

Sets the SPIR-V `bytecode` that will be compiled for the specified `version`.
