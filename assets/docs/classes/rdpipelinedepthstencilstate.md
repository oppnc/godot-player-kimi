# RDPipelineDepthStencilState

> class RDPipelineDepthStencilState
> inherits RDPipelineDepthStencilState RefCounted

## Brief

Pipeline depth/stencil state (used by `RenderingDevice`).

## Description

`RDPipelineDepthStencilState` controls the way depth and stencil comparisons are performed when sampling those values using `RenderingDevice`.

## Properties

> property back_op_compare : RenderingDevice.CompareOperator ; default=7 ; setter=set_back_op_compare ; getter=get_back_op_compare

The method used for comparing the previous back stencil value and `back_op_reference`.

> property back_op_compare_mask : int ; default=0 ; setter=set_back_op_compare_mask ; getter=get_back_op_compare_mask

Selects which bits from the back stencil value will be compared.

> property back_op_depth_fail : RenderingDevice.StencilOperation ; default=1 ; setter=set_back_op_depth_fail ; getter=get_back_op_depth_fail

The operation to perform on the stencil buffer for back pixels that pass the stencil test but fail the depth test.

> property back_op_fail : RenderingDevice.StencilOperation ; default=1 ; setter=set_back_op_fail ; getter=get_back_op_fail

The operation to perform on the stencil buffer for back pixels that fail the stencil test.

> property back_op_pass : RenderingDevice.StencilOperation ; default=1 ; setter=set_back_op_pass ; getter=get_back_op_pass

The operation to perform on the stencil buffer for back pixels that pass the stencil test.

> property back_op_reference : int ; default=0 ; setter=set_back_op_reference ; getter=get_back_op_reference

The value the previous back stencil value will be compared to.

> property back_op_write_mask : int ; default=0 ; setter=set_back_op_write_mask ; getter=get_back_op_write_mask

Selects which bits from the back stencil value will be changed.

> property depth_compare_operator : RenderingDevice.CompareOperator ; default=7 ; setter=set_depth_compare_operator ; getter=get_depth_compare_operator

The method used for comparing the previous and current depth values.

> property depth_range_max : float ; default=0.0 ; setter=set_depth_range_max ; getter=get_depth_range_max

The maximum depth that returns `true` for `enable_depth_range`.

> property depth_range_min : float ; default=0.0 ; setter=set_depth_range_min ; getter=get_depth_range_min

The minimum depth that returns `true` for `enable_depth_range`.

> property enable_depth_range : bool ; default=false ; setter=set_enable_depth_range ; getter=get_enable_depth_range

If `true`, each depth value will be tested to see if it is between `depth_range_min` and `depth_range_max`. If it is outside of these values, it is discarded.

> property enable_depth_test : bool ; default=false ; setter=set_enable_depth_test ; getter=get_enable_depth_test

If `true`, enables depth testing which allows objects to be automatically occluded by other objects based on their depth. This also allows objects to be partially occluded by other objects. If `false`, objects will appear in the order they were drawn (like in Godot's 2D renderer).

> property enable_depth_write : bool ; default=false ; setter=set_enable_depth_write ; getter=get_enable_depth_write

If `true`, writes to the depth buffer whenever the depth test returns `true`. Only works when enable_depth_test is also `true`.

> property enable_stencil : bool ; default=false ; setter=set_enable_stencil ; getter=get_enable_stencil

If `true`, enables stencil testing. There are separate stencil buffers for front-facing triangles and back-facing triangles. See properties that begin with "front_op" and properties with "back_op" for each.

> property front_op_compare : RenderingDevice.CompareOperator ; default=7 ; setter=set_front_op_compare ; getter=get_front_op_compare

The method used for comparing the previous front stencil value and `front_op_reference`.

> property front_op_compare_mask : int ; default=0 ; setter=set_front_op_compare_mask ; getter=get_front_op_compare_mask

Selects which bits from the front stencil value will be compared.

> property front_op_depth_fail : RenderingDevice.StencilOperation ; default=1 ; setter=set_front_op_depth_fail ; getter=get_front_op_depth_fail

The operation to perform on the stencil buffer for front pixels that pass the stencil test but fail the depth test.

> property front_op_fail : RenderingDevice.StencilOperation ; default=1 ; setter=set_front_op_fail ; getter=get_front_op_fail

The operation to perform on the stencil buffer for front pixels that fail the stencil test.

> property front_op_pass : RenderingDevice.StencilOperation ; default=1 ; setter=set_front_op_pass ; getter=get_front_op_pass

The operation to perform on the stencil buffer for front pixels that pass the stencil test.

> property front_op_reference : int ; default=0 ; setter=set_front_op_reference ; getter=get_front_op_reference

The value the previous front stencil value will be compared to.

> property front_op_write_mask : int ; default=0 ; setter=set_front_op_write_mask ; getter=get_front_op_write_mask

Selects which bits from the front stencil value will be changed.
