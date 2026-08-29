# RenderSceneBuffersRD

> class RenderSceneBuffersRD
> inherits RenderSceneBuffersRD RenderSceneBuffers

## Brief

Render scene buffer implementation for the RenderingDevice based renderers.

## Description

This object manages all 3D rendering buffers for the rendering device based renderers. An instance of this object is created for every viewport that has 3D rendering enabled. See also `RenderSceneBuffers`.
All buffers are organized in **contexts**. The default context is called **render_buffers** and can contain amongst others the color buffer, depth buffer, velocity buffers, VRS density map and MSAA variants of these buffers.
Buffers are only guaranteed to exist during rendering of the viewport.
**Note:** This is an internal rendering server object. Do not instantiate this class from a script.

## Methods

> method clear_context(context: StringName) -> void

Frees all buffers related to this context.

> method create_texture(context: StringName, name: StringName, data_format: RenderingDevice.DataFormat, usage_bits: int, texture_samples: RenderingDevice.TextureSamples, size: Vector2i, layers: int, mipmaps: int, unique: bool, discardable: bool) -> RID

Create a new texture with the given definition and cache this under the given name. Will return the existing texture if it already exists.

> method create_texture_from_format(context: StringName, name: StringName, format: RDTextureFormat, view: RDTextureView, unique: bool) -> RID

Create a new texture using the given format and view and cache this under the given name. Will return the existing texture if it already exists.

> method create_texture_view(context: StringName, name: StringName, view_name: StringName, view: RDTextureView) -> RID

Create a new texture view for an existing texture and cache this under the given `view_name`. Will return the existing texture view if it already exists. Will error if the source texture doesn't exist.

> method get_color_layer(layer: int, msaa: bool = false) -> RID

Returns the specified layer from the color texture we are rendering 3D content to.
If `msaa` is `true` and MSAA is enabled, this returns the MSAA variant of the buffer.

> method get_color_texture(msaa: bool = false) -> RID

Returns the color texture we are rendering 3D content to. If multiview is used this will be a texture array with all views.
If `msaa` is `true` and MSAA is enabled, this returns the MSAA variant of the buffer.

> method get_depth_layer(layer: int, msaa: bool = false) -> RID

Returns the specified layer from the depth texture we are rendering 3D content to.
If `msaa` is `true` and MSAA is enabled, this returns the MSAA variant of the buffer.

> method get_depth_texture(msaa: bool = false) -> RID

Returns the depth texture we are rendering 3D content to. If multiview is used this will be a texture array with all views.
If `msaa` is `true` and MSAA is enabled, this returns the MSAA variant of the buffer.

> method get_fsr_sharpness() -> float ; qualifiers=const

Returns the FSR sharpness value used while rendering the 3D content (if `get_scaling_3d_mode` is an FSR mode).

> method get_internal_size() -> Vector2i ; qualifiers=const

Returns the internal size of the render buffer (size before upscaling) with which textures are created by default.

> method get_msaa_3d() -> RenderingServer.ViewportMSAA ; qualifiers=const

Returns the applied 3D MSAA mode for this viewport.

> method get_render_target() -> RID ; qualifiers=const

Returns the render target associated with this buffers object.

> method get_scaling_3d_mode() -> RenderingServer.ViewportScaling3DMode ; qualifiers=const

Returns the scaling mode used for upscaling.

> method get_screen_space_aa() -> RenderingServer.ViewportScreenSpaceAA ; qualifiers=const

Returns the screen-space antialiasing method applied.

> method get_target_size() -> Vector2i ; qualifiers=const

Returns the target size of the render buffer (size after upscaling).

> method get_texture(context: StringName, name: StringName) -> RID ; qualifiers=const

Returns a cached texture with this name.

> method get_texture_format(context: StringName, name: StringName) -> RDTextureFormat ; qualifiers=const

Returns the texture format information with which a cached texture was created.

> method get_texture_samples() -> RenderingDevice.TextureSamples ; qualifiers=const

Returns the number of MSAA samples used.

> method get_texture_slice(context: StringName, name: StringName, layer: int, mipmap: int, layers: int, mipmaps: int) -> RID

Returns a specific slice (layer or mipmap) for a cached texture.

> method get_texture_slice_size(context: StringName, name: StringName, mipmap: int) -> Vector2i

Returns the texture size of a given slice of a cached texture.

> method get_texture_slice_view(context: StringName, name: StringName, layer: int, mipmap: int, layers: int, mipmaps: int, view: RDTextureView) -> RID

Returns a specific view of a slice (layer or mipmap) for a cached texture.

> method get_use_debanding() -> bool ; qualifiers=const

Returns `true` if debanding is enabled.

> method get_use_taa() -> bool ; qualifiers=const

Returns `true` if TAA is enabled.

> method get_velocity_layer(layer: int, msaa: bool = false) -> RID

Returns the specified layer from the velocity texture we are rendering 3D content to.

> method get_velocity_texture(msaa: bool = false) -> RID

Returns the velocity texture we are rendering 3D content to. If multiview is used this will be a texture array with all views.
If `msaa` is **true** and MSAA is enabled, this returns the MSAA variant of the buffer.

> method get_view_count() -> int ; qualifiers=const

Returns the view count for the associated viewport.

> method has_texture(context: StringName, name: StringName) -> bool ; qualifiers=const

Returns `true` if a cached texture exists for this name.
