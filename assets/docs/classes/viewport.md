# Viewport

> class Viewport
> inherits Viewport Node

## Brief

Abstract base class for viewports. Encapsulates drawing and interaction with a game world.

## Description

A `Viewport` creates a different view into the screen, or a sub-view inside another viewport. Child 2D nodes will display on it, and child Camera3D 3D nodes will render on it too.
Optionally, a viewport can have its own 2D or 3D world, so it doesn't share what it draws with other viewports.
Viewports can also choose to be audio listeners, so they generate positional audio depending on a 2D or 3D camera child of it.
Also, viewports can be assigned to different screens in case the devices have multiple screens.
Finally, viewports can also behave as render targets, in which case they will not be visible unless the associated texture is used to draw.

## Properties

> property anisotropic_filtering_level : AnisotropicFiltering ; default=2 ; setter=set_anisotropic_filtering_level ; getter=get_anisotropic_filtering_level

Sets the maximum number of samples to take when using anisotropic filtering on textures (as a power of two). A higher sample count will result in sharper textures at oblique angles, but is more expensive to compute. A value of `0` forcibly disables anisotropic filtering, even on materials where it is enabled.
The anisotropic filtering level also affects decals and light projectors if they are configured to use anisotropic filtering. See `ProjectSettings.rendering/textures/decals/filter` and `ProjectSettings.rendering/textures/light_projectors/filter`.
**Note:** In 3D, for this setting to have an effect, set `BaseMaterial3D.texture_filter` to `BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC` or `BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC` on materials.
**Note:** In 2D, for this setting to have an effect, set `CanvasItem.texture_filter` to `CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC` or `CanvasItem.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC` on the `CanvasItem` node displaying the texture (or in `CanvasTexture`). However, anisotropic filtering is rarely useful in 2D, so only enable it for textures in 2D if it makes a meaningful visual difference.

> property audio_listener_enable_2d : bool ; default=false ; setter=set_as_audio_listener_2d ; getter=is_audio_listener_2d

If `true`, the viewport will process 2D audio streams.

> property audio_listener_enable_3d : bool ; default=false ; setter=set_as_audio_listener_3d ; getter=is_audio_listener_3d

If `true`, the viewport will process 3D audio streams.

> property canvas_cull_mask : int ; default=4294967295 ; setter=set_canvas_cull_mask ; getter=get_canvas_cull_mask

The rendering layers in which this `Viewport` renders `CanvasItem` nodes.
**Note:** A `CanvasItem` does not inherit its parents' visibility layers. See `CanvasItem.visibility_layer`'s description for details.

> property canvas_item_default_texture_filter : DefaultCanvasItemTextureFilter ; default=1 ; setter=set_default_canvas_item_texture_filter ; getter=get_default_canvas_item_texture_filter

The default filter mode used by `CanvasItem` nodes in this viewport.

> property canvas_item_default_texture_repeat : DefaultCanvasItemTextureRepeat ; default=0 ; setter=set_default_canvas_item_texture_repeat ; getter=get_default_canvas_item_texture_repeat

The default repeat mode used by `CanvasItem` nodes in this viewport.

> property canvas_transform : Transform2D ; setter=set_canvas_transform ; getter=get_canvas_transform

The canvas transform of the viewport, useful for changing the on-screen positions of all child `CanvasItem`s. This is relative to the global canvas transform of the viewport.

> property debug_draw : DebugDraw ; default=0 ; setter=set_debug_draw ; getter=get_debug_draw

The overlay mode for test rendered geometry in debug purposes.

> property disable_3d : bool ; default=false ; setter=set_disable_3d ; getter=is_3d_disabled

Disable 3D rendering (but keep 2D rendering).

> property fsr_sharpness : float ; default=0.2 ; setter=set_fsr_sharpness ; getter=get_fsr_sharpness

Determines how sharp the upscaled image will be when using the FSR upscaling mode. Sharpness halves with every whole number. Values go from 0.0 (sharpest) to 2.0. Values above 2.0 won't make a visible difference.
To control this property on the root viewport, set the `ProjectSettings.rendering/scaling_3d/fsr_sharpness` project setting.

> property global_canvas_transform : Transform2D ; setter=set_global_canvas_transform ; getter=get_global_canvas_transform

The global canvas transform of the viewport. The canvas transform is relative to this.

> property gui_disable_input : bool ; default=false ; setter=set_disable_input ; getter=is_input_disabled

If `true`, the viewport will not receive input events.

> property gui_drag_threshold : int ; default=10 ; setter=set_drag_threshold ; getter=get_drag_threshold

The minimum distance the mouse cursor must move while pressed before a drag operation begins.

> property gui_embed_subwindows : bool ; default=false ; setter=set_embedding_subwindows ; getter=is_embedding_subwindows

If `true`, sub-windows (popups and dialogs) will be embedded inside application window as control-like nodes. If `false`, they will appear as separate windows handled by the operating system.

> property gui_snap_controls_to_pixels : bool ; default=true ; setter=set_snap_controls_to_pixels ; getter=is_snap_controls_to_pixels_enabled

If `true`, the GUI controls on the viewport will lay pixel perfectly.

> property handle_input_locally : bool ; default=true ; setter=set_handle_input_locally ; getter=is_handling_input_locally

If `true`, this viewport will mark incoming input events as handled by itself. If `false`, this is instead done by the first parent viewport that is set to handle input locally.
A `SubViewportContainer` will automatically set this property to `false` for the `Viewport` contained inside of it.
See also `set_input_as_handled` and `is_input_handled`.

> property mesh_lod_threshold : float ; default=1.0 ; setter=set_mesh_lod_threshold ; getter=get_mesh_lod_threshold

The automatic LOD bias to use for meshes rendered within the `Viewport` (this is analogous to `ReflectionProbe.mesh_lod_threshold`). Higher values will use less detailed versions of meshes that have LOD variations generated. If set to `0.0`, automatic LOD is disabled. Increase `mesh_lod_threshold` to improve performance at the cost of geometry detail.
To control this property on the root viewport, set the `ProjectSettings.rendering/mesh_lod/lod_change/threshold_pixels` project setting.
**Note:** Depending on the mesh's attributes (vertex colors, blend shapes, ...), a mesh may have fewer levels of LOD generated to avoid visible distortion of the mesh once it is affected by vertex colors or blend shapes. Meshes with a very low vertex count will also not have any LODs generated, which means this setting will not affect them at all. In general, this setting makes the largest impact on static meshes with a high vertex count.
**Note:** `mesh_lod_threshold` does not affect `GeometryInstance3D` visibility ranges (also known as "manual" LOD or hierarchical LOD).

> property msaa_2d : MSAA ; default=0 ; setter=set_msaa_2d ; getter=get_msaa_2d

The multisample antialiasing mode for 2D/Canvas rendering. A higher number results in smoother edges at the cost of significantly worse performance. A value of `Viewport.MSAA_2X` or `Viewport.MSAA_4X` is best unless targeting very high-end systems. This has no effect on shader-induced aliasing or texture aliasing.
See also `ProjectSettings.rendering/anti_aliasing/quality/msaa_2d` and `RenderingServer.viewport_set_msaa_2d`.

