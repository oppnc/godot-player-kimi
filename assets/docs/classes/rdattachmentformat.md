# RDAttachmentFormat

> class RDAttachmentFormat
> inherits RDAttachmentFormat RefCounted

## Brief

Attachment format (used by `RenderingDevice`).

## Description

This object is used by `RenderingDevice`.

## Properties

> property format : RenderingDevice.DataFormat ; default=36 ; setter=set_format ; getter=get_format

The attachment's data format.

> property samples : RenderingDevice.TextureSamples ; default=0 ; setter=set_samples ; getter=get_samples

The number of samples used when sampling the attachment.

> property usage_flags : int ; default=0 ; setter=set_usage_flags ; getter=get_usage_flags

The attachment's usage flags, which determine what can be done with it.
