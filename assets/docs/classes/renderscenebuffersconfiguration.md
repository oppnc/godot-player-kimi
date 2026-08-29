# RenderSceneBuffersConfiguration

> class RenderSceneBuffersConfiguration
> inherits RenderSceneBuffersConfiguration RefCounted

## Brief

Configuration object used to setup a `RenderSceneBuffers` object.

## Description

This configuration object is created and populated by the render engine on a viewport change and used to (re)configure a `RenderSceneBuffers` object.

## Properties

> property anisotropic_filtering_level : RenderingServer.ViewportAnisotropicFiltering ; default=2 ; setter=set_anisotropic_filtering_level ; getter=get_anisotropic_filtering_level

Level of the anisotropic filter.

> property fsr_sharpness : float ; default=0.0 ; setter=set_fsr_sharpness ; getter=get_fsr_sharpness

FSR Sharpness applicable if FSR upscaling is used.

> property internal_size : Vector2i ; default=Vector2i(0, 0) ; setter=set_internal_size ; getter=get_internal_size

The size of the 3D render buffer used for rendering.

> property msaa_3d : RenderingServer.ViewportMSAA ; default=0 ; setter=set_msaa_3d ; getter=get_msaa_3d

The MSAA mode we're using for 3D rendering.

> property render_target : RID ; default=RID() ; setter=set_render_target ; getter=get_render_target

The render target associated with these buffer.

> property scaling_3d_mode : RenderingServer.ViewportScaling3DMode ; default=255 ; setter=set_scaling_3d_mode ; getter=get_scaling_3d_mode

The requested scaling mode with which we upscale/downscale if `internal_size` and `target_size` are not equal.

> property screen_space_aa : RenderingServer.ViewportScreenSpaceAA ; default=0 ; setter=set_screen_space_aa ; getter=get_screen_space_aa

The requested screen space AA applied in post processing.

> property target_size : Vector2i ; default=Vector2i(0, 0) ; setter=set_target_size ; getter=get_target_size

The target (upscale) size if scaling is used.

> property texture_mipmap_bias : float ; default=0.0 ; setter=set_texture_mipmap_bias ; getter=get_texture_mipmap_bias

Bias applied to mipmaps.
**Note:** This property is only supported in the Forward+ and Mobile renderers, not Compatibility. In Compatibility, this property is always treated as if it was set to `0.0`.

> property view_count : int ; default=1 ; setter=set_view_count ; getter=get_view_count

The number of views we're rendering.