> property msaa_3d : MSAA ; default=0 ; setter=set_msaa_3d ; getter=get_msaa_3d

The multisample antialiasing mode for 3D rendering. A higher number results in smoother edges at the cost of significantly worse performance. A value of `Viewport.MSAA_2X` or `Viewport.MSAA_4X` is best unless targeting very high-end systems. See also bilinear scaling 3D `scaling_3d_mode` for supersampling, which provides higher quality but is much more expensive. This has no effect on shader-induced aliasing or texture aliasing.
See also `ProjectSettings.rendering/anti_aliasing/quality/msaa_3d` and `RenderingServer.viewport_set_msaa_3d`.

> property oversampling : bool ; default=true ; setter=set_use_oversampling ; getter=is_using_oversampling

If `true` and one of the following conditions are true: `SubViewport.size_2d_override_stretch` and `SubViewport.size_2d_override` are set, `Window.content_scale_factor` is set and scaling is enabled, `oversampling_override` is set, font and `DPITexture` oversampling are enabled.

> property oversampling_override : float ; default=0.0 ; setter=set_oversampling_override ; getter=get_oversampling_override

If greater than zero, this value is used as the font oversampling factor, otherwise oversampling is equal to viewport scale.

> property own_world_3d : bool ; default=false ; setter=set_use_own_world_3d ; getter=is_using_own_world_3d

If `true`, the viewport will use a unique copy of the `World3D` defined in `world_3d`.

> property physics_interpolation_mode : Node.PhysicsInterpolationMode ; default=1 ; setter=set_physics_interpolation_mode ; getter=get_physics_interpolation_mode ; overrides=Node

> property physics_object_picking : bool ; default=false ; setter=set_physics_object_picking ; getter=get_physics_object_picking

If `true`, the objects rendered by viewport become subjects of mouse picking process.
**Note:** The number of simultaneously pickable objects is limited to 64 and they are selected in a non-deterministic order, which can be different in each picking process.

> property physics_object_picking_first_only : bool ; default=false ; setter=set_physics_object_picking_first_only ; getter=get_physics_object_picking_first_only

If `true`, the input_event signal will only be sent to one physics object in the mouse picking process. If you want to get the top object only, you must also enable `physics_object_picking_sort`.
If `false`, an input_event signal will be sent to all physics objects in the mouse picking process.
This applies to 2D CanvasItem object picking only.

> property physics_object_picking_sort : bool ; default=false ; setter=set_physics_object_picking_sort ; getter=get_physics_object_picking_sort

If `true`, objects receive mouse picking events sorted primarily by their `CanvasItem.z_index` and secondarily by their position in the scene tree. If `false`, the order is undetermined.
**Note:** This setting is disabled by default because of its potential expensive computational cost.
**Note:** Sorting happens after selecting the pickable objects. Because of the limitation of 64 simultaneously pickable objects, it is not guaranteed that the object with the highest `CanvasItem.z_index` receives the picking event.

> property positional_shadow_atlas_16_bits : bool ; default=true ; setter=set_positional_shadow_atlas_16_bits ; getter=get_positional_shadow_atlas_16_bits

Use 16 bits for the omni/spot shadow depth map. Enabling this results in shadows having less precision and may result in shadow acne, but can lead to performance improvements on some devices.

> property positional_shadow_atlas_quad_0 : PositionalShadowAtlasQuadrantSubdiv ; default=2 ; setter=set_positional_shadow_atlas_quadrant_subdiv ; getter=get_positional_shadow_atlas_quadrant_subdiv

The subdivision amount of the first quadrant on the shadow atlas.

> property positional_shadow_atlas_quad_1 : PositionalShadowAtlasQuadrantSubdiv ; default=2 ; setter=set_positional_shadow_atlas_quadrant_subdiv ; getter=get_positional_shadow_atlas_quadrant_subdiv

The subdivision amount of the second quadrant on the shadow atlas.

> property positional_shadow_atlas_quad_2 : PositionalShadowAtlasQuadrantSubdiv ; default=3 ; setter=set_positional_shadow_atlas_quadrant_subdiv ; getter=get_positional_shadow_atlas_quadrant_subdiv

The subdivision amount of the third quadrant on the shadow atlas.

> property positional_shadow_atlas_quad_3 : PositionalShadowAtlasQuadrantSubdiv ; default=4 ; setter=set_positional_shadow_atlas_quadrant_subdiv ; getter=get_positional_shadow_atlas_quadrant_subdiv

The subdivision amount of the fourth quadrant on the shadow atlas.

> property positional_shadow_atlas_size : int ; default=2048 ; setter=set_positional_shadow_atlas_size ; getter=get_positional_shadow_atlas_size

The shadow atlas' resolution (used for omni and spot lights). The value is rounded up to the nearest power of 2.
**Note:** If this is set to `0`, no positional shadows will be visible at all. This can improve performance significantly on low-end systems by reducing both the CPU and GPU load (as fewer draw calls are needed to draw the scene without shadows).

> property scaling_3d_mode : Scaling3DMode ; default=0 ; setter=set_scaling_3d_mode ; getter=get_scaling_3d_mode

Sets scaling 3D mode. Bilinear scaling renders at different resolution to either undersample or supersample the viewport. FidelityFX Super Resolution 1.0, abbreviated to FSR, is an upscaling technology that produces high quality images at fast framerates by using a spatially aware upscaling algorithm. FSR is slightly more expensive than bilinear, but it produces significantly higher image quality. FSR should be used where possible.
To control this property on the root viewport, set the `ProjectSettings.rendering/scaling_3d/mode` project setting.

> property scaling_3d_scale : float ; default=1.0 ; setter=set_scaling_3d_scale ; getter=get_scaling_3d_scale

Scales the 3D render buffer based on the viewport size uses an image filter specified in `ProjectSettings.rendering/scaling_3d/mode` to scale the output image to the full viewport size. Values lower than `1.0` can be used to speed up 3D rendering at the cost of quality (undersampling). Values greater than `1.0` are only valid for bilinear mode and can be used to improve 3D rendering quality at a high performance cost (supersampling). See also `ProjectSettings.rendering/anti_aliasing/quality/msaa_3d` for multi-sample antialiasing, which is significantly cheaper but only smooths the edges of polygons.
When using FSR upscaling, AMD recommends exposing the following values as preset options to users "Ultra Quality: 0.77", "Quality: 0.67", "Balanced: 0.59", "Performance: 0.5" instead of exposing the entire scale.
To control this property on the root viewport, set the `ProjectSettings.rendering/scaling_3d/scale` project setting.

> property screen_space_aa : ScreenSpaceAA ; default=0 ; setter=set_screen_space_aa ; getter=get_screen_space_aa

Sets the screen-space antialiasing method used. Screen-space antialiasing works by selectively blurring edges in a post-process shader. It differs from MSAA which takes multiple coverage samples while rendering objects. Screen-space AA methods are typically faster than MSAA and will smooth out specular aliasing, but tend to make scenes appear blurry.
See also `ProjectSettings.rendering/anti_aliasing/quality/screen_space_aa` and `RenderingServer.viewport_set_screen_space_aa`.

