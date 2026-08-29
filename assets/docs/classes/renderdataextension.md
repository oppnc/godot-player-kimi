# RenderDataExtension

> class RenderDataExtension
> inherits RenderDataExtension RenderData

## Brief

This class allows for a RenderData implementation to be made in GDExtension.

## Description

This class allows for a RenderData implementation to be made in GDExtension.

## Methods

> method _get_camera_attributes() -> RID ; qualifiers=virtual const

Implement this in GDExtension to return the `RID` for the implementation's camera attributes object.

> method _get_environment() -> RID ; qualifiers=virtual const

Implement this in GDExtension to return the `RID` of the implementation's environment object.

> method _get_render_scene_buffers() -> RenderSceneBuffers ; qualifiers=virtual const

Implement this in GDExtension to return the implementation's `RenderSceneBuffers` object.

> method _get_render_scene_data() -> RenderSceneData ; qualifiers=virtual const

Implement this in GDExtension to return the implementation's `RenderSceneDataExtension` object.
