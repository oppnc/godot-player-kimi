# RDUniform

> class RDUniform
> inherits RDUniform RefCounted

## Brief

Shader uniform (used by `RenderingDevice`).

## Description

This object is used by `RenderingDevice`.

## Properties

> property binding : int ; default=0 ; setter=set_binding ; getter=get_binding

The uniform's binding.

> property uniform_type : RenderingDevice.UniformType ; default=3 ; setter=set_uniform_type ; getter=get_uniform_type

The uniform's data type.

## Methods

> method add_id(id: RID) -> void

Binds the given id to the uniform. The data associated with the id is then used when the uniform is passed to a shader.

> method clear_ids() -> void

Unbinds all ids currently bound to the uniform.

> method get_ids() -> Array[RID] ; qualifiers=const

Returns an array of all ids currently bound to the uniform.