> property sdf_oversize : SDFOversize ; default=1 ; setter=set_sdf_oversize ; getter=get_sdf_oversize

Controls how much of the original viewport's size should be covered by the 2D signed distance field. This SDF can be sampled in `CanvasItem` shaders and is also used for `GPUParticles2D` collision. Higher values allow portions of occluders located outside the viewport to still be taken into account in the generated signed distance field, at the cost of performance. If you notice particles falling through `LightOccluder2D`s as the occluders leave the viewport, increase this setting.
The percentage is added on each axis and on both sides. For example, with the default `SDF_OVERSIZE_120_PERCENT`, the signed distance field will cover 20% of the viewport's size outside the viewport on each side (top, right, bottom, left).

> property sdf_scale : SDFScale ; default=1 ; setter=set_sdf_scale ; getter=get_sdf_scale

The resolution scale to use for the 2D signed distance field. Higher values lead to a more precise and more stable signed distance field as the camera moves, at the cost of performance.

> property snap_2d_transforms_to_pixel : bool ; default=false ; setter=set_snap_2d_transforms_to_pixel ; getter=is_snap_2d_transforms_to_pixel_enabled

If `true`, `CanvasItem` nodes will internally snap to full pixels. Their position can still be sub-pixel, but the decimals will not have effect. This can lead to a crisper appearance at the cost of less smooth movement, especially when `Camera2D` smoothing is enabled.

> property snap_2d_vertices_to_pixel : bool ; default=false ; setter=set_snap_2d_vertices_to_pixel ; getter=is_snap_2d_vertices_to_pixel_enabled

If `true`, vertices of `CanvasItem` nodes will snap to full pixels. Only affects the final vertex positions, not the transforms. This can lead to a crisper appearance at the cost of less smooth movement, especially when `Camera2D` smoothing is enabled.

> property texture_mipmap_bias : float ; default=0.0 ; setter=set_texture_mipmap_bias ; getter=get_texture_mipmap_bias

Affects the final texture sharpness by reading from a lower or higher mipmap (also called "texture LOD bias"). Negative values make mipmapped textures sharper but grainier when viewed at a distance, while positive values make mipmapped textures blurrier (even when up close).
Enabling temporal antialiasing (`use_taa`) will automatically apply a `-0.5` offset to this value, while enabling FXAA (`screen_space_aa`) will automatically apply a `-0.25` offset to this value. If both TAA and FXAA are enabled at the same time, an offset of `-0.75` is applied to this value.
To control this property on the root viewport, set the `ProjectSettings.rendering/textures/default_filters/texture_mipmap_bias` project setting.
**Note:** If `scaling_3d_scale` is lower than `1.0` (exclusive), `texture_mipmap_bias` is used to adjust the automatic mipmap bias which is calculated internally based on the scale factor. The formula for this is `log2(scaling_3d_scale) + mipmap_bias`.
**Note:** This property is only supported in the Forward+ and Mobile renderers, not Compatibility. In Compatibility, this property is always treated as if it was set to `0.0`.

> property transparent_bg : bool ; default=false ; setter=set_transparent_background ; getter=has_transparent_background

If `true`, the viewport should render its background as transparent.
**Note:** Due to technical limitations, certain rendering features are disabled when a viewport has a transparent background. This currently applies to screen-space reflections, subsurface scattering, and depth of field.

> property use_debanding : bool ; default=false ; setter=set_use_debanding ; getter=is_using_debanding

When using the Mobile or Forward+ renderers, set `use_debanding` to enable or disable the debanding feature of this `Viewport`. If `use_hdr_2d` is `false`, 2D rendering is *not* affected by debanding unless the `Environment.background_mode` is `Environment.BG_CANVAS`. If `use_hdr_2d` is `true`, debanding will only be applied if this is the root `Viewport` and will affect all 2D and 3D rendering, including canvas items.
`use_debanding` has no effect when using the Compatibility rendering method. The Mobile renderer can also use material debanding, which can be set with `RenderingServer.material_set_use_debanding` or configured with `ProjectSettings.rendering/anti_aliasing/quality/use_debanding`.
See also `ProjectSettings.rendering/anti_aliasing/quality/use_debanding`, `RenderingServer.material_set_use_debanding`, and `RenderingServer.viewport_set_use_debanding`.

> property use_hdr_2d : bool ; default=false ; setter=set_use_hdr_2d ; getter=is_using_hdr_2d

If `true`, 2D rendering will use a high dynamic range (HDR) `RGBA16` format framebuffer. Additionally, 2D rendering will be performed on linear values and will be converted using the appropriate transfer function immediately before blitting to the screen (if the Viewport is attached to the screen).
Practically speaking, this means that the end result of the Viewport will not be clamped to the `0-1` range and can be used in 3D rendering without color encoding adjustments. This allows 2D rendering to take advantage of effects requiring high dynamic range (e.g. 2D glow) as well as substantially improves the appearance of effects requiring highly detailed gradients.

> property use_occlusion_culling : bool ; default=false ; setter=set_use_occlusion_culling ; getter=is_using_occlusion_culling

If `true`, `OccluderInstance3D` nodes will be usable for occlusion culling in 3D for this viewport. For the root viewport, `ProjectSettings.rendering/occlusion_culling/use_occlusion_culling` must be set to `true` instead.
**Note:** Enabling occlusion culling has a cost on the CPU. Only enable occlusion culling if you actually plan to use it, and think whether your scene can actually benefit from occlusion culling. Large, open scenes with few or no objects blocking the view will generally not benefit much from occlusion culling. Large open scenes generally benefit more from mesh LOD and visibility ranges (`GeometryInstance3D.visibility_range_begin` and `GeometryInstance3D.visibility_range_end`) compared to occlusion culling.
**Note:** Due to memory constraints, occlusion culling is not supported by default in Web export templates. It can be enabled by compiling custom Web export templates with `module_raycast_enabled=yes`.

> property use_taa : bool ; default=false ; setter=set_use_taa ; getter=is_using_taa

Enables temporal antialiasing for this viewport. TAA works by jittering the camera and accumulating the images of the last rendered frames, motion vector rendering is used to account for camera and object motion.
**Note:** The implementation is not complete yet, some visual instances such as particles and skinned meshes may show artifacts.
See also `ProjectSettings.rendering/anti_aliasing/quality/use_taa` and `RenderingServer.viewport_set_use_taa`.

> property use_xr : bool ; default=false ; setter=set_use_xr ; getter=is_using_xr

If `true`, the viewport will use the primary XR interface to render XR output. When applicable this can result in a stereoscopic image and the resulting render being output to a headset.

> property vrs_mode : VRSMode ; default=0 ; setter=set_vrs_mode ; getter=get_vrs_mode

The Variable Rate Shading (VRS) mode that is used for this viewport. Note, if hardware does not support VRS this property is ignored.

> property vrs_texture : Texture2D ; setter=set_vrs_texture ; getter=get_vrs_texture

Texture to use when `vrs_mode` is set to `Viewport.VRS_TEXTURE`.
The texture *must* use a lossless compression format so that colors can be matched precisely. The following VRS densities are mapped to various colors, with brighter colors representing a lower level of shading precision:

