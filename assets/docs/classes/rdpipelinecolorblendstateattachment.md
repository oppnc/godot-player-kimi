# RDPipelineColorBlendStateAttachment

> class RDPipelineColorBlendStateAttachment
> inherits RDPipelineColorBlendStateAttachment RefCounted

## Brief

Pipeline color blend state attachment (used by `RenderingDevice`).

## Description

Controls how blending between source and destination fragments is performed when using `RenderingDevice`.
For reference, this is how common user-facing blend modes are implemented in Godot's 2D renderer:
**Mix:**

```text
        var attachment = RDPipelineColorBlendStateAttachment.new()
        attachment.enable_blend = true
        attachment.color_blend_op = RenderingDevice.BLEND_OP_ADD
        attachment.src_color_blend_factor = RenderingDevice.BLEND_FACTOR_SRC_ALPHA
        attachment.dst_color_blend_factor = RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA
        attachment.alpha_blend_op = RenderingDevice.BLEND_OP_ADD
        attachment.src_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
        attachment.dst_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA

```

**Add:**

```text
        var attachment = RDPipelineColorBlendStateAttachment.new()
        attachment.enable_blend = true
        attachment.alpha_blend_op = RenderingDevice.BLEND_OP_ADD
        attachment.color_blend_op = RenderingDevice.BLEND_OP_ADD
        attachment.src_color_blend_factor = RenderingDevice.BLEND_FACTOR_SRC_ALPHA
        attachment.dst_color_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
        attachment.src_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_SRC_ALPHA
        attachment.dst_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE

```

**Subtract:**

```text
        var attachment = RDPipelineColorBlendStateAttachment.new()
        attachment.enable_blend = true
        attachment.alpha_blend_op = RenderingDevice.BLEND_OP_REVERSE_SUBTRACT
        attachment.color_blend_op = RenderingDevice.BLEND_OP_REVERSE_SUBTRACT
        attachment.src_color_blend_factor = RenderingDevice.BLEND_FACTOR_SRC_ALPHA
        attachment.dst_color_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
        attachment.src_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_SRC_ALPHA
        attachment.dst_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE

```

**Multiply:**

```text
        var attachment = RDPipelineColorBlendStateAttachment.new()
        attachment.enable_blend = true
        attachment.alpha_blend_op = RenderingDevice.BLEND_OP_ADD
        attachment.color_blend_op = RenderingDevice.BLEND_OP_ADD
        attachment.src_color_blend_factor = RenderingDevice.BLEND_FACTOR_DST_COLOR
        attachment.dst_color_blend_factor = RenderingDevice.BLEND_FACTOR_ZERO
        attachment.src_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_DST_ALPHA
        attachment.dst_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ZERO

```

**Pre-multiplied alpha:**

```text
        var attachment = RDPipelineColorBlendStateAttachment.new()
        attachment.enable_blend = true
        attachment.alpha_blend_op = RenderingDevice.BLEND_OP_ADD
        attachment.color_blend_op = RenderingDevice.BLEND_OP_ADD
        attachment.src_color_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
        attachment.dst_color_blend_factor = RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA
        attachment.src_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE
        attachment.dst_alpha_blend_factor = RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA

```

## Properties

> property alpha_blend_op : RenderingDevice.BlendOperation ; default=0 ; setter=set_alpha_blend_op ; getter=get_alpha_blend_op

The blend mode to use for the alpha channel.

> property color_blend_op : RenderingDevice.BlendOperation ; default=0 ; setter=set_color_blend_op ; getter=get_color_blend_op

The blend mode to use for the red/green/blue color channels.

> property dst_alpha_blend_factor : RenderingDevice.BlendFactor ; default=0 ; setter=set_dst_alpha_blend_factor ; getter=get_dst_alpha_blend_factor

Controls how the blend factor for the alpha channel is determined based on the destination's fragments.

> property dst_color_blend_factor : RenderingDevice.BlendFactor ; default=0 ; setter=set_dst_color_blend_factor ; getter=get_dst_color_blend_factor

Controls how the blend factor for the color channels is determined based on the destination's fragments.

> property enable_blend : bool ; default=false ; setter=set_enable_blend ; getter=get_enable_blend

If `true`, performs blending between the source and destination according to the factors defined in `src_color_blend_factor`, `dst_color_blend_factor`, `src_alpha_blend_factor` and `dst_alpha_blend_factor`. The blend modes `color_blend_op` and `alpha_blend_op` are also taken into account, with `write_r`, `write_g`, `write_b` and `write_a` controlling the output.

> property src_alpha_blend_factor : RenderingDevice.BlendFactor ; default=0 ; setter=set_src_alpha_blend_factor ; getter=get_src_alpha_blend_factor

Controls how the blend factor for the alpha channel is determined based on the source's fragments.

> property src_color_blend_factor : RenderingDevice.BlendFactor ; default=0 ; setter=set_src_color_blend_factor ; getter=get_src_color_blend_factor

Controls how the blend factor for the color channels is determined based on the source's fragments.

> property write_a : bool ; default=true ; setter=set_write_a ; getter=get_write_a

If `true`, writes the new alpha channel to the final result.

> property write_b : bool ; default=true ; setter=set_write_b ; getter=get_write_b

If `true`, writes the new blue color channel to the final result.

> property write_g : bool ; default=true ; setter=set_write_g ; getter=get_write_g

If `true`, writes the new green color channel to the final result.

> property write_r : bool ; default=true ; setter=set_write_r ; getter=get_write_r

If `true`, writes the new red color channel to the final result.

## Methods

> method set_as_mix() -> void

Convenience method to perform standard mix blending with straight (non-premultiplied) alpha. This sets `enable_blend` to `true`, `src_color_blend_factor` to `RenderingDevice.BLEND_FACTOR_SRC_ALPHA`, `dst_color_blend_factor` to `RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA`, `src_alpha_blend_factor` to `RenderingDevice.BLEND_FACTOR_SRC_ALPHA` and `dst_alpha_blend_factor` to `RenderingDevice.BLEND_FACTOR_ONE_MINUS_SRC_ALPHA`.
