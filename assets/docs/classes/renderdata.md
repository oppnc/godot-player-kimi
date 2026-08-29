# RenderData

> class RenderData
> inherits RenderData Object

## Brief

Abstract render data object, holds frame data related to rendering a single frame of a viewport.

## Description

Abstract render data object, exists for the duration of rendering a single viewport. See also `RenderDataRD`, `RenderSceneData`, and `RenderSceneDataRD`.
**Note:** This is an internal rendering server object. Do not instantiate this class from a script.

## Methods

> method get_camera_attributes() -> RID ; qualifiers=const

Returns the `RID` of the camera attributes object in the `RenderingServer` being used to render this viewport.

> method get_environment() -> RID ; qualifiers=const

Returns the `RID` of the environment object in the `RenderingServer` being used to render this viewport.

> method get_render_scene_buffers() -> RenderSceneBuffers ; qualifiers=const

Returns the `RenderSceneBuffers` object managing the scene buffers for rendering this viewport.

> method get_render_scene_data() -> RenderSceneData ; qualifiers=const

Returns the `RenderSceneData` object managing this frames scene data.