```text
            - 1×1 = rgb(0, 0, 0)     - #000000
            - 1×2 = rgb(0, 85, 0)    - #005500
            - 2×1 = rgb(85, 0, 0)    - #550000
            - 2×2 = rgb(85, 85, 0)   - #555500
            - 2×4 = rgb(85, 170, 0)  - #55aa00
            - 4×2 = rgb(170, 85, 0)  - #aa5500
            - 4×4 = rgb(170, 170, 0) - #aaaa00
            - 4×8 = rgb(170, 255, 0) - #aaff00 - Not supported on most hardware
            - 8×4 = rgb(255, 170, 0) - #ffaa00 - Not supported on most hardware
            - 8×8 = rgb(255, 255, 0) - #ffff00 - Not supported on most hardware

```

> property vrs_update_mode : VRSUpdateMode ; default=1 ; setter=set_vrs_update_mode ; getter=get_vrs_update_mode

Sets the update mode for Variable Rate Shading (VRS) for the viewport. VRS requires the input texture to be converted to the format usable by the VRS method supported by the hardware. The update mode defines how often this happens. If the GPU does not support VRS, or VRS is not enabled, this property is ignored.

> property world_2d : World2D ; setter=set_world_2d ; getter=get_world_2d

The custom `World2D` which can be used as 2D environment source.

> property world_3d : World3D ; setter=set_world_3d ; getter=get_world_3d

The custom `World3D` which can be used as 3D environment source.

## Methods

> method find_world_2d() -> World2D ; qualifiers=const

Returns the first valid `World2D` for this viewport, searching the `world_2d` property of itself and any Viewport ancestor.

> method find_world_3d() -> World3D ; qualifiers=const

Returns the first valid `World3D` for this viewport, searching the `world_3d` property of itself and any Viewport ancestor.

> method get_audio_listener_2d() -> AudioListener2D ; qualifiers=const

Returns the currently active 2D audio listener. Returns `null` if there are no active 2D audio listeners, in which case the active 2D camera will be treated as listener.

> method get_audio_listener_3d() -> AudioListener3D ; qualifiers=const

Returns the currently active 3D audio listener. Returns `null` if there are no active 3D audio listeners, in which case the active 3D camera will be treated as listener.

> method get_camera_2d() -> Camera2D ; qualifiers=const

Returns the currently active 2D camera. Returns `null` if there are no active cameras.
**Note:** If called while the *Camera Override* system is active in editor, this will return the internally managed override camera. It is therefore advised to avoid caching the return value, or to check that the cached value is still a valid instance and is the current camera before use. See `@GlobalScope.is_instance_valid` and `Camera2D.is_current`.

> method get_camera_3d() -> Camera3D ; qualifiers=const

Returns the currently active 3D camera. Returns `null` if there are no active cameras.
**Note:** If called while the *Camera Override* system is active in editor, this will return the internally managed override camera. It is therefore advised to avoid caching the return value, or to check that the cached value is a valid instance and is the current camera before use. See `@GlobalScope.is_instance_valid` and `Camera3D.current`.

> method get_canvas_cull_mask_bit(layer: int) -> bool ; qualifiers=const

Returns an individual bit on the rendering layer mask.

> method get_embedded_subwindows() -> Array[Window] ; qualifiers=const

Returns a list of the visible embedded `Window`s inside the viewport.
**Note:** `Window`s inside other viewports will not be listed.

> method get_final_transform() -> Transform2D ; qualifiers=const

Returns the transform from the viewport's coordinate system to the embedder's coordinate system.

> method get_mouse_position() -> Vector2 ; qualifiers=const

Returns the mouse's position in this `Viewport` using the coordinate system of this `Viewport`.

> method get_oversampling() -> float ; qualifiers=const

Returns viewport oversampling factor.

> method get_positional_shadow_atlas_quadrant_subdiv(quadrant: int) -> PositionalShadowAtlasQuadrantSubdiv ; qualifiers=const

Returns the positional shadow atlas quadrant subdivision of the specified quadrant.

> method get_render_info(type: RenderInfoType, info: RenderInfo) -> int

Returns rendering statistics of the given type.

> method get_screen_transform() -> Transform2D ; qualifiers=const

Returns the transform from the Viewport's coordinates to the screen coordinates of the containing window manager window.

> method get_stretch_transform() -> Transform2D ; qualifiers=const

Returns the automatically computed 2D stretch transform, taking the `Viewport`'s stretch settings into account. The final value is multiplied by `Window.content_scale_factor`, but only for the root viewport. If this method is called on a `SubViewport` (e.g., in a scene tree with `SubViewportContainer` and `SubViewport`), the scale factor of the root window will not be applied. Using `Transform2D.get_scale` on the returned value, this can be used to compensate for scaling when zooming a `Camera2D` node, or to scale down a `TextureRect` to be pixel-perfect regardless of the automatically computed scale factor.
**Note:** Due to how pixel scaling works, the returned transform's X and Y scale may differ slightly, even when `Window.content_scale_aspect` is set to a mode that preserves the pixels' aspect ratio. If `Window.content_scale_aspect` is `Window.CONTENT_SCALE_ASPECT_IGNORE`, the X and Y scale may differ *significantly*.

> method get_texture() -> ViewportTexture ; qualifiers=const

Returns the viewport's texture.
**Note:** When trying to store the current texture (e.g. in a file), it might be completely black or outdated if used too early, especially when used in e.g. `Node._ready`. To make sure the texture you get is correct, you can await `RenderingServer.frame_post_draw` signal.

```gdscript
                func _ready():
                    await RenderingServer.frame_post_draw
                    $Viewport.get_texture().get_image().save_png("user://Screenshot.png")

```

```csharp
                public async override void _Ready()
                {
                    await ToSignal(RenderingServer.Singleton, RenderingServer.SignalName.FramePostDraw);
                    var viewport = GetNode<Viewport>("Viewport");
                    viewport.GetTexture().GetImage().SavePng("user://Screenshot.png");
                }

```

**Note:** When `use_hdr_2d` is `true` the returned texture will be an HDR image using linear encoding.

> method get_viewport_rid() -> RID ; qualifiers=const

Returns the viewport's RID from the `RenderingServer`.

> method get_visible_rect() -> Rect2 ; qualifiers=const

Returns the visible rectangle in global screen coordinates.

> method gui_cancel_drag() -> void

Cancels the drag operation that was previously started through `Control._get_drag_data` or forced with `Control.force_drag`.

> method gui_get_drag_data() -> Variant ; qualifiers=const

Returns the drag data from the GUI, that was previously returned by `Control._get_drag_data`.

> method gui_get_drag_description() -> String ; qualifiers=const

Returns the human-readable description of the drag data, used for assistive apps.

> method gui_get_focus_owner() -> Control ; qualifiers=const

Returns the currently focused `Control` within this viewport. If no `Control` is focused, returns `null`.

> method gui_get_hovered_control() -> Control ; qualifiers=const

