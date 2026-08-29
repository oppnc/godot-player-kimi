# RDFramebufferPass

> class RDFramebufferPass
> inherits RDFramebufferPass RefCounted

## Brief

Framebuffer pass attachment description (used by `RenderingDevice`).

## Description

This class contains the list of attachment descriptions for a framebuffer pass. Each points with an index to a previously supplied list of texture attachments.
Multipass framebuffers can optimize some configurations in mobile. On desktop, they provide little to no advantage.
This object is used by `RenderingDevice`.

## Properties

> property color_attachments : PackedInt32Array ; default=PackedInt32Array() ; setter=set_color_attachments ; getter=get_color_attachments

Color attachments in order starting from 0. If this attachment is not used by the shader, pass ATTACHMENT_UNUSED to skip.

> property depth_attachment : int ; default=-1 ; setter=set_depth_attachment ; getter=get_depth_attachment

Depth attachment. ATTACHMENT_UNUSED should be used if no depth buffer is required for this pass.

> property input_attachments : PackedInt32Array ; default=PackedInt32Array() ; setter=set_input_attachments ; getter=get_input_attachments

Used for multipass framebuffers (more than one render pass). Converts an attachment to an input. Make sure to also supply it properly in the `RDUniform` for the uniform set.

> property preserve_attachments : PackedInt32Array ; default=PackedInt32Array() ; setter=set_preserve_attachments ; getter=get_preserve_attachments

Attachments to preserve in this pass (otherwise they are erased).

> property resolve_attachments : PackedInt32Array ; default=PackedInt32Array() ; setter=set_resolve_attachments ; getter=get_resolve_attachments

If the color attachments are multisampled, non-multisampled resolve attachments can be provided.

## Constants

> constant ATTACHMENT_UNUSED = -1

Attachment is unused.
