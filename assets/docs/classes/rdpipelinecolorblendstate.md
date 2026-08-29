# RDPipelineColorBlendState

> class RDPipelineColorBlendState
> inherits RDPipelineColorBlendState RefCounted

## Brief

Pipeline color blend state (used by `RenderingDevice`).

## Description

This object is used by `RenderingDevice`.

## Properties

> property attachments : Array[RDPipelineColorBlendStateAttachment] ; default=[] ; setter=set_attachments ; getter=get_attachments

The attachments that are blended together.

> property blend_constant : Color ; default=Color(0, 0, 0, 1) ; setter=set_blend_constant ; getter=get_blend_constant

The constant color to blend with. See also `RenderingDevice.draw_list_set_blend_constants`.

> property enable_logic_op : bool ; default=false ; setter=set_enable_logic_op ; getter=get_enable_logic_op

If `true`, performs the logic operation defined in `logic_op`.

> property logic_op : RenderingDevice.LogicOperation ; default=0 ; setter=set_logic_op ; getter=get_logic_op

The logic operation to perform for blending. Only effective if `enable_logic_op` is `true`.