Returns the `Control` that the mouse is currently hovering over in this viewport. If no `Control` has the cursor, returns `null`.
Typically the leaf `Control` node or deepest level of the subtree which claims hover. This is very useful when used together with `Node.is_ancestor_of` to find if the mouse is within a control tree.

> method gui_is_drag_successful() -> bool ; qualifiers=const

Returns `true` if the drag operation is successful.

> method gui_is_dragging() -> bool ; qualifiers=const

Returns `true` if a drag operation is currently ongoing and where the drop action could happen in this viewport.
Alternative to `Node.NOTIFICATION_DRAG_BEGIN` and `Node.NOTIFICATION_DRAG_END` when you prefer polling the value.

> method gui_release_focus() -> void

Removes the focus from the currently focused `Control` within this viewport. If no `Control` has the focus, does nothing.

> method gui_set_drag_description(description: String) -> void

Sets the human-readable description of the drag data to `description`, used for assistive apps.

> method is_input_handled() -> bool ; qualifiers=const

Returns whether the current `InputEvent` has been handled. Input events are not handled until `set_input_as_handled` has been called during the lifetime of an `InputEvent`.
This is usually done as part of input handling methods like `Node._input`, `Control._gui_input` or others, as well as in corresponding signal handlers.
If `handle_input_locally` is set to `false`, this method will try finding the first parent viewport that is set to handle input locally, and return its value for `is_input_handled` instead.

> method notify_mouse_entered() -> void

Inform the Viewport that the mouse has entered its area. Use this function before sending an `InputEventMouseButton` or `InputEventMouseMotion` to the `Viewport` with `Viewport.push_input`. See also `notify_mouse_exited`.
**Note:** In most cases, it is not necessary to call this function because `SubViewport` nodes that are children of `SubViewportContainer` are notified automatically. This is only necessary when interacting with viewports in non-default ways, for example as textures in `TextureRect` or with an `Area3D` that forwards input events.

> method notify_mouse_exited() -> void

Inform the Viewport that the mouse has left its area. Use this function when the node that displays the viewport notices the mouse has left the area of the displayed viewport. See also `notify_mouse_entered`.
**Note:** In most cases, it is not necessary to call this function because `SubViewport` nodes that are children of `SubViewportContainer` are notified automatically. This is only necessary when interacting with viewports in non-default ways, for example as textures in `TextureRect` or with an `Area3D` that forwards input events.

> method push_input(event: InputEvent, in_local_coords: bool = false) -> void

Triggers the given `event` in this `Viewport`. This can be used to pass an `InputEvent` between viewports, or to locally apply inputs that were sent over the network or saved to a file.
If `in_local_coords` is `false`, the event's position is in the embedder's coordinates and will be converted to viewport coordinates. If `in_local_coords` is `true`, the event's position is in viewport coordinates.
While this method serves a similar purpose as `Input.parse_input_event`, it does not remap the specified `event` based on project settings like `ProjectSettings.input_devices/pointing/emulate_touch_from_mouse`.
Calling this method will propagate calls to child nodes for following methods in the given order:
- `Node._input`
- `Control._gui_input` for `Control` nodes
- `Node._shortcut_input`
- `Node._unhandled_key_input`
- `Node._unhandled_input`
If an earlier method marks the input as handled via `set_input_as_handled`, any later method in this list will not be called.
If none of the methods handle the event and `physics_object_picking` is `true`, the event is used for physics object picking.

> method push_text_input(text: String) -> void

Helper method which calls the `set_text()` method on the currently focused `Control`, provided that it is defined (e.g. if the focused Control is `Button` or `LineEdit`).

> method push_unhandled_input(event: InputEvent, in_local_coords: bool = false) -> void ; deprecated=Use `push_input` instead.

Triggers the given `event` in this `Viewport`. This can be used to pass an `InputEvent` between viewports, or to locally apply inputs that were sent over the network or saved to a file.
If `in_local_coords` is `false`, the event's position is in the embedder's coordinates and will be converted to viewport coordinates. If `in_local_coords` is `true`, the event's position is in viewport coordinates.
Calling this method will propagate calls to child nodes for following methods in the given order:
- `Node._shortcut_input`
- `Node._unhandled_key_input`
- `Node._unhandled_input`
If an earlier method marks the input as handled via `set_input_as_handled`, any later method in this list will not be called.
If none of the methods handle the event and `physics_object_picking` is `true`, the event is used for physics object picking.
**Note:** This method doesn't propagate input events to embedded `Window`s or `SubViewport`s.

> method set_canvas_cull_mask_bit(layer: int, enable: bool) -> void

Set/clear individual bits on the rendering layer mask. This simplifies editing this `Viewport`'s layers.

> method set_input_as_handled() -> void

Stops the input from propagating further up the `SceneTree`.
**Note:** This does not affect the methods in `Input`, only the way events are propagated.

> method set_positional_shadow_atlas_quadrant_subdiv(quadrant: int, subdiv: PositionalShadowAtlasQuadrantSubdiv) -> void

Sets the number of subdivisions to use in the specified quadrant. A higher number of subdivisions allows you to have more shadows in the scene at once, but reduces the quality of the shadows. A good practice is to have quadrants with a varying number of subdivisions and to have as few subdivisions as possible.

> method update_mouse_cursor_state() -> void

Force instantly updating the display based on the current mouse cursor position. This includes updating the mouse cursor shape and sending necessary `Control.mouse_entered`, `CollisionObject2D.mouse_entered`, `CollisionObject3D.mouse_entered` and `Window.mouse_entered` signals and their respective `mouse_exited` counterparts.

> method warp_mouse(position: Vector2) -> void

Moves the mouse pointer to the specified position in this `Viewport` using the coordinate system of this `Viewport`.
**Note:** `warp_mouse` is only supported on Windows, macOS and Linux. It has no effect on Android, iOS and Web.

## Signals

> signal gui_focus_changed(node: Control)

Emitted when a Control node grabs keyboard focus.
**Note:** A Control node losing focus doesn't cause this signal to be emitted.

> signal size_changed()

Emitted when the size of the viewport is changed, whether by resizing of window, or some other means.

## Enumerations

> enum AnisotropicFiltering

> enum_value AnisotropicFiltering.ANISOTROPY_DISABLED = 0

Anisotropic filtering is disabled.

> enum_value AnisotropicFiltering.ANISOTROPY_2X = 1

Use 2× anisotropic filtering.

> enum_value AnisotropicFiltering.ANISOTROPY_4X = 2

Use 4× anisotropic filtering. This is the default value.

> enum_value AnisotropicFiltering.ANISOTROPY_8X = 3

Use 8× anisotropic filtering.

> enum_value AnisotropicFiltering.ANISOTROPY_16X = 4

Use 16× anisotropic filtering.

> enum_value AnisotropicFiltering.ANISOTROPY_MAX = 5

Represents the size of the `AnisotropicFiltering` enum.

> enum DebugDraw

> enum_value DebugDraw.DEBUG_DRAW_DISABLED = 0

Objects are displayed normally.

> enum_value DebugDraw.DEBUG_DRAW_UNSHADED = 1

Objects are displayed without light information.

> enum_value DebugDraw.DEBUG_DRAW_LIGHTING = 2

