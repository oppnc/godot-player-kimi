# RDVertexAttribute

> class RDVertexAttribute
> inherits RDVertexAttribute RefCounted

## Brief

Vertex attribute (used by `RenderingDevice`).

## Description

This object is used by `RenderingDevice`.

## Properties

> property binding : int ; default=4294967295 ; setter=set_binding ; getter=get_binding

The index of the buffer in the vertex buffer array to bind this vertex attribute. When set to `-1`, it defaults to the index of the attribute.
**Note:** You cannot mix binding explicitly assigned attributes with implicitly assigned ones (i.e. `-1`). Either all attributes must have their binding set to `-1`, or all must have explicit bindings.

> property format : RenderingDevice.DataFormat ; default=232 ; setter=set_format ; getter=get_format

The way that this attribute's data is interpreted when sent to a shader.

> property frequency : RenderingDevice.VertexFrequency ; default=0 ; setter=set_frequency ; getter=get_frequency

The rate at which this attribute is pulled from its vertex buffer.

> property location : int ; default=0 ; setter=set_location ; getter=get_location

The location in the shader that this attribute is bound to.

> property offset : int ; default=0 ; setter=set_offset ; getter=get_offset

The number of bytes between the start of the vertex buffer and the first instance of this attribute.

> property stride : int ; default=0 ; setter=set_stride ; getter=get_stride

The number of bytes between the starts of consecutive instances of this attribute.