Objects are displayed without textures and only with lighting information.
**Note:** When using this debug draw mode, custom shaders are ignored since all materials in the scene temporarily use a debug material. This means the result from custom shader functions (such as vertex displacement) won't be visible anymore when using this debug draw mode.

> enum_value DebugDraw.DEBUG_DRAW_OVERDRAW = 3

Objects are displayed semi-transparent with additive blending so you can see where they are drawing over top of one another. A higher overdraw means you are wasting performance on drawing pixels that are being hidden behind others.
**Note:** When using this debug draw mode, custom shaders are ignored since all materials in the scene temporarily use a debug material. This means the result from custom shader functions (such as vertex displacement) won't be visible anymore when using this debug draw mode.

> enum_value DebugDraw.DEBUG_DRAW_WIREFRAME = 4

Objects are displayed as wireframe models.
**Note:** `RenderingServer.set_debug_generate_wireframes` must be called before loading any meshes for wireframes to be visible when using the Compatibility renderer.
**Note:** In the Compatibility renderer, backfaces are always visible when using wireframe rendering. In the Forward+ and Mobile renderers, wireframes follow the material's backface culling properties instead.

> enum_value DebugDraw.DEBUG_DRAW_NORMAL_BUFFER = 5

Objects are displayed without lighting information and their textures replaced by normal mapping.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_VOXEL_GI_ALBEDO = 6

Objects are displayed with only the albedo value from `VoxelGI`s. Requires at least one visible `VoxelGI` node that has been baked to have a visible effect.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_VOXEL_GI_LIGHTING = 7

Objects are displayed with only the lighting value from `VoxelGI`s. Requires at least one visible `VoxelGI` node that has been baked to have a visible effect.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_VOXEL_GI_EMISSION = 8

Objects are displayed with only the emission color from `VoxelGI`s. Requires at least one visible `VoxelGI` node that has been baked to have a visible effect.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_SHADOW_ATLAS = 9

Draws the shadow atlas that stores shadows from `OmniLight3D`s and `SpotLight3D`s in the upper left quadrant of the `Viewport`.

> enum_value DebugDraw.DEBUG_DRAW_DIRECTIONAL_SHADOW_ATLAS = 10

Draws the shadow atlas that stores shadows from `DirectionalLight3D`s in the upper left quadrant of the `Viewport`.

> enum_value DebugDraw.DEBUG_DRAW_SCENE_LUMINANCE = 11

Draws the scene luminance buffer (if available) in the upper left quadrant of the `Viewport`.
**Note:** Only supported when using the Forward+ or Mobile rendering methods.

> enum_value DebugDraw.DEBUG_DRAW_SSAO = 12

Draws the screen-space ambient occlusion texture instead of the scene so that you can clearly see how it is affecting objects. In order for this display mode to work, you must have `Environment.ssao_enabled` set in your `WorldEnvironment`.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_SSIL = 13

Draws the screen-space indirect lighting texture instead of the scene so that you can clearly see how it is affecting objects. In order for this display mode to work, you must have `Environment.ssil_enabled` set in your `WorldEnvironment`.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_PSSM_SPLITS = 14

Colors each PSSM split for the `DirectionalLight3D`s in the scene a different color so you can see where the splits are. In order (from closest to furthest from the camera), they are colored red, green, blue, and yellow.
**Note:** When using this debug draw mode, custom shaders are ignored since all materials in the scene temporarily use a debug material. This means the result from custom shader functions (such as vertex displacement) won't be visible anymore when using this debug draw mode.
**Note:** Only supported when using the Forward+ or Mobile rendering methods.

> enum_value DebugDraw.DEBUG_DRAW_DECAL_ATLAS = 15

Draws the decal atlas used by `Decal`s and light projector textures in the upper left quadrant of the `Viewport`.
**Note:** Only supported when using the Forward+ or Mobile rendering methods.

> enum_value DebugDraw.DEBUG_DRAW_SDFGI = 16

Draws the cascades used to render signed distance field global illumination (SDFGI).
Does nothing if the current environment's `Environment.sdfgi_enabled` is `false`.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_SDFGI_PROBES = 17

Draws the probes used for signed distance field global illumination (SDFGI).
When in the editor, left-clicking a probe will display additional bright dots that show its occlusion information. A white dot means the light is not occluded at all at the dot's position, while a red dot means the light is fully occluded. Intermediate values are possible.
Does nothing if the current environment's `Environment.sdfgi_enabled` is `false`.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_GI_BUFFER = 18

Draws the buffer used for global illumination from `VoxelGI` or SDFGI. Requires `VoxelGI` (at least one visible baked VoxelGI node) or SDFGI (`Environment.sdfgi_enabled`) to be enabled to have a visible effect.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_DISABLE_LOD = 19

Draws all of the objects at their highest polycount regardless of their distance from the camera. No low level of detail (LOD) is applied.

> enum_value DebugDraw.DEBUG_DRAW_CLUSTER_OMNI_LIGHTS = 20

Draws the cluster used by `OmniLight3D` nodes to optimize light rendering.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_CLUSTER_SPOT_LIGHTS = 21

Draws the cluster used by `SpotLight3D` nodes to optimize light rendering.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_CLUSTER_DECALS = 22

Draws the cluster used by `Decal` nodes to optimize decal rendering.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_CLUSTER_REFLECTION_PROBES = 23

Draws the cluster used by `ReflectionProbe` nodes to optimize reflection probes.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_OCCLUDERS = 24

Draws the buffer used for occlusion culling.
**Note:** Only supported when using the Forward+ or Mobile rendering methods.

> enum_value DebugDraw.DEBUG_DRAW_MOTION_VECTORS = 25

Draws vector lines over the viewport to indicate the movement of pixels between frames.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_INTERNAL_BUFFER = 26

Draws the internal resolution buffer of the scene in linear colorspace before tonemapping or post-processing is applied.
**Note:** Only supported when using the Forward+ or Mobile rendering methods.

> enum_value DebugDraw.DEBUG_DRAW_CLUSTER_AREA_LIGHTS = 27

Draws the cluster used by `AreaLight3D` nodes to optimize light rendering.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value DebugDraw.DEBUG_DRAW_AREA_LIGHT_ATLAS = 28

Draws the atlas used by `AreaLight3D` nodes in the upper left quadrant of the `Viewport`.
**Note:** Only supported when using the Forward+ or Mobile rendering method.

> enum DefaultCanvasItemTextureFilter

> enum_value DefaultCanvasItemTextureFilter.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST = 0

The texture filter reads from the nearest pixel only. This makes the texture look pixelated from up close, and grainy from a distance (due to mipmaps not being sampled).

> enum_value DefaultCanvasItemTextureFilter.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_LINEAR = 1

The texture filter blends between the nearest 4 pixels. This makes the texture look smooth from up close, and grainy from a distance (due to mipmaps not being sampled).

> enum_value DefaultCanvasItemTextureFilter.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_LINEAR_WITH_MIPMAPS = 2

The texture filter blends between the nearest 4 pixels and between the nearest 2 mipmaps (or uses the nearest mipmap if `ProjectSettings.rendering/textures/default_filters/use_nearest_mipmap_filter` is `true`). This makes the texture look smooth from up close, and smooth from a distance.
Use this for non-pixel art textures that may be viewed at a low scale (e.g. due to `Camera2D` zoom or sprite scaling), as mipmaps are important to smooth out pixels that are smaller than on-screen pixels.

> enum_value DefaultCanvasItemTextureFilter.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST_WITH_MIPMAPS = 3

The texture filter reads from the nearest pixel and blends between the nearest 2 mipmaps (or uses the nearest mipmap if `ProjectSettings.rendering/textures/default_filters/use_nearest_mipmap_filter` is `true`). This makes the texture look pixelated from up close, and smooth from a distance.
Use this for non-pixel art textures that may be viewed at a low scale (e.g. due to `Camera2D` zoom or sprite scaling), as mipmaps are important to smooth out pixels that are smaller than on-screen pixels.

> enum_value DefaultCanvasItemTextureFilter.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_PARENT_NODE = 4

The `Viewport` will inherit the filter from its parent `CanvasItem` or `Viewport`.

> enum_value DefaultCanvasItemTextureFilter.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_MAX = 5

Represents the size of the `DefaultCanvasItemTextureFilter` enum.

> enum DefaultCanvasItemTextureRepeat

> enum_value DefaultCanvasItemTextureRepeat.DEFAULT_CANVAS_ITEM_TEXTURE_REPEAT_DISABLED = 0

Disables textures repeating. Instead, when reading UVs outside the 0-1 range, the value will be clamped to the edge of the texture, resulting in a stretched out look at the borders of the texture.

> enum_value DefaultCanvasItemTextureRepeat.DEFAULT_CANVAS_ITEM_TEXTURE_REPEAT_ENABLED = 1

Enables the texture to repeat when UV coordinates are outside the 0-1 range. If using one of the linear filtering modes, this can result in artifacts at the edges of a texture when the sampler filters across the edges of the texture.

> enum_value DefaultCanvasItemTextureRepeat.DEFAULT_CANVAS_ITEM_TEXTURE_REPEAT_MIRROR = 2

Flip the texture when repeating so that the edge lines up instead of abruptly changing.

> enum_value DefaultCanvasItemTextureRepeat.DEFAULT_CANVAS_ITEM_TEXTURE_REPEAT_PARENT_NODE = 3

The `Viewport` will inherit the repeat mode from its parent `CanvasItem` or `Viewport`.

> enum_value DefaultCanvasItemTextureRepeat.DEFAULT_CANVAS_ITEM_TEXTURE_REPEAT_MAX = 4

Represents the size of the `DefaultCanvasItemTextureRepeat` enum.

> enum MSAA

> enum_value MSAA.MSAA_DISABLED = 0

Multisample antialiasing mode disabled. This is the default value, and is also the fastest setting.

> enum_value MSAA.MSAA_2X = 1

Use 2× Multisample Antialiasing. This has a moderate performance cost. It helps reduce aliasing noticeably, but 4× MSAA still looks substantially better.

> enum_value MSAA.MSAA_4X = 2

Use 4× Multisample Antialiasing. This has a significant performance cost, and is generally a good compromise between performance and quality.

> enum_value MSAA.MSAA_8X = 3

Use 8× Multisample Antialiasing. This has a very high performance cost. The difference between 4× and 8× MSAA may not always be visible in real gameplay conditions. Likely unsupported on low-end and older hardware.

> enum_value MSAA.MSAA_MAX = 4

Represents the size of the `MSAA` enum.

> enum PositionalShadowAtlasQuadrantSubdiv

> enum_value PositionalShadowAtlasQuadrantSubdiv.SHADOW_ATLAS_QUADRANT_SUBDIV_DISABLED = 0

This quadrant will not be used.

> enum_value PositionalShadowAtlasQuadrantSubdiv.SHADOW_ATLAS_QUADRANT_SUBDIV_1 = 1

This quadrant will only be used by one shadow map.

> enum_value PositionalShadowAtlasQuadrantSubdiv.SHADOW_ATLAS_QUADRANT_SUBDIV_4 = 2

This quadrant will be split in 4 and used by up to 4 shadow maps.

> enum_value PositionalShadowAtlasQuadrantSubdiv.SHADOW_ATLAS_QUADRANT_SUBDIV_16 = 3

This quadrant will be split 16 ways and used by up to 16 shadow maps.

> enum_value PositionalShadowAtlasQuadrantSubdiv.SHADOW_ATLAS_QUADRANT_SUBDIV_64 = 4

This quadrant will be split 64 ways and used by up to 64 shadow maps.

> enum_value PositionalShadowAtlasQuadrantSubdiv.SHADOW_ATLAS_QUADRANT_SUBDIV_256 = 5

This quadrant will be split 256 ways and used by up to 256 shadow maps. Unless the `positional_shadow_atlas_size` is very high, the shadows in this quadrant will be very low resolution.

> enum_value PositionalShadowAtlasQuadrantSubdiv.SHADOW_ATLAS_QUADRANT_SUBDIV_1024 = 6

This quadrant will be split 1024 ways and used by up to 1024 shadow maps. Unless the `positional_shadow_atlas_size` is very high, the shadows in this quadrant will be very low resolution.

> enum_value PositionalShadowAtlasQuadrantSubdiv.SHADOW_ATLAS_QUADRANT_SUBDIV_MAX = 7

Represents the size of the `PositionalShadowAtlasQuadrantSubdiv` enum.

> enum RenderInfo

> enum_value RenderInfo.RENDER_INFO_OBJECTS_IN_FRAME = 0

Amount of objects in frame.

> enum_value RenderInfo.RENDER_INFO_PRIMITIVES_IN_FRAME = 1

Amount of vertices in frame.

> enum_value RenderInfo.RENDER_INFO_DRAW_CALLS_IN_FRAME = 2

Amount of draw calls in frame.

> enum_value RenderInfo.RENDER_INFO_MAX = 3

Represents the size of the `RenderInfo` enum.

> enum RenderInfoType

> enum_value RenderInfoType.RENDER_INFO_TYPE_VISIBLE = 0

Visible render pass (excluding shadows).

> enum_value RenderInfoType.RENDER_INFO_TYPE_SHADOW = 1

Shadow render pass. Objects will be rendered several times depending on the number of amounts of lights with shadows and the number of directional shadow splits.

> enum_value RenderInfoType.RENDER_INFO_TYPE_CANVAS = 2

Canvas item rendering. This includes all 2D rendering.

> enum_value RenderInfoType.RENDER_INFO_TYPE_MAX = 3

Represents the size of the `RenderInfoType` enum.

> enum SDFOversize

> enum_value SDFOversize.SDF_OVERSIZE_100_PERCENT = 0

The signed distance field only covers the viewport's own rectangle.

> enum_value SDFOversize.SDF_OVERSIZE_120_PERCENT = 1

The signed distance field is expanded to cover 20% of the viewport's size around the borders.

> enum_value SDFOversize.SDF_OVERSIZE_150_PERCENT = 2

The signed distance field is expanded to cover 50% of the viewport's size around the borders.

> enum_value SDFOversize.SDF_OVERSIZE_200_PERCENT = 3

The signed distance field is expanded to cover 100% (double) of the viewport's size around the borders.

> enum_value SDFOversize.SDF_OVERSIZE_MAX = 4

Represents the size of the `SDFOversize` enum.

> enum SDFScale

> enum_value SDFScale.SDF_SCALE_100_PERCENT = 0

The signed distance field is rendered at full resolution.

> enum_value SDFScale.SDF_SCALE_50_PERCENT = 1

The signed distance field is rendered at half the resolution of this viewport.

> enum_value SDFScale.SDF_SCALE_25_PERCENT = 2

The signed distance field is rendered at a quarter the resolution of this viewport.

> enum_value SDFScale.SDF_SCALE_MAX = 3

Represents the size of the `SDFScale` enum.

> enum Scaling3DMode

> enum_value Scaling3DMode.SCALING_3D_MODE_BILINEAR = 0

Use bilinear scaling for the viewport's 3D buffer. The amount of scaling can be set using `scaling_3d_scale`. Values less than `1.0` will result in undersampling while values greater than `1.0` will result in supersampling. A value of `1.0` disables scaling.

> enum_value Scaling3DMode.SCALING_3D_MODE_FSR = 1

Use AMD FidelityFX Super Resolution 1.0 upscaling for the viewport's 3D buffer. The amount of scaling can be set using `scaling_3d_scale`. Values less than `1.0` will result in the viewport being upscaled using FSR. Values greater than `1.0` are not supported and bilinear downsampling will be used instead. A value of `1.0` disables scaling.

> enum_value Scaling3DMode.SCALING_3D_MODE_FSR2 = 2

Use AMD FidelityFX Super Resolution 2.2 upscaling for the viewport's 3D buffer. The amount of scaling can be set using `Viewport.scaling_3d_scale`. Values less than `1.0` will result in the viewport being upscaled using FSR2. Values greater than `1.0` are not supported and bilinear downsampling will be used instead. A value of `1.0` will use FSR2 at native resolution as a TAA solution.

> enum_value Scaling3DMode.SCALING_3D_MODE_METALFX_SPATIAL = 3

Use the [MetalFX spatial upscaler](https://developer.apple.com/documentation/metalfx/mtlfxspatialscaler#overview) for the viewport's 3D buffer.
The amount of scaling can be set using `scaling_3d_scale`.
Values less than `1.0` will result in the viewport being upscaled using MetalFX. Values greater than `1.0` are not supported and bilinear downsampling will be used instead. A value of `1.0` disables scaling.
More information: [MetalFX](https://developer.apple.com/documentation/metalfx).
**Note:** Only supported when the Metal rendering driver is in use, which limits this scaling mode to macOS and iOS.

> enum_value Scaling3DMode.SCALING_3D_MODE_METALFX_TEMPORAL = 4

Use the [MetalFX temporal upscaler](https://developer.apple.com/documentation/metalfx/mtlfxtemporalscaler#overview) for the viewport's 3D buffer.
The amount of scaling can be set using `scaling_3d_scale`. To determine the minimum input scale, use the `RenderingDevice.limit_get` method with `RenderingDevice.LIMIT_METALFX_TEMPORAL_SCALER_MIN_SCALE`.
Values less than `1.0` will result in the viewport being upscaled using MetalFX. Values greater than `1.0` are not supported and bilinear downsampling will be used instead. A value of `1.0` will use MetalFX at native resolution as a TAA solution.
More information: [MetalFX](https://developer.apple.com/documentation/metalfx).
**Note:** Only supported when the Metal rendering driver is in use, which limits this scaling mode to macOS and iOS.

> enum_value Scaling3DMode.SCALING_3D_MODE_NEAREST = 5

Use nearest-neighbor filtering for the viewport's 3D buffer. This looks crisper than `SCALING_3D_MODE_BILINEAR` and has no additional rendering cost. The amount of scaling can be set using `scaling_3d_scale`. Values greater than `1.0` are not supported and bilinear downsampling will be used instead. A value of `1.0` disables scaling.
**Note:** When using the **Nearest** scaling mode, to avoid uneven pixel scaling, it's highly recommended to use a value equal to an integer divisor with a dividend of `1`. For example, it's best to use a scale of `0.5` (1/2), `0.3333` (1/3), `0.25` (1/4), `0.2` (1/5), and so on.

> enum_value Scaling3DMode.SCALING_3D_MODE_MAX = 6

Represents the size of the `Scaling3DMode` enum.

> enum ScreenSpaceAA

> enum_value ScreenSpaceAA.SCREEN_SPACE_AA_DISABLED = 0

Do not perform any antialiasing in the full screen post-process.

> enum_value ScreenSpaceAA.SCREEN_SPACE_AA_FXAA = 1

Use fast approximate antialiasing. FXAA is a popular screen-space antialiasing method, which is fast but will make the image look blurry, especially at lower resolutions. It can still work relatively well at large resolutions such as 1440p and 4K.

> enum_value ScreenSpaceAA.SCREEN_SPACE_AA_SMAA = 2

Use subpixel morphological antialiasing. SMAA may produce clearer results than FXAA, but at a slightly higher performance cost.

> enum_value ScreenSpaceAA.SCREEN_SPACE_AA_MAX = 3

Represents the size of the `ScreenSpaceAA` enum.

> enum VRSMode

> enum_value VRSMode.VRS_DISABLED = 0

Variable Rate Shading is disabled.

> enum_value VRSMode.VRS_TEXTURE = 1

Variable Rate Shading uses a texture. Note, for stereoscopic use a texture atlas with a texture for each view.

> enum_value VRSMode.VRS_XR = 2

Variable Rate Shading's texture is supplied by the primary `XRInterface`.

> enum_value VRSMode.VRS_MAX = 3

Represents the size of the `VRSMode` enum.

> enum VRSUpdateMode

> enum_value VRSUpdateMode.VRS_UPDATE_DISABLED = 0

The input texture for variable rate shading will not be processed.

> enum_value VRSUpdateMode.VRS_UPDATE_ONCE = 1

The input texture for variable rate shading will be processed once.

> enum_value VRSUpdateMode.VRS_UPDATE_ALWAYS = 2

The input texture for variable rate shading will be processed each frame.

> enum_value VRSUpdateMode.VRS_UPDATE_MAX = 3

Represents the size of the `VRSUpdateMode` enum.

## Tutorials
- [Using Viewports]($DOCS_URL/tutorials/rendering/viewports.html)
- [Viewport and canvas transforms]($DOCS_URL/tutorials/2d/2d_transforms.html)
- [GUI in 3D Viewport Demo](https://godotengine.org/asset-library/asset/2807)
- [3D in 2D Viewport Demo](https://godotengine.org/asset-library/asset/2804)
- [2D in 3D Viewport Demo](https://godotengine.org/asset-library/asset/2803)
- [Screen Capture Demo](https://godotengine.org/asset-library/asset/2808)
- [Dynamic Split Screen Demo](https://godotengine.org/asset-library/asset/2806)
- [3D Resolution Scaling Demo](https://godotengine.org/asset-library/asset/2805)
