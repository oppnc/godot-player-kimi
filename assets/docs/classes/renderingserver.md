# RenderingServer

> class RenderingServer
> inherits RenderingServer Object

## Brief

Server for anything visible.

## Description

The rendering server is the API backend for everything visible. The whole scene system mounts on it to display. The rendering server is completely opaque: the internals are entirely implementation-specific and cannot be accessed.
The rendering server can be used to bypass the scene/`Node` system entirely. This can improve performance in cases where the scene system is the bottleneck, but won't improve performance otherwise (for instance, if the GPU is already fully utilized).
Resources are created using the `*_create` functions. These functions return `RID`s which are not references to the objects themselves, but opaque *pointers* towards these objects.
All objects are drawn to a viewport. You can use the `Viewport` attached to the `SceneTree` or you can create one yourself with `viewport_create`. When using a custom scenario or canvas, the scenario or canvas needs to be attached to the viewport using `viewport_set_scenario` or `viewport_attach_canvas`.
**Scenarios:** In 3D, all visual objects must be associated with a scenario. The scenario is a visual representation of the world. If accessing the rendering server from a running game, the scenario can be accessed from the scene tree from any `Node3D` node with `Node3D.get_world_3d`. Otherwise, a scenario can be created with `scenario_create`.
Similarly, in 2D, a canvas is needed to draw all canvas items.
**3D:** In 3D, all visible objects are comprised of a resource and an instance. A resource can be a mesh, a particle system, a light, or any other 3D object. In order to be visible resources must be attached to an instance using `instance_set_base`. The instance must also be attached to the scenario using `instance_set_scenario` in order to be visible. RenderingServer methods that don't have a prefix are usually 3D-specific (but not always).
**2D:** In 2D, all visible objects are some form of canvas item. In order to be visible, a canvas item needs to be the child of a canvas attached to a viewport, or it needs to be the child of another canvas item that is eventually attached to the canvas. 2D-specific RenderingServer methods generally start with `canvas_*`.
**Headless mode:** Starting the engine with the `--headless` [command line argument]($DOCS_URL/tutorials/editor/command_line_tutorial.html) disables all rendering and window management functions. Most functions from `RenderingServer` will return dummy values in this case.

## Properties

> property render_loop_enabled : bool ; setter=set_render_loop_enabled ; getter=is_render_loop_enabled

If `false`, disables rendering completely, but the engine logic is still being processed. You can call `force_draw` to draw a frame even with rendering disabled.

## Methods

> method area_light_create() -> RID

Creates a new area light and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID can be used in most `light_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
To place in a scene, attach this area light to an instance using `instance_set_base` using the returned RID.
**Note:** The equivalent node is `AreaLight3D`.

> method bake_render_uv2(base: RID, material_overrides: Array[RID], image_size: Vector2i) -> Array[Image]

Bakes the material data of the Mesh passed in the `base` parameter with optional `material_overrides` to a set of `Image`s of size `image_size`. Returns an array of `Image`s containing material properties as specified in `BakeChannels`.

> method call_on_render_thread(callable: Callable) -> void

As the RenderingServer actual logic may run on a separate thread, accessing its internals from the main (or any other) thread will result in errors. To make it easier to run code that can safely access the rendering internals (such as `RenderingDevice` and similar RD classes), push a callable via this function so it will be executed on the render thread.

> method camera_attributes_create() -> RID

Creates a camera attributes object and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `camera_attributes_` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent resource is `CameraAttributes`.

> method camera_attributes_set_auto_exposure(camera_attributes: RID, enable: bool, min_sensitivity: float, max_sensitivity: float, speed: float, scale: float) -> void

Sets the parameters to use with the auto-exposure effect. These parameters take on the same meaning as their counterparts in `CameraAttributes` and `CameraAttributesPractical`.

> method camera_attributes_set_dof_blur(camera_attributes: RID, far_enable: bool, far_distance: float, far_transition: float, near_enable: bool, near_distance: float, near_transition: float, amount: float) -> void

Sets the parameters to use with the DOF blur effect. These parameters take on the same meaning as their counterparts in `CameraAttributesPractical`.

> method camera_attributes_set_dof_blur_bokeh_shape(shape: DOFBokehShape) -> void

Sets the shape of the DOF bokeh pattern to `shape`. Different shapes may be used to achieve artistic effect, or to meet performance targets.

> method camera_attributes_set_dof_blur_quality(quality: DOFBlurQuality, use_jitter: bool) -> void

Sets the quality level of the DOF blur effect to `quality`. `use_jitter` can be used to jitter samples taken during the blur pass to hide artifacts at the cost of looking more fuzzy.

> method camera_attributes_set_exposure(camera_attributes: RID, multiplier: float, normalization: float) -> void

Sets the exposure values that will be used by the renderers. The normalization amount is used to bake a given Exposure Value (EV) into rendering calculations to reduce the dynamic range of the scene.
The normalization factor can be calculated from exposure value (EV100) as follows:

```text
                func get_exposure_normalization(ev100: float):
                    return 1.0 / (pow(2.0, ev100) * 1.2)

```

The exposure value can be calculated from aperture (in f-stops), shutter speed (in seconds), and sensitivity (in ISO) as follows:

```text
                func get_exposure(aperture: float, shutter_speed: float, sensitivity: float):
                    return log((aperture * aperture) / shutter_speed * (100.0 / sensitivity)) / log(2)

```

> method camera_create() -> RID

Creates a 3D camera and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `camera_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent node is `Camera3D`.

> method camera_set_camera_attributes(camera: RID, effects: RID) -> void

Sets the camera_attributes created with `camera_attributes_create` to the given camera.

> method camera_set_compositor(camera: RID, compositor: RID) -> void

Sets the compositor used by this camera. Equivalent to `Camera3D.compositor`.

> method camera_set_cull_mask(camera: RID, layers: int) -> void

Sets the cull mask associated with this camera. The cull mask describes which 3D layers are rendered by this camera. Equivalent to `Camera3D.cull_mask`.

> method camera_set_environment(camera: RID, env: RID) -> void

Sets the environment used by this camera. Equivalent to `Camera3D.environment`.

> method camera_set_frustum(camera: RID, size: float, offset: Vector2, z_near: float, z_far: float) -> void

Sets camera to use frustum projection. This mode allows adjusting the `offset` argument to create "tilted frustum" effects.

> method camera_set_orthogonal(camera: RID, size: float, z_near: float, z_far: float) -> void

Sets camera to use orthogonal projection, also known as orthographic projection. Objects remain the same size on the screen no matter how far away they are.

> method camera_set_perspective(camera: RID, fovy_degrees: float, z_near: float, z_far: float) -> void

Sets camera to use perspective projection. Objects on the screen becomes smaller when they are far away.

> method camera_set_transform(camera: RID, transform: Transform3D) -> void

Sets `Transform3D` of camera.

> method camera_set_use_vertical_aspect(camera: RID, enable: bool) -> void

If `true`, preserves the horizontal aspect ratio which is equivalent to `Camera3D.KEEP_WIDTH`. If `false`, preserves the vertical aspect ratio which is equivalent to `Camera3D.KEEP_HEIGHT`.

> method canvas_create() -> RID

Creates a canvas and returns the assigned `RID`. It can be accessed with the RID that is returned. This RID will be used in all `canvas_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
Canvas has no `Resource` or `Node` equivalent.

> method canvas_item_add_animation_slice(item: RID, animation_length: float, slice_begin: float, slice_end: float, offset: float = 0.0) -> void

Subsequent drawing commands will be ignored unless they fall within the specified animation slice. This is a faster way to implement animations that loop on background rather than redrawing constantly.

> method canvas_item_add_circle(item: RID, pos: Vector2, radius: float, color: Color, antialiased: bool = false) -> void

Draws a circle on the `CanvasItem` pointed to by the `item` `RID`. See also `CanvasItem.draw_circle`.

> method canvas_item_add_clip_ignore(item: RID, ignore: bool) -> void

If `ignore` is `true`, ignore clipping on items drawn with this canvas item until this is called again with `ignore` set to `false`.

> method canvas_item_add_ellipse(item: RID, pos: Vector2, major: float, minor: float, color: Color, antialiased: bool = false) -> void

Draws an ellipse with semi-major axis `major` and semi-minor axis `minor` on the `CanvasItem` pointed to by the `item` `RID`. See also `CanvasItem.draw_ellipse`.

> method canvas_item_add_lcd_texture_rect_region(item: RID, rect: Rect2, texture: RID, src_rect: Rect2, modulate: Color) -> void

See also `CanvasItem.draw_lcd_texture_rect_region`.

> method canvas_item_add_line(item: RID, from: Vector2, to: Vector2, color: Color, width: float = -1.0, antialiased: bool = false) -> void

Draws a line on the `CanvasItem` pointed to by the `item` `RID`. See also `CanvasItem.draw_line`.

> method canvas_item_add_mesh(item: RID, mesh: RID, transform: Transform2D = Transform2D(1, 0, 0, 1, 0, 0), modulate: Color = Color(1, 1, 1, 1), texture: RID = RID()) -> void

Draws a mesh created with `mesh_create` with given `transform`, `modulate` color, and `texture`. This is used internally by `MeshInstance2D`.

> method canvas_item_add_msdf_texture_rect_region(item: RID, rect: Rect2, texture: RID, src_rect: Rect2, modulate: Color = Color(1, 1, 1, 1), outline_size: int = 0, px_range: float = 1.0, scale: float = 1.0) -> void

See also `CanvasItem.draw_msdf_texture_rect_region`.

> method canvas_item_add_multiline(item: RID, points: PackedVector2Array, colors: PackedColorArray, width: float = -1.0, antialiased: bool = false) -> void

Draws a 2D multiline on the `CanvasItem` pointed to by the `item` `RID`. See also `CanvasItem.draw_multiline` and `CanvasItem.draw_multiline_colors`.

> method canvas_item_add_multimesh(item: RID, mesh: RID, texture: RID = RID()) -> void

Draws a 2D `MultiMesh` on the `CanvasItem` pointed to by the `item` `RID`. See also `CanvasItem.draw_multimesh`.

> method canvas_item_add_nine_patch(item: RID, rect: Rect2, source: Rect2, texture: RID, topleft: Vector2, bottomright: Vector2, x_axis_mode: NinePatchAxisMode = 0, y_axis_mode: NinePatchAxisMode = 0, draw_center: bool = true, modulate: Color = Color(1, 1, 1, 1)) -> void

Draws a nine-patch rectangle on the `CanvasItem` pointed to by the `item` `RID`.

> method canvas_item_add_particles(item: RID, particles: RID, texture: RID) -> void

Draws particles on the `CanvasItem` pointed to by the `item` `RID`.

> method canvas_item_add_polygon(item: RID, points: PackedVector2Array, colors: PackedColorArray, uvs: PackedVector2Array = PackedVector2Array(), texture: RID = RID()) -> void

Draws a 2D polygon on the `CanvasItem` pointed to by the `item` `RID`. If you need more flexibility (such as being able to use bones), use `canvas_item_add_triangle_array` instead. See also `CanvasItem.draw_polygon`.
**Note:** If you frequently redraw the same polygon with a large number of vertices, consider pre-calculating the triangulation with `Geometry2D.triangulate_polygon` and using `CanvasItem.draw_mesh`, `CanvasItem.draw_multimesh`, or `canvas_item_add_triangle_array`.

> method canvas_item_add_polyline(item: RID, points: PackedVector2Array, colors: PackedColorArray, width: float = -1.0, antialiased: bool = false) -> void

Draws a 2D polyline on the `CanvasItem` pointed to by the `item` `RID`. See also `CanvasItem.draw_polyline` and `CanvasItem.draw_polyline_colors`.

> method canvas_item_add_primitive(item: RID, points: PackedVector2Array, colors: PackedColorArray, uvs: PackedVector2Array, texture: RID) -> void

Draws a 2D primitive on the `CanvasItem` pointed to by the `item` `RID`. See also `CanvasItem.draw_primitive`.

> method canvas_item_add_rect(item: RID, rect: Rect2, color: Color, antialiased: bool = false) -> void

Draws a rectangle on the `CanvasItem` pointed to by the `item` `RID`. See also `CanvasItem.draw_rect`.

> method canvas_item_add_set_transform(item: RID, transform: Transform2D) -> void

Sets a `Transform2D` that will be used to transform subsequent canvas item commands.

> method canvas_item_add_texture_rect(item: RID, rect: Rect2, texture: RID, tile: bool = false, modulate: Color = Color(1, 1, 1, 1), transpose: bool = false) -> void

Draws a 2D textured rectangle on the `CanvasItem` pointed to by the `item` `RID`. See also `CanvasItem.draw_texture_rect` and `Texture2D.draw_rect`.

> method canvas_item_add_texture_rect_region(item: RID, rect: Rect2, texture: RID, src_rect: Rect2, modulate: Color = Color(1, 1, 1, 1), transpose: bool = false, clip_uv: bool = true) -> void

Draws the specified region of a 2D textured rectangle on the `CanvasItem` pointed to by the `item` `RID`. See also `CanvasItem.draw_texture_rect_region` and `Texture2D.draw_rect_region`.

> method canvas_item_add_triangle_array(item: RID, indices: PackedInt32Array, points: PackedVector2Array, colors: PackedColorArray, uvs: PackedVector2Array = PackedVector2Array(), bones: PackedInt32Array = PackedInt32Array(), weights: PackedFloat32Array = PackedFloat32Array(), texture: RID = RID(), count: int = -1) -> void

Draws a triangle array on the `CanvasItem` pointed to by the `item` `RID`. This is internally used by `Line2D` and `StyleBoxFlat` for rendering. `canvas_item_add_triangle_array` is highly flexible, but more complex to use than `canvas_item_add_polygon`.
**Note:** If `count` is set to a non-negative value, only the first `count * 3` indices (corresponding to `count` triangles) will be drawn. Otherwise, all indices are drawn.

> method canvas_item_attach_skeleton(item: RID, skeleton: RID) -> void

Attaches a skeleton to the `CanvasItem`. Removes the previous skeleton.

> method canvas_item_clear(item: RID) -> void

Clears the `CanvasItem` and removes all commands in it.

> method canvas_item_create() -> RID

Creates a new CanvasItem instance and returns its `RID`. It can be accessed with the RID that is returned. This RID will be used in all `canvas_item_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent node is `CanvasItem`.

> method canvas_item_get_instance_shader_parameter(instance: RID, parameter: StringName) -> Variant ; qualifiers=const

Returns the value of the per-instance shader uniform from the specified canvas item instance. Equivalent to `CanvasItem.get_instance_shader_parameter`.

> method canvas_item_get_instance_shader_parameter_default_value(instance: RID, parameter: StringName) -> Variant ; qualifiers=const

Returns the default value of the per-instance shader uniform from the specified canvas item instance. Equivalent to `CanvasItem.get_instance_shader_parameter`.

> method canvas_item_get_instance_shader_parameter_list(instance: RID) -> Array[Dictionary] ; qualifiers=const

Returns a dictionary of per-instance shader uniform names of the per-instance shader uniform from the specified canvas item instance.
The returned dictionary is in PropertyInfo format, with the keys `name`, `class_name`, `type`, `hint`, `hint_string`, and `usage`.

> method canvas_item_reset_physics_interpolation(item: RID) -> void

Prevents physics interpolation for the current physics tick.
This is useful when moving a canvas item to a new location, to give an instantaneous change rather than interpolation from the previous location.

> method canvas_item_set_canvas_group_mode(item: RID, mode: CanvasGroupMode, clear_margin: float = 5.0, fit_empty: bool = false, fit_margin: float = 0.0, blur_mipmaps: bool = false) -> void

Sets the canvas group mode used during 2D rendering for the canvas item specified by the `item` RID. For faster but more limited clipping, use `canvas_item_set_clip` instead.
**Note:** The equivalent node functionality is found in `CanvasGroup` and `CanvasItem.clip_children`.

> method canvas_item_set_clip(item: RID, clip: bool) -> void

If `clip` is `true`, makes the canvas item specified by the `item` RID not draw anything outside of its rect's coordinates. This clipping is fast, but works only with axis-aligned rectangles. This means that rotation is ignored by the clipping rectangle. For more advanced clipping shapes, use `canvas_item_set_canvas_group_mode` instead.
**Note:** The equivalent node functionality is found in `Label.clip_text`, `RichTextLabel` (always enabled) and more.

> method canvas_item_set_copy_to_backbuffer(item: RID, enabled: bool, rect: Rect2) -> void

Sets the `CanvasItem` to copy a rect to the backbuffer.

> method canvas_item_set_custom_rect(item: RID, use_custom_rect: bool, rect: Rect2 = Rect2(0, 0, 0, 0)) -> void

If `use_custom_rect` is `true`, sets the custom visibility rectangle (used for culling) to `rect` for the canvas item specified by `item`. Setting a custom visibility rect can reduce CPU load when drawing lots of 2D instances. If `use_custom_rect` is `false`, automatically computes a visibility rectangle based on the canvas item's draw commands.

> method canvas_item_set_default_texture_filter(item: RID, filter: CanvasItemTextureFilter) -> void

Sets the default texture filter mode for the canvas item specified by the `item` RID. Equivalent to `CanvasItem.texture_filter`.

> method canvas_item_set_default_texture_repeat(item: RID, repeat: CanvasItemTextureRepeat) -> void

Sets the default texture repeat mode for the canvas item specified by the `item` RID. Equivalent to `CanvasItem.texture_repeat`.

> method canvas_item_set_distance_field_mode(item: RID, enabled: bool) -> void

If `enabled` is `true`, enables multichannel signed distance field rendering mode for the canvas item specified by the `item` RID. This is meant to be used for font rendering, or with specially generated images using [msdfgen](https://github.com/Chlumsky/msdfgen).

> method canvas_item_set_draw_behind_parent(item: RID, enabled: bool) -> void

If `enabled` is `true`, draws the canvas item specified by the `item` RID behind its parent. Equivalent to `CanvasItem.show_behind_parent`.

> method canvas_item_set_draw_index(item: RID, index: int) -> void

Sets the index for the `CanvasItem`.

> method canvas_item_set_instance_shader_parameter(instance: RID, parameter: StringName, value: Variant) -> void

Sets the per-instance shader uniform on the specified canvas item instance. Equivalent to `CanvasItem.set_instance_shader_parameter`.

> method canvas_item_set_interpolated(item: RID, interpolated: bool) -> void

If `interpolated` is `true`, turns on physics interpolation for the canvas item.

> method canvas_item_set_light_mask(item: RID, mask: int) -> void

Sets the light `mask` for the canvas item specified by the `item` RID. Equivalent to `CanvasItem.light_mask`.

> method canvas_item_set_material(item: RID, material: RID) -> void

Sets a new `material` to the canvas item specified by the `item` RID. Equivalent to `CanvasItem.material`.

> method canvas_item_set_modulate(item: RID, color: Color) -> void

Multiplies the color of the canvas item specified by the `item` RID, while affecting its children. See also `canvas_item_set_self_modulate`. Equivalent to `CanvasItem.modulate`.

> method canvas_item_set_parent(item: RID, parent: RID) -> void

Sets a parent `CanvasItem` to the `CanvasItem`. The item will inherit transform, modulation and visibility from its parent, like `CanvasItem` nodes in the scene tree.

> method canvas_item_set_self_modulate(item: RID, color: Color) -> void

Multiplies the color of the canvas item specified by the `item` RID, without affecting its children. See also `canvas_item_set_modulate`. Equivalent to `CanvasItem.self_modulate`.

> method canvas_item_set_sort_children_by_y(item: RID, enabled: bool) -> void

If `enabled` is `true`, child nodes with the lowest Y position are drawn before those with a higher Y position. Y-sorting only affects children that inherit from the canvas item specified by the `item` RID, not the canvas item itself. Equivalent to `CanvasItem.y_sort_enabled`.

> method canvas_item_set_transform(item: RID, transform: Transform2D) -> void

Sets the `transform` of the canvas item specified by the `item` RID. This affects where and how the item will be drawn. Child canvas items' transforms are multiplied by their parent's transform. Equivalent to `Node2D.transform`.

> method canvas_item_set_use_parent_material(item: RID, enabled: bool) -> void

Sets if the `CanvasItem` uses its parent's material.

> method canvas_item_set_visibility_layer(item: RID, visibility_layer: int) -> void

Sets the rendering visibility layer associated with this `CanvasItem`. Only `Viewport` nodes with a matching rendering mask will render this `CanvasItem`.

> method canvas_item_set_visibility_notifier(item: RID, enable: bool, area: Rect2, enter_callable: Callable, exit_callable: Callable) -> void

Sets the given `CanvasItem` as visibility notifier. `area` defines the area of detecting visibility. `enter_callable` is called when the `CanvasItem` enters the screen, `exit_callable` is called when the `CanvasItem` exits the screen. If `enable` is `false`, the item will no longer function as notifier.
This method can be used to manually mimic `VisibleOnScreenNotifier2D`.

> method canvas_item_set_visible(item: RID, visible: bool) -> void

Sets the visibility of the `CanvasItem`.

> method canvas_item_set_z_as_relative_to_parent(item: RID, enabled: bool) -> void

If this is enabled, the Z index of the parent will be added to the children's Z index.

> method canvas_item_set_z_index(item: RID, z_index: int) -> void

Sets the `CanvasItem`'s Z index, i.e. its draw order (lower indexes are drawn first).

> method canvas_item_transform_physics_interpolation(item: RID, transform: Transform2D) -> void

Transforms both the current and previous stored transform for a canvas item.
This allows transforming a canvas item without creating a "glitch" in the interpolation, which is particularly useful for large worlds utilizing a shifting origin.

> method canvas_light_attach_to_canvas(light: RID, canvas: RID) -> void

Attaches the canvas light to the canvas. Removes it from its previous canvas.

> method canvas_light_create() -> RID

Creates a canvas light and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `canvas_light_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent node is `Light2D`.

> method canvas_light_occluder_attach_to_canvas(occluder: RID, canvas: RID) -> void

Attaches a light occluder to the canvas. Removes it from its previous canvas.

> method canvas_light_occluder_create() -> RID

Creates a light occluder and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `canvas_light_occluder_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent node is `LightOccluder2D`.

> method canvas_light_occluder_reset_physics_interpolation(occluder: RID) -> void

Prevents physics interpolation for the current physics tick.
This is useful when moving an occluder to a new location, to give an instantaneous change rather than interpolation from the previous location.

> method canvas_light_occluder_set_as_sdf_collision(occluder: RID, enable: bool) -> void

Enables or disables using the light occluder as a signed distance field for 2D particle collision.

> method canvas_light_occluder_set_enabled(occluder: RID, enabled: bool) -> void

Enables or disables light occluder.

> method canvas_light_occluder_set_interpolated(occluder: RID, interpolated: bool) -> void

If `interpolated` is `true`, turns on physics interpolation for the light occluder.

> method canvas_light_occluder_set_light_mask(occluder: RID, mask: int) -> void

The light mask. See `LightOccluder2D` for more information on light masks.

> method canvas_light_occluder_set_polygon(occluder: RID, polygon: RID) -> void

Sets a light occluder's polygon.

> method canvas_light_occluder_set_transform(occluder: RID, transform: Transform2D) -> void

Sets a light occluder's `Transform2D`.

> method canvas_light_occluder_transform_physics_interpolation(occluder: RID, transform: Transform2D) -> void

Transforms both the current and previous stored transform for a light occluder.
This allows transforming an occluder without creating a "glitch" in the interpolation, which is particularly useful for large worlds utilizing a shifting origin.

> method canvas_light_reset_physics_interpolation(light: RID) -> void

Prevents physics interpolation for the current physics tick.
This is useful when moving a canvas item to a new location, to give an instantaneous change rather than interpolation from the previous location.

> method canvas_light_set_blend_mode(light: RID, mode: CanvasLightBlendMode) -> void

Sets the blend mode for the given canvas light to `mode`. Equivalent to `Light2D.blend_mode`.

> method canvas_light_set_color(light: RID, color: Color) -> void

Sets the color for a light.

> method canvas_light_set_enabled(light: RID, enabled: bool) -> void

Enables or disables a canvas light.

> method canvas_light_set_energy(light: RID, energy: float) -> void

Sets a canvas light's energy.

> method canvas_light_set_height(light: RID, height: float) -> void

Sets a canvas light's height.

> method canvas_light_set_interpolated(light: RID, interpolated: bool) -> void

If `interpolated` is `true`, turns on physics interpolation for the canvas light.

> method canvas_light_set_item_cull_mask(light: RID, mask: int) -> void

The light mask. See `LightOccluder2D` for more information on light masks.

> method canvas_light_set_item_shadow_cull_mask(light: RID, mask: int) -> void

The binary mask used to determine which layers this canvas light's shadows affects. See `LightOccluder2D` for more information on light masks.

> method canvas_light_set_layer_range(light: RID, min_layer: int, max_layer: int) -> void

The layer range that gets rendered with this light.

> method canvas_light_set_mode(light: RID, mode: CanvasLightMode) -> void

Sets the mode of the canvas light.

> method canvas_light_set_shadow_color(light: RID, color: Color) -> void

Sets the color of the canvas light's shadow.

> method canvas_light_set_shadow_enabled(light: RID, enabled: bool) -> void

Enables or disables the canvas light's shadow.

> method canvas_light_set_shadow_filter(light: RID, filter: CanvasLightShadowFilter) -> void

Sets the canvas light's shadow's filter.

> method canvas_light_set_shadow_smooth(light: RID, smooth: float) -> void

Smoothens the shadow. The lower, the smoother.

> method canvas_light_set_texture(light: RID, texture: RID) -> void

Sets the texture to be used by a `PointLight2D`. Equivalent to `PointLight2D.texture`.

> method canvas_light_set_texture_offset(light: RID, offset: Vector2) -> void

Sets the offset of a `PointLight2D`'s texture. Equivalent to `PointLight2D.offset`.

> method canvas_light_set_texture_scale(light: RID, scale: float) -> void

Sets the scale factor of a `PointLight2D`'s texture. Equivalent to `PointLight2D.texture_scale`.

> method canvas_light_set_transform(light: RID, transform: Transform2D) -> void

Sets the canvas light's `Transform2D`.

> method canvas_light_set_z_range(light: RID, min_z: int, max_z: int) -> void

Sets the Z range of objects that will be affected by this light. Equivalent to `Light2D.range_z_min` and `Light2D.range_z_max`.

> method canvas_light_transform_physics_interpolation(light: RID, transform: Transform2D) -> void

Transforms both the current and previous stored transform for a canvas light.
This allows transforming a light without creating a "glitch" in the interpolation, which is particularly useful for large worlds utilizing a shifting origin.

> method canvas_occluder_polygon_create() -> RID

Creates a new light occluder polygon and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `canvas_occluder_polygon_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent resource is `OccluderPolygon2D`.

> method canvas_occluder_polygon_set_cull_mode(occluder_polygon: RID, mode: CanvasOccluderPolygonCullMode) -> void

Sets an occluder polygon's cull mode.

> method canvas_occluder_polygon_set_shape(occluder_polygon: RID, shape: PackedVector2Array, closed: bool) -> void

Sets the shape of the occluder polygon.

> method canvas_set_disable_scale(disable: bool) -> void

If `disable` is `true`, makes 2D rendering ignore the canvas scale defined for each canvas layer. This affects `CanvasLayer`s with the `CanvasLayer.follow_viewport_enabled` property set to `true`.
In the editor, this is set to `true` by default, and set to `false` when **View > Preview Canvas Scale** is enabled at the top of the 2D editor viewport.
**Note:** Setting this to `true` does not impact the behavior of `CanvasLayer.scale`, `Node2D.scale`, or `Control.scale`.

> method canvas_set_item_mirroring(canvas: RID, item: RID, mirroring: Vector2) -> void

A copy of the canvas item will be drawn with a local offset of the `mirroring`.
**Note:** This is equivalent to calling `canvas_set_item_repeat` like `canvas_set_item_repeat(item, mirroring, 1)`, with an additional check ensuring `canvas` is a parent of `item`.

> method canvas_set_item_repeat(item: RID, repeat_size: Vector2, repeat_times: int) -> void

A copy of the canvas item will be drawn with a local offset of the `repeat_size` by the number of times of the `repeat_times`. As the `repeat_times` increases, the copies will spread away from the origin texture.

> method canvas_set_modulate(canvas: RID, color: Color) -> void

Modulates all colors in the given canvas.

> method canvas_set_shadow_texture_size(size: int) -> void

Sets the `ProjectSettings.rendering/2d/shadow_atlas/size` to use for `Light2D` shadow rendering (in pixels). The value is rounded up to the nearest power of 2.

> method canvas_texture_create() -> RID

Creates a canvas texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `canvas_texture_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method. See also `texture_2d_create`.
**Note:** The equivalent resource is `CanvasTexture` and is only meant to be used in 2D rendering, not 3D.

> method canvas_texture_set_channel(canvas_texture: RID, channel: CanvasTextureChannel, texture: RID) -> void

Sets the `channel`'s `texture` for the canvas texture specified by the `canvas_texture` RID. Equivalent to `CanvasTexture.diffuse_texture`, `CanvasTexture.normal_texture` and `CanvasTexture.specular_texture`.

> method canvas_texture_set_shading_parameters(canvas_texture: RID, base_color: Color, shininess: float) -> void

Sets the `base_color` and `shininess` to use for the canvas texture specified by the `canvas_texture` RID. Equivalent to `CanvasTexture.specular_color` and `CanvasTexture.specular_shininess`.

> method canvas_texture_set_texture_filter(canvas_texture: RID, filter: CanvasItemTextureFilter) -> void

Sets the texture `filter` mode to use for the canvas texture specified by the `canvas_texture` RID.

> method canvas_texture_set_texture_repeat(canvas_texture: RID, repeat: CanvasItemTextureRepeat) -> void

Sets the texture `repeat` mode to use for the canvas texture specified by the `canvas_texture` RID.

> method compositor_create() -> RID

Creates a new compositor and adds it to the RenderingServer. It can be accessed with the RID that is returned.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.

> method compositor_effect_create() -> RID

Creates a new rendering effect and adds it to the RenderingServer. It can be accessed with the RID that is returned.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.

> method compositor_effect_set_callback(effect: RID, callback_type: CompositorEffectCallbackType, callback: Callable) -> void

Sets the callback type (`callback_type`) and callback method(`callback`) for this rendering effect.

> method compositor_effect_set_enabled(effect: RID, enabled: bool) -> void

Enables/disables this rendering effect.

> method compositor_effect_set_flag(effect: RID, flag: CompositorEffectFlags, set: bool) -> void

Sets the flag (`flag`) for this rendering effect to `true` or `false` (`set`).

> method compositor_set_compositor_effects(compositor: RID, effects: Array[RID]) -> void

Sets the compositor effects for the specified compositor RID. `effects` should be an array containing RIDs created with `compositor_effect_create`.

> method create_local_rendering_device() -> RenderingDevice ; qualifiers=const

Creates a RenderingDevice that can be used to do draw and compute operations on a separate thread. Cannot draw to the screen nor share data with the global RenderingDevice.
**Note:** When using the OpenGL rendering driver or when running in headless mode, this function always returns `null`.

> method debug_canvas_item_get_rect(item: RID) -> Rect2

Returns the bounding rectangle for a canvas item in local space, as calculated by the renderer. This bound is used internally for culling.
**Warning:** This function is intended for debugging in the editor, and will pass through and return a zero `Rect2` in exported projects.

> method decal_create() -> RID

Creates a decal and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `decal_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
To place in a scene, attach this decal to an instance using `instance_set_base` using the returned RID.
**Note:** The equivalent node is `Decal`.

> method decal_set_albedo_mix(decal: RID, albedo_mix: float) -> void

Sets the `albedo_mix` in the decal specified by the `decal` RID. Equivalent to `Decal.albedo_mix`.

> method decal_set_cull_mask(decal: RID, mask: int) -> void

Sets the cull `mask` in the decal specified by the `decal` RID. Equivalent to `Decal.cull_mask`.

> method decal_set_distance_fade(decal: RID, enabled: bool, begin: float, length: float) -> void

Sets the distance fade parameters in the decal specified by the `decal` RID. Equivalent to `Decal.distance_fade_enabled`, `Decal.distance_fade_begin` and `Decal.distance_fade_length`.

> method decal_set_emission_energy(decal: RID, energy: float) -> void

Sets the emission `energy` in the decal specified by the `decal` RID. Equivalent to `Decal.emission_energy`.

> method decal_set_fade(decal: RID, above: float, below: float) -> void

Sets the upper fade (`above`) and lower fade (`below`) in the decal specified by the `decal` RID. Equivalent to `Decal.upper_fade` and `Decal.lower_fade`.

> method decal_set_modulate(decal: RID, color: Color) -> void

Sets the color multiplier in the decal specified by the `decal` RID to `color`. Equivalent to `Decal.modulate`.

> method decal_set_normal_fade(decal: RID, fade: float) -> void

Sets the normal `fade` in the decal specified by the `decal` RID. Equivalent to `Decal.normal_fade`.

> method decal_set_size(decal: RID, size: Vector3) -> void

Sets the `size` of the decal specified by the `decal` RID. Equivalent to `Decal.size`.

> method decal_set_texture(decal: RID, type: DecalTexture, texture: RID) -> void

Sets the `texture` in the given texture `type` slot for the specified decal. Equivalent to `Decal.set_texture`.

> method decals_set_filter(filter: DecalFilter) -> void

Sets the texture `filter` mode to use when rendering decals. This parameter is global and cannot be set on a per-decal basis.

> method directional_light_create() -> RID

Creates a directional light and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID can be used in most `light_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
To place in a scene, attach this directional light to an instance using `instance_set_base` using the returned RID.
**Note:** The equivalent node is `DirectionalLight3D`.

> method directional_shadow_atlas_set_size(size: int, is_16bits: bool) -> void

Sets the `size` of the directional light shadows in 3D. See also `ProjectSettings.rendering/lights_and_shadows/directional_shadow/size`. This parameter is global and cannot be set on a per-viewport basis.

> method directional_soft_shadow_filter_set_quality(quality: ShadowQuality) -> void

Sets the filter `quality` for directional light shadows in 3D. See also `ProjectSettings.rendering/lights_and_shadows/directional_shadow/soft_shadow_filter_quality`. This parameter is global and cannot be set on a per-viewport basis.

> method environment_bake_panorama(environment: RID, bake_irradiance: bool, size: Vector2i) -> Image

Generates and returns an `Image` containing the radiance map for the specified `environment` RID's sky. This supports built-in sky material and custom sky shaders. If `bake_irradiance` is `true`, the irradiance map is saved instead of the radiance map. The radiance map is used to render reflected light, while the irradiance map is used to render ambient light. See also `sky_bake_panorama`.
**Note:** The image is saved using linear encoding without any tonemapping performed, which means it will look too dark if viewed directly in an image editor.
**Note:** `size` should be a 2:1 aspect ratio for the generated panorama to have square pixels. For radiance maps, there is no point in using a height greater than `Sky.radiance_size`, as it won't increase detail. Irradiance maps only contain low-frequency data, so there is usually no point in going past a size of 128×64 pixels when saving an irradiance map.

> method environment_create() -> RID

Creates an environment and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `environment_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent resource is `Environment`.

> method environment_glow_set_use_bicubic_upscale(enable: bool) -> void

If `enable` is `true`, enables bicubic upscaling for glow which improves quality at the cost of performance. Equivalent to `ProjectSettings.rendering/environment/glow/upscale_mode`.
**Note:** This setting is only effective when using the Forward+ or Mobile rendering methods, as Compatibility uses a different glow implementation.

> method environment_set_adjustment(env: RID, enable: bool, brightness: float, contrast: float, saturation: float, use_1d_color_correction: bool, color_correction: RID) -> void

Sets the values to be used with the "adjustments" post-process effect. See `Environment` for more details.

> method environment_set_ambient_light(env: RID, color: Color, ambient: EnvironmentAmbientSource = 0, energy: float = 1.0, sky_contribution: float = 0.0, reflection_source: EnvironmentReflectionSource = 0) -> void

Sets the values to be used for ambient light rendering. See `Environment` for more details.

> method environment_set_background(env: RID, bg: EnvironmentBG) -> void

Sets the environment's background mode. Equivalent to `Environment.background_mode`.

> method environment_set_bg_color(env: RID, color: Color) -> void

Color displayed for clear areas of the scene. Only effective if using the `ENV_BG_COLOR` background mode.

> method environment_set_bg_energy(env: RID, multiplier: float, exposure_value: float) -> void

Sets the intensity of the background color.

> method environment_set_camera_id(env: RID, id: int) -> void

Sets the camera ID to be used as environment background.

> method environment_set_canvas_max_layer(env: RID, max_layer: int) -> void

Sets the maximum layer to use if using Canvas background mode.

> method environment_set_fog(env: RID, enable: bool, light_color: Color, light_energy: float, sun_scatter: float, density: float, height: float, height_density: float, aerial_perspective: float, sky_affect: float, fog_mode: EnvironmentFogMode = 0) -> void

Configures fog for the specified environment RID. See `fog_*` properties in `Environment` for more information.

> method environment_set_fog_depth(env: RID, curve: float, begin: float, end: float) -> void

Configures fog depth for the specified environment RID. Only has an effect when the fog mode of the environment is `ENV_FOG_MODE_DEPTH`. See `fog_depth_*` properties in `Environment` for more information.

> method environment_set_glow(env: RID, enable: bool, levels: PackedFloat32Array, intensity: float, strength: float, mix: float, bloom_threshold: float, blend_mode: EnvironmentGlowBlendMode, hdr_bleed_threshold: float, hdr_bleed_scale: float, hdr_luminance_cap: float, glow_map_strength: float, glow_map: RID) -> void

Configures glow for the specified environment RID. See `glow_*` properties in `Environment` for more information.

> method environment_set_sdfgi(env: RID, enable: bool, cascades: int, min_cell_size: float, y_scale: EnvironmentSDFGIYScale, use_occlusion: bool, bounce_feedback: float, read_sky: bool, energy: float, normal_bias: float, probe_bias: float) -> void

Configures signed distance field global illumination for the specified environment RID. See `sdfgi_*` properties in `Environment` for more information.

> method environment_set_sdfgi_frames_to_converge(frames: EnvironmentSDFGIFramesToConverge) -> void

Sets the number of frames to use for converging signed distance field global illumination. Equivalent to `ProjectSettings.rendering/global_illumination/sdfgi/frames_to_converge`.

> method environment_set_sdfgi_frames_to_update_light(frames: EnvironmentSDFGIFramesToUpdateLight) -> void

Sets the update speed for dynamic lights' indirect lighting when computing signed distance field global illumination. Equivalent to `ProjectSettings.rendering/global_illumination/sdfgi/frames_to_update_lights`.

> method environment_set_sdfgi_ray_count(ray_count: EnvironmentSDFGIRayCount) -> void

Sets the number of rays to throw per frame when computing signed distance field global illumination. Equivalent to `ProjectSettings.rendering/global_illumination/sdfgi/probe_ray_count`.

> method environment_set_sky(env: RID, sky: RID) -> void

Sets the `Sky` to be used as the environment's background when using *BGMode* sky. Equivalent to `Environment.sky`.

> method environment_set_sky_custom_fov(env: RID, scale: float) -> void

Sets a custom field of view for the background `Sky`. Equivalent to `Environment.sky_custom_fov`.

> method environment_set_sky_orientation(env: RID, orientation: Basis) -> void

Sets the rotation of the background `Sky` expressed as a `Basis`. Equivalent to `Environment.sky_rotation`, where the rotation vector is used to construct the `Basis`.

> method environment_set_ssao(env: RID, enable: bool, radius: float, intensity: float, power: float, detail: float, horizon: float, sharpness: float, light_affect: float, ao_channel_affect: float) -> void

Sets the variables to be used with the screen-space ambient occlusion (SSAO) post-process effect. See `Environment` for more details.

> method environment_set_ssao_quality(quality: EnvironmentSSAOQuality, half_size: bool, adaptive_target: float, blur_passes: int, fadeout_from: float, fadeout_to: float) -> void

Sets the quality level of the screen-space ambient occlusion (SSAO) post-process effect. See `Environment` for more details.

> method environment_set_ssil_quality(quality: EnvironmentSSILQuality, half_size: bool, adaptive_target: float, blur_passes: int, fadeout_from: float, fadeout_to: float) -> void

Sets the quality level of the screen-space indirect lighting (SSIL) post-process effect. See `Environment` for more details.

> method environment_set_ssr(env: RID, enable: bool, max_steps: int, fade_in: float, fade_out: float, depth_tolerance: float) -> void

Sets the variables to be used with the screen-space reflections (SSR) post-process effect. See `Environment` for more details.

> method environment_set_ssr_half_size(half_size: bool) -> void

Sets whether screen-space reflections will be rendered at full or half size. Half size is faster, but may look pixelated or cause flickering.

> method environment_set_ssr_roughness_quality(quality: EnvironmentSSRRoughnessQuality) -> void ; deprecated=This option no longer does anything.

> method environment_set_tonemap(env: RID, tone_mapper: EnvironmentToneMapper, exposure: float, white: float) -> void

Sets the variables to be used with the "tonemap" post-process effect. See `Environment` for more details.

> method environment_set_tonemap_agx_contrast(env: RID, agx_contrast: float) -> void

See `Environment.tonemap_agx_contrast` for more details.

> method environment_set_volumetric_fog(env: RID, enable: bool, density: float, albedo: Color, emission: Color, emission_energy: float, anisotropy: float, length: float, detail_spread: float, gi_inject: float, temporal_reprojection: bool, temporal_reprojection_amount: float, ambient_inject: float, sky_affect: float) -> void

Sets the variables to be used with the volumetric fog post-process effect. See `Environment` for more details.

> method environment_set_volumetric_fog_filter_active(active: bool) -> void

Enables filtering of the volumetric fog scattering buffer. This results in much smoother volumes with very few under-sampling artifacts.

> method environment_set_volumetric_fog_volume_size(size: int, depth: int) -> void

Sets the resolution of the volumetric fog's froxel buffer. `size` is modified by the screen's aspect ratio and then used to set the width and height of the buffer. While `depth` is directly used to set the depth of the buffer.

> method fog_volume_create() -> RID

Creates a new fog volume and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `fog_volume_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent node is `FogVolume`.

> method fog_volume_set_material(fog_volume: RID, material: RID) -> void

Sets the `Material` of the fog volume. Can be either a `FogMaterial` or a custom `ShaderMaterial`.

> method fog_volume_set_shape(fog_volume: RID, shape: FogVolumeShape) -> void

Sets the shape of the fog volume to either `RenderingServer.FOG_VOLUME_SHAPE_ELLIPSOID`, `RenderingServer.FOG_VOLUME_SHAPE_CONE`, `RenderingServer.FOG_VOLUME_SHAPE_CYLINDER`, `RenderingServer.FOG_VOLUME_SHAPE_BOX` or `RenderingServer.FOG_VOLUME_SHAPE_WORLD`.

> method fog_volume_set_size(fog_volume: RID, size: Vector3) -> void

Sets the size of the fog volume when shape is `RenderingServer.FOG_VOLUME_SHAPE_ELLIPSOID`, `RenderingServer.FOG_VOLUME_SHAPE_CONE`, `RenderingServer.FOG_VOLUME_SHAPE_CYLINDER` or `RenderingServer.FOG_VOLUME_SHAPE_BOX`.

> method force_draw(swap_buffers: bool = true, frame_step: float = 0.0) -> void

Forces redrawing of all viewports at once. Must be called from the main thread.

> method force_sync() -> void

Forces a synchronization between the CPU and GPU, which may be required in certain cases. Only call this when needed, as CPU-GPU synchronization has a performance cost.

> method free_rid(rid: RID) -> void

Tries to free an object in the RenderingServer. To avoid memory leaks, this should be called after using an object as memory management does not occur automatically when using RenderingServer directly.

> method get_current_rendering_driver_name() -> String ; qualifiers=const

Returns the name of the current rendering driver. This can be `vulkan`, `d3d12`, `metal`, `opengl3`, `opengl3_es`, or `opengl3_angle`. See also `get_current_rendering_method`.
When `ProjectSettings.rendering/renderer/rendering_method` is `forward_plus` or `mobile`, the rendering driver is determined by `ProjectSettings.rendering/rendering_device/driver`.
When `ProjectSettings.rendering/renderer/rendering_method` is `gl_compatibility`, the rendering driver is determined by `ProjectSettings.rendering/gl_compatibility/driver`.
The rendering driver is also determined by the `--rendering-driver` command line argument that overrides this project setting, or an automatic fallback that is applied depending on the hardware.

> method get_current_rendering_method() -> String ; qualifiers=const

Returns the name of the current rendering method. This can be `forward_plus`, `mobile`, or `gl_compatibility`. See also `get_current_rendering_driver_name`.
The rendering method is determined by `ProjectSettings.rendering/renderer/rendering_method`, the `--rendering-method` command line argument that overrides this project setting, or an automatic fallback that is applied depending on the hardware.

> method get_default_clear_color() -> Color

Returns the default clear color which is used when a specific clear color has not been selected. See also `set_default_clear_color`.

> method get_frame_setup_time_cpu() -> float ; qualifiers=const

Returns the time taken to setup rendering on the CPU in milliseconds. This value is shared across all viewports and does *not* require `viewport_set_measure_render_time` to be enabled on a viewport to be queried. See also `viewport_get_measured_render_time_cpu`.

> method get_rendering_device() -> RenderingDevice ; qualifiers=const

Returns the global RenderingDevice.
**Note:** When using the OpenGL rendering driver or when running in headless mode, this function always returns `null`.

> method get_rendering_info(info: RenderingInfo) -> int

Returns a statistic about the rendering engine which can be used for performance profiling. See also `viewport_get_render_info`, which returns information specific to a viewport.
**Note:** Only 3D rendering is currently taken into account by some of these values, such as the number of draw calls.
**Note:** Rendering information is not available until at least 2 frames have been rendered by the engine. If rendering information is not available, `get_rendering_info` returns `0`. To print rendering information in `_ready()` successfully, use the following:

```text
                func _ready():
                    for _i in 2:
                        await get_tree().process_frame

                    print(RenderingServer.get_rendering_info(RENDERING_INFO_TOTAL_DRAW_CALLS_IN_FRAME))

```

> method get_shader_parameter_list(shader: RID) -> Array[Dictionary] ; qualifiers=const

Returns the parameters of a shader.

> method get_test_cube() -> RID

Returns the RID of the test cube. This mesh will be created and returned on the first call to `get_test_cube`, then it will be cached for subsequent calls. See also `make_sphere_mesh`.

> method get_test_texture() -> RID

Returns the RID of a 256×256 texture with a testing pattern on it (in `Image.FORMAT_RGB8` format). This texture will be created and returned on the first call to `get_test_texture`, then it will be cached for subsequent calls. See also `get_white_texture`.
**Example:** Get the test texture and apply it to a `Sprite2D` node:

```text
                var texture_rid = RenderingServer.get_test_texture()
                var texture = ImageTexture.create_from_image(RenderingServer.texture_2d_get(texture_rid))
                $Sprite2D.texture = texture

```

> method get_video_adapter_api_version() -> String ; qualifiers=const

Returns the version of the graphics video adapter *currently in use* (e.g. "1.2.189" for Vulkan, "3.3.0 NVIDIA 510.60.02" for OpenGL). This version may be different from the actual latest version supported by the hardware, as Godot may not always request the latest version. See also `OS.get_video_adapter_driver_info`.
**Note:** When running a headless or server binary, this function returns an empty string.

> method get_video_adapter_name() -> String ; qualifiers=const

Returns the name of the video adapter (e.g. "GeForce GTX 1080/PCIe/SSE2").
**Note:** When running a headless or server binary, this function returns an empty string.
**Note:** On the web platform, some browsers such as Firefox may report a different, fixed GPU name such as "GeForce GTX 980" (regardless of the user's actual GPU model). This is done to make fingerprinting more difficult.

> method get_video_adapter_type() -> RenderingDevice.DeviceType ; qualifiers=const

Returns the type of the video adapter. Since dedicated graphics cards from a given generation will *usually* be significantly faster than integrated graphics made in the same generation, the device type can be used as a basis for automatic graphics settings adjustment. However, this is not always true, so make sure to provide users with a way to manually override graphics settings.
**Note:** When using the OpenGL rendering driver or when running in headless mode, this function always returns `RenderingDevice.DEVICE_TYPE_OTHER`.

> method get_video_adapter_vendor() -> String ; qualifiers=const

Returns the vendor of the video adapter (e.g. "NVIDIA Corporation").
**Note:** When running a headless or server binary, this function returns an empty string.

> method get_white_texture() -> RID

Returns the ID of a 4×4 white texture (in `Image.FORMAT_RGB8` format). This texture will be created and returned on the first call to `get_white_texture`, then it will be cached for subsequent calls. See also `get_test_texture`.
**Example:** Get the white texture and apply it to a `Sprite2D` node:

```text
                var texture_rid = RenderingServer.get_white_texture()
                var texture = ImageTexture.create_from_image(RenderingServer.texture_2d_get(texture_rid))
                $Sprite2D.texture = texture

```

> method gi_set_use_half_resolution(half_resolution: bool) -> void

If `half_resolution` is `true`, renders `VoxelGI` and SDFGI (`Environment.sdfgi_enabled`) buffers at halved resolution on each axis (e.g. 960×540 when the viewport size is 1920×1080). This improves performance significantly when VoxelGI or SDFGI is enabled, at the cost of artifacts that may be visible on polygon edges. The loss in quality becomes less noticeable as the viewport resolution increases. `LightmapGI` rendering is not affected by this setting. Equivalent to `ProjectSettings.rendering/global_illumination/gi/use_half_resolution`.

> method global_shader_parameter_add(name: StringName, type: GlobalShaderParameterType, default_value: Variant) -> void

Creates a new global shader uniform.
**Note:** Global shader parameter names are case-sensitive.

> method global_shader_parameter_get(name: StringName) -> Variant ; qualifiers=const

Returns the value of the global shader uniform specified by `name`.
**Note:** `global_shader_parameter_get` has a large performance penalty as the rendering thread needs to synchronize with the calling thread, which is slow. Do not use this method during gameplay to avoid stuttering. If you need to read values in a script after setting them, consider creating an autoload where you store the values you need to query at the same time you're setting them as global parameters.

> method global_shader_parameter_get_list() -> Array[StringName] ; qualifiers=const

Returns the list of global shader uniform names.
**Note:** `global_shader_parameter_get` has a large performance penalty as the rendering thread needs to synchronize with the calling thread, which is slow. Do not use this method during gameplay to avoid stuttering. If you need to read values in a script after setting them, consider creating an autoload where you store the values you need to query at the same time you're setting them as global parameters.

> method global_shader_parameter_get_type(name: StringName) -> GlobalShaderParameterType ; qualifiers=const

Returns the type associated to the global shader uniform specified by `name`.
**Note:** `global_shader_parameter_get` has a large performance penalty as the rendering thread needs to synchronize with the calling thread, which is slow. Do not use this method during gameplay to avoid stuttering. If you need to read values in a script after setting them, consider creating an autoload where you store the values you need to query at the same time you're setting them as global parameters.

> method global_shader_parameter_remove(name: StringName) -> void

Removes the global shader uniform specified by `name`.

> method global_shader_parameter_set(name: StringName, value: Variant) -> void

Sets the global shader uniform `name` to `value`.

> method global_shader_parameter_set_override(name: StringName, value: Variant) -> void

Overrides the global shader uniform `name` with `value`. Equivalent to the `ShaderGlobalsOverride` node.

> method has_changed() -> bool ; qualifiers=const

Returns `true` if changes have been made to the RenderingServer's data. `force_draw` is usually called if this happens.

> method has_feature(feature: Features) -> bool ; qualifiers=const ; deprecated=This method has not been used since Godot 3.0.

This method does nothing and always returns `false`.

> method has_os_feature(feature: String) -> bool ; qualifiers=const

Returns `true` if the OS supports a certain `feature`. Features might be `s3tc`, `etc`, and `etc2`.

> method instance_attach_object_instance_id(instance: RID, id: int) -> void

Attaches a unique Object ID to instance. Object ID must be attached to instance for proper culling with `instances_cull_aabb`, `instances_cull_convex`, and `instances_cull_ray`.

> method instance_attach_skeleton(instance: RID, skeleton: RID) -> void

Attaches a skeleton to an instance. Removes the previous skeleton from the instance.

> method instance_create() -> RID

Creates a visual instance and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `instance_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
An instance is a way of placing a 3D object in the scenario. Objects like particles, meshes, reflection probes and decals need to be associated with an instance to be visible in the scenario using `instance_set_base`.
**Note:** The equivalent node is `VisualInstance3D`.

> method instance_create2(base: RID, scenario: RID) -> RID

Creates a visual instance, adds it to the RenderingServer, and sets both base and scenario. It can be accessed with the RID that is returned. This RID will be used in all `instance_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method. This is a shorthand for using `instance_create` and setting the base and scenario manually.

> method instance_geometry_get_shader_parameter(instance: RID, parameter: StringName) -> Variant ; qualifiers=const

Returns the value of the per-instance shader uniform from the specified 3D geometry instance. Equivalent to `GeometryInstance3D.get_instance_shader_parameter`.
**Note:** Per-instance shader parameter names are case-sensitive.

> method instance_geometry_get_shader_parameter_default_value(instance: RID, parameter: StringName) -> Variant ; qualifiers=const

Returns the default value of the per-instance shader uniform from the specified 3D geometry instance. Equivalent to `GeometryInstance3D.get_instance_shader_parameter`.

> method instance_geometry_get_shader_parameter_list(instance: RID) -> Array[Dictionary] ; qualifiers=const

Returns a dictionary of per-instance shader uniform names of the per-instance shader uniform from the specified 3D geometry instance. The returned dictionary is in PropertyInfo format, with the keys `name`, `class_name`, `type`, `hint`, `hint_string` and `usage`. Equivalent to `GeometryInstance3D.get_instance_shader_parameter`.

> method instance_geometry_set_cast_shadows_setting(instance: RID, shadow_casting_setting: ShadowCastingSetting) -> void

Sets the shadow casting setting. Equivalent to `GeometryInstance3D.cast_shadow`.

> method instance_geometry_set_flag(instance: RID, flag: InstanceFlags, enabled: bool) -> void

Sets the `flag` for a given `instance` to `enabled`.

> method instance_geometry_set_lightmap(instance: RID, lightmap: RID, lightmap_uv_scale: Rect2, lightmap_slice: int) -> void

Sets the lightmap GI instance to use for the specified 3D geometry instance. The lightmap UV scale for the specified instance (equivalent to `GeometryInstance3D.gi_lightmap_scale`) and lightmap atlas slice must also be specified.

> method instance_geometry_set_lod_bias(instance: RID, lod_bias: float) -> void

Sets the level of detail bias to use when rendering the specified 3D geometry instance. Higher values result in higher detail from further away. Equivalent to `GeometryInstance3D.lod_bias`.

> method instance_geometry_set_material_overlay(instance: RID, material: RID) -> void

Sets a material that will be rendered for all surfaces on top of active materials for the mesh associated with this instance. Equivalent to `GeometryInstance3D.material_overlay`.

> method instance_geometry_set_material_override(instance: RID, material: RID) -> void

Sets a material that will override the material for all surfaces on the mesh associated with this instance. Equivalent to `GeometryInstance3D.material_override`.

> method instance_geometry_set_shader_parameter(instance: RID, parameter: StringName, value: Variant) -> void

Sets the per-instance shader uniform on the specified 3D geometry instance. Equivalent to `GeometryInstance3D.set_instance_shader_parameter`.

> method instance_geometry_set_transparency(instance: RID, transparency: float) -> void

Sets the transparency for the given geometry instance. Equivalent to `GeometryInstance3D.transparency`.
A transparency of `0.0` is fully opaque, while `1.0` is fully transparent. Values greater than `0.0` (exclusive) will force the geometry's materials to go through the transparent pipeline, which is slower to render and can exhibit rendering issues due to incorrect transparency sorting. However, unlike using a transparent material, setting `transparency` to a value greater than `0.0` (exclusive) will *not* disable shadow rendering.
In spatial shaders, `1.0 - transparency` is set as the default value of the `ALPHA` built-in.
**Note:** `transparency` is clamped between `0.0` and `1.0`, so this property cannot be used to make transparent materials more opaque than they originally are.

> method instance_geometry_set_visibility_range(instance: RID, min: float, max: float, min_margin: float, max_margin: float, fade_mode: VisibilityRangeFadeMode) -> void

Sets the visibility range values for the given geometry instance. Equivalent to `GeometryInstance3D.visibility_range_begin` and related properties.

> method instance_set_base(instance: RID, base: RID) -> void

Sets the base of the instance. A base can be any of the 3D objects that are created in the RenderingServer that can be displayed. For example, any of the light types, mesh, multimesh, particle system, reflection probe, decal, lightmap, voxel GI and visibility notifiers are all types that can be set as the base of an instance in order to be displayed in the scenario.

> method instance_set_blend_shape_weight(instance: RID, shape: int, weight: float) -> void

Sets the weight for a given blend shape associated with this instance.

> method instance_set_custom_aabb(instance: RID, aabb: AABB) -> void

Sets a custom AABB to use when culling objects from the view frustum. Equivalent to setting `GeometryInstance3D.custom_aabb`.

> method instance_set_extra_visibility_margin(instance: RID, margin: float) -> void

Sets a margin to increase the size of the AABB when culling objects from the view frustum. This allows you to avoid culling objects that fall outside the view frustum. Equivalent to `GeometryInstance3D.extra_cull_margin`.

> method instance_set_ignore_culling(instance: RID, enabled: bool) -> void

If `true`, ignores all culling on the specified 3D geometry instance, including frustum culling, occlusion culling, and layer culling. This is not the same as `GeometryInstance3D.ignore_occlusion_culling`, which only ignores occlusion culling but leaves frustum and layer culling intact.

> method instance_set_layer_mask(instance: RID, mask: int) -> void

Sets the render layers that this instance will be drawn to. Equivalent to `VisualInstance3D.layers`.

> method instance_set_pivot_data(instance: RID, sorting_offset: float, use_aabb_center: bool) -> void

Sets the sorting offset and switches between using the bounding box or instance origin for depth sorting.

> method instance_set_scenario(instance: RID, scenario: RID) -> void

Sets the scenario that the instance is in. The scenario is the 3D world that the objects will be displayed in.

> method instance_set_surface_override_material(instance: RID, surface: int, material: RID) -> void

Sets the override material of a specific surface. Equivalent to `MeshInstance3D.set_surface_override_material`.

> method instance_set_transform(instance: RID, transform: Transform3D) -> void

Sets the world space transform of the instance. Equivalent to `Node3D.global_transform`.

> method instance_set_visibility_parent(instance: RID, parent: RID) -> void

Sets the visibility parent for the given instance. Equivalent to `Node3D.visibility_parent`.

> method instance_set_visible(instance: RID, visible: bool) -> void

Sets whether an instance is drawn or not. Equivalent to `Node3D.visible`.

> method instance_teleport(instance: RID) -> void

Resets motion vectors and other interpolated values. Use this *after* teleporting a mesh from one position to another to avoid ghosting artifacts.

> method instances_cull_aabb(aabb: AABB, scenario: RID = RID()) -> PackedInt64Array ; qualifiers=const

Returns an array of object IDs intersecting with the provided AABB. Only 3D nodes that inherit from `VisualInstance3D` are considered, such as `MeshInstance3D` or `DirectionalLight3D`. Use `@GlobalScope.instance_from_id` to obtain the actual nodes. A scenario RID must be provided, which is available in the `World3D` you want to query. This forces an update for all resources queued to update.
**Warning:** This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.

> method instances_cull_convex(convex: Array[Plane], scenario: RID = RID()) -> PackedInt64Array ; qualifiers=const

Returns an array of object IDs intersecting with the provided convex shape. Only 3D nodes that inherit from `VisualInstance3D` are considered, such as `MeshInstance3D` or `DirectionalLight3D`. Use `@GlobalScope.instance_from_id` to obtain the actual nodes. A scenario RID must be provided, which is available in the `World3D` you want to query. This forces an update for all resources queued to update.
**Warning:** This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.

> method instances_cull_ray(from: Vector3, to: Vector3, scenario: RID = RID()) -> PackedInt64Array ; qualifiers=const

Returns an array of object IDs intersecting with the provided 3D ray. Only 3D nodes that inherit from `VisualInstance3D` are considered, such as `MeshInstance3D` or `DirectionalLight3D`. Use `@GlobalScope.instance_from_id` to obtain the actual nodes. A scenario RID must be provided, which is available in the `World3D` you want to query. This forces an update for all resources queued to update.
**Warning:** This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.

> method is_on_render_thread() -> bool

Returns `true` if our code is currently executing on the rendering thread.

> method light_area_set_normalize_energy(light: RID, enable: bool) -> void

Defines whether the energy of an `AreaLight3D` is normalized (divided) by its area. If set to `true`, changing the size does not affect the total energy output. Equivalent to `AreaLight3D.area_normalize_energy`.

> method light_area_set_size(light: RID, size: Vector2) -> void

Sets the extents (width and height) in meters for this area light. Equivalent to `AreaLight3D.area_size`.

> method light_directional_set_blend_splits(light: RID, enable: bool) -> void

If `true`, this directional light will blend between shadow map splits resulting in a smoother transition between them. Equivalent to `DirectionalLight3D.directional_shadow_blend_splits`.

> method light_directional_set_shadow_mode(light: RID, mode: LightDirectionalShadowMode) -> void

Sets the shadow mode for this directional light. Equivalent to `DirectionalLight3D.directional_shadow_mode`.

> method light_directional_set_sky_mode(light: RID, mode: LightDirectionalSkyMode) -> void

If `true`, this light will not be used for anything except sky shaders. Use this for lights that impact your sky shader that you may want to hide from affecting the rest of the scene. For example, you may want to enable this when the sun in your sky shader falls below the horizon.

> method light_omni_set_shadow_mode(light: RID, mode: LightOmniShadowMode) -> void

Sets whether to use a dual paraboloid or a cubemap for the shadow map. Dual paraboloid is faster but may suffer from artifacts. Equivalent to `OmniLight3D.omni_shadow_mode`.

> method light_projectors_set_filter(filter: LightProjectorFilter) -> void

Sets the texture filter mode to use when rendering light projectors. This parameter is global and cannot be set on a per-light basis.

> method light_set_bake_mode(light: RID, bake_mode: LightBakeMode) -> void

Sets the bake mode to use for the specified 3D light. Equivalent to `Light3D.light_bake_mode`.

> method light_set_color(light: RID, color: Color) -> void

Sets the color of the light. Equivalent to `Light3D.light_color`.

> method light_set_cull_mask(light: RID, mask: int) -> void

Sets the cull mask for this 3D light. Lights only affect objects in the selected layers. Equivalent to `Light3D.light_cull_mask`.

> method light_set_distance_fade(decal: RID, enabled: bool, begin: float, shadow: float, length: float) -> void

Sets the distance fade for this 3D light. This acts as a form of level of detail (LOD) and can be used to improve performance. Equivalent to `Light3D.distance_fade_enabled`, `Light3D.distance_fade_begin`, `Light3D.distance_fade_shadow`, and `Light3D.distance_fade_length`.

> method light_set_max_sdfgi_cascade(light: RID, cascade: int) -> void

Sets the maximum SDFGI cascade in which the 3D light's indirect lighting is rendered. Higher values allow the light to be rendered in SDFGI further away from the camera.

> method light_set_negative(light: RID, enable: bool) -> void

If `true`, the 3D light will subtract light instead of adding light. Equivalent to `Light3D.light_negative`.

> method light_set_param(light: RID, param: LightParam, value: float) -> void

Sets the specified 3D light parameter. Equivalent to `Light3D.set_param`.

> method light_set_projector(light: RID, texture: RID) -> void

Sets the projector texture to use for the specified 3D light. Equivalent to `Light3D.light_projector`.

> method light_set_reverse_cull_face_mode(light: RID, enabled: bool) -> void

If `true`, reverses the backface culling of the mesh. This can be useful when you have a flat mesh that has a light behind it. If you need to cast a shadow on both sides of the mesh, set the mesh to use double-sided shadows with `instance_geometry_set_cast_shadows_setting`. Equivalent to `Light3D.shadow_reverse_cull_face`.

> method light_set_shadow(light: RID, enabled: bool) -> void

If `true`, light will cast shadows. Equivalent to `Light3D.shadow_enabled`.

> method light_set_shadow_caster_mask(light: RID, mask: int) -> void

Sets the shadow caster mask for this 3D light. Shadows will only be cast using objects in the selected layers. Equivalent to `Light3D.shadow_caster_mask`.

> method lightmap_create() -> RID

Creates a new lightmap global illumination instance and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `lightmap_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent node is `LightmapGI`.

> method lightmap_get_probe_capture_bsp_tree(lightmap: RID) -> PackedInt32Array ; qualifiers=const

Returns the BSP tree data used for accelerating probe lookups. The BSP data is structured as a series of six signed 32-bit values per BSP node in this order: `float plane_x`, `float plane_y`, `float plane_z`, `float plane_distance`, `int32_t over`, `int32_t under`. An empty leaf is denoted by the value `-2147483648` (the minimum 32-bit signed integer). See also `lightmap_set_probe_capture_data`.

> method lightmap_get_probe_capture_points(lightmap: RID) -> PackedVector3Array ; qualifiers=const

Returns the *local space* positions of each lightmap probe capture point. Keep in mind the lightmap instance may have a non-zero transform, which will affect the position of the probe capture points. See also `lightmap_set_probe_capture_data`.

> method lightmap_get_probe_capture_sh(lightmap: RID) -> PackedColorArray ; qualifiers=const

Returns the L0, L1, and L2 [spherical harmonics](https://en.wikipedia.org/wiki/Spherical_harmonics) data for each lightmap probe capture point. This is specified as 9 `Color` values per probe, which means the size of the returned data is always 9 times the number of probe points. See also `lightmap_set_probe_capture_data`.

> method lightmap_get_probe_capture_tetrahedra(lightmap: RID) -> PackedInt32Array ; qualifiers=const

Returns the tetrahedralization data used for interpolating between lightmap probe capture points. Each tetrahedron is specified as a series of 4 numbers, each being an index into the probe capture points array returned by `lightmap_get_probe_capture_points`. See also `lightmap_set_probe_capture_data`.

> method lightmap_set_baked_exposure_normalization(lightmap: RID, baked_exposure: float) -> void

Used to inform the renderer what exposure normalization value was used while baking the lightmap. This value will be used and modulated at run time to ensure that the lightmap maintains a consistent level of exposure even if the scene-wide exposure normalization is changed at run time. For more information see `camera_attributes_set_exposure`.

> method lightmap_set_probe_bounds(lightmap: RID, bounds: AABB) -> void

Sets the bounds that this lightmap instance should visually affect, both in terms of static lightmap baking and probe-based global illumination.

> method lightmap_set_probe_capture_data(lightmap: RID, points: PackedVector3Array, point_sh: PackedColorArray, tetrahedra: PackedInt32Array, bsp_tree: PackedInt32Array) -> void

Sets the probe capture data for the given lightmap instance. See `lightmap_get_probe_capture_points`, `lightmap_get_probe_capture_sh`, `lightmap_get_probe_capture_tetrahedra`, and `lightmap_get_probe_capture_bsp_tree` for the expected data formats.

> method lightmap_set_probe_capture_update_speed(speed: float) -> void

The framerate-independent update speed when representing dynamic object lighting from `LightmapProbe`s. Higher values make dynamic object lighting update faster. Higher values can prevent fast-moving objects from having "outdated" indirect lighting displayed on them, at the cost of possible flickering when an object moves from a bright area to a shaded area. See also `ProjectSettings.rendering/lightmapping/probe_capture/update_speed`.

> method lightmap_set_probe_interior(lightmap: RID, interior: bool) -> void

Sets whether the lightmap instance should be considered as interior (when `interior` is `true`). If the lightmap is marked as interior, environment lighting is ignored when baking lightmaps.

> method lightmap_set_textures(lightmap: RID, light: RID, uses_sh: bool) -> void

Set the textures on the given `lightmap` GI instance to the texture array pointed to by the `light` RID. If the lightmap texture was baked with `LightmapGI.directional` set to `true`, then `uses_sh` must also be `true`.

> method lightmaps_set_bicubic_filter(enable: bool) -> void

Toggles whether a bicubic filter should be used when lightmaps are sampled. This smoothens their appearance at a performance cost.

> method make_sphere_mesh(latitudes: int, longitudes: int, radius: float) -> RID

Returns a mesh of a sphere with the given number of horizontal subdivisions, vertical subdivisions and radius. See also `get_test_cube`.

> method material_create() -> RID

Creates an empty material and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `material_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent resource is `Material`.

> method material_get_param(material: RID, parameter: StringName) -> Variant ; qualifiers=const

Returns the value of a certain material's parameter.

> method material_set_next_pass(material: RID, next_material: RID) -> void

Sets an object's next material.

> method material_set_param(material: RID, parameter: StringName, value: Variant) -> void

Sets a material's parameter.

> method material_set_render_priority(material: RID, priority: int) -> void

Sets a material's render priority.

> method material_set_shader(shader_material: RID, shader: RID) -> void

Sets a shader material's shader.

> method material_set_use_debanding(enable: bool) -> void

When using the Mobile renderer, `material_set_use_debanding` can be used to enable or disable the debanding feature of 3D materials (`BaseMaterial3D` and `ShaderMaterial`).
`material_set_use_debanding` has no effect when using the Compatibility or Forward+ renderer. In Forward+, `Viewport` debanding can be used instead.
See also `ProjectSettings.rendering/anti_aliasing/quality/use_debanding` and `RenderingServer.viewport_set_use_debanding`.

> method mesh_add_surface(mesh: RID, surface: Dictionary) -> void

Creates a new surface on the given `mesh`. Equivalent to `mesh_add_surface_from_arrays`, but takes a single `Dictionary` argument instead of separate arguments. The dictionary must follow this structure:

```text
                {
                    # Required:
                    "primitive": RenderingServer.PrimitiveType,
                    "format": RenderingServer.ArrayFormat,
                    "vertex_data": PackedByteArray,
                    "vertex_count": int,
                    "aabb": AABB,

                    # Optional:
                    "attribute_data": PackedByteArray,
                    "skin_data": PackedByteArray,
                    "index_data": PackedByteArray,
                    "index_count": int, # Required if `index_data` is specified.
                    "uv_scale": Vector4,
                    "lods": [
                        # Both values are required for each LOD level.
                        {
                            "edge_length": float,
                            "index_data": PackedByteArray,
                        },
                    ],
                    "bone_aabbs": Array[AABB],
                    "blend_shape_data": PackedByteArray,
                    "material": Material,
                }

```

See also `mesh_get_surface`, which returns data in the same structure defined above.

> method mesh_add_surface_from_arrays(mesh: RID, primitive: PrimitiveType, arrays: Array, blend_shapes: Array = [], lods: Dictionary = {}, compress_format: BitField[ArrayFormat] = 0) -> void

Creates a new surface on the given `mesh`. `mesh_get_surface_count` will become the surface index for this new surface.
Surfaces are created to be rendered using a `primitive`, which may be any of the values defined in `Mesh.PrimitiveType`.
The `arrays` argument is an array of arrays. Each of the `Mesh.ARRAY_MAX` elements contains an array with some of the mesh data for this surface as described by the corresponding member of `Mesh.ArrayType` or `null` if it is not used by the surface. For example, `arrays[0]` is the array of vertices. That first vertex sub-array is always required; the others are optional. Adding an index array puts this surface into "index mode" where the vertex and other arrays become the sources of data and the index array defines the vertex order. All sub-arrays must have the same length as the vertex array (or be an exact multiple of the vertex array's length, when multiple elements of a sub-array correspond to a single vertex) or be empty, except for `Mesh.ARRAY_INDEX` if it is used.
The `blend_shapes` argument is an array of vertex data for each blend shape. Each element is an array of the same structure as `arrays`, but `Mesh.ARRAY_VERTEX`, `Mesh.ARRAY_NORMAL`, and `Mesh.ARRAY_TANGENT` are set if and only if they are set in `arrays` and all other entries are `null`.
The `lods` argument is a dictionary with `float` keys and `PackedInt32Array` values. Each entry in the dictionary represents an LOD level of the surface, where the value is the `Mesh.ARRAY_INDEX` array to use for the LOD level and the key is roughly proportional to the distance at which the LOD stats being used. I.e., increasing the key of an LOD also increases the distance that the objects has to be from the camera before the LOD is used.
The `compress_format` argument is the bitwise OR of, as required: One value of `ArrayFormat` left shifted by `ARRAY_FORMAT_CUSTOMn_SHIFT` for each custom channel in use, `ARRAY_FLAG_USE_DYNAMIC_UPDATE`, `ARRAY_FLAG_USE_8_BONE_WEIGHTS`, or `ARRAY_FLAG_USES_EMPTY_VERTEX_ARRAY`.
See `ArrayMesh.add_surface_from_arrays` and `ImporterMesh.add_surface` for higher-level equivalents of this method.
**Note:** When using indices, it is recommended to only use points, lines, or triangles.

> method mesh_clear(mesh: RID) -> void

Removes all surfaces from a mesh.

> method mesh_create() -> RID

Creates a new mesh and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `mesh_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
To place in a scene, attach this mesh to an instance using `instance_set_base` using the returned RID.
**Note:** The equivalent resource is `Mesh`.

> method mesh_create_from_surfaces(surfaces: Array[Dictionary], blend_shape_count: int = 0) -> RID

Creates a new mesh with predefined surfaces for it and adds the mesh to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `mesh_*` RenderingServer functions. This method is more efficient for creating meshes with multiple surfaces compared to creating an empty mesh with `mesh_create` and adding surfaces one by one with `mesh_add_surface`.
Each element in the `surfaces` array must follow the same structure as described in `mesh_add_surface`. The `blend_shape_count` parameter must match the blend shape data defined in all surfaces.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
To place in a scene, attach this mesh to an instance using `instance_set_base` using the returned RID.
**Note:** The equivalent resource is `Mesh`.

> method mesh_get_blend_shape_count(mesh: RID) -> int ; qualifiers=const

Returns a mesh's blend shape count.

> method mesh_get_blend_shape_mode(mesh: RID) -> BlendShapeMode ; qualifiers=const

Returns a mesh's blend shape mode.

> method mesh_get_custom_aabb(mesh: RID) -> AABB ; qualifiers=const

Returns a mesh's custom aabb.

> method mesh_get_surface(mesh: RID, surface: int) -> Dictionary

Returns a mesh's surface as a dictionary following the same structure as described in `mesh_add_surface`.

> method mesh_get_surface_count(mesh: RID) -> int ; qualifiers=const

Returns a mesh's number of surfaces.

> method mesh_set_blend_shape_mode(mesh: RID, mode: BlendShapeMode) -> void

Sets a mesh's blend shape mode.

> method mesh_set_custom_aabb(mesh: RID, aabb: AABB) -> void

Sets a mesh's custom aabb.

> method mesh_set_shadow_mesh(mesh: RID, shadow_mesh: RID) -> void

Sets an optional second mesh which can be used for rendering shadows and the depth prepass. Can be used to increase performance by supplying a mesh with fused vertices and only vertex position data (without normals, UVs, colors, etc.).
**Note:** This mesh must have exactly the same vertex positions as the source mesh (including the source mesh's LODs, if present). If vertex positions differ, then the mesh will not draw correctly.

> method mesh_surface_get_arrays(mesh: RID, surface: int) -> Array ; qualifiers=const

Returns a mesh's surface's buffer arrays.

> method mesh_surface_get_blend_shape_arrays(mesh: RID, surface: int) -> Array[Array] ; qualifiers=const

Returns a mesh's surface's arrays for blend shapes.

> method mesh_surface_get_format_attribute_stride(format: BitField[ArrayFormat], vertex_count: int) -> int ; qualifiers=const

Returns the stride of the attribute buffer for a mesh with given `format`.

> method mesh_surface_get_format_index_stride(format: BitField[ArrayFormat], vertex_count: int) -> int ; qualifiers=const

Returns the stride of the index buffer for a mesh with the given `format`.

> method mesh_surface_get_format_normal_tangent_stride(format: BitField[ArrayFormat], vertex_count: int) -> int ; qualifiers=const

Returns the stride of the combined normals and tangents for a mesh with given `format`. Note importantly that, while normals and tangents are in the vertex buffer with vertices, they are only interleaved with each other and so have a different stride than vertex positions.

> method mesh_surface_get_format_offset(format: BitField[ArrayFormat], vertex_count: int, array_index: int) -> int ; qualifiers=const

Returns the offset of a given attribute by `array_index` in the start of its respective buffer.

> method mesh_surface_get_format_skin_stride(format: BitField[ArrayFormat], vertex_count: int) -> int ; qualifiers=const

Returns the stride of the skin buffer for a mesh with given `format`.

> method mesh_surface_get_format_vertex_stride(format: BitField[ArrayFormat], vertex_count: int) -> int ; qualifiers=const

Returns the stride of the vertex positions for a mesh with given `format`. Note importantly that vertex positions are stored consecutively and are not interleaved with the other attributes in the vertex buffer (normals and tangents).

> method mesh_surface_get_material(mesh: RID, surface: int) -> RID ; qualifiers=const

Returns a mesh's surface's material.

> method mesh_surface_remove(mesh: RID, surface: int) -> void

Removes the surface at the given index from the Mesh, shifting surfaces with higher index down by one.

> method mesh_surface_set_material(mesh: RID, surface: int, material: RID) -> void

Sets a mesh's surface's material.

> method mesh_surface_update_attribute_region(mesh: RID, surface: int, offset: int, data: PackedByteArray) -> void

Updates the attribute buffer of the mesh surface with the given `data`. The expected data per attribute is 8 or 12 bytes (4 bytes per float, 2 floats per `Vector2`, and 3 floats per `Vector3`) depending on if the mesh is using `Vector2` or `Vector3` vertices. This value can be determined with `mesh_surface_get_format_attribute_stride` instead.
The starting point of the updates can be changed with `offset`. The value of `offset` should be a multiple of 12 bytes in most cases to align to each attribute.
A `PackedVector3Array` of attribute locations can be converted into a `PackedByteArray` using `PackedVector3Array.to_byte_array` for use in `data`.

> method mesh_surface_update_index_region(mesh: RID, surface: int, offset: int, data: PackedByteArray) -> void

Updates the index buffer of the mesh surface with the given `data`. The expected data are 16 or 32-bit unsigned integers, which can be determined with `mesh_surface_get_format_index_stride`.

> method mesh_surface_update_skin_region(mesh: RID, surface: int, offset: int, data: PackedByteArray) -> void

Updates the skin buffer of the mesh surface with the given `data`. The expected data per skin is 8 or 12 bytes (4 bytes per float, 2 floats per `Vector2`, and 3 floats per `Vector3`) depending on if the mesh is using `Vector2` or `Vector3` vertices. This value can be determined with `mesh_surface_get_format_skin_stride` instead.
The starting point of the updates can be changed with `offset`. The value of `offset` should be a multiple of 12 bytes in most cases to align to each skin.
A `PackedVector3Array` of skin locations can be converted into a `PackedByteArray` using `PackedVector3Array.to_byte_array` for use in `data`.

> method mesh_surface_update_vertex_region(mesh: RID, surface: int, offset: int, data: PackedByteArray) -> void

Updates the vertex buffer of the mesh surface with the given `data`. The expected data per vertex is 8 or 12 bytes (4 bytes per float, 2 floats per `Vector2`, and 3 floats per `Vector3`) depending on if the mesh is using `Vector2` or `Vector3` vertices. This value can be determined with `mesh_surface_get_format_vertex_stride` instead.
The starting point of the updates can be changed with `offset`. The value of `offset` should be a multiple of 12 bytes in most cases to align to each vertex.
A `PackedVector3Array` of vertex locations can be converted into a `PackedByteArray` using `PackedVector3Array.to_byte_array` for use in `data`.

> method multimesh_allocate_data(multimesh: RID, instances: int, transform_format: MultimeshTransformFormat, color_format: bool = false, custom_data_format: bool = false, use_indirect: bool = false) -> void

Sets up the multimesh using the specified data. The number of instances is set by `instances`. The format of the instance transforms is set by `transform_format`, which should be set according to whether the multimesh is meant to be rendered in 2D or 3D. If `color_format` is `true`, each instance will have a color associated with it. If `custom_data_format` is `true`, each instance will have a custom data vector associated with it. If `use_indirect` is `true`, an indirect command buffer will be created for this multimesh, allowing the instance count to be modified directly on the GPU. See also `multimesh_get_command_buffer_rd_rid`.

> method multimesh_create() -> RID

Creates a new multimesh on the RenderingServer and returns an `RID` handle. This RID will be used in all `multimesh_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
To place in a scene, attach this multimesh to an instance using `instance_set_base` using the returned RID.
**Note:** The equivalent resource is `MultiMesh`.

> method multimesh_get_aabb(multimesh: RID) -> AABB ; qualifiers=const

Calculates and returns the axis-aligned bounding box that encloses all instances within the multimesh.

> method multimesh_get_buffer(multimesh: RID) -> PackedFloat32Array ; qualifiers=const

Returns the MultiMesh data (such as instance transforms, colors, etc.). See `multimesh_set_buffer` for details on the returned data.
**Note:** If the buffer is in the engine's internal cache, it will have to be fetched from GPU memory and possibly decompressed. This means `multimesh_get_buffer` is potentially a slow operation and should be avoided whenever possible.

> method multimesh_get_buffer_rd_rid(multimesh: RID) -> RID ; qualifiers=const

Returns the `RenderingDevice` `RID` handle of the `MultiMesh`, which can be used as any other buffer on the Rendering Device.

> method multimesh_get_command_buffer_rd_rid(multimesh: RID) -> RID ; qualifiers=const

Returns the `RenderingDevice` `RID` handle of the `MultiMesh` command buffer. This `RID` is only valid if `use_indirect` is set to `true` when allocating data through `multimesh_allocate_data`. It can be used to directly modify the instance count via buffer.
The data structure is dependent on both how many surfaces the mesh contains and whether it is indexed or not, the buffer has 5 integers in it, with the last unused if the mesh is not indexed.
Each of the values in the buffer correspond to these options:

```text
                Indexed:
                  0 - indexCount;
                  1 - instanceCount;
                  2 - firstIndex;
                  3 - vertexOffset;
                  4 - firstInstance;
                Non-indexed:
                  0 - vertexCount;
                  1 - instanceCount;
                  2 - firstVertex;
                  3 - firstInstance;
                  4 - unused;

```

> method multimesh_get_custom_aabb(multimesh: RID) -> AABB ; qualifiers=const

Returns the custom AABB defined for this MultiMesh resource.

> method multimesh_get_instance_count(multimesh: RID) -> int ; qualifiers=const

Returns the number of instances allocated for this multimesh.

> method multimesh_get_mesh(multimesh: RID) -> RID ; qualifiers=const

Returns the RID of the mesh that will be used in drawing this multimesh.

> method multimesh_get_visible_instances(multimesh: RID) -> int ; qualifiers=const

Returns the number of visible instances for this multimesh.

> method multimesh_instance_get_color(multimesh: RID, index: int) -> Color ; qualifiers=const

Returns the color by which the specified instance will be modulated.

> method multimesh_instance_get_custom_data(multimesh: RID, index: int) -> Color ; qualifiers=const

Returns the custom data associated with the specified instance.

> method multimesh_instance_get_transform(multimesh: RID, index: int) -> Transform3D ; qualifiers=const

Returns the `Transform3D` of the specified instance.

> method multimesh_instance_get_transform_2d(multimesh: RID, index: int) -> Transform2D ; qualifiers=const

Returns the `Transform2D` of the specified instance. For use when the multimesh is set to use 2D transforms.

> method multimesh_instance_reset_physics_interpolation(multimesh: RID, index: int) -> void

Prevents physics interpolation for the specified instance during the current physics tick.
This is useful when moving an instance to a new location, to give an instantaneous change rather than interpolation from the previous location.

> method multimesh_instance_set_color(multimesh: RID, index: int, color: Color) -> void

Sets the color by which this instance will be modulated. Equivalent to `MultiMesh.set_instance_color`.

> method multimesh_instance_set_custom_data(multimesh: RID, index: int, custom_data: Color) -> void

Sets the custom data for this instance. Custom data is passed as a `Color`, but is interpreted as a `vec4` in the shader. Equivalent to `MultiMesh.set_instance_custom_data`.

> method multimesh_instance_set_transform(multimesh: RID, index: int, transform: Transform3D) -> void

Sets the `Transform3D` for this instance. Equivalent to `MultiMesh.set_instance_transform`.

> method multimesh_instance_set_transform_2d(multimesh: RID, index: int, transform: Transform2D) -> void

Sets the `Transform2D` for this instance. For use when multimesh is used in 2D. Equivalent to `MultiMesh.set_instance_transform_2d`.

> method multimesh_instances_reset_physics_interpolation(multimesh: RID) -> void

Prevents physics interpolation for all instances during the current physics tick.
This is useful when moving all instances to new locations, to give instantaneous changes rather than interpolation from the previous locations.

> method multimesh_set_buffer(multimesh: RID, buffer: PackedFloat32Array) -> void

Set the entire data to use for drawing the `multimesh` at once to `buffer` (such as instance transforms and colors). `buffer`'s size must match the number of instances multiplied by the per-instance data size (which depends on the enabled MultiMesh fields). Otherwise, an error message is printed and nothing is rendered. See also `multimesh_get_buffer`.
The per-instance data size and expected data order is:

```text
                2D:
                  - Position: 8 floats (8 floats for Transform2D)
                  - Position + Vertex color: 12 floats (8 floats for Transform2D, 4 floats for Color)
                  - Position + Custom data: 12 floats (8 floats for Transform2D, 4 floats of custom data)
                  - Position + Vertex color + Custom data: 16 floats (8 floats for Transform2D, 4 floats for Color, 4 floats of custom data)
                3D:
                  - Position: 12 floats (12 floats for Transform3D)
                  - Position + Vertex color: 16 floats (12 floats for Transform3D, 4 floats for Color)
                  - Position + Custom data: 16 floats (12 floats for Transform3D, 4 floats of custom data)
                  - Position + Vertex color + Custom data: 20 floats (12 floats for Transform3D, 4 floats for Color, 4 floats of custom data)

```

Instance transforms are in row-major order. Specifically:
- For `Transform2D` the float-order is: `(x.x, y.x, padding_float, origin.x, x.y, y.y, padding_float, origin.y)`.
- For `Transform3D` the float-order is: `(basis.x.x, basis.y.x, basis.z.x, origin.x, basis.x.y, basis.y.y, basis.z.y, origin.y, basis.x.z, basis.y.z, basis.z.z, origin.z)`.

> method multimesh_set_buffer_interpolated(multimesh: RID, buffer: PackedFloat32Array, buffer_previous: PackedFloat32Array) -> void

Alternative version of `multimesh_set_buffer` for use with physics interpolation.
Takes both an array of current data and an array of data for the previous physics tick.

> method multimesh_set_custom_aabb(multimesh: RID, aabb: AABB) -> void

Sets the custom AABB for this MultiMesh resource.

> method multimesh_set_mesh(multimesh: RID, mesh: RID) -> void

Sets the mesh to be drawn by the multimesh. Equivalent to `MultiMesh.mesh`.

> method multimesh_set_physics_interpolated(multimesh: RID, interpolated: bool) -> void

Turns on and off physics interpolation for this MultiMesh resource.

> method multimesh_set_physics_interpolation_quality(multimesh: RID, quality: MultimeshPhysicsInterpolationQuality) -> void

Sets the physics interpolation quality for the `MultiMesh`.
A value of `MULTIMESH_INTERP_QUALITY_FAST` gives fast but low quality interpolation, a value of `MULTIMESH_INTERP_QUALITY_HIGH` gives slower but higher quality interpolation.

> method multimesh_set_visible_instances(multimesh: RID, visible: int) -> void

Sets the number of instances visible at a given time. If -1, all instances that have been allocated are drawn. Equivalent to `MultiMesh.visible_instance_count`.

> method occluder_create() -> RID

Creates an occluder instance and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `occluder_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent resource is `Occluder3D` (not to be confused with the `OccluderInstance3D` node).

> method occluder_set_mesh(occluder: RID, vertices: PackedVector3Array, indices: PackedInt32Array) -> void

Sets the mesh data for the given occluder RID, which controls the shape of the occlusion culling that will be performed.

> method omni_light_create() -> RID

Creates a new omni light and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID can be used in most `light_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
To place in a scene, attach this omni light to an instance using `instance_set_base` using the returned RID.
**Note:** The equivalent node is `OmniLight3D`.

> method particles_collision_create() -> RID

Creates a new 3D GPU particle collision or attractor and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID can be used in most `particles_collision_*` RenderingServer functions.
**Note:** The equivalent nodes are `GPUParticlesCollision3D` and `GPUParticlesAttractor3D`.

> method particles_collision_height_field_update(particles_collision: RID) -> void

Requests an update for the 3D GPU particle collision heightfield. This may be automatically called by the 3D GPU particle collision heightfield depending on its `GPUParticlesCollisionHeightField3D.update_mode`.

> method particles_collision_set_attractor_attenuation(particles_collision: RID, curve: float) -> void

Sets the attenuation `curve` for the 3D GPU particles attractor specified by the `particles_collision` RID. Only used for attractors, not colliders. Equivalent to `GPUParticlesAttractor3D.attenuation`.

> method particles_collision_set_attractor_directionality(particles_collision: RID, amount: float) -> void

Sets the directionality `amount` for the 3D GPU particles attractor specified by the `particles_collision` RID. Only used for attractors, not colliders. Equivalent to `GPUParticlesAttractor3D.directionality`.

> method particles_collision_set_attractor_strength(particles_collision: RID, strength: float) -> void

Sets the `strength` for the 3D GPU particles attractor specified by the `particles_collision` RID. Only used for attractors, not colliders. Equivalent to `GPUParticlesAttractor3D.strength`.

> method particles_collision_set_box_extents(particles_collision: RID, extents: Vector3) -> void

Sets the `extents` for the 3D GPU particles collision by the `particles_collision` RID. Equivalent to `GPUParticlesCollisionBox3D.size`, `GPUParticlesCollisionSDF3D.size`, `GPUParticlesCollisionHeightField3D.size`, `GPUParticlesAttractorBox3D.size` or `GPUParticlesAttractorVectorField3D.size` depending on the `particles_collision` type.

> method particles_collision_set_collision_type(particles_collision: RID, type: ParticlesCollisionType) -> void

Sets the collision or attractor shape `type` for the 3D GPU particles collision or attractor specified by the `particles_collision` RID.

> method particles_collision_set_cull_mask(particles_collision: RID, mask: int) -> void

Sets the cull `mask` for the 3D GPU particles collision or attractor specified by the `particles_collision` RID. Equivalent to `GPUParticlesCollision3D.cull_mask` or `GPUParticlesAttractor3D.cull_mask` depending on the `particles_collision` type.

> method particles_collision_set_field_texture(particles_collision: RID, texture: RID) -> void

Sets the signed distance field `texture` for the 3D GPU particles collision specified by the `particles_collision` RID. Equivalent to `GPUParticlesCollisionSDF3D.texture` or `GPUParticlesAttractorVectorField3D.texture` depending on the `particles_collision` type.

> method particles_collision_set_height_field_mask(particles_collision: RID, mask: int) -> void

Sets the heightfield `mask` for the 3D GPU particles heightfield collision specified by the `particles_collision` RID. Equivalent to `GPUParticlesCollisionHeightField3D.heightfield_mask`.

> method particles_collision_set_height_field_resolution(particles_collision: RID, resolution: ParticlesCollisionHeightfieldResolution) -> void

Sets the heightmap `resolution` for the 3D GPU particles heightfield collision specified by the `particles_collision` RID. Equivalent to `GPUParticlesCollisionHeightField3D.resolution`.

> method particles_collision_set_sphere_radius(particles_collision: RID, radius: float) -> void

Sets the `radius` for the 3D GPU particles sphere collision or attractor specified by the `particles_collision` RID. Equivalent to `GPUParticlesCollisionSphere3D.radius` or `GPUParticlesAttractorSphere3D.radius` depending on the `particles_collision` type.

> method particles_create() -> RID

Creates a GPU-based particle system and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `particles_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
To place in a scene, attach these particles to an instance using `instance_set_base` using the returned RID.
**Note:** The equivalent nodes are `GPUParticles2D` and `GPUParticles3D`.
**Note:** All `particles_*` methods only apply to GPU-based particles, not CPU-based particles. `CPUParticles2D` and `CPUParticles3D` do not have equivalent RenderingServer functions available, as these use `MultiMeshInstance2D` and `MultiMeshInstance3D` under the hood (see `multimesh_*` methods).

> method particles_emit(particles: RID, transform: Transform3D, velocity: Vector3, color: Color, custom: Color, emit_flags: int) -> void

Manually emits particles from the `particles` instance.

> method particles_get_current_aabb(particles: RID) -> AABB

Calculates and returns the axis-aligned bounding box that contains all the particles. Equivalent to `GPUParticles3D.capture_aabb`.

> method particles_get_emitting(particles: RID) -> bool

Returns `true` if particles are currently set to emitting.

> method particles_is_inactive(particles: RID) -> bool

Returns `true` if particles are not emitting and particles are set to inactive.

> method particles_request_process(particles: RID) -> void

Add particle system to list of particle systems that need to be updated. Update will take place on the next frame, or on the next call to `instances_cull_aabb`, `instances_cull_convex`, or `instances_cull_ray`.

> method particles_request_process_time(particles: RID, process_time: float, process_time_residual: float = 0.0) -> void

Requests the particles to process for extra process time during a single frame.
`process_time` defines the time that the particles will process while emitting is on. `process_time_residual` defines the time that particles will process with emitting turned off for the simulation. When combined with the particles' speed scale set to `0.0`, this is useful to be able to seek a particle system timeline.

> method particles_restart(particles: RID) -> void

Reset the particles on the next update. Equivalent to `GPUParticles3D.restart`.

> method particles_set_amount(particles: RID, amount: int) -> void

Sets the number of particles to be drawn and allocates the memory for them. Equivalent to `GPUParticles3D.amount`.

> method particles_set_amount_ratio(particles: RID, ratio: float) -> void

Sets the amount ratio for particles to be emitted. Equivalent to `GPUParticles3D.amount_ratio`.

> method particles_set_collision_base_size(particles: RID, size: float) -> void

Sets the base size for particle collision. Equivalent to `GPUParticles3D.collision_base_size`.

> method particles_set_custom_aabb(particles: RID, aabb: AABB) -> void

Sets a custom axis-aligned bounding box for the particle system. Equivalent to `GPUParticles3D.visibility_aabb`.

> method particles_set_draw_order(particles: RID, order: ParticlesDrawOrder) -> void

Sets the draw order of the particles. Equivalent to `GPUParticles3D.draw_order`.

> method particles_set_draw_pass_mesh(particles: RID, pass: int, mesh: RID) -> void

Sets the mesh to be used for the specified draw pass. Equivalent to `GPUParticles3D.draw_pass_1`, `GPUParticles3D.draw_pass_2`, `GPUParticles3D.draw_pass_3`, and `GPUParticles3D.draw_pass_4`.

> method particles_set_draw_passes(particles: RID, count: int) -> void

Sets the number of draw passes to use. Equivalent to `GPUParticles3D.draw_passes`.

> method particles_set_emission_transform(particles: RID, transform: Transform3D) -> void

Sets the `Transform3D` that will be used by the particles when they first emit.

> method particles_set_emitter_velocity(particles: RID, velocity: Vector3) -> void

Sets the velocity of a particle node, that will be used by `ParticleProcessMaterial.inherit_velocity_ratio`.

> method particles_set_emitting(particles: RID, emitting: bool) -> void

If `true`, particles will emit over time. Setting to `false` does not reset the particles, but only stops their emission. Equivalent to `GPUParticles3D.emitting`.

> method particles_set_explosiveness_ratio(particles: RID, ratio: float) -> void

Sets the explosiveness ratio. Equivalent to `GPUParticles3D.explosiveness`.

> method particles_set_fixed_fps(particles: RID, fps: int) -> void

Sets the frame rate that the particle system rendering will be fixed to. Equivalent to `GPUParticles3D.fixed_fps`.

> method particles_set_fractional_delta(particles: RID, enable: bool) -> void

If `true`, uses fractional delta which smooths the movement of the particles. Equivalent to `GPUParticles3D.fract_delta`.

> method particles_set_interp_to_end(particles: RID, factor: float) -> void

Sets the value that informs a `ParticleProcessMaterial` to rush all particles towards the end of their lifetime.

> method particles_set_interpolate(particles: RID, enable: bool) -> void

Sets whether particles should use interpolation between fixed steps. Equivalent to `GPUParticles3D.interpolate`.

> method particles_set_lifetime(particles: RID, lifetime: float) -> void

Sets the lifetime of each particle in the system. Equivalent to `GPUParticles3D.lifetime`.

> method particles_set_mode(particles: RID, mode: ParticlesMode) -> void

Sets whether the GPU particles specified by the `particles` RID should be rendered in 2D or 3D according to `mode`.

> method particles_set_one_shot(particles: RID, one_shot: bool) -> void

If `true`, particles will emit once and then stop. Equivalent to `GPUParticles3D.one_shot`.

> method particles_set_pre_process_time(particles: RID, time: float) -> void

Sets the preprocess time for the particles' animation. This lets you delay starting an animation until after the particles have begun emitting. Equivalent to `GPUParticles3D.preprocess`.

> method particles_set_process_material(particles: RID, material: RID) -> void

Sets the material for processing the particles.
**Note:** This is not the material used to draw the materials. Equivalent to `GPUParticles3D.process_material`.

> method particles_set_randomness_ratio(particles: RID, ratio: float) -> void

Sets the emission randomness ratio. This randomizes the emission of particles within their phase. Equivalent to `GPUParticles3D.randomness`.

> method particles_set_speed_scale(particles: RID, scale: float) -> void

Sets the speed scale of the particle system. Equivalent to `GPUParticles3D.speed_scale`.

> method particles_set_subemitter(particles: RID, subemitter_particles: RID) -> void

Sets the subemitter particles for the particle system. Equivalent to `GPUParticles3D.sub_emitter`.

> method particles_set_trail_bind_poses(particles: RID, bind_poses: Array[Transform3D]) -> void

Sets the trail bind poses for the particle system. This specified as an array of `Transform3D`s representing the bind pose for each draw pass. See `GPUParticles3D.draw_skin`, `Skin.get_bind_count`, and `Skin.get_bind_pose`. Set the value for each draw pass to `Transform3D.IDENTITY` to use the default behavior, which is what built-in trails use (`RibbonTrailMesh` and `TubeTrailMesh`).

> method particles_set_trails(particles: RID, enable: bool, length_sec: float) -> void

If `enable` is `true`, enables trails for the `particles` with the specified `length_sec` in seconds. Equivalent to `GPUParticles3D.trail_enabled` and `GPUParticles3D.trail_lifetime`.

> method particles_set_transform_align(particles: RID, align: ParticlesTransformAlign) -> void

Sets the transform alignment for the particle system. Equivalent to `GPUParticles3D.transform_align`.

> method particles_set_transform_align_axis(particles: RID, rotation_axis: ParticlesTransformAlignAxis) -> void

Sets which axis to use for transform alignment.

> method particles_set_transform_align_channel_filter(particles: RID, channel_filter: ParticlesTransformAlignCustomSrc) -> void

When using Z-Billboarding, which CUSTOM channel to read from.

> method particles_set_use_local_coordinates(particles: RID, enable: bool) -> void

If `true`, particles use local coordinates. If `false` they use global coordinates. Equivalent to `GPUParticles3D.local_coords`.

> method positional_soft_shadow_filter_set_quality(quality: ShadowQuality) -> void

Sets the filter quality for omni and spot light shadows in 3D. See also `ProjectSettings.rendering/lights_and_shadows/positional_shadow/soft_shadow_filter_quality`. This parameter is global and cannot be set on a per-viewport basis.

> method reflection_probe_create() -> RID

Creates a reflection probe and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `reflection_probe_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
To place in a scene, attach this reflection probe to an instance using `instance_set_base` using the returned RID.
**Note:** The equivalent node is `ReflectionProbe`.

> method reflection_probe_set_ambient_color(probe: RID, color: Color) -> void

Sets the reflection probe's custom ambient light color. Equivalent to `ReflectionProbe.ambient_color`.

> method reflection_probe_set_ambient_energy(probe: RID, energy: float) -> void

Sets the reflection probe's custom ambient light energy. Equivalent to `ReflectionProbe.ambient_color_energy`.

> method reflection_probe_set_ambient_mode(probe: RID, mode: ReflectionProbeAmbientMode) -> void

Sets the reflection probe's ambient light mode. Equivalent to `ReflectionProbe.ambient_mode`.

> method reflection_probe_set_as_interior(probe: RID, enable: bool) -> void

If `true`, reflections will ignore sky contribution. Equivalent to `ReflectionProbe.interior`.

> method reflection_probe_set_blend_distance(probe: RID, blend_distance: float) -> void

Sets the distance in meters over which a probe blends into the scene.

> method reflection_probe_set_cull_mask(probe: RID, layers: int) -> void

Sets the render cull mask for this reflection probe. Only instances with a matching layer will be reflected by this probe. Equivalent to `ReflectionProbe.cull_mask`.

> method reflection_probe_set_enable_box_projection(probe: RID, enable: bool) -> void

If `true`, uses box projection. This can make reflections look more correct in certain situations. Equivalent to `ReflectionProbe.box_projection`.

> method reflection_probe_set_enable_shadows(probe: RID, enable: bool) -> void

If `true`, computes shadows in the reflection probe. This makes the reflection much slower to compute. Equivalent to `ReflectionProbe.enable_shadows`.

> method reflection_probe_set_intensity(probe: RID, intensity: float) -> void

Sets the intensity of the reflection probe. Intensity modulates the strength of the reflection. Equivalent to `ReflectionProbe.intensity`.

> method reflection_probe_set_max_distance(probe: RID, distance: float) -> void

Sets the max distance away from the probe an object can be before it is culled. Equivalent to `ReflectionProbe.max_distance`.

> method reflection_probe_set_mesh_lod_threshold(probe: RID, pixels: float) -> void

Sets the mesh level of detail to use in the reflection probe rendering. Higher values will use less detailed versions of meshes that have LOD variations generated, which can improve performance. Equivalent to `ReflectionProbe.mesh_lod_threshold`.

> method reflection_probe_set_origin_offset(probe: RID, offset: Vector3) -> void

Sets the origin offset to be used when this reflection probe is in box project mode. Equivalent to `ReflectionProbe.origin_offset`.

> method reflection_probe_set_reflection_mask(probe: RID, layers: int) -> void

Sets the render reflection mask for this reflection probe. Only instances with a matching layer will have reflections applied from this probe. Equivalent to `ReflectionProbe.reflection_mask`.

> method reflection_probe_set_resolution(probe: RID, resolution: int) -> void ; deprecated=This method has not done anything since Godot 3.

Deprecated. This method does nothing.

> method reflection_probe_set_size(probe: RID, size: Vector3) -> void

Sets the size of the area that the reflection probe will capture. Equivalent to `ReflectionProbe.size`.

> method reflection_probe_set_update_mode(probe: RID, mode: ReflectionProbeUpdateMode) -> void

Sets how often the reflection probe updates. Can either be once or every frame.

> method request_frame_drawn_callback(callable: Callable) -> void

Schedules a callback to the given callable after a frame has been drawn.

> method scenario_create() -> RID

Creates a scenario and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `scenario_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
The scenario is the 3D world that all the visual instances exist in.

> method scenario_set_camera_attributes(scenario: RID, effects: RID) -> void

Sets the camera attributes (`effects`) that will be used with this scenario. See also `CameraAttributes`.

> method scenario_set_compositor(scenario: RID, compositor: RID) -> void

Sets the compositor (`compositor`) that will be used with this scenario. See also `Compositor`.

> method scenario_set_environment(scenario: RID, environment: RID) -> void

Sets the environment that will be used with this scenario. See also `Environment`.

> method scenario_set_fallback_environment(scenario: RID, environment: RID) -> void

Sets the fallback environment to be used by this scenario. The fallback environment is used if no environment is set. Internally, this is used by the editor to provide a default environment.

> method screen_space_roughness_limiter_set_active(enable: bool, amount: float, limit: float) -> void

Sets the screen-space roughness limiter parameters, such as whether it should be enabled and its thresholds. Equivalent to `ProjectSettings.rendering/anti_aliasing/screen_space_roughness_limiter/enabled`, `ProjectSettings.rendering/anti_aliasing/screen_space_roughness_limiter/amount` and `ProjectSettings.rendering/anti_aliasing/screen_space_roughness_limiter/limit`.

> method set_boot_image(image: Image, color: Color, scale: bool, use_filter: bool = true) -> void ; deprecated=Use `set_boot_image_with_stretch` instead.

Sets a boot image. The `color` defines the background color. The value of `scale` indicates if the image will be scaled to fit the screen size. If `use_filter` is `true`, the image will be scaled with linear interpolation. If `use_filter` is `false`, the image will be scaled with nearest-neighbor interpolation.

> method set_boot_image_with_stretch(image: Image, color: Color, stretch_mode: SplashStretchMode, use_filter: bool = true) -> void

Sets a boot image. The `color` defines the background color. The value of `stretch_mode` indicates how the image will be stretched (see `SplashStretchMode` for possible values). If `use_filter` is `true`, the image will be scaled with linear interpolation. If `use_filter` is `false`, the image will be scaled with nearest-neighbor interpolation.

> method set_debug_generate_wireframes(generate: bool) -> void

If `generate` is `true`, generates debug wireframes for all meshes that are loaded when using the Compatibility renderer. By default, the engine does not generate debug wireframes at runtime, since they slow down loading of assets and take up VRAM.
**Note:** You must call this method before loading any meshes when using the Compatibility renderer. Otherwise, wireframes will not be used.

> method set_default_clear_color(color: Color) -> void

Sets the default clear color which is used when a specific clear color has not been selected. See also `get_default_clear_color`.

> method shader_create() -> RID

Creates an empty shader and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `shader_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent resource is `Shader`.

> method shader_get_code(shader: RID) -> String ; qualifiers=const

Returns a shader's source code as a string.

> method shader_get_default_texture_parameter(shader: RID, name: StringName, index: int = 0) -> RID ; qualifiers=const

Returns a default texture from a shader searched by name.
**Note:** If the sampler array is used use `index` to access the specified texture.

> method shader_get_parameter_default(shader: RID, name: StringName) -> Variant ; qualifiers=const

Returns the default value for the specified shader uniform. This is usually the value written in the shader source code.

> method shader_set_code(shader: RID, code: String) -> void

Sets the shader's source code (which triggers recompilation after being changed).

> method shader_set_default_texture_parameter(shader: RID, name: StringName, texture: RID, index: int = 0) -> void

Sets a shader's default texture. Overwrites the texture given by name.
**Note:** If the sampler array is used use `index` to access the specified texture.

> method shader_set_path_hint(shader: RID, path: String) -> void

Sets the path hint for the specified shader. This should generally match the `Shader` resource's `Resource.resource_path`.

> method skeleton_allocate_data(skeleton: RID, bones: int, is_2d_skeleton: bool = false) -> void

Allocates data for this skeleton using the number of bones specified in `bones`. If `is_2d_skeleton` is `true`, the skeleton will be treated as a 2D skeleton instead of a 3D skeleton. See also `skeleton_get_bone_count`.

> method skeleton_bone_get_transform(skeleton: RID, bone: int) -> Transform3D ; qualifiers=const

Returns the `Transform3D` set for a specific bone of this skeleton.

> method skeleton_bone_get_transform_2d(skeleton: RID, bone: int) -> Transform2D ; qualifiers=const

Returns the `Transform2D` set for a specific bone of this skeleton.

> method skeleton_bone_set_transform(skeleton: RID, bone: int, transform: Transform3D) -> void

Sets the `Transform3D` for a specific bone of this skeleton.

> method skeleton_bone_set_transform_2d(skeleton: RID, bone: int, transform: Transform2D) -> void

Sets the `Transform2D` for a specific bone of this skeleton.

> method skeleton_create() -> RID

Creates a skeleton and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `skeleton_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.

> method skeleton_get_bone_count(skeleton: RID) -> int ; qualifiers=const

Returns the number of bones allocated for this skeleton. See also `skeleton_allocate_data`.

> method skeleton_set_base_transform_2d(skeleton: RID, base_transform: Transform2D) -> void

Sets the base `Transform2D` to use for the specified skeleton.

> method sky_bake_panorama(sky: RID, energy: float, bake_irradiance: bool, size: Vector2i) -> Image

Generates and returns an `Image` containing the radiance map for the specified `sky` RID. This supports built-in sky material and custom sky shaders. If `bake_irradiance` is `true`, the irradiance map is saved instead of the radiance map. The radiance map is used to render reflected light, while the irradiance map is used to render ambient light. See also `environment_bake_panorama`.
**Note:** The image is saved using linear encoding without any tonemapping performed, which means it will look too dark if viewed directly in an image editor. `energy` values above `1.0` can be used to brighten the resulting image.
**Note:** `size` should be a 2:1 aspect ratio for the generated panorama to have square pixels. For radiance maps, there is no point in using a height greater than `Sky.radiance_size`, as it won't increase detail. Irradiance maps only contain low-frequency data, so there is usually no point in going past a size of 128×64 pixels when saving an irradiance map.

> method sky_create() -> RID

Creates an empty sky and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `sky_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.

> method sky_set_material(sky: RID, material: RID) -> void

Sets the material that the sky uses to render the background, ambient and reflection maps.

> method sky_set_mode(sky: RID, mode: SkyMode) -> void

Sets the process `mode` of the sky specified by the `sky` RID. Equivalent to `Sky.process_mode`.

> method sky_set_radiance_size(sky: RID, radiance_size: int) -> void

Sets the `radiance_size` of the sky specified by the `sky` RID (in pixels). Equivalent to `Sky.radiance_size`.

> method spot_light_create() -> RID

Creates a spot light and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID can be used in most `light_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
To place in a scene, attach this spot light to an instance using `instance_set_base` using the returned RID.

> method sub_surface_scattering_set_quality(quality: SubSurfaceScatteringQuality) -> void

Sets `ProjectSettings.rendering/environment/subsurface_scattering/subsurface_scattering_quality` to use when rendering materials that have subsurface scattering enabled.

> method sub_surface_scattering_set_scale(scale: float, depth_scale: float) -> void

Sets the `ProjectSettings.rendering/environment/subsurface_scattering/subsurface_scattering_scale` and `ProjectSettings.rendering/environment/subsurface_scattering/subsurface_scattering_depth_scale` to use when rendering materials that have subsurface scattering enabled.

> method texture_2d_create(image: Image) -> RID

Creates a 2-dimensional texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `texture_2d_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent resource is `Texture2D`.
**Note:** Not to be confused with `RenderingDevice.texture_create`, which creates the graphics API's own texture type as opposed to the Godot-specific `Texture2D` resource.

> method texture_2d_get(texture: RID) -> Image ; qualifiers=const

Returns an `Image` instance from the given `texture` `RID`.
**Example:** Get the test texture from `get_test_texture` and apply it to a `Sprite2D` node:

```text
                var texture_rid = RenderingServer.get_test_texture()
                var texture = ImageTexture.create_from_image(RenderingServer.texture_2d_get(texture_rid))
                $Sprite2D.texture = texture

```

> method texture_2d_layer_get(texture: RID, layer: int) -> Image ; qualifiers=const

Returns an `Image` instance from the given `texture` `RID` and `layer`.

> method texture_2d_layered_create(layers: Array[Image], layered_type: TextureLayeredType) -> RID

Creates a 2-dimensional layered texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `texture_2d_layered_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent resource is `TextureLayered`.

> method texture_2d_layered_placeholder_create(layered_type: TextureLayeredType) -> RID

Creates a placeholder for a 2-dimensional layered texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `texture_2d_layered_*` RenderingServer functions, although it does nothing when used. See also `texture_2d_placeholder_create`.
**Note:** The equivalent resource is `PlaceholderTextureLayered`.

> method texture_2d_placeholder_create() -> RID

Creates a placeholder for a 2-dimensional layered texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `texture_2d_layered_*` RenderingServer functions, although it does nothing when used. See also `texture_2d_layered_placeholder_create`.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent resource is `PlaceholderTexture2D`.

> method texture_2d_update(texture: RID, image: Image, layer: int) -> void

Updates the texture specified by the `texture` `RID` with the data in `image`. A `layer` must also be specified, which should be `0` when updating a single-layer texture (`Texture2D`).
**Note:** The `image` must have the same width, height and format as the current `texture` data. Otherwise, an error will be printed and the original texture won't be modified. If you need to use different width, height or format, use `texture_replace` instead.

> method texture_3d_create(format: Image.Format, width: int, height: int, depth: int, mipmaps: bool, data: Array[Image]) -> RID

**Note:** The equivalent resource is `Texture3D`.

> method texture_3d_get(texture: RID) -> Array[Image] ; qualifiers=const

Returns 3D texture data as an array of `Image`s for the specified texture `RID`.

> method texture_3d_placeholder_create() -> RID

Creates a placeholder for a 3-dimensional texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `texture_3d_*` RenderingServer functions, although it does nothing when used.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent resource is `PlaceholderTexture3D`.

> method texture_3d_update(texture: RID, data: Array[Image]) -> void

Updates the texture specified by the `texture` `RID`'s data with the data in `data`. All the texture's layers must be replaced at once.
**Note:** The `texture` must have the same width, height, depth and format as the current texture data. Otherwise, an error will be printed and the original texture won't be modified. If you need to use different width, height, depth or format, use `texture_replace` instead.

> method texture_create_from_native_handle(type: TextureType, format: Image.Format, native_handle: int, width: int, height: int, depth: int, layers: int = 1, layered_type: TextureLayeredType = 0) -> RID

Creates a texture based on a native handle that was created outside of Godot's renderer.
**Note:** If using only the rendering device renderer, it's recommend to use `RenderingDevice.texture_create_from_extension` together with `RenderingServer.texture_rd_create`, rather than this method. This way, the texture's format and usage can be controlled more effectively.

> method texture_drawable_blit_rect(textures: Array[RID], rect: Rect2i, material: RID, modulate: Color, source_textures: Array[RID], to_mipmap: int = 0) -> void

Draws to `rect` on up to 4 given Drawable `textures`, using a TextureBlit Shader from `material`. `modulate` and up to 4 `source_textures` are uniforms for the Shader to process with. `to_mipmap` can specify to perform this draw to a lower mipmap level.
**Note:** All `textures` must be the same size and format.

> method texture_drawable_create(width: int, height: int, format: TextureDrawableFormat, color: Color = Color(1, 1, 1, 1), with_mipmaps: bool = false) -> RID

Creates a 2-dimensional texture and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `texture_drawable*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent resource is `DrawableTexture2D`.

> method texture_drawable_generate_mipmaps(texture: RID) -> void

Calculates new MipMaps for the given Drawable `texture`.

> method texture_drawable_get_default_material() -> RID ; qualifiers=const

Returns a ShaderMaterial with the default texture_blit Shader.

> method texture_get_format(texture: RID) -> Image.Format ; qualifiers=const

Returns the format for the texture.

> method texture_get_native_handle(texture: RID, srgb: bool = false) -> int ; qualifiers=const

Returns the internal graphics handle for this texture object. For use when communicating with third-party APIs mostly with GDExtension.
`srgb` should be `true` when the texture uses nonlinear sRGB encoding and `false` when the texture uses linear encoding.
**Note:** This function returns a `uint64_t` which internally maps to a `GLuint` (OpenGL) or `VkImage` (Vulkan).

> method texture_get_path(texture: RID) -> String ; qualifiers=const

Returns the resource path (starting with `res://` or `uid://`) for the specified texture RID. Returns an empty `String` if the resource is built-in. See also `texture_set_path`.

> method texture_get_rd_texture(texture: RID, srgb: bool = false) -> RID ; qualifiers=const

Returns a texture `RID` that can be used with `RenderingDevice`.
`srgb` should be `true` when the texture uses nonlinear sRGB encoding and `false` when the texture uses linear encoding.

> method texture_proxy_create(base: RID) -> RID ; deprecated=ProxyTexture was removed in Godot 4.

This method does nothing and always returns an invalid `RID`.

> method texture_proxy_update(texture: RID, proxy_to: RID) -> void ; deprecated=ProxyTexture was removed in Godot 4.

This method does nothing.

> method texture_rd_create(rd_texture: RID, layer_type: TextureLayeredType = 0) -> RID

Creates a new texture object based on a texture created directly on the `RenderingDevice`. If the texture contains layers, `layer_type` is used to define the layer type.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The RenderingServer's `free_rid` won't free the underlying `rd_texture`, you will want to free the `rd_texture` using `RenderingDevice.free_rid`.

> method texture_replace(texture: RID, by_texture: RID) -> void

Replaces `texture`'s texture data by the texture specified by the `by_texture` RID, without changing `texture`'s RID.

> method texture_set_force_redraw_if_visible(texture: RID, enable: bool) -> void

Sets whether the texture RID should force redrawing when it's visible on screen when `OS.low_processor_usage_mode` is `true`. This is used by `AnimatedTexture` to force redrawing.

> method texture_set_path(texture: RID, path: String) -> void

Sets the resource path for this texture RID. See also `texture_get_path`.
**Note:** This is purely a hint and does not cause the texture to be automatically saved when set to a `res://` path.

> method texture_set_size_override(texture: RID, width: int, height: int) -> void

Sets the size at which the texture should be *displayed* in 2D, ignoring its original size. This does not rescale the texture data itself, only how it is drawn in 2D. Set `width` and `height` to 0 to disable the size override.

> method viewport_attach_camera(viewport: RID, camera: RID) -> void

Sets a viewport's camera.

> method viewport_attach_canvas(viewport: RID, canvas: RID) -> void

Sets a viewport's canvas.

> method viewport_attach_to_screen(viewport: RID, rect: Rect2 = Rect2(0, 0, 0, 0), screen: int = 0) -> void

Copies the viewport to a region of the screen specified by `rect`. If `viewport_set_render_direct_to_screen` is `true`, then the viewport does not use a framebuffer and the contents of the viewport are rendered directly to screen. However, note that the root viewport is drawn last, therefore it will draw over the screen. Accordingly, you must set the root viewport to an area that does not cover the area that you have attached this viewport to.
For example, you can set the root viewport to not render at all with the following code:

```gdscript
                func _ready():
                    RenderingServer.viewport_attach_to_screen(get_viewport().get_viewport_rid(), Rect2())
                    RenderingServer.viewport_attach_to_screen($Viewport.get_viewport_rid(), Rect2(0, 0, 600, 600))

```

Using this can result in significant optimization, especially on lower-end devices. However, it comes at the cost of having to manage your viewports manually. For further optimization, see `viewport_set_render_direct_to_screen`.

> method viewport_create() -> RID

Creates an empty viewport and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `viewport_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent node is `Viewport`.

> method viewport_get_measured_render_time_cpu(viewport: RID) -> float ; qualifiers=const

Returns the CPU time taken to render the last frame in milliseconds. This *only* includes time spent in rendering-related operations; scripts' `_process` functions and other engine subsystems are not included in this readout. To get a complete readout of CPU time spent to render the scene, sum the render times of all viewports that are drawn every frame plus `get_frame_setup_time_cpu`. Unlike `Engine.get_frames_per_second`, this method will accurately reflect CPU utilization even if framerate is capped via V-Sync or `Engine.max_fps`. See also `viewport_get_measured_render_time_gpu`.
**Note:** Requires measurements to be enabled on the specified `viewport` using `viewport_set_measure_render_time`. Otherwise, this method returns `0.0`.

> method viewport_get_measured_render_time_gpu(viewport: RID) -> float ; qualifiers=const

Returns the GPU time taken to render the last frame in milliseconds. To get a complete readout of GPU time spent to render the scene, sum the render times of all viewports that are drawn every frame. Unlike `Engine.get_frames_per_second`, this method accurately reflects GPU utilization even if framerate is capped via V-Sync or `Engine.max_fps`. See also `viewport_get_measured_render_time_cpu`.
**Note:** Requires measurements to be enabled on the specified `viewport` using `viewport_set_measure_render_time`. Otherwise, this method returns `0.0`.
**Note:** When GPU utilization is low enough during a certain period of time, GPUs will decrease their power state (which in turn decreases core and memory clock speeds). This can cause the reported GPU time to increase if GPU utilization is kept low enough by a framerate cap (compared to what it would be at the GPU's highest power state). Keep this in mind when benchmarking using `viewport_get_measured_render_time_gpu`. This behavior can be overridden in the graphics driver settings at the cost of higher power usage.

> method viewport_get_render_info(viewport: RID, type: ViewportRenderInfoType, info: ViewportRenderInfo) -> int

Returns a statistic about the rendering engine which can be used for performance profiling. This is separated into render pass `type`s, each of them having the same `info`s you can query (different passes will return different values).
See also `get_rendering_info`, which returns global information across all viewports.
**Note:** Viewport rendering information is not available until at least 2 frames have been rendered by the engine. If rendering information is not available, `viewport_get_render_info` returns `0`. To print rendering information in `_ready()` successfully, use the following:

```text
                func _ready():
                    for _i in 2:
                        await get_tree().process_frame

                    print(
                            RenderingServer.viewport_get_render_info(get_viewport().get_viewport_rid(),
                            RenderingServer.VIEWPORT_RENDER_INFO_TYPE_VISIBLE,
                            RenderingServer.VIEWPORT_RENDER_INFO_DRAW_CALLS_IN_FRAME)
                    )

```

> method viewport_get_render_target(viewport: RID) -> RID ; qualifiers=const

Returns the render target for the viewport.

> method viewport_get_texture(viewport: RID) -> RID ; qualifiers=const

Returns the viewport's last rendered frame.

> method viewport_get_update_mode(viewport: RID) -> ViewportUpdateMode ; qualifiers=const

Returns the viewport's update mode.
**Warning:** Calling this from any thread other than the rendering thread will be detrimental to performance.

> method viewport_remove_canvas(viewport: RID, canvas: RID) -> void

Detaches a viewport from a canvas.

> method viewport_set_active(viewport: RID, active: bool) -> void

If `true`, sets the viewport active, else sets it inactive.

> method viewport_set_anisotropic_filtering_level(viewport: RID, anisotropic_filtering_level: ViewportAnisotropicFiltering) -> void

Sets the maximum number of samples to take when using anisotropic filtering on textures (as a power of two). A higher sample count will result in sharper textures at oblique angles, but is more expensive to compute. A value of `0` forcibly disables anisotropic filtering, even on materials where it is enabled.
The anisotropic filtering level also affects decals and light projectors if they are configured to use anisotropic filtering. See `ProjectSettings.rendering/textures/decals/filter` and `ProjectSettings.rendering/textures/light_projectors/filter`.
**Note:** In 3D, for this setting to have an effect, set `BaseMaterial3D.texture_filter` to `BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC` or `BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC` on materials.
**Note:** In 2D, for this setting to have an effect, set `CanvasItem.texture_filter` to `CanvasItem.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC` or `CanvasItem.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC` on the `CanvasItem` node displaying the texture (or in `CanvasTexture`). However, anisotropic filtering is rarely useful in 2D, so only enable it for textures in 2D if it makes a meaningful visual difference.

> method viewport_set_canvas_cull_mask(viewport: RID, canvas_cull_mask: int) -> void

Sets the rendering mask associated with this `Viewport`. Only `CanvasItem` nodes with a matching rendering visibility layer will be rendered by this `Viewport`.

> method viewport_set_canvas_stacking(viewport: RID, canvas: RID, layer: int, sublayer: int) -> void

Sets the stacking order for a viewport's canvas.
`layer` is the actual canvas layer, while `sublayer` specifies the stacking order of the canvas among those in the same layer.
**Note:** `layer` should be between `CANVAS_LAYER_MIN` and `CANVAS_LAYER_MAX` (inclusive). Any other value will wrap around.

> method viewport_set_canvas_transform(viewport: RID, canvas: RID, offset: Transform2D) -> void

Sets the transformation of a viewport's canvas.

> method viewport_set_clear_mode(viewport: RID, clear_mode: ViewportClearMode) -> void

Sets the clear mode of a viewport.

> method viewport_set_debug_draw(viewport: RID, draw: ViewportDebugDraw) -> void

Sets the debug draw mode of a viewport.

> method viewport_set_default_canvas_item_texture_filter(viewport: RID, filter: CanvasItemTextureFilter) -> void

Sets the default texture filtering mode for the specified `viewport` RID.

> method viewport_set_default_canvas_item_texture_repeat(viewport: RID, repeat: CanvasItemTextureRepeat) -> void

Sets the default texture repeat mode for the specified `viewport` RID.

> method viewport_set_disable_2d(viewport: RID, disable: bool) -> void

If `true`, the viewport's canvas (i.e. 2D and GUI elements) is not rendered.

> method viewport_set_disable_3d(viewport: RID, disable: bool) -> void

If `true`, the viewport's 3D elements are not rendered.

> method viewport_set_environment_mode(viewport: RID, mode: ViewportEnvironmentMode) -> void

Sets the viewport's environment mode which allows enabling or disabling rendering of 3D environment over 2D canvas. When disabled, 2D will not be affected by the environment. When enabled, 2D will be affected by the environment if the environment background mode is `ENV_BG_CANVAS`. The default behavior is to inherit the setting from the viewport's parent. If the topmost parent is also set to `VIEWPORT_ENVIRONMENT_INHERIT`, then the behavior will be the same as if it was set to `VIEWPORT_ENVIRONMENT_ENABLED`.

> method viewport_set_fsr_sharpness(viewport: RID, sharpness: float) -> void

Determines how sharp the upscaled image will be when using the FSR upscaling mode. Sharpness halves with every whole number. Values go from 0.0 (sharpest) to 2.0. Values above 2.0 won't make a visible difference.

> method viewport_set_global_canvas_transform(viewport: RID, transform: Transform2D) -> void

Sets the viewport's global transformation matrix.

> method viewport_set_measure_render_time(viewport: RID, enable: bool) -> void

Sets the measurement for the given `viewport` RID (obtained using `Viewport.get_viewport_rid`). Once enabled, `viewport_get_measured_render_time_cpu` and `viewport_get_measured_render_time_gpu` will return values greater than `0.0` when queried with the given `viewport`.

> method viewport_set_msaa_2d(viewport: RID, msaa: ViewportMSAA) -> void

Sets the multisample antialiasing mode for 2D/Canvas on the specified `viewport` RID. Equivalent to `ProjectSettings.rendering/anti_aliasing/quality/msaa_2d` or `Viewport.msaa_2d`.

> method viewport_set_msaa_3d(viewport: RID, msaa: ViewportMSAA) -> void

Sets the multisample antialiasing mode for 3D on the specified `viewport` RID. Equivalent to `ProjectSettings.rendering/anti_aliasing/quality/msaa_3d` or `Viewport.msaa_3d`.

> method viewport_set_occlusion_culling_build_quality(quality: ViewportOcclusionCullingBuildQuality) -> void

Sets the `ProjectSettings.rendering/occlusion_culling/bvh_build_quality` to use for occlusion culling. This parameter is global and cannot be set on a per-viewport basis.

> method viewport_set_occlusion_rays_per_thread(rays_per_thread: int) -> void

Sets the `ProjectSettings.rendering/occlusion_culling/occlusion_rays_per_thread` to use for occlusion culling. This parameter is global and cannot be set on a per-viewport basis.

> method viewport_set_parent_viewport(viewport: RID, parent_viewport: RID) -> void

Sets the viewport's parent to the viewport specified by the `parent_viewport` RID.

> method viewport_set_positional_shadow_atlas_quadrant_subdivision(viewport: RID, quadrant: int, subdivision: int) -> void

Sets the number of subdivisions to use in the specified shadow atlas `quadrant` for omni and spot shadows. See also `Viewport.set_positional_shadow_atlas_quadrant_subdiv`.

> method viewport_set_positional_shadow_atlas_size(viewport: RID, size: int, use_16_bits: bool = false) -> void

Sets the `size` of the shadow atlas's images (used for omni and spot lights) on the viewport specified by the `viewport` RID. The value is rounded up to the nearest power of 2. If `use_16_bits` is `true`, use 16 bits for the omni/spot shadow depth map. Enabling this results in shadows having less precision and may result in shadow acne, but can lead to performance improvements on some devices.
**Note:** If this is set to `0`, no positional shadows will be visible at all. This can improve performance significantly on low-end systems by reducing both the CPU and GPU load (as fewer draw calls are needed to draw the scene without shadows).

> method viewport_set_render_direct_to_screen(viewport: RID, enabled: bool) -> void

If `true`, render the contents of the viewport directly to screen. This allows a low-level optimization where you can skip drawing a viewport to the root viewport. While this optimization can result in a significant increase in speed (especially on older devices), it comes at a cost of usability. When this is enabled, you cannot read from the viewport or from the screen_texture. You also lose the benefit of certain window settings, such as the various stretch modes. Another consequence to be aware of is that in 2D the rendering happens in window coordinates, so if you have a viewport that is double the size of the window, and you set this, then only the portion that fits within the window will be drawn, no automatic scaling is possible, even if your game scene is significantly larger than the window size.

> method viewport_set_scaling_3d_mode(viewport: RID, scaling_3d_mode: ViewportScaling3DMode) -> void

Sets the 3D resolution scaling mode. Bilinear scaling renders at different resolution to either undersample or supersample the viewport. FidelityFX Super Resolution 1.0, abbreviated to FSR, is an upscaling technology that produces high quality images at fast framerates by using a spatially aware upscaling algorithm. FSR is slightly more expensive than bilinear, but it produces significantly higher image quality. FSR should be used where possible.

> method viewport_set_scaling_3d_scale(viewport: RID, scale: float) -> void

Scales the 3D render buffer based on the viewport size uses an image filter specified in `ViewportScaling3DMode` to scale the output image to the full viewport size. Values lower than `1.0` can be used to speed up 3D rendering at the cost of quality (undersampling). Values greater than `1.0` are only valid for bilinear mode and can be used to improve 3D rendering quality at a high performance cost (supersampling). See also `ViewportMSAA` for multi-sample antialiasing, which is significantly cheaper but only smoothens the edges of polygons.
When using FSR upscaling, AMD recommends exposing the following values as preset options to users "Ultra Quality: 0.77", "Quality: 0.67", "Balanced: 0.59", "Performance: 0.5" instead of exposing the entire scale.

> method viewport_set_scenario(viewport: RID, scenario: RID) -> void

Sets a viewport's scenario. The scenario contains information about environment information, reflection atlas, etc.

> method viewport_set_screen_space_aa(viewport: RID, mode: ViewportScreenSpaceAA) -> void

Sets the viewport's screen-space antialiasing mode. Equivalent to `ProjectSettings.rendering/anti_aliasing/quality/screen_space_aa` or `Viewport.screen_space_aa`.

> method viewport_set_sdf_oversize_and_scale(viewport: RID, oversize: ViewportSDFOversize, scale: ViewportSDFScale) -> void

Sets the viewport's 2D signed distance field `ProjectSettings.rendering/2d/sdf/oversize` and `ProjectSettings.rendering/2d/sdf/scale`. This is used when sampling the signed distance field in `CanvasItem` shaders as well as `GPUParticles2D` collision. This is *not* used by SDFGI in 3D rendering.

> method viewport_set_size(viewport: RID, width: int, height: int, view_count: int = 1) -> void

Sets the viewport's `width` and `height` in pixels. Optionally the `view_count` can be set to increase the number of view layers for stereo rendering.

> method viewport_set_snap_2d_transforms_to_pixel(viewport: RID, enabled: bool) -> void

If `true`, canvas item transforms (i.e. origin position) are snapped to the nearest pixel when rendering. This can lead to a crisper appearance at the cost of less smooth movement, especially when `Camera2D` smoothing is enabled. Equivalent to `ProjectSettings.rendering/2d/snap/snap_2d_transforms_to_pixel`.

> method viewport_set_snap_2d_vertices_to_pixel(viewport: RID, enabled: bool) -> void

If `true`, canvas item vertices (i.e. polygon points) are snapped to the nearest pixel when rendering. This can lead to a crisper appearance at the cost of less smooth movement, especially when `Camera2D` smoothing is enabled. Equivalent to `ProjectSettings.rendering/2d/snap/snap_2d_vertices_to_pixel`.

> method viewport_set_texture_mipmap_bias(viewport: RID, mipmap_bias: float) -> void

Affects the final texture sharpness by reading from a lower or higher mipmap (also called "texture LOD bias"). Negative values make mipmapped textures sharper but grainier when viewed at a distance, while positive values make mipmapped textures blurrier (even when up close). To get sharper textures at a distance without introducing too much graininess, set this between `-0.75` and `0.0`. Enabling temporal antialiasing (`ProjectSettings.rendering/anti_aliasing/quality/use_taa`) can help reduce the graininess visible when using negative mipmap bias.
**Note:** When the 3D scaling mode is set to FSR 1.0, this value is used to adjust the automatic mipmap bias which is calculated internally based on the scale factor. The formula for this is `-log2(1.0 / scale) + mipmap_bias`.
**Note:** This method is only supported in the Forward+ and Mobile renderers, not Compatibility. In Compatibility, this method is always treated as if `mipmap_bias` was set to `0.0`.

> method viewport_set_transparent_background(viewport: RID, enabled: bool) -> void

If `true`, the viewport renders its background as transparent.

> method viewport_set_update_mode(viewport: RID, update_mode: ViewportUpdateMode) -> void

Sets when the viewport should be updated.

> method viewport_set_use_debanding(viewport: RID, enable: bool) -> void

Equivalent to `Viewport.use_debanding`. See also `ProjectSettings.rendering/anti_aliasing/quality/use_debanding`.

> method viewport_set_use_hdr_2d(viewport: RID, enabled: bool) -> void

If `true`, 2D rendering will use a high dynamic range (HDR) `RGBA16` format framebuffer. Additionally, 2D rendering will be performed on linear values and will be converted using the appropriate transfer function immediately before blitting to the screen (if the Viewport is attached to the screen).
Practically speaking, this means that the end result of the Viewport will not be clamped to the `0-1` range and can be used in 3D rendering without color encoding adjustments. This allows 2D rendering to take advantage of effects requiring high dynamic range (e.g. 2D glow) as well as substantially improves the appearance of effects requiring highly detailed gradients. This setting has the same effect as `Viewport.use_hdr_2d`.

> method viewport_set_use_occlusion_culling(viewport: RID, enable: bool) -> void

If `true`, enables occlusion culling on the specified viewport. Equivalent to `ProjectSettings.rendering/occlusion_culling/use_occlusion_culling`.

> method viewport_set_use_taa(viewport: RID, enable: bool) -> void

If `true`, use temporal antialiasing. Equivalent to `ProjectSettings.rendering/anti_aliasing/quality/use_taa` or `Viewport.use_taa`.

> method viewport_set_use_xr(viewport: RID, use_xr: bool) -> void

If `true`, the viewport uses augmented or virtual reality technologies. See `XRInterface`.

> method viewport_set_vrs_mode(viewport: RID, mode: ViewportVRSMode) -> void

Sets the Variable Rate Shading (VRS) mode for the viewport. If the GPU does not support VRS, this property is ignored. Equivalent to `ProjectSettings.rendering/vrs/mode`.

> method viewport_set_vrs_texture(viewport: RID, texture: RID) -> void

The texture to use when the VRS mode is set to `RenderingServer.VIEWPORT_VRS_TEXTURE`. Equivalent to `ProjectSettings.rendering/vrs/texture`.

> method viewport_set_vrs_update_mode(viewport: RID, mode: ViewportVRSUpdateMode) -> void

Sets the update mode for Variable Rate Shading (VRS) for the viewport. VRS requires the input texture to be converted to the format usable by the VRS method supported by the hardware. The update mode defines how often this happens. If the GPU does not support VRS, or VRS is not enabled, this property is ignored.
If set to `RenderingServer.VIEWPORT_VRS_UPDATE_ONCE`, the input texture is copied once and the mode is changed to `RenderingServer.VIEWPORT_VRS_UPDATE_DISABLED`.

> method visibility_notifier_create() -> RID

Creates a new 3D visibility notifier object and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `visibility_notifier_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
To place in a scene, attach this notifier to an instance using `instance_set_base` using the returned RID.
**Note:** The equivalent node is `VisibleOnScreenNotifier3D`.

> method visibility_notifier_set_aabb(notifier: RID, aabb: AABB) -> void

Sets the AABB of the specified visibility notifier.

> method visibility_notifier_set_callbacks(notifier: RID, enter_callable: Callable, exit_callable: Callable) -> void

Sets the methods to be called when the notifier enters or exits the view.

> method voxel_gi_allocate_data(voxel_gi: RID, to_cell_xform: Transform3D, aabb: AABB, octree_size: Vector3i, octree_cells: PackedByteArray, data_cells: PackedByteArray, distance_field: PackedByteArray, level_counts: PackedInt32Array) -> void

Allocates and initializes the voxel GI data for the specified `voxel_gi` RID. `octree_cells` must be a multiple of 32. `octree_cells` must be double the size of `data_cells`. The allocated data can be retrieved later using the various `voxel_gi_get_*` methods.

> method voxel_gi_create() -> RID

Creates a new voxel-based global illumination object and adds it to the RenderingServer. It can be accessed with the RID that is returned. This RID will be used in all `voxel_gi_*` RenderingServer functions.
Once finished with your RID, you will want to free the RID using the RenderingServer's `free_rid` method.
**Note:** The equivalent node is `VoxelGI`.

> method voxel_gi_get_data_cells(voxel_gi: RID) -> PackedByteArray ; qualifiers=const

Returns the data cells for the specified voxel GI data instance. See also `voxel_gi_allocate_data`.

> method voxel_gi_get_distance_field(voxel_gi: RID) -> PackedByteArray ; qualifiers=const

Returns the distance field data for the specified voxel GI data instance. See also `voxel_gi_allocate_data`.

> method voxel_gi_get_level_counts(voxel_gi: RID) -> PackedInt32Array ; qualifiers=const

Returns the level counts for the specified voxel GI data instance. See also `voxel_gi_allocate_data`.

> method voxel_gi_get_octree_cells(voxel_gi: RID) -> PackedByteArray ; qualifiers=const

Returns the octree cell data for the specified voxel GI data instance. See also `voxel_gi_allocate_data`.

> method voxel_gi_get_octree_size(voxel_gi: RID) -> Vector3i ; qualifiers=const

Returns the octree size for the specified voxel GI data instance, which corresponds to the number of subdivisions per axis. This can be viewed in the editor by hovering the **Bake VoxelGI** button at the top of the 3D editor viewport when a `VoxelGI` node is selected and looking at the **Subdivisions** field in the tooltip.

> method voxel_gi_get_to_cell_xform(voxel_gi: RID) -> Transform3D ; qualifiers=const

Returns the transform to cell space for the specified voxel GI data instance. See also `voxel_gi_allocate_data`.

> method voxel_gi_set_baked_exposure_normalization(voxel_gi: RID, baked_exposure: float) -> void

Used to inform the renderer what exposure normalization value was used while baking the voxel gi. This value will be used and modulated at run time to ensure that the voxel gi maintains a consistent level of exposure even if the scene-wide exposure normalization is changed at run time. For more information see `camera_attributes_set_exposure`.

> method voxel_gi_set_bias(voxel_gi: RID, bias: float) -> void

Sets the `VoxelGIData.bias` value to use on the specified `voxel_gi`'s `RID`.

> method voxel_gi_set_dynamic_range(voxel_gi: RID, range: float) -> void

Sets the `VoxelGIData.dynamic_range` value to use on the specified `voxel_gi`'s `RID`.

> method voxel_gi_set_energy(voxel_gi: RID, energy: float) -> void

Sets the `VoxelGIData.energy` value to use on the specified `voxel_gi`'s `RID`.

> method voxel_gi_set_interior(voxel_gi: RID, enable: bool) -> void

Sets the `VoxelGIData.interior` value to use on the specified `voxel_gi`'s `RID`.

> method voxel_gi_set_normal_bias(voxel_gi: RID, bias: float) -> void

Sets the `VoxelGIData.normal_bias` value to use on the specified `voxel_gi`'s `RID`.

> method voxel_gi_set_propagation(voxel_gi: RID, amount: float) -> void

Sets the `VoxelGIData.propagation` value to use on the specified `voxel_gi`'s `RID`.

> method voxel_gi_set_quality(quality: VoxelGIQuality) -> void

Sets the `ProjectSettings.rendering/global_illumination/voxel_gi/quality` value to use when rendering. This parameter is global and cannot be set on a per-VoxelGI basis.

> method voxel_gi_set_use_two_bounces(voxel_gi: RID, enable: bool) -> void

Sets the `VoxelGIData.use_two_bounces` value to use on the specified `voxel_gi`'s `RID`.

## Signals

> signal frame_post_draw()

Emitted at the end of the frame, after the RenderingServer has finished updating all the Viewports.

> signal frame_pre_draw()

Emitted at the beginning of the frame, before the RenderingServer updates all the Viewports.

## Enumerations

> enum ArrayCustomFormat

> enum_value ArrayCustomFormat.ARRAY_CUSTOM_RGBA8_UNORM = 0

Custom data array contains 8-bit-per-channel red/green/blue/alpha color data. Values are normalized, unsigned floating-point in the `[0.0, 1.0]` range.

> enum_value ArrayCustomFormat.ARRAY_CUSTOM_RGBA8_SNORM = 1

Custom data array contains 8-bit-per-channel red/green/blue/alpha color data. Values are normalized, signed floating-point in the `[-1.0, 1.0]` range.

> enum_value ArrayCustomFormat.ARRAY_CUSTOM_RG_HALF = 2

Custom data array contains 16-bit-per-channel red/green color data. Values are floating-point in half precision.

> enum_value ArrayCustomFormat.ARRAY_CUSTOM_RGBA_HALF = 3

Custom data array contains 16-bit-per-channel red/green/blue/alpha color data. Values are floating-point in half precision.

> enum_value ArrayCustomFormat.ARRAY_CUSTOM_R_FLOAT = 4

Custom data array contains 32-bit-per-channel red color data. Values are floating-point in single precision.

> enum_value ArrayCustomFormat.ARRAY_CUSTOM_RG_FLOAT = 5

Custom data array contains 32-bit-per-channel red/green color data. Values are floating-point in single precision.

> enum_value ArrayCustomFormat.ARRAY_CUSTOM_RGB_FLOAT = 6

Custom data array contains 32-bit-per-channel red/green/blue color data. Values are floating-point in single precision.

> enum_value ArrayCustomFormat.ARRAY_CUSTOM_RGBA_FLOAT = 7

Custom data array contains 32-bit-per-channel red/green/blue/alpha color data. Values are floating-point in single precision.

> enum_value ArrayCustomFormat.ARRAY_CUSTOM_MAX = 8

Represents the size of the `ArrayCustomFormat` enum.

> enum ArrayFormat ; bitfield=true

> enum_value ArrayFormat.ARRAY_FORMAT_VERTEX = 1

Flag used to mark a vertex position array.

> enum_value ArrayFormat.ARRAY_FORMAT_NORMAL = 2

Flag used to mark a normal array.

> enum_value ArrayFormat.ARRAY_FORMAT_TANGENT = 4

Flag used to mark a tangent array.

> enum_value ArrayFormat.ARRAY_FORMAT_COLOR = 8

Flag used to mark a vertex color array.

> enum_value ArrayFormat.ARRAY_FORMAT_TEX_UV = 16

Flag used to mark a UV coordinates array.

> enum_value ArrayFormat.ARRAY_FORMAT_TEX_UV2 = 32

Flag used to mark a UV coordinates array for the second UV coordinates.

> enum_value ArrayFormat.ARRAY_FORMAT_CUSTOM0 = 64

Flag used to mark an array of custom per-vertex data for the first set of custom data.

> enum_value ArrayFormat.ARRAY_FORMAT_CUSTOM1 = 128

Flag used to mark an array of custom per-vertex data for the second set of custom data.

> enum_value ArrayFormat.ARRAY_FORMAT_CUSTOM2 = 256

Flag used to mark an array of custom per-vertex data for the third set of custom data.

> enum_value ArrayFormat.ARRAY_FORMAT_CUSTOM3 = 512

Flag used to mark an array of custom per-vertex data for the fourth set of custom data.

> enum_value ArrayFormat.ARRAY_FORMAT_BONES = 1024

Flag used to mark a bone information array.

> enum_value ArrayFormat.ARRAY_FORMAT_WEIGHTS = 2048

Flag used to mark a weights array.

> enum_value ArrayFormat.ARRAY_FORMAT_INDEX = 4096

Flag used to mark an index array.

> enum_value ArrayFormat.ARRAY_FORMAT_BLEND_SHAPE_MASK = 7

Mask of mesh channels permitted in blend shapes.

> enum_value ArrayFormat.ARRAY_FORMAT_CUSTOM_BASE = 13

Shift of first custom channel.

> enum_value ArrayFormat.ARRAY_FORMAT_CUSTOM_BITS = 3

Number of format bits per custom channel. See `ArrayCustomFormat`.

> enum_value ArrayFormat.ARRAY_FORMAT_CUSTOM0_SHIFT = 13

Amount to shift `ArrayCustomFormat` for custom channel index 0.

> enum_value ArrayFormat.ARRAY_FORMAT_CUSTOM1_SHIFT = 16

Amount to shift `ArrayCustomFormat` for custom channel index 1.

> enum_value ArrayFormat.ARRAY_FORMAT_CUSTOM2_SHIFT = 19

Amount to shift `ArrayCustomFormat` for custom channel index 2.

> enum_value ArrayFormat.ARRAY_FORMAT_CUSTOM3_SHIFT = 22

Amount to shift `ArrayCustomFormat` for custom channel index 3.

> enum_value ArrayFormat.ARRAY_FORMAT_CUSTOM_MASK = 7

Mask of custom format bits per custom channel. Must be shifted by one of the SHIFT constants. See `ArrayCustomFormat`.

> enum_value ArrayFormat.ARRAY_COMPRESS_FLAGS_BASE = 25

Shift of first compress flag. Compress flags should be passed to `ArrayMesh.add_surface_from_arrays` and `SurfaceTool.commit`.

> enum_value ArrayFormat.ARRAY_FLAG_USE_2D_VERTICES = 33554432

Flag used to mark that the array contains 2D vertices.

> enum_value ArrayFormat.ARRAY_FLAG_USE_DYNAMIC_UPDATE = 67108864

Flag used to mark that the mesh data will use `GL_DYNAMIC_DRAW` on GLES. Unused on Vulkan.

> enum_value ArrayFormat.ARRAY_FLAG_USE_8_BONE_WEIGHTS = 134217728

Flag used to mark that the array uses 8 bone weights instead of 4.

> enum_value ArrayFormat.ARRAY_FLAG_USES_EMPTY_VERTEX_ARRAY = 268435456

Flag used to mark that the mesh does not have a vertex array and instead will infer vertex positions in the shader using indices and other information.

> enum_value ArrayFormat.ARRAY_FLAG_COMPRESS_ATTRIBUTES = 536870912

Flag used to mark that a mesh is using compressed attributes (vertices, normals, tangents, UVs). When this form of compression is enabled, vertex positions will be packed into an RGBA16UNORM attribute and scaled in the vertex shader. The normal and tangent will be packed into an RG16UNORM representing an axis, and a 16-bit float stored in the A-channel of the vertex. UVs will use 16-bit normalized floats instead of full 32-bit signed floats. When using this compression mode you must use either vertices, normals, and tangents or only vertices. You cannot use normals without tangents. Importers will automatically enable this compression if they can.

> enum_value ArrayFormat.ARRAY_FLAG_FORMAT_VERSION_BASE = 35

Flag used to mark the start of the bits used to store the mesh version.

> enum_value ArrayFormat.ARRAY_FLAG_FORMAT_VERSION_SHIFT = 35

Flag used to shift a mesh format int to bring the version into the lowest digits.

> enum_value ArrayFormat.ARRAY_FLAG_FORMAT_VERSION_1 = 0

Flag used to record the format used by prior mesh versions before the introduction of a version.

> enum_value ArrayFormat.ARRAY_FLAG_FORMAT_VERSION_2 = 34359738368

Flag used to record the second iteration of the mesh version flag. The primary difference between this and `ARRAY_FLAG_FORMAT_VERSION_1` is that this version supports `ARRAY_FLAG_COMPRESS_ATTRIBUTES` and in this version vertex positions are de-interleaved from normals and tangents.

> enum_value ArrayFormat.ARRAY_FLAG_FORMAT_CURRENT_VERSION = 34359738368

Flag used to record the current version that the engine expects. Currently this is the same as `ARRAY_FLAG_FORMAT_VERSION_2`.

> enum_value ArrayFormat.ARRAY_FLAG_FORMAT_VERSION_MASK = 255

Flag used to isolate the bits used for mesh version after using `ARRAY_FLAG_FORMAT_VERSION_SHIFT` to shift them into place.

> enum ArrayType

> enum_value ArrayType.ARRAY_VERTEX = 0

Array is a vertex position array.

> enum_value ArrayType.ARRAY_NORMAL = 1

Array is a normal array.

> enum_value ArrayType.ARRAY_TANGENT = 2

Array is a tangent array.

> enum_value ArrayType.ARRAY_COLOR = 3

Array is a vertex color array.

> enum_value ArrayType.ARRAY_TEX_UV = 4

Array is a UV coordinates array.

> enum_value ArrayType.ARRAY_TEX_UV2 = 5

Array is a UV coordinates array for the second set of UV coordinates.

> enum_value ArrayType.ARRAY_CUSTOM0 = 6

Array is a custom data array for the first set of custom data.

> enum_value ArrayType.ARRAY_CUSTOM1 = 7

Array is a custom data array for the second set of custom data.

> enum_value ArrayType.ARRAY_CUSTOM2 = 8

Array is a custom data array for the third set of custom data.

> enum_value ArrayType.ARRAY_CUSTOM3 = 9

Array is a custom data array for the fourth set of custom data.

> enum_value ArrayType.ARRAY_BONES = 10

Array contains bone information.

> enum_value ArrayType.ARRAY_WEIGHTS = 11

Array is weight information.

> enum_value ArrayType.ARRAY_INDEX = 12

Array is an index array.

> enum_value ArrayType.ARRAY_MAX = 13

Represents the size of the `ArrayType` enum.

> enum BakeChannels

> enum_value BakeChannels.BAKE_CHANNEL_ALBEDO_ALPHA = 0

Index of `Image` in array of `Image`s returned by `bake_render_uv2`. Image uses `Image.FORMAT_RGBA8` and contains albedo color in the `.rgb` channels and alpha in the `.a` channel.

> enum_value BakeChannels.BAKE_CHANNEL_NORMAL = 1

Index of `Image` in array of `Image`s returned by `bake_render_uv2`. Image uses `Image.FORMAT_RGBA8` and contains the per-pixel normal of the object in the `.rgb` channels and nothing in the `.a` channel. The per-pixel normal is encoded as `normal * 0.5 + 0.5`.

> enum_value BakeChannels.BAKE_CHANNEL_ORM = 2

Index of `Image` in array of `Image`s returned by `bake_render_uv2`. Image uses `Image.FORMAT_RGBA8` and contains ambient occlusion (from material and decals only) in the `.r` channel, roughness in the `.g` channel, metallic in the `.b` channel and sub surface scattering amount in the `.a` channel.

> enum_value BakeChannels.BAKE_CHANNEL_EMISSION = 3

Index of `Image` in array of `Image`s returned by `bake_render_uv2`. Image uses `Image.FORMAT_RGBAH` and contains emission color in the `.rgb` channels and nothing in the `.a` channel.

> enum BlendShapeMode

> enum_value BlendShapeMode.BLEND_SHAPE_MODE_NORMALIZED = 0

Blend shapes are normalized.

> enum_value BlendShapeMode.BLEND_SHAPE_MODE_RELATIVE = 1

Blend shapes are relative to base weight.

> enum CanvasGroupMode

> enum_value CanvasGroupMode.CANVAS_GROUP_MODE_DISABLED = 0

Child draws over parent and is not clipped.

> enum_value CanvasGroupMode.CANVAS_GROUP_MODE_CLIP_ONLY = 1

Parent is used for the purposes of clipping only. Child is clipped to the parent's visible area, parent is not drawn.

> enum_value CanvasGroupMode.CANVAS_GROUP_MODE_CLIP_AND_DRAW = 2

Parent is used for clipping child, but parent is also drawn underneath child as normal before clipping child to its visible area.

> enum_value CanvasGroupMode.CANVAS_GROUP_MODE_TRANSPARENT = 3

> enum CanvasItemTextureFilter

> enum_value CanvasItemTextureFilter.CANVAS_ITEM_TEXTURE_FILTER_DEFAULT = 0

Uses the default filter mode for this `Viewport`.

> enum_value CanvasItemTextureFilter.CANVAS_ITEM_TEXTURE_FILTER_NEAREST = 1

The texture filter reads from the nearest pixel only. This makes the texture look pixelated from up close, and grainy from a distance (due to mipmaps not being sampled).

> enum_value CanvasItemTextureFilter.CANVAS_ITEM_TEXTURE_FILTER_LINEAR = 2

The texture filter blends between the nearest 4 pixels. This makes the texture look smooth from up close, and grainy from a distance (due to mipmaps not being sampled).

> enum_value CanvasItemTextureFilter.CANVAS_ITEM_TEXTURE_FILTER_NEAREST_WITH_MIPMAPS = 3

The texture filter reads from the nearest pixel and blends between the nearest 2 mipmaps (or uses the nearest mipmap if `ProjectSettings.rendering/textures/default_filters/use_nearest_mipmap_filter` is `true`). This makes the texture look pixelated from up close, and smooth from a distance.
Use this for non-pixel art textures that may be viewed at a low scale (e.g. due to `Camera2D` zoom or sprite scaling), as mipmaps are important to smooth out pixels that are smaller than on-screen pixels.

> enum_value CanvasItemTextureFilter.CANVAS_ITEM_TEXTURE_FILTER_LINEAR_WITH_MIPMAPS = 4

The texture filter blends between the nearest 4 pixels and between the nearest 2 mipmaps (or uses the nearest mipmap if `ProjectSettings.rendering/textures/default_filters/use_nearest_mipmap_filter` is `true`). This makes the texture look smooth from up close, and smooth from a distance.
Use this for non-pixel art textures that may be viewed at a low scale (e.g. due to `Camera2D` zoom or sprite scaling), as mipmaps are important to smooth out pixels that are smaller than on-screen pixels.

> enum_value CanvasItemTextureFilter.CANVAS_ITEM_TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC = 5

The texture filter reads from the nearest pixel and blends between 2 mipmaps (or uses the nearest mipmap if `ProjectSettings.rendering/textures/default_filters/use_nearest_mipmap_filter` is `true`) based on the angle between the surface and the camera view. This makes the texture look pixelated from up close, and smooth from a distance. Anisotropic filtering improves texture quality on surfaces that are almost in line with the camera, but is slightly slower. The anisotropic filtering level can be changed by adjusting `ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level`.
**Note:** This texture filter is rarely useful in 2D projects. `CANVAS_ITEM_TEXTURE_FILTER_NEAREST_WITH_MIPMAPS` is usually more appropriate in this case.

> enum_value CanvasItemTextureFilter.CANVAS_ITEM_TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC = 6

The texture filter blends between the nearest 4 pixels and blends between 2 mipmaps (or uses the nearest mipmap if `ProjectSettings.rendering/textures/default_filters/use_nearest_mipmap_filter` is `true`) based on the angle between the surface and the camera view. This makes the texture look smooth from up close, and smooth from a distance. Anisotropic filtering improves texture quality on surfaces that are almost in line with the camera, but is slightly slower. The anisotropic filtering level can be changed by adjusting `ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level`.
**Note:** This texture filter is rarely useful in 2D projects. `CANVAS_ITEM_TEXTURE_FILTER_LINEAR_WITH_MIPMAPS` is usually more appropriate in this case.

> enum_value CanvasItemTextureFilter.CANVAS_ITEM_TEXTURE_FILTER_MAX = 7

Max value for `CanvasItemTextureFilter` enum.

> enum CanvasItemTextureRepeat

> enum_value CanvasItemTextureRepeat.CANVAS_ITEM_TEXTURE_REPEAT_DEFAULT = 0

Uses the default repeat mode for this `Viewport`.

> enum_value CanvasItemTextureRepeat.CANVAS_ITEM_TEXTURE_REPEAT_DISABLED = 1

Disables textures repeating. Instead, when reading UVs outside the 0-1 range, the value will be clamped to the edge of the texture, resulting in a stretched out look at the borders of the texture.

> enum_value CanvasItemTextureRepeat.CANVAS_ITEM_TEXTURE_REPEAT_ENABLED = 2

Enables the texture to repeat when UV coordinates are outside the 0-1 range. If using one of the linear filtering modes, this can result in artifacts at the edges of a texture when the sampler filters across the edges of the texture.

> enum_value CanvasItemTextureRepeat.CANVAS_ITEM_TEXTURE_REPEAT_MIRROR = 3

Flip the texture when repeating so that the edge lines up instead of abruptly changing.

> enum_value CanvasItemTextureRepeat.CANVAS_ITEM_TEXTURE_REPEAT_MAX = 4

Max value for `CanvasItemTextureRepeat` enum.

> enum CanvasLightBlendMode

> enum_value CanvasLightBlendMode.CANVAS_LIGHT_BLEND_MODE_ADD = 0

Adds light color additive to the canvas.

> enum_value CanvasLightBlendMode.CANVAS_LIGHT_BLEND_MODE_SUB = 1

Adds light color subtractive to the canvas.

> enum_value CanvasLightBlendMode.CANVAS_LIGHT_BLEND_MODE_MIX = 2

The light adds color depending on transparency.

> enum CanvasLightMode

> enum_value CanvasLightMode.CANVAS_LIGHT_MODE_POINT = 0

2D point light (see `PointLight2D`).

> enum_value CanvasLightMode.CANVAS_LIGHT_MODE_DIRECTIONAL = 1

2D directional (sun/moon) light (see `DirectionalLight2D`).

> enum CanvasLightShadowFilter

> enum_value CanvasLightShadowFilter.CANVAS_LIGHT_FILTER_NONE = 0

Do not apply a filter to canvas light shadows.

> enum_value CanvasLightShadowFilter.CANVAS_LIGHT_FILTER_PCF5 = 1

Use PCF5 filtering to filter canvas light shadows.

> enum_value CanvasLightShadowFilter.CANVAS_LIGHT_FILTER_PCF13 = 2

Use PCF13 filtering to filter canvas light shadows.

> enum_value CanvasLightShadowFilter.CANVAS_LIGHT_FILTER_MAX = 3

Max value of the `CanvasLightShadowFilter` enum.

> enum CanvasOccluderPolygonCullMode

> enum_value CanvasOccluderPolygonCullMode.CANVAS_OCCLUDER_POLYGON_CULL_DISABLED = 0

Culling of the canvas occluder is disabled.

> enum_value CanvasOccluderPolygonCullMode.CANVAS_OCCLUDER_POLYGON_CULL_CLOCKWISE = 1

Culling of the canvas occluder is clockwise.

> enum_value CanvasOccluderPolygonCullMode.CANVAS_OCCLUDER_POLYGON_CULL_COUNTER_CLOCKWISE = 2

Culling of the canvas occluder is counterclockwise.

> enum CanvasTextureChannel

> enum_value CanvasTextureChannel.CANVAS_TEXTURE_CHANNEL_DIFFUSE = 0

Diffuse canvas texture (`CanvasTexture.diffuse_texture`).

> enum_value CanvasTextureChannel.CANVAS_TEXTURE_CHANNEL_NORMAL = 1

Normal map canvas texture (`CanvasTexture.normal_texture`).

> enum_value CanvasTextureChannel.CANVAS_TEXTURE_CHANNEL_SPECULAR = 2

Specular map canvas texture (`CanvasTexture.specular_texture`).

> enum CompositorEffectCallbackType

> enum_value CompositorEffectCallbackType.COMPOSITOR_EFFECT_CALLBACK_TYPE_PRE_OPAQUE = 0

The callback is called before our opaque rendering pass, but after depth prepass (if applicable).

> enum_value CompositorEffectCallbackType.COMPOSITOR_EFFECT_CALLBACK_TYPE_POST_OPAQUE = 1

The callback is called after our opaque rendering pass, but before our sky is rendered.

> enum_value CompositorEffectCallbackType.COMPOSITOR_EFFECT_CALLBACK_TYPE_POST_SKY = 2

The callback is called after our sky is rendered, but before our back buffers are created (and if enabled, before subsurface scattering and/or screen space reflections).

> enum_value CompositorEffectCallbackType.COMPOSITOR_EFFECT_CALLBACK_TYPE_PRE_TRANSPARENT = 3

The callback is called before our transparent rendering pass, but after our sky is rendered and we've created our back buffers.

> enum_value CompositorEffectCallbackType.COMPOSITOR_EFFECT_CALLBACK_TYPE_POST_TRANSPARENT = 4

The callback is called after our transparent rendering pass, but before any built-in post-processing effects and output to our render target.

> enum_value CompositorEffectCallbackType.COMPOSITOR_EFFECT_CALLBACK_TYPE_ANY = -1

> enum CompositorEffectFlags

> enum_value CompositorEffectFlags.COMPOSITOR_EFFECT_FLAG_ACCESS_RESOLVED_COLOR = 1

The rendering effect requires the color buffer to be resolved if MSAA is enabled.

> enum_value CompositorEffectFlags.COMPOSITOR_EFFECT_FLAG_ACCESS_RESOLVED_DEPTH = 2

The rendering effect requires the depth buffer to be resolved if MSAA is enabled.

> enum_value CompositorEffectFlags.COMPOSITOR_EFFECT_FLAG_NEEDS_MOTION_VECTORS = 4

The rendering effect requires motion vectors to be produced.

> enum_value CompositorEffectFlags.COMPOSITOR_EFFECT_FLAG_NEEDS_ROUGHNESS = 8

The rendering effect requires normals and roughness g-buffer to be produced (Forward+ only).

> enum_value CompositorEffectFlags.COMPOSITOR_EFFECT_FLAG_NEEDS_SEPARATE_SPECULAR = 16

The rendering effect requires specular data to be separated out (Forward+ only).

> enum CubeMapLayer

> enum_value CubeMapLayer.CUBEMAP_LAYER_LEFT = 0

Left face of a `Cubemap`.

> enum_value CubeMapLayer.CUBEMAP_LAYER_RIGHT = 1

Right face of a `Cubemap`.

> enum_value CubeMapLayer.CUBEMAP_LAYER_BOTTOM = 2

Bottom face of a `Cubemap`.

> enum_value CubeMapLayer.CUBEMAP_LAYER_TOP = 3

Top face of a `Cubemap`.

> enum_value CubeMapLayer.CUBEMAP_LAYER_FRONT = 4

Front face of a `Cubemap`.

> enum_value CubeMapLayer.CUBEMAP_LAYER_BACK = 5

Back face of a `Cubemap`.

> enum DOFBlurQuality

> enum_value DOFBlurQuality.DOF_BLUR_QUALITY_VERY_LOW = 0

Lowest quality DOF blur. This is the fastest setting, but you may be able to see filtering artifacts.

> enum_value DOFBlurQuality.DOF_BLUR_QUALITY_LOW = 1

Low quality DOF blur.

> enum_value DOFBlurQuality.DOF_BLUR_QUALITY_MEDIUM = 2

Medium quality DOF blur.

> enum_value DOFBlurQuality.DOF_BLUR_QUALITY_HIGH = 3

Highest quality DOF blur. Results in the smoothest looking blur by taking the most samples, but is also significantly slower.

> enum DOFBokehShape

> enum_value DOFBokehShape.DOF_BOKEH_BOX = 0

Calculate the DOF blur using a box filter. The fastest option, but results in obvious lines in blur pattern.

> enum_value DOFBokehShape.DOF_BOKEH_HEXAGON = 1

Calculates DOF blur using a hexagon shaped filter.

> enum_value DOFBokehShape.DOF_BOKEH_CIRCLE = 2

Calculates DOF blur using a circle shaped filter. Best quality and most realistic, but slowest. Use only for areas where a lot of performance can be dedicated to post-processing (e.g. cutscenes).

> enum DecalFilter

> enum_value DecalFilter.DECAL_FILTER_NEAREST = 0

Nearest-neighbor filter for decals (use for pixel art decals). No mipmaps are used for rendering, which means decals at a distance will look sharp but grainy. This has roughly the same performance cost as using mipmaps.

> enum_value DecalFilter.DECAL_FILTER_LINEAR = 1

Linear filter for decals (use for non-pixel art decals). No mipmaps are used for rendering, which means decals at a distance will look smooth but blurry. This has roughly the same performance cost as using mipmaps.

> enum_value DecalFilter.DECAL_FILTER_NEAREST_MIPMAPS = 2

Nearest-neighbor filter for decals (use for pixel art decals). Isotropic mipmaps are used for rendering, which means decals at a distance will look smooth but blurry. This has roughly the same performance cost as not using mipmaps.

> enum_value DecalFilter.DECAL_FILTER_LINEAR_MIPMAPS = 3

Linear filter for decals (use for non-pixel art decals). Isotropic mipmaps are used for rendering, which means decals at a distance will look smooth but blurry. This has roughly the same performance cost as not using mipmaps.

> enum_value DecalFilter.DECAL_FILTER_NEAREST_MIPMAPS_ANISOTROPIC = 4

Nearest-neighbor filter for decals (use for pixel art decals). Anisotropic mipmaps are used for rendering, which means decals at a distance will look smooth and sharp when viewed from oblique angles. This looks better compared to isotropic mipmaps, but is slower. The level of anisotropic filtering is defined by `ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level`.

> enum_value DecalFilter.DECAL_FILTER_LINEAR_MIPMAPS_ANISOTROPIC = 5

Linear filter for decals (use for non-pixel art decals). Anisotropic mipmaps are used for rendering, which means decals at a distance will look smooth and sharp when viewed from oblique angles. This looks better compared to isotropic mipmaps, but is slower. The level of anisotropic filtering is defined by `ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level`.

> enum DecalTexture

> enum_value DecalTexture.DECAL_TEXTURE_ALBEDO = 0

Albedo texture slot in a decal (`Decal.texture_albedo`).

> enum_value DecalTexture.DECAL_TEXTURE_NORMAL = 1

Normal map texture slot in a decal (`Decal.texture_normal`).

> enum_value DecalTexture.DECAL_TEXTURE_ORM = 2

Occlusion/Roughness/Metallic texture slot in a decal (`Decal.texture_orm`).

> enum_value DecalTexture.DECAL_TEXTURE_EMISSION = 3

Emission texture slot in a decal (`Decal.texture_emission`).

> enum_value DecalTexture.DECAL_TEXTURE_MAX = 4

Represents the size of the `DecalTexture` enum.

> enum EnvironmentAmbientSource

> enum_value EnvironmentAmbientSource.ENV_AMBIENT_SOURCE_BG = 0

Gather ambient light from whichever source is specified as the background.

> enum_value EnvironmentAmbientSource.ENV_AMBIENT_SOURCE_DISABLED = 1

Disable ambient light.

> enum_value EnvironmentAmbientSource.ENV_AMBIENT_SOURCE_COLOR = 2

Specify a specific `Color` for ambient light.

> enum_value EnvironmentAmbientSource.ENV_AMBIENT_SOURCE_SKY = 3

Gather ambient light from the `Sky` regardless of what the background is.

> enum EnvironmentBG

> enum_value EnvironmentBG.ENV_BG_CLEAR_COLOR = 0

Use the clear color as background.

> enum_value EnvironmentBG.ENV_BG_COLOR = 1

Use a specified color as the background.

> enum_value EnvironmentBG.ENV_BG_SKY = 2

Use a sky resource for the background.

> enum_value EnvironmentBG.ENV_BG_CANVAS = 3

Use a specified canvas layer as the background. This can be useful for instantiating a 2D scene in a 3D world.

> enum_value EnvironmentBG.ENV_BG_KEEP = 4

Do not clear the background, use whatever was rendered last frame as the background.

> enum_value EnvironmentBG.ENV_BG_CAMERA_FEED = 5

Displays a camera feed in the background.

> enum_value EnvironmentBG.ENV_BG_MAX = 6

Represents the size of the `EnvironmentBG` enum.

> enum EnvironmentFogMode

> enum_value EnvironmentFogMode.ENV_FOG_MODE_EXPONENTIAL = 0

Use a physically-based fog model defined primarily by fog density.

> enum_value EnvironmentFogMode.ENV_FOG_MODE_DEPTH = 1

Use a simple fog model defined by start and end positions and a custom curve. While not physically accurate, this model can be useful when you need more artistic control.

> enum EnvironmentGlowBlendMode

> enum_value EnvironmentGlowBlendMode.ENV_GLOW_BLEND_MODE_ADDITIVE = 0

Adds the glow effect to the scene.

> enum_value EnvironmentGlowBlendMode.ENV_GLOW_BLEND_MODE_SCREEN = 1

Adds the glow effect to the scene after modifying the glow influence based on the scene value; dark values will be highly influenced by glow and bright values will not be influenced by glow. This approach avoids bright values becoming overly bright from the glow effect. `Environment.tonemap_white` is used to determine the maximum scene value where the glow should have no influence. When `Environment.tonemap_mode` is set to `Environment.TONE_MAPPER_LINEAR` and `Viewport.use_hdr_2d` is `true`, the parent window's `Window.get_output_max_linear_value` will be used as the maximum scene value.

> enum_value EnvironmentGlowBlendMode.ENV_GLOW_BLEND_MODE_SOFTLIGHT = 2

Adds the glow effect to the tonemapped image after modifying the glow influence based on the image value; dark values and bright values will not be influenced by glow and mid-range values will be highly influenced by glow. This approach avoids bright values becoming overly bright from the glow effect. The glow will have the largest influence on image values of `0.25` and will have no influence when applied to image values greater than `1.0`.
**Note:** This blend mode does not support HDR output because expects a maximum output value of `1.0`. It is recommended to use a different blend mode when rendering to an HDR screen.

> enum_value EnvironmentGlowBlendMode.ENV_GLOW_BLEND_MODE_REPLACE = 3

Replaces all pixels' color by the glow effect. This can be used to simulate a full-screen blur effect by tweaking the glow parameters to match the original image's brightness or to preview glow configuration in the editor.

> enum_value EnvironmentGlowBlendMode.ENV_GLOW_BLEND_MODE_MIX = 4

Mixes the glow image with the scene image. Best used with `Environment.glow_bloom` to avoid darkening the scene.

> enum EnvironmentReflectionSource

> enum_value EnvironmentReflectionSource.ENV_REFLECTION_SOURCE_BG = 0

Use the background for reflections.

> enum_value EnvironmentReflectionSource.ENV_REFLECTION_SOURCE_DISABLED = 1

Disable reflections.

> enum_value EnvironmentReflectionSource.ENV_REFLECTION_SOURCE_SKY = 2

Use the `Sky` for reflections regardless of what the background is.

> enum EnvironmentSDFGIFramesToConverge

> enum_value EnvironmentSDFGIFramesToConverge.ENV_SDFGI_CONVERGE_IN_5_FRAMES = 0

Converge SDFGI over 5 frames. This is the most responsive, but creates the most noisy result with a given ray count.

> enum_value EnvironmentSDFGIFramesToConverge.ENV_SDFGI_CONVERGE_IN_10_FRAMES = 1

Configure SDFGI to fully converge over 10 frames.

> enum_value EnvironmentSDFGIFramesToConverge.ENV_SDFGI_CONVERGE_IN_15_FRAMES = 2

Configure SDFGI to fully converge over 15 frames.

> enum_value EnvironmentSDFGIFramesToConverge.ENV_SDFGI_CONVERGE_IN_20_FRAMES = 3

Configure SDFGI to fully converge over 20 frames.

> enum_value EnvironmentSDFGIFramesToConverge.ENV_SDFGI_CONVERGE_IN_25_FRAMES = 4

Configure SDFGI to fully converge over 25 frames.

> enum_value EnvironmentSDFGIFramesToConverge.ENV_SDFGI_CONVERGE_IN_30_FRAMES = 5

Configure SDFGI to fully converge over 30 frames. This is the least responsive, but creates the least noisy result with a given ray count.

> enum_value EnvironmentSDFGIFramesToConverge.ENV_SDFGI_CONVERGE_MAX = 6

Represents the size of the `EnvironmentSDFGIFramesToConverge` enum.

> enum EnvironmentSDFGIFramesToUpdateLight

> enum_value EnvironmentSDFGIFramesToUpdateLight.ENV_SDFGI_UPDATE_LIGHT_IN_1_FRAME = 0

Update indirect light from dynamic lights in SDFGI over 1 frame. This is the most responsive, but has the highest GPU requirements.

> enum_value EnvironmentSDFGIFramesToUpdateLight.ENV_SDFGI_UPDATE_LIGHT_IN_2_FRAMES = 1

Update indirect light from dynamic lights in SDFGI over 2 frames.

> enum_value EnvironmentSDFGIFramesToUpdateLight.ENV_SDFGI_UPDATE_LIGHT_IN_4_FRAMES = 2

Update indirect light from dynamic lights in SDFGI over 4 frames.

> enum_value EnvironmentSDFGIFramesToUpdateLight.ENV_SDFGI_UPDATE_LIGHT_IN_8_FRAMES = 3

Update indirect light from dynamic lights in SDFGI over 8 frames.

> enum_value EnvironmentSDFGIFramesToUpdateLight.ENV_SDFGI_UPDATE_LIGHT_IN_16_FRAMES = 4

Update indirect light from dynamic lights in SDFGI over 16 frames. This is the least responsive, but has the lowest GPU requirements.

> enum_value EnvironmentSDFGIFramesToUpdateLight.ENV_SDFGI_UPDATE_LIGHT_MAX = 5

Represents the size of the `EnvironmentSDFGIFramesToUpdateLight` enum.

> enum EnvironmentSDFGIRayCount

> enum_value EnvironmentSDFGIRayCount.ENV_SDFGI_RAY_COUNT_4 = 0

Throw 4 rays per frame when converging SDFGI. This has the lowest GPU requirements, but creates the most noisy result.

> enum_value EnvironmentSDFGIRayCount.ENV_SDFGI_RAY_COUNT_8 = 1

Throw 8 rays per frame when converging SDFGI.

> enum_value EnvironmentSDFGIRayCount.ENV_SDFGI_RAY_COUNT_16 = 2

Throw 16 rays per frame when converging SDFGI.

> enum_value EnvironmentSDFGIRayCount.ENV_SDFGI_RAY_COUNT_32 = 3

Throw 32 rays per frame when converging SDFGI.

> enum_value EnvironmentSDFGIRayCount.ENV_SDFGI_RAY_COUNT_64 = 4

Throw 64 rays per frame when converging SDFGI.

> enum_value EnvironmentSDFGIRayCount.ENV_SDFGI_RAY_COUNT_96 = 5

Throw 96 rays per frame when converging SDFGI. This has high GPU requirements.

> enum_value EnvironmentSDFGIRayCount.ENV_SDFGI_RAY_COUNT_128 = 6

Throw 128 rays per frame when converging SDFGI. This has very high GPU requirements, but creates the least noisy result.

> enum_value EnvironmentSDFGIRayCount.ENV_SDFGI_RAY_COUNT_MAX = 7

Represents the size of the `EnvironmentSDFGIRayCount` enum.

> enum EnvironmentSDFGIYScale

> enum_value EnvironmentSDFGIYScale.ENV_SDFGI_Y_SCALE_50_PERCENT = 0

Use 50% scale for SDFGI on the Y (vertical) axis. SDFGI cells will be twice as short as they are wide. This allows providing increased GI detail and reduced light leaking with thin floors and ceilings. This is usually the best choice for scenes that don't feature much verticality.

> enum_value EnvironmentSDFGIYScale.ENV_SDFGI_Y_SCALE_75_PERCENT = 1

Use 75% scale for SDFGI on the Y (vertical) axis. This is a balance between the 50% and 100% SDFGI Y scales.

> enum_value EnvironmentSDFGIYScale.ENV_SDFGI_Y_SCALE_100_PERCENT = 2

Use 100% scale for SDFGI on the Y (vertical) axis. SDFGI cells will be as tall as they are wide. This is usually the best choice for highly vertical scenes. The downside is that light leaking may become more noticeable with thin floors and ceilings.

> enum EnvironmentSSAOQuality

> enum_value EnvironmentSSAOQuality.ENV_SSAO_QUALITY_VERY_LOW = 0

Lowest quality of screen-space ambient occlusion.

> enum_value EnvironmentSSAOQuality.ENV_SSAO_QUALITY_LOW = 1

Low quality screen-space ambient occlusion.

> enum_value EnvironmentSSAOQuality.ENV_SSAO_QUALITY_MEDIUM = 2

Medium quality screen-space ambient occlusion.

> enum_value EnvironmentSSAOQuality.ENV_SSAO_QUALITY_HIGH = 3

High quality screen-space ambient occlusion.

> enum_value EnvironmentSSAOQuality.ENV_SSAO_QUALITY_ULTRA = 4

Highest quality screen-space ambient occlusion. Uses the adaptive target setting which can be dynamically adjusted to smoothly balance performance and visual quality.

> enum EnvironmentSSILQuality

> enum_value EnvironmentSSILQuality.ENV_SSIL_QUALITY_VERY_LOW = 0

Lowest quality of screen-space indirect lighting.

> enum_value EnvironmentSSILQuality.ENV_SSIL_QUALITY_LOW = 1

Low quality screen-space indirect lighting.

> enum_value EnvironmentSSILQuality.ENV_SSIL_QUALITY_MEDIUM = 2

High quality screen-space indirect lighting.

> enum_value EnvironmentSSILQuality.ENV_SSIL_QUALITY_HIGH = 3

High quality screen-space indirect lighting.

> enum_value EnvironmentSSILQuality.ENV_SSIL_QUALITY_ULTRA = 4

Highest quality screen-space indirect lighting. Uses the adaptive target setting which can be dynamically adjusted to smoothly balance performance and visual quality.

> enum EnvironmentSSRRoughnessQuality

> enum_value EnvironmentSSRRoughnessQuality.ENV_SSR_ROUGHNESS_QUALITY_DISABLED = 0

Lowest quality of roughness filter for screen-space reflections. Rough materials will not have blurrier screen-space reflections compared to smooth (non-rough) materials. This is the fastest option.

> enum_value EnvironmentSSRRoughnessQuality.ENV_SSR_ROUGHNESS_QUALITY_LOW = 1

Low quality of roughness filter for screen-space reflections.

> enum_value EnvironmentSSRRoughnessQuality.ENV_SSR_ROUGHNESS_QUALITY_MEDIUM = 2

Medium quality of roughness filter for screen-space reflections.

> enum_value EnvironmentSSRRoughnessQuality.ENV_SSR_ROUGHNESS_QUALITY_HIGH = 3

High quality of roughness filter for screen-space reflections. This is the slowest option.

> enum EnvironmentToneMapper

> enum_value EnvironmentToneMapper.ENV_TONE_MAPPER_LINEAR = 0

Does not modify color data, resulting in a linear tonemapping curve which unnaturally clips bright values, causing bright lighting to look blown out. The simplest and fastest tonemapper.

> enum_value EnvironmentToneMapper.ENV_TONE_MAPPER_REINHARD = 1

A simple tonemapping curve that rolls off bright values to prevent clipping. This results in an image that can appear dull and low contrast. Slower than `ENV_TONE_MAPPER_LINEAR`.
**Note:** When `Environment.tonemap_white` is left at the default value of `1.0`, `ENV_TONE_MAPPER_REINHARD` produces an identical image to `ENV_TONE_MAPPER_LINEAR`.

> enum_value EnvironmentToneMapper.ENV_TONE_MAPPER_FILMIC = 2

Uses a film-like tonemapping curve to prevent clipping of bright values and provide better contrast than `ENV_TONE_MAPPER_REINHARD`. Slightly slower than `ENV_TONE_MAPPER_REINHARD`.
**Note:** This tonemapper does not support HDR output because it produces output in the SDR range. It is recommended to use a different tonemapper when rendering to an HDR screen.

> enum_value EnvironmentToneMapper.ENV_TONE_MAPPER_ACES = 3

Uses a high-contrast film-like tonemapping curve and desaturates bright values for a more realistic appearance. Slightly slower than `ENV_TONE_MAPPER_FILMIC`.
**Note:** This tonemapping operator is called "ACES Fitted" in Godot 3.x.
**Note:** This tonemapper does not support HDR output because it produces output in the SDR range. It is recommended to use a different tonemapper when rendering to an HDR screen.

> enum_value EnvironmentToneMapper.ENV_TONE_MAPPER_AGX = 4

Uses an adjustable film-like tonemapping curve and desaturates bright values for a more realistic appearance. Better than other tonemappers at maintaining the hue of colors as they become brighter. The slowest tonemapping option.

> enum Features

> enum_value Features.FEATURE_SHADERS = 0 ; deprecated=This constant has not been used since Godot 3.0.

> enum_value Features.FEATURE_MULTITHREADED = 1 ; deprecated=This constant has not been used since Godot 3.0.

> enum FogVolumeShape

> enum_value FogVolumeShape.FOG_VOLUME_SHAPE_ELLIPSOID = 0

`FogVolume` will be shaped like an ellipsoid (stretched sphere).

> enum_value FogVolumeShape.FOG_VOLUME_SHAPE_CONE = 1

`FogVolume` will be shaped like a cone pointing upwards (in local coordinates). The cone's angle is set automatically to fill the size. The cone will be adjusted to fit within the size. Rotate the `FogVolume` node to reorient the cone. Non-uniform scaling via size is not supported (scale the `FogVolume` node instead).

> enum_value FogVolumeShape.FOG_VOLUME_SHAPE_CYLINDER = 2

`FogVolume` will be shaped like an upright cylinder (in local coordinates). Rotate the `FogVolume` node to reorient the cylinder. The cylinder will be adjusted to fit within the size. Non-uniform scaling via size is not supported (scale the `FogVolume` node instead).

> enum_value FogVolumeShape.FOG_VOLUME_SHAPE_BOX = 3

`FogVolume` will be shaped like a box.

> enum_value FogVolumeShape.FOG_VOLUME_SHAPE_WORLD = 4

`FogVolume` will have no shape, will cover the whole world and will not be culled.

> enum_value FogVolumeShape.FOG_VOLUME_SHAPE_MAX = 5

Represents the size of the `FogVolumeShape` enum.

> enum GlobalShaderParameterType

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_BOOL = 0

Boolean global shader parameter (`global uniform bool ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_BVEC2 = 1

2-dimensional boolean vector global shader parameter (`global uniform bvec2 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_BVEC3 = 2

3-dimensional boolean vector global shader parameter (`global uniform bvec3 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_BVEC4 = 3

4-dimensional boolean vector global shader parameter (`global uniform bvec4 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_INT = 4

Integer global shader parameter (`global uniform int ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_IVEC2 = 5

2-dimensional integer vector global shader parameter (`global uniform ivec2 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_IVEC3 = 6

3-dimensional integer vector global shader parameter (`global uniform ivec3 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_IVEC4 = 7

4-dimensional integer vector global shader parameter (`global uniform ivec4 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_RECT2I = 8

2-dimensional integer rectangle global shader parameter (`global uniform ivec4 ...`). Equivalent to `GLOBAL_VAR_TYPE_IVEC4` in shader code, but exposed as a `Rect2i` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_UINT = 9

Unsigned integer global shader parameter (`global uniform uint ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_UVEC2 = 10

2-dimensional unsigned integer vector global shader parameter (`global uniform uvec2 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_UVEC3 = 11

3-dimensional unsigned integer vector global shader parameter (`global uniform uvec3 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_UVEC4 = 12

4-dimensional unsigned integer vector global shader parameter (`global uniform uvec4 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_FLOAT = 13

Single-precision floating-point global shader parameter (`global uniform float ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_VEC2 = 14

2-dimensional floating-point vector global shader parameter (`global uniform vec2 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_VEC3 = 15

3-dimensional floating-point vector global shader parameter (`global uniform vec3 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_VEC4 = 16

4-dimensional floating-point vector global shader parameter (`global uniform vec4 ...`).

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_COLOR = 17

Color global shader parameter (`global uniform vec4 ...`). Equivalent to `GLOBAL_VAR_TYPE_VEC4` in shader code, but exposed as a `Color` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_RECT2 = 18

2-dimensional floating-point rectangle global shader parameter (`global uniform vec4 ...`). Equivalent to `GLOBAL_VAR_TYPE_VEC4` in shader code, but exposed as a `Rect2` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_MAT2 = 19

2×2 matrix global shader parameter (`global uniform mat2 ...`). Exposed as a `PackedInt32Array` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_MAT3 = 20

3×3 matrix global shader parameter (`global uniform mat3 ...`). Exposed as a `Basis` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_MAT4 = 21

4×4 matrix global shader parameter (`global uniform mat4 ...`). Exposed as a `Projection` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_TRANSFORM_2D = 22

2-dimensional transform global shader parameter (`global uniform mat2x3 ...`). Exposed as a `Transform2D` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_TRANSFORM = 23

3-dimensional transform global shader parameter (`global uniform mat3x4 ...`). Exposed as a `Transform3D` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_SAMPLER2D = 24

2D sampler global shader parameter (`global uniform sampler2D ...`). Exposed as a `Texture2D` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_SAMPLER2DARRAY = 25

2D sampler array global shader parameter (`global uniform sampler2DArray ...`). Exposed as a `Texture2DArray` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_SAMPLER3D = 26

3D sampler global shader parameter (`global uniform sampler3D ...`). Exposed as a `Texture3D` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_SAMPLERCUBE = 27

Cubemap sampler global shader parameter (`global uniform samplerCube ...`). Exposed as a `Cubemap` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_SAMPLEREXT = 28

External sampler global shader parameter (`global uniform samplerExternalOES ...`). Exposed as an `ExternalTexture` in the editor UI.

> enum_value GlobalShaderParameterType.GLOBAL_VAR_TYPE_MAX = 29

Represents the size of the `GlobalShaderParameterType` enum.

> enum InstanceFlags

> enum_value InstanceFlags.INSTANCE_FLAG_USE_BAKED_LIGHT = 0

Allows the instance to be used in baked lighting.

> enum_value InstanceFlags.INSTANCE_FLAG_USE_DYNAMIC_GI = 1

Allows the instance to be used with dynamic global illumination.

> enum_value InstanceFlags.INSTANCE_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE = 2

When set, manually requests to draw geometry on next frame.

> enum_value InstanceFlags.INSTANCE_FLAG_IGNORE_OCCLUSION_CULLING = 3

Always draw, even if the instance would be culled by occlusion culling. Does not affect view frustum culling.

> enum_value InstanceFlags.INSTANCE_FLAG_MAX = 4

Represents the size of the `InstanceFlags` enum.

> enum InstanceType

> enum_value InstanceType.INSTANCE_NONE = 0

The instance does not have a type.

> enum_value InstanceType.INSTANCE_MESH = 1

The instance is a mesh.

> enum_value InstanceType.INSTANCE_MULTIMESH = 2

The instance is a multimesh.

> enum_value InstanceType.INSTANCE_PARTICLES = 3

The instance is a particle emitter.

> enum_value InstanceType.INSTANCE_PARTICLES_COLLISION = 4

The instance is a GPUParticles collision shape.

> enum_value InstanceType.INSTANCE_LIGHT = 5

The instance is a light.

> enum_value InstanceType.INSTANCE_REFLECTION_PROBE = 6

The instance is a reflection probe.

> enum_value InstanceType.INSTANCE_DECAL = 7

The instance is a decal.

> enum_value InstanceType.INSTANCE_VOXEL_GI = 8

The instance is a VoxelGI.

> enum_value InstanceType.INSTANCE_LIGHTMAP = 9

The instance is a lightmap.

> enum_value InstanceType.INSTANCE_OCCLUDER = 10

The instance is an occlusion culling occluder.

> enum_value InstanceType.INSTANCE_VISIBLITY_NOTIFIER = 11

The instance is a visible on-screen notifier.

> enum_value InstanceType.INSTANCE_FOG_VOLUME = 12

The instance is a fog volume.

> enum_value InstanceType.INSTANCE_MAX = 13

Represents the size of the `InstanceType` enum.

> enum_value InstanceType.INSTANCE_GEOMETRY_MASK = 14

A combination of the flags of geometry instances (mesh, multimesh, immediate and particles).

> enum LightBakeMode

> enum_value LightBakeMode.LIGHT_BAKE_DISABLED = 0

Light is ignored when baking. This is the fastest mode, but the light will be taken into account when baking global illumination. This mode should generally be used for dynamic lights that change quickly, as the effect of global illumination is less noticeable on those lights.

> enum_value LightBakeMode.LIGHT_BAKE_STATIC = 1

Light is taken into account in static baking (`VoxelGI`, `LightmapGI`, SDFGI (`Environment.sdfgi_enabled`)). The light can be moved around or modified, but its global illumination will not update in real-time. This is suitable for subtle changes (such as flickering torches), but generally not large changes such as toggling a light on and off.

> enum_value LightBakeMode.LIGHT_BAKE_DYNAMIC = 2

Light is taken into account in dynamic baking (`VoxelGI` and SDFGI (`Environment.sdfgi_enabled`) only). The light can be moved around or modified with global illumination updating in real-time. The light's global illumination appearance will be slightly different compared to `LIGHT_BAKE_STATIC`. This has a greater performance cost compared to `LIGHT_BAKE_STATIC`. When using SDFGI, the update speed of dynamic lights is affected by `ProjectSettings.rendering/global_illumination/sdfgi/frames_to_update_lights`.

> enum LightDirectionalShadowMode

> enum_value LightDirectionalShadowMode.LIGHT_DIRECTIONAL_SHADOW_ORTHOGONAL = 0

Use orthogonal shadow projection for directional light.

> enum_value LightDirectionalShadowMode.LIGHT_DIRECTIONAL_SHADOW_PARALLEL_2_SPLITS = 1

Use 2 splits for shadow projection when using directional light.

> enum_value LightDirectionalShadowMode.LIGHT_DIRECTIONAL_SHADOW_PARALLEL_4_SPLITS = 2

Use 4 splits for shadow projection when using directional light.

> enum LightDirectionalSkyMode

> enum_value LightDirectionalSkyMode.LIGHT_DIRECTIONAL_SKY_MODE_LIGHT_AND_SKY = 0

Use DirectionalLight3D in both sky rendering and scene lighting.

> enum_value LightDirectionalSkyMode.LIGHT_DIRECTIONAL_SKY_MODE_LIGHT_ONLY = 1

Only use DirectionalLight3D in scene lighting.

> enum_value LightDirectionalSkyMode.LIGHT_DIRECTIONAL_SKY_MODE_SKY_ONLY = 2

Only use DirectionalLight3D in sky rendering.

> enum LightOmniShadowMode

> enum_value LightOmniShadowMode.LIGHT_OMNI_SHADOW_DUAL_PARABOLOID = 0

Use a dual paraboloid shadow map for omni lights.

> enum_value LightOmniShadowMode.LIGHT_OMNI_SHADOW_CUBE = 1

Use a cubemap shadow map for omni lights. Slower but better quality than dual paraboloid.

> enum LightParam

> enum_value LightParam.LIGHT_PARAM_ENERGY = 0

The light's energy multiplier.

> enum_value LightParam.LIGHT_PARAM_INDIRECT_ENERGY = 1

The light's indirect energy multiplier (final indirect energy is `LIGHT_PARAM_ENERGY` * `LIGHT_PARAM_INDIRECT_ENERGY`).

> enum_value LightParam.LIGHT_PARAM_VOLUMETRIC_FOG_ENERGY = 2

The light's volumetric fog energy multiplier (final volumetric fog energy is `LIGHT_PARAM_ENERGY` * `LIGHT_PARAM_VOLUMETRIC_FOG_ENERGY`).

> enum_value LightParam.LIGHT_PARAM_SPECULAR = 3

The light's influence on specularity.

> enum_value LightParam.LIGHT_PARAM_RANGE = 4

The light's range.

> enum_value LightParam.LIGHT_PARAM_SIZE = 5

The size of the light when using spot light or omni light. The angular size of the light when using directional light.

> enum_value LightParam.LIGHT_PARAM_ATTENUATION = 6

The light's attenuation.

> enum_value LightParam.LIGHT_PARAM_SPOT_ANGLE = 7

The spotlight's angle.

> enum_value LightParam.LIGHT_PARAM_SPOT_ATTENUATION = 8

The spotlight's attenuation.

> enum_value LightParam.LIGHT_PARAM_SHADOW_MAX_DISTANCE = 9

The maximum distance for shadow splits. Increasing this value will make directional shadows visible from further away, at the cost of lower overall shadow detail and performance (since more objects need to be included in the directional shadow rendering).

> enum_value LightParam.LIGHT_PARAM_SHADOW_SPLIT_1_OFFSET = 10

Proportion of shadow atlas occupied by the first split.

> enum_value LightParam.LIGHT_PARAM_SHADOW_SPLIT_2_OFFSET = 11

Proportion of shadow atlas occupied by the second split.

> enum_value LightParam.LIGHT_PARAM_SHADOW_SPLIT_3_OFFSET = 12

Proportion of shadow atlas occupied by the third split. The fourth split occupies the rest.

> enum_value LightParam.LIGHT_PARAM_SHADOW_FADE_START = 13

Proportion of shadow max distance where the shadow will start to fade out.

> enum_value LightParam.LIGHT_PARAM_SHADOW_NORMAL_BIAS = 14

Normal bias used to offset shadow lookup by object normal. Can be used to fix self-shadowing artifacts.

> enum_value LightParam.LIGHT_PARAM_SHADOW_BIAS = 15

Bias for the shadow lookup to fix self-shadowing artifacts.

> enum_value LightParam.LIGHT_PARAM_SHADOW_PANCAKE_SIZE = 16

Sets the size of the directional shadow pancake. The pancake offsets the start of the shadow's camera frustum to provide a higher effective depth resolution for the shadow. However, a high pancake size can cause artifacts in the shadows of large objects that are close to the edge of the frustum. Reducing the pancake size can help. Setting the size to `0` turns off the pancaking effect.

> enum_value LightParam.LIGHT_PARAM_SHADOW_OPACITY = 17

The light's shadow opacity. Values lower than `1.0` make the light appear through shadows. This can be used to fake global illumination at a low performance cost.

> enum_value LightParam.LIGHT_PARAM_SHADOW_BLUR = 18

Blurs the edges of the shadow. Can be used to hide pixel artifacts in low resolution shadow maps. A high value can make shadows appear grainy and can cause other unwanted artifacts. Try to keep as near default as possible.

> enum_value LightParam.LIGHT_PARAM_TRANSMITTANCE_BIAS = 19

> enum_value LightParam.LIGHT_PARAM_INTENSITY = 20

Constant representing the intensity of the light, measured in Lumens when dealing with a `SpotLight3D` or `OmniLight3D`, or measured in Lux with a `DirectionalLight3D`. Only used when `ProjectSettings.rendering/lights_and_shadows/use_physical_light_units` is `true`.

> enum_value LightParam.LIGHT_PARAM_MAX = 21

Represents the size of the `LightParam` enum.

> enum LightProjectorFilter

> enum_value LightProjectorFilter.LIGHT_PROJECTOR_FILTER_NEAREST = 0

Nearest-neighbor filter for light projectors (use for pixel art light projectors). No mipmaps are used for rendering, which means light projectors at a distance will look sharp but grainy. This has roughly the same performance cost as using mipmaps.

> enum_value LightProjectorFilter.LIGHT_PROJECTOR_FILTER_LINEAR = 1

Linear filter for light projectors (use for non-pixel art light projectors). No mipmaps are used for rendering, which means light projectors at a distance will look smooth but blurry. This has roughly the same performance cost as using mipmaps.

> enum_value LightProjectorFilter.LIGHT_PROJECTOR_FILTER_NEAREST_MIPMAPS = 2

Nearest-neighbor filter for light projectors (use for pixel art light projectors). Isotropic mipmaps are used for rendering, which means light projectors at a distance will look smooth but blurry. This has roughly the same performance cost as not using mipmaps.

> enum_value LightProjectorFilter.LIGHT_PROJECTOR_FILTER_LINEAR_MIPMAPS = 3

Linear filter for light projectors (use for non-pixel art light projectors). Isotropic mipmaps are used for rendering, which means light projectors at a distance will look smooth but blurry. This has roughly the same performance cost as not using mipmaps.

> enum_value LightProjectorFilter.LIGHT_PROJECTOR_FILTER_NEAREST_MIPMAPS_ANISOTROPIC = 4

Nearest-neighbor filter for light projectors (use for pixel art light projectors). Anisotropic mipmaps are used for rendering, which means light projectors at a distance will look smooth and sharp when viewed from oblique angles. This looks better compared to isotropic mipmaps, but is slower. The level of anisotropic filtering is defined by `ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level`.

> enum_value LightProjectorFilter.LIGHT_PROJECTOR_FILTER_LINEAR_MIPMAPS_ANISOTROPIC = 5

Linear filter for light projectors (use for non-pixel art light projectors). Anisotropic mipmaps are used for rendering, which means light projectors at a distance will look smooth and sharp when viewed from oblique angles. This looks better compared to isotropic mipmaps, but is slower. The level of anisotropic filtering is defined by `ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level`.

> enum LightType

> enum_value LightType.LIGHT_DIRECTIONAL = 0

Directional (sun/moon) light (see `DirectionalLight3D`).

> enum_value LightType.LIGHT_OMNI = 1

Omni light (see `OmniLight3D`).

> enum_value LightType.LIGHT_SPOT = 2

Spot light (see `SpotLight3D`).

> enum_value LightType.LIGHT_AREA = 3

Area light (see `AreaLight3D`).

> enum MultimeshPhysicsInterpolationQuality

> enum_value MultimeshPhysicsInterpolationQuality.MULTIMESH_INTERP_QUALITY_FAST = 0

MultiMesh physics interpolation favors speed over quality.

> enum_value MultimeshPhysicsInterpolationQuality.MULTIMESH_INTERP_QUALITY_HIGH = 1

MultiMesh physics interpolation favors quality over speed.

> enum MultimeshTransformFormat

> enum_value MultimeshTransformFormat.MULTIMESH_TRANSFORM_2D = 0

Use `Transform2D` to store MultiMesh transform.

> enum_value MultimeshTransformFormat.MULTIMESH_TRANSFORM_3D = 1

Use `Transform3D` to store MultiMesh transform.

> enum NinePatchAxisMode

> enum_value NinePatchAxisMode.NINE_PATCH_STRETCH = 0

The nine patch gets stretched where needed.

> enum_value NinePatchAxisMode.NINE_PATCH_TILE = 1

The nine patch gets filled with tiles where needed.

> enum_value NinePatchAxisMode.NINE_PATCH_TILE_FIT = 2

The nine patch gets filled with tiles where needed and stretches them a bit if needed.

> enum ParticlesCollisionHeightfieldResolution

> enum_value ParticlesCollisionHeightfieldResolution.PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_256 = 0

256×256 heightfield resolution for `GPUParticlesCollisionHeightField3D`.

> enum_value ParticlesCollisionHeightfieldResolution.PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_512 = 1

512×512 heightfield resolution for `GPUParticlesCollisionHeightField3D`.

> enum_value ParticlesCollisionHeightfieldResolution.PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_1024 = 2

1024×1024 heightfield resolution for `GPUParticlesCollisionHeightField3D`.

> enum_value ParticlesCollisionHeightfieldResolution.PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_2048 = 3

2048×2048 heightfield resolution for `GPUParticlesCollisionHeightField3D`.

> enum_value ParticlesCollisionHeightfieldResolution.PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_4096 = 4

4096×4096 heightfield resolution for `GPUParticlesCollisionHeightField3D`.

> enum_value ParticlesCollisionHeightfieldResolution.PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_8192 = 5

8192×8192 heightfield resolution for `GPUParticlesCollisionHeightField3D`.

> enum_value ParticlesCollisionHeightfieldResolution.PARTICLES_COLLISION_HEIGHTFIELD_RESOLUTION_MAX = 6

Represents the size of the `ParticlesCollisionHeightfieldResolution` enum.

> enum ParticlesCollisionType

> enum_value ParticlesCollisionType.PARTICLES_COLLISION_TYPE_SPHERE_ATTRACT = 0

Sphere attractor type for `GPUParticles3D` (see `GPUParticlesAttractorSphere3D`).

> enum_value ParticlesCollisionType.PARTICLES_COLLISION_TYPE_BOX_ATTRACT = 1

Box attractor type for `GPUParticles3D` (see `GPUParticlesAttractorBox3D`).

> enum_value ParticlesCollisionType.PARTICLES_COLLISION_TYPE_VECTOR_FIELD_ATTRACT = 2

Vector field attractor type for `GPUParticles3D` (see `GPUParticlesAttractorVectorField3D`).

> enum_value ParticlesCollisionType.PARTICLES_COLLISION_TYPE_SPHERE_COLLIDE = 3

Sphere collision type for `GPUParticles3D` (see `GPUParticlesCollisionSphere3D`).

> enum_value ParticlesCollisionType.PARTICLES_COLLISION_TYPE_BOX_COLLIDE = 4

Box collision type for `GPUParticles3D` (see `GPUParticlesCollisionBox3D`).

> enum_value ParticlesCollisionType.PARTICLES_COLLISION_TYPE_SDF_COLLIDE = 5

Signed distance field collision type for `GPUParticles3D` (see `GPUParticlesCollisionSDF3D`).

> enum_value ParticlesCollisionType.PARTICLES_COLLISION_TYPE_HEIGHTFIELD_COLLIDE = 6

Heightfield collision type for `GPUParticles3D` (see `GPUParticlesCollisionHeightField3D`).

> enum ParticlesDrawOrder

> enum_value ParticlesDrawOrder.PARTICLES_DRAW_ORDER_INDEX = 0

Draw particles in the order that they appear in the particles array.

> enum_value ParticlesDrawOrder.PARTICLES_DRAW_ORDER_LIFETIME = 1

Sort particles based on their lifetime. In other words, the particle with the highest lifetime is drawn at the front.

> enum_value ParticlesDrawOrder.PARTICLES_DRAW_ORDER_REVERSE_LIFETIME = 2

Sort particles based on the inverse of their lifetime. In other words, the particle with the lowest lifetime is drawn at the front.

> enum_value ParticlesDrawOrder.PARTICLES_DRAW_ORDER_VIEW_DEPTH = 3

Sort particles based on their distance to the camera.

> enum ParticlesMode

> enum_value ParticlesMode.PARTICLES_MODE_2D = 0

2D particles.

> enum_value ParticlesMode.PARTICLES_MODE_3D = 1

3D particles.

> enum ParticlesTransformAlign

> enum_value ParticlesTransformAlign.PARTICLES_TRANSFORM_ALIGN_DISABLED = 0

Do not align particle transforms relative to the camera or velocity.

> enum_value ParticlesTransformAlign.PARTICLES_TRANSFORM_ALIGN_Z_BILLBOARD = 1

Align each particle's Z axis to face the camera.

> enum_value ParticlesTransformAlign.PARTICLES_TRANSFORM_ALIGN_Y_TO_VELOCITY = 2

Align each particle's Y axis to the velocity vector.

> enum_value ParticlesTransformAlign.PARTICLES_TRANSFORM_ALIGN_Z_BILLBOARD_Y_TO_VELOCITY = 3

Align each particle's Z axis to face the camera and Y axis to the velocity vector.

> enum_value ParticlesTransformAlign.PARTICLES_TRANSFORM_ALIGN_LOCAL_BILLBOARD = 4

Billboard each particles around a local axis.

> enum ParticlesTransformAlignAxis

> enum_value ParticlesTransformAlignAxis.PARTICLES_ALIGN_AXIS_X = 0

Use the X axis for local billboarding.

> enum_value ParticlesTransformAlignAxis.PARTICLES_ALIGN_AXIS_Y = 1

Use the Y axis for local billboarding.

> enum ParticlesTransformAlignCustomSrc

> enum_value ParticlesTransformAlignCustomSrc.PARTICLES_ALIGN_CHANNEL_FILTER_DISABLED = 0

Do not read from CUSTOM when performing billboarding.

> enum_value ParticlesTransformAlignCustomSrc.PARTICLES_ALIGN_CHANNEL_FILTER_X = 1

Read from `CUSTOM.x` when performing billboarding and use it as an angle, in radians.

> enum_value ParticlesTransformAlignCustomSrc.PARTICLES_ALIGN_CHANNEL_FILTER_Y = 2

Read from `CUSTOM.y` when performing billboarding and use it as an angle, in radians.

> enum_value ParticlesTransformAlignCustomSrc.PARTICLES_ALIGN_CHANNEL_FILTER_Z = 3

Read from `CUSTOM.z` when performing billboarding and use it as an angle, in radians.

> enum_value ParticlesTransformAlignCustomSrc.PARTICLES_ALIGN_CHANNEL_FILTER_W = 4

Read from `CUSTOM.w` when performing billboarding and use it as an angle, in radians.

> enum PipelineSource

> enum_value PipelineSource.PIPELINE_SOURCE_CANVAS = 0

Pipeline compilation that was triggered by the 2D canvas renderer.

> enum_value PipelineSource.PIPELINE_SOURCE_MESH = 1

Pipeline compilation that was triggered by loading a mesh.

> enum_value PipelineSource.PIPELINE_SOURCE_SURFACE = 2

Pipeline compilation that was triggered by building the surface cache before rendering the scene.

> enum_value PipelineSource.PIPELINE_SOURCE_DRAW = 3

Pipeline compilation that was triggered while drawing the scene.

> enum_value PipelineSource.PIPELINE_SOURCE_SPECIALIZATION = 4

Pipeline compilation that was triggered to optimize the current scene.

> enum_value PipelineSource.PIPELINE_SOURCE_MAX = 5

Represents the size of the `PipelineSource` enum.

> enum PrimitiveType

> enum_value PrimitiveType.PRIMITIVE_POINTS = 0

Primitive to draw consists of points.

> enum_value PrimitiveType.PRIMITIVE_LINES = 1

Primitive to draw consists of lines.

> enum_value PrimitiveType.PRIMITIVE_LINE_STRIP = 2

Primitive to draw consists of a line strip from start to end.

> enum_value PrimitiveType.PRIMITIVE_TRIANGLES = 3

Primitive to draw consists of triangles.

> enum_value PrimitiveType.PRIMITIVE_TRIANGLE_STRIP = 4

Primitive to draw consists of a triangle strip (the last 3 vertices are always combined to make a triangle).

> enum_value PrimitiveType.PRIMITIVE_MAX = 5

Represents the size of the `PrimitiveType` enum.

> enum ReflectionProbeAmbientMode

> enum_value ReflectionProbeAmbientMode.REFLECTION_PROBE_AMBIENT_DISABLED = 0

Do not apply any ambient lighting inside the reflection probe's box defined by its size.

> enum_value ReflectionProbeAmbientMode.REFLECTION_PROBE_AMBIENT_ENVIRONMENT = 1

Apply automatically-sourced environment lighting inside the reflection probe's box defined by its size.

> enum_value ReflectionProbeAmbientMode.REFLECTION_PROBE_AMBIENT_COLOR = 2

Apply custom ambient lighting inside the reflection probe's box defined by its size. See `reflection_probe_set_ambient_color` and `reflection_probe_set_ambient_energy`.

> enum ReflectionProbeUpdateMode

> enum_value ReflectionProbeUpdateMode.REFLECTION_PROBE_UPDATE_ONCE = 0

Reflection probe will update reflections once and then stop.

> enum_value ReflectionProbeUpdateMode.REFLECTION_PROBE_UPDATE_ALWAYS = 1

Reflection probe will update each frame. This mode is necessary to capture moving objects.

> enum RenderingInfo

> enum_value RenderingInfo.RENDERING_INFO_TOTAL_OBJECTS_IN_FRAME = 0

Number of objects rendered in the current 3D scene. This varies depending on camera position and rotation.

> enum_value RenderingInfo.RENDERING_INFO_TOTAL_PRIMITIVES_IN_FRAME = 1

Number of points, lines, or triangles rendered in the current 3D scene. This varies depending on camera position and rotation.

> enum_value RenderingInfo.RENDERING_INFO_TOTAL_DRAW_CALLS_IN_FRAME = 2

Number of draw calls performed to render in the current 3D scene. This varies depending on camera position and rotation.

> enum_value RenderingInfo.RENDERING_INFO_TEXTURE_MEM_USED = 3

Texture memory used (in bytes).

> enum_value RenderingInfo.RENDERING_INFO_BUFFER_MEM_USED = 4

Buffer memory used (in bytes). This includes vertex data, uniform buffers, and many miscellaneous buffer types used internally.

> enum_value RenderingInfo.RENDERING_INFO_VIDEO_MEM_USED = 5

Video memory used (in bytes). When using the Forward+ or Mobile renderers, this is always greater than the sum of `RENDERING_INFO_TEXTURE_MEM_USED` and `RENDERING_INFO_BUFFER_MEM_USED`, since there is miscellaneous data not accounted for by those two metrics. When using the Compatibility renderer, this is equal to the sum of `RENDERING_INFO_TEXTURE_MEM_USED` and `RENDERING_INFO_BUFFER_MEM_USED`.

> enum_value RenderingInfo.RENDERING_INFO_PIPELINE_COMPILATIONS_CANVAS = 6

Number of pipeline compilations that were triggered by the 2D canvas renderer.

> enum_value RenderingInfo.RENDERING_INFO_PIPELINE_COMPILATIONS_MESH = 7

Number of pipeline compilations that were triggered by loading meshes. These compilations will show up as longer loading times the first time a user runs the game and the pipeline is required.

> enum_value RenderingInfo.RENDERING_INFO_PIPELINE_COMPILATIONS_SURFACE = 8

Number of pipeline compilations that were triggered by building the surface cache before rendering the scene. These compilations will show up as a stutter when loading a scene the first time a user runs the game and the pipeline is required.

> enum_value RenderingInfo.RENDERING_INFO_PIPELINE_COMPILATIONS_DRAW = 9

Number of pipeline compilations that were triggered while drawing the scene. These compilations will show up as stutters during gameplay the first time a user runs the game and the pipeline is required.

> enum_value RenderingInfo.RENDERING_INFO_PIPELINE_COMPILATIONS_SPECIALIZATION = 10

Number of pipeline compilations that were triggered to optimize the current scene. These compilations are done in the background and should not cause any stutters whatsoever.

> enum ShaderMode

> enum_value ShaderMode.SHADER_SPATIAL = 0

Shader is a 3D shader.

> enum_value ShaderMode.SHADER_CANVAS_ITEM = 1

Shader is a 2D shader.

> enum_value ShaderMode.SHADER_PARTICLES = 2

Shader is a particle shader (can be used in both 2D and 3D).

> enum_value ShaderMode.SHADER_SKY = 3

Shader is a 3D sky shader.

> enum_value ShaderMode.SHADER_FOG = 4

Shader is a 3D fog shader.

> enum_value ShaderMode.SHADER_TEXTURE_BLIT = 5

Shader is a texture_blit shader.

> enum_value ShaderMode.SHADER_MAX = 6

Represents the size of the `ShaderMode` enum.

> enum ShadowCastingSetting

> enum_value ShadowCastingSetting.SHADOW_CASTING_SETTING_OFF = 0

Disable shadows from this instance.

> enum_value ShadowCastingSetting.SHADOW_CASTING_SETTING_ON = 1

Cast shadows from this instance.

> enum_value ShadowCastingSetting.SHADOW_CASTING_SETTING_DOUBLE_SIDED = 2

Disable backface culling when rendering the shadow of the object. This is slightly slower but may result in more correct shadows.

> enum_value ShadowCastingSetting.SHADOW_CASTING_SETTING_SHADOWS_ONLY = 3

Only render the shadows from the object. The object itself will not be drawn.

> enum ShadowQuality

> enum_value ShadowQuality.SHADOW_QUALITY_HARD = 0

Lowest shadow filtering quality (fastest). Soft shadows are not available with this quality setting, which means the `Light3D.shadow_blur` property is ignored if `Light3D.light_size` and `Light3D.light_angular_distance` is `0.0`.
**Note:** The variable shadow blur performed by `Light3D.light_size` and `Light3D.light_angular_distance` is still effective when using hard shadow filtering. In this case, `Light3D.shadow_blur` *is* taken into account. However, the results will not be blurred, instead the blur amount is treated as a maximum radius for the penumbra.

> enum_value ShadowQuality.SHADOW_QUALITY_SOFT_VERY_LOW = 1

Very low shadow filtering quality (faster). When using this quality setting, `Light3D.shadow_blur` is automatically multiplied by 0.75× to avoid introducing too much noise. This division only applies to lights whose `Light3D.light_size` or `Light3D.light_angular_distance` is `0.0`).

> enum_value ShadowQuality.SHADOW_QUALITY_SOFT_LOW = 2

Low shadow filtering quality (fast).

> enum_value ShadowQuality.SHADOW_QUALITY_SOFT_MEDIUM = 3

Medium low shadow filtering quality (average).

> enum_value ShadowQuality.SHADOW_QUALITY_SOFT_HIGH = 4

High low shadow filtering quality (slow). When using this quality setting, `Light3D.shadow_blur` is automatically multiplied by 1.5× to better make use of the high sample count. This increased blur also improves the stability of dynamic object shadows. This multiplier only applies to lights whose `Light3D.light_size` or `Light3D.light_angular_distance` is `0.0`).

> enum_value ShadowQuality.SHADOW_QUALITY_SOFT_ULTRA = 5

Highest low shadow filtering quality (slowest). When using this quality setting, `Light3D.shadow_blur` is automatically multiplied by 2× to better make use of the high sample count. This increased blur also improves the stability of dynamic object shadows. This multiplier only applies to lights whose `Light3D.light_size` or `Light3D.light_angular_distance` is `0.0`).

> enum_value ShadowQuality.SHADOW_QUALITY_MAX = 6

Represents the size of the `ShadowQuality` enum.

> enum SkyMode

> enum_value SkyMode.SKY_MODE_AUTOMATIC = 0

Automatically selects the appropriate process mode based on your sky shader. If your shader uses `TIME` or `POSITION`, this will use `SKY_MODE_REALTIME`. If your shader uses any of the `LIGHT_*` variables or any custom uniforms, this uses `SKY_MODE_INCREMENTAL`. Otherwise, this defaults to `SKY_MODE_QUALITY`.

> enum_value SkyMode.SKY_MODE_QUALITY = 1

Uses high quality importance sampling to process the radiance map. In general, this results in much higher quality than `SKY_MODE_REALTIME` but takes much longer to generate. This should not be used if you plan on changing the sky at runtime. If you are finding that the reflection is not blurry enough and is showing sparkles or fireflies, try increasing `ProjectSettings.rendering/reflections/sky_reflections/ggx_samples`.

> enum_value SkyMode.SKY_MODE_INCREMENTAL = 2

Uses the same high quality importance sampling to process the radiance map as `SKY_MODE_QUALITY`, but updates over several frames. The number of frames is determined by `ProjectSettings.rendering/reflections/sky_reflections/roughness_layers`. Use this when you need highest quality radiance maps, but have a sky that updates slowly.

> enum_value SkyMode.SKY_MODE_REALTIME = 3

Uses the fast filtering algorithm to process the radiance map. In general this results in lower quality, but substantially faster run times. If you need better quality, but still need to update the sky every frame, consider turning on `ProjectSettings.rendering/reflections/sky_reflections/fast_filter_high_quality`.
**Note:** The fast filtering algorithm is limited to 256×256 cubemaps, so `sky_set_radiance_size` must be set to `256`. Otherwise, a warning is printed and the overridden radiance size is ignored.

> enum SplashStretchMode

> enum_value SplashStretchMode.SPLASH_STRETCH_MODE_DISABLED = 0

No stretching is applied.

> enum_value SplashStretchMode.SPLASH_STRETCH_MODE_KEEP = 1

Stretches image to fullscreen while preserving aspect ratio.

> enum_value SplashStretchMode.SPLASH_STRETCH_MODE_KEEP_WIDTH = 2

Stretches the height of the image based on the width of the screen.

> enum_value SplashStretchMode.SPLASH_STRETCH_MODE_KEEP_HEIGHT = 3

Stretches the width of the image based on the height of the screen.

> enum_value SplashStretchMode.SPLASH_STRETCH_MODE_COVER = 4

Stretches the image to cover the entire screen while preserving aspect ratio.

> enum_value SplashStretchMode.SPLASH_STRETCH_MODE_IGNORE = 5

Stretches the image to cover the entire screen but doesn't preserve aspect ratio.

> enum SubSurfaceScatteringQuality

> enum_value SubSurfaceScatteringQuality.SUB_SURFACE_SCATTERING_QUALITY_DISABLED = 0

Disables subsurface scattering entirely, even on materials that have `BaseMaterial3D.subsurf_scatter_enabled` set to `true`. This has the lowest GPU requirements.

> enum_value SubSurfaceScatteringQuality.SUB_SURFACE_SCATTERING_QUALITY_LOW = 1

Low subsurface scattering quality.

> enum_value SubSurfaceScatteringQuality.SUB_SURFACE_SCATTERING_QUALITY_MEDIUM = 2

Medium subsurface scattering quality.

> enum_value SubSurfaceScatteringQuality.SUB_SURFACE_SCATTERING_QUALITY_HIGH = 3

High subsurface scattering quality. This has the highest GPU requirements.

> enum TextureDrawableFormat

> enum_value TextureDrawableFormat.TEXTURE_DRAWABLE_FORMAT_RGBA8 = 0

OpenGL texture format RGBA with four components, each with a bitdepth of 8.

> enum_value TextureDrawableFormat.TEXTURE_DRAWABLE_FORMAT_RGBA8_SRGB = 1

OpenGL texture format RGBA with four components, each with a bitdepth of 8.
When drawn to, an sRGB to linear color space conversion is performed.

> enum_value TextureDrawableFormat.TEXTURE_DRAWABLE_FORMAT_RGBAH = 2

OpenGL texture format GL_RGBA16F where there are four components, each a 16-bit "half-precision" floating-point value.

> enum_value TextureDrawableFormat.TEXTURE_DRAWABLE_FORMAT_RGBAF = 3

OpenGL texture format GL_RGBA32F where there are four components, each a 32-bit floating-point value.

> enum TextureLayeredType

> enum_value TextureLayeredType.TEXTURE_LAYERED_2D_ARRAY = 0

Array of 2-dimensional textures (see `Texture2DArray`).

> enum_value TextureLayeredType.TEXTURE_LAYERED_CUBEMAP = 1

Cubemap texture (see `Cubemap`).

> enum_value TextureLayeredType.TEXTURE_LAYERED_CUBEMAP_ARRAY = 2

Array of cubemap textures (see `CubemapArray`).

> enum TextureType

> enum_value TextureType.TEXTURE_TYPE_2D = 0

2D texture.

> enum_value TextureType.TEXTURE_TYPE_LAYERED = 1

Layered texture.

> enum_value TextureType.TEXTURE_TYPE_3D = 2

3D texture.

> enum ViewportAnisotropicFiltering

> enum_value ViewportAnisotropicFiltering.VIEWPORT_ANISOTROPY_DISABLED = 0

Anisotropic filtering is disabled.

> enum_value ViewportAnisotropicFiltering.VIEWPORT_ANISOTROPY_2X = 1

Use 2× anisotropic filtering.

> enum_value ViewportAnisotropicFiltering.VIEWPORT_ANISOTROPY_4X = 2

Use 4× anisotropic filtering. This is the default value.

> enum_value ViewportAnisotropicFiltering.VIEWPORT_ANISOTROPY_8X = 3

Use 8× anisotropic filtering.

> enum_value ViewportAnisotropicFiltering.VIEWPORT_ANISOTROPY_16X = 4

Use 16× anisotropic filtering.

> enum_value ViewportAnisotropicFiltering.VIEWPORT_ANISOTROPY_MAX = 5

Represents the size of the `ViewportAnisotropicFiltering` enum.

> enum ViewportClearMode

> enum_value ViewportClearMode.VIEWPORT_CLEAR_ALWAYS = 0

Always clear the viewport's render target before drawing.

> enum_value ViewportClearMode.VIEWPORT_CLEAR_NEVER = 1

Never clear the viewport's render target.

> enum_value ViewportClearMode.VIEWPORT_CLEAR_ONLY_NEXT_FRAME = 2

Clear the viewport's render target on the next frame, then switch to `VIEWPORT_CLEAR_NEVER`.

> enum ViewportDebugDraw

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_DISABLED = 0

Debug draw is disabled. Default setting.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_UNSHADED = 1

Objects are displayed without light information.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_LIGHTING = 2

Objects are displayed with only light information.
**Note:** When using this debug draw mode, custom shaders are ignored since all materials in the scene temporarily use a debug material. This means the result from custom shader functions (such as vertex displacement) won't be visible anymore when using this debug draw mode.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_OVERDRAW = 3

Objects are displayed semi-transparent with additive blending so you can see where they are drawing over top of one another. A higher overdraw (represented by brighter colors) means you are wasting performance on drawing pixels that are being hidden behind others.
**Note:** When using this debug draw mode, custom shaders are ignored since all materials in the scene temporarily use a debug material. This means the result from custom shader functions (such as vertex displacement) won't be visible anymore when using this debug draw mode.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_WIREFRAME = 4

Debug draw draws objects in wireframe.
**Note:** `set_debug_generate_wireframes` must be called before loading any meshes for wireframes to be visible when using the Compatibility renderer.
**Note:** In the Compatibility renderer, backfaces are always visible when using wireframe rendering. In the Forward+ and Mobile renderers, wireframes follow the material's backface culling properties instead.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_NORMAL_BUFFER = 5

Normal buffer is drawn instead of regular scene so you can see the per-pixel normals that will be used by post-processing effects.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_VOXEL_GI_ALBEDO = 6

Objects are displayed with only the albedo value from `VoxelGI`s. Requires at least one visible `VoxelGI` node that has been baked to have a visible effect.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_VOXEL_GI_LIGHTING = 7

Objects are displayed with only the lighting value from `VoxelGI`s. Requires at least one visible `VoxelGI` node that has been baked to have a visible effect.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_VOXEL_GI_EMISSION = 8

Objects are displayed with only the emission color from `VoxelGI`s. Requires at least one visible `VoxelGI` node that has been baked to have a visible effect.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_SHADOW_ATLAS = 9

Draws the shadow atlas that stores shadows from `OmniLight3D`s and `SpotLight3D`s in the upper left quadrant of the `Viewport`.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_DIRECTIONAL_SHADOW_ATLAS = 10

Draws the shadow atlas that stores shadows from `DirectionalLight3D`s in the upper left quadrant of the `Viewport`.
The slice of the camera frustum related to the shadow map cascade is superimposed to visualize coverage. The color of each slice matches the colors used for `VIEWPORT_DEBUG_DRAW_PSSM_SPLITS`. When shadow cascades are blended the overlap is taken into account when drawing the frustum slices.
The last cascade shows all frustum slices to illustrate the coverage of all slices.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_SCENE_LUMINANCE = 11

Draws the estimated scene luminance. This is a 1×1 texture that is generated when autoexposure is enabled to control the scene's exposure.
**Note:** Only supported when using the Forward+ or Mobile rendering methods.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_SSAO = 12

Draws the screen space ambient occlusion texture instead of the scene so that you can clearly see how it is affecting objects. In order for this display mode to work, you must have `Environment.ssao_enabled` set in your `WorldEnvironment`.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_SSIL = 13

Draws the screen space indirect lighting texture instead of the scene so that you can clearly see how it is affecting objects. In order for this display mode to work, you must have `Environment.ssil_enabled` set in your `WorldEnvironment`.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_PSSM_SPLITS = 14

Colors each PSSM split for the `DirectionalLight3D`s in the scene a different color so you can see where the splits are. In order (from closest to furthest from the camera), they are colored red, green, blue, and yellow.
**Note:** When using this debug draw mode, custom shaders are ignored since all materials in the scene temporarily use a debug material. This means the result from custom shader functions (such as vertex displacement) won't be visible anymore when using this debug draw mode.
**Note:** Only supported when using the Forward+ or Mobile rendering methods.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_DECAL_ATLAS = 15

Draws the decal atlas that stores decal textures from `Decal`s.
**Note:** Only supported when using the Forward+ or Mobile rendering methods.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_SDFGI = 16

Draws SDFGI cascade data. This is the data structure that is used to bounce lighting against and create reflections.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_SDFGI_PROBES = 17

Draws SDFGI probe data. This is the data structure that is used to give indirect lighting dynamic objects moving within the scene.
When in the editor, left-clicking a probe will display additional bright dots that show its occlusion information. A white dot means the light is not occluded at all at the dot's position, while a red dot means the light is fully occluded. Intermediate values are possible.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_GI_BUFFER = 18

Draws the global illumination buffer from `VoxelGI` or SDFGI. Requires `VoxelGI` (at least one visible baked VoxelGI node) or SDFGI (`Environment.sdfgi_enabled`) to be enabled to have a visible effect.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_DISABLE_LOD = 19

Disable mesh LOD. All meshes are drawn with full detail, which can be used to compare performance.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_CLUSTER_OMNI_LIGHTS = 20

Draws the `OmniLight3D` cluster. Clustering determines where lights are positioned in screen-space, which allows the engine to only process these portions of the screen for lighting.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_CLUSTER_SPOT_LIGHTS = 21

Draws the `SpotLight3D` cluster. Clustering determines where lights are positioned in screen-space, which allows the engine to only process these portions of the screen for lighting.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_CLUSTER_DECALS = 22

Draws the `Decal` cluster. Clustering determines where decals are positioned in screen-space, which allows the engine to only process these portions of the screen for decals.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_CLUSTER_REFLECTION_PROBES = 23

Draws the `ReflectionProbe` cluster. Clustering determines where reflection probes are positioned in screen-space, which allows the engine to only process these portions of the screen for reflection probes.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_OCCLUDERS = 24

Draws the occlusion culling buffer. This low-resolution occlusion culling buffer is rasterized on the CPU and is used to check whether instances are occluded by other objects.
**Note:** Only supported when using the Forward+ or Mobile rendering methods.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_MOTION_VECTORS = 25

Draws the motion vectors buffer. This is used by temporal antialiasing to correct for motion that occurs during gameplay.
**Note:** Only supported when using the Forward+ rendering method.

> enum_value ViewportDebugDraw.VIEWPORT_DEBUG_DRAW_INTERNAL_BUFFER = 26

Internal buffer is drawn instead of regular scene so you can see the per-pixel output that will be used by post-processing effects.
**Note:** Only supported when using the Forward+ or Mobile rendering methods.

> enum ViewportEnvironmentMode

> enum_value ViewportEnvironmentMode.VIEWPORT_ENVIRONMENT_DISABLED = 0

Disable rendering of 3D environment over 2D canvas.

> enum_value ViewportEnvironmentMode.VIEWPORT_ENVIRONMENT_ENABLED = 1

Enable rendering of 3D environment over 2D canvas.

> enum_value ViewportEnvironmentMode.VIEWPORT_ENVIRONMENT_INHERIT = 2

Inherit enable/disable value from parent. If the topmost parent is also set to `VIEWPORT_ENVIRONMENT_INHERIT`, then this has the same behavior as `VIEWPORT_ENVIRONMENT_ENABLED`.

> enum_value ViewportEnvironmentMode.VIEWPORT_ENVIRONMENT_MAX = 3

Represents the size of the `ViewportEnvironmentMode` enum.

> enum ViewportMSAA

> enum_value ViewportMSAA.VIEWPORT_MSAA_DISABLED = 0

Multisample antialiasing for 3D is disabled. This is the default value, and also the fastest setting.

> enum_value ViewportMSAA.VIEWPORT_MSAA_2X = 1

Multisample antialiasing uses 2 samples per pixel for 3D. This has a moderate impact on performance.

> enum_value ViewportMSAA.VIEWPORT_MSAA_4X = 2

Multisample antialiasing uses 4 samples per pixel for 3D. This has a high impact on performance.

> enum_value ViewportMSAA.VIEWPORT_MSAA_8X = 3

Multisample antialiasing uses 8 samples per pixel for 3D. This has a very high impact on performance. Likely unsupported on low-end and older hardware.

> enum_value ViewportMSAA.VIEWPORT_MSAA_MAX = 4

Represents the size of the `ViewportMSAA` enum.

> enum ViewportOcclusionCullingBuildQuality

> enum_value ViewportOcclusionCullingBuildQuality.VIEWPORT_OCCLUSION_BUILD_QUALITY_LOW = 0

Low occlusion culling BVH build quality (as defined by Embree). Results in the lowest CPU usage, but least effective culling.

> enum_value ViewportOcclusionCullingBuildQuality.VIEWPORT_OCCLUSION_BUILD_QUALITY_MEDIUM = 1

Medium occlusion culling BVH build quality (as defined by Embree).

> enum_value ViewportOcclusionCullingBuildQuality.VIEWPORT_OCCLUSION_BUILD_QUALITY_HIGH = 2

High occlusion culling BVH build quality (as defined by Embree). Results in the highest CPU usage, but most effective culling.

> enum ViewportRenderInfo

> enum_value ViewportRenderInfo.VIEWPORT_RENDER_INFO_OBJECTS_IN_FRAME = 0

Number of objects drawn in a single frame.

> enum_value ViewportRenderInfo.VIEWPORT_RENDER_INFO_PRIMITIVES_IN_FRAME = 1

Number of points, lines, or triangles drawn in a single frame.

> enum_value ViewportRenderInfo.VIEWPORT_RENDER_INFO_DRAW_CALLS_IN_FRAME = 2

Number of draw calls during this frame.

> enum_value ViewportRenderInfo.VIEWPORT_RENDER_INFO_MAX = 3

Represents the size of the `ViewportRenderInfo` enum.

> enum ViewportRenderInfoType

> enum_value ViewportRenderInfoType.VIEWPORT_RENDER_INFO_TYPE_VISIBLE = 0

Visible render pass (excluding shadows).

> enum_value ViewportRenderInfoType.VIEWPORT_RENDER_INFO_TYPE_SHADOW = 1

Shadow render pass. Objects will be rendered several times depending on the number of amounts of lights with shadows and the number of directional shadow splits.

> enum_value ViewportRenderInfoType.VIEWPORT_RENDER_INFO_TYPE_CANVAS = 2

Canvas item rendering. This includes all 2D rendering.

> enum_value ViewportRenderInfoType.VIEWPORT_RENDER_INFO_TYPE_MAX = 3

Represents the size of the `ViewportRenderInfoType` enum.

> enum ViewportSDFOversize

> enum_value ViewportSDFOversize.VIEWPORT_SDF_OVERSIZE_100_PERCENT = 0

Do not oversize the 2D signed distance field. Occluders may disappear when touching the viewport's edges, and `GPUParticles3D` collision may stop working earlier than intended. This has the lowest GPU requirements.

> enum_value ViewportSDFOversize.VIEWPORT_SDF_OVERSIZE_120_PERCENT = 1

2D signed distance field covers 20% of the viewport's size outside the viewport on each side (top, right, bottom, left).

> enum_value ViewportSDFOversize.VIEWPORT_SDF_OVERSIZE_150_PERCENT = 2

2D signed distance field covers 50% of the viewport's size outside the viewport on each side (top, right, bottom, left).

> enum_value ViewportSDFOversize.VIEWPORT_SDF_OVERSIZE_200_PERCENT = 3

2D signed distance field covers 100% of the viewport's size outside the viewport on each side (top, right, bottom, left). This has the highest GPU requirements.

> enum_value ViewportSDFOversize.VIEWPORT_SDF_OVERSIZE_MAX = 4

Represents the size of the `ViewportSDFOversize` enum.

> enum ViewportSDFScale

> enum_value ViewportSDFScale.VIEWPORT_SDF_SCALE_100_PERCENT = 0

Full resolution 2D signed distance field scale. This has the highest GPU requirements.

> enum_value ViewportSDFScale.VIEWPORT_SDF_SCALE_50_PERCENT = 1

Half resolution 2D signed distance field scale on each axis (25% of the viewport pixel count).

> enum_value ViewportSDFScale.VIEWPORT_SDF_SCALE_25_PERCENT = 2

Quarter resolution 2D signed distance field scale on each axis (6.25% of the viewport pixel count). This has the lowest GPU requirements.

> enum_value ViewportSDFScale.VIEWPORT_SDF_SCALE_MAX = 3

Represents the size of the `ViewportSDFScale` enum.

> enum ViewportScaling3DMode

> enum_value ViewportScaling3DMode.VIEWPORT_SCALING_3D_MODE_BILINEAR = 0

Use bilinear scaling for the viewport's 3D buffer. The amount of scaling can be set using `Viewport.scaling_3d_scale`. Values less than `1.0` will result in undersampling while values greater than `1.0` will result in supersampling. A value of `1.0` disables scaling.

> enum_value ViewportScaling3DMode.VIEWPORT_SCALING_3D_MODE_FSR = 1

Use AMD FidelityFX Super Resolution 1.0 upscaling for the viewport's 3D buffer. The amount of scaling can be set using `Viewport.scaling_3d_scale`. Values less than `1.0` will result in the viewport being upscaled using FSR. Values greater than `1.0` are not supported and bilinear downsampling will be used instead. A value of `1.0` disables scaling.

> enum_value ViewportScaling3DMode.VIEWPORT_SCALING_3D_MODE_FSR2 = 2

Use AMD FidelityFX Super Resolution 2.2 upscaling for the viewport's 3D buffer. The amount of scaling can be set using `Viewport.scaling_3d_scale`. Values less than `1.0` will result in the viewport being upscaled using FSR2. Values greater than `1.0` are not supported and bilinear downsampling will be used instead. A value of `1.0` will use FSR2 at native resolution as a TAA solution.

> enum_value ViewportScaling3DMode.VIEWPORT_SCALING_3D_MODE_METALFX_SPATIAL = 3

Use MetalFX spatial upscaling for the viewport's 3D buffer. The amount of scaling can be set using `Viewport.scaling_3d_scale`. Values less than `1.0` will result in the viewport being upscaled using MetalFX. Values greater than `1.0` are not supported and bilinear downsampling will be used instead. A value of `1.0` disables scaling.
**Note:** Only supported when the Metal rendering driver is in use, which limits this scaling mode to macOS and iOS.

> enum_value ViewportScaling3DMode.VIEWPORT_SCALING_3D_MODE_METALFX_TEMPORAL = 4

Use MetalFX temporal upscaling for the viewport's 3D buffer. The amount of scaling can be set using `Viewport.scaling_3d_scale`. Values less than `1.0` will result in the viewport being upscaled using MetalFX. Values greater than `1.0` are not supported and bilinear downsampling will be used instead. A value of `1.0` will use MetalFX at native resolution as a TAA solution.
**Note:** Only supported when the Metal rendering driver is in use, which limits this scaling mode to macOS and iOS.

> enum_value ViewportScaling3DMode.VIEWPORT_SCALING_3D_MODE_NEAREST = 5

Use nearest-neighbor filtering for the viewport's 3D buffer. This looks crisper than `VIEWPORT_SCALING_3D_MODE_BILINEAR` and has no additional rendering cost. The amount of scaling can be set using `Viewport.scaling_3d_scale`. Values greater than `1.0` are not supported and bilinear downsampling will be used instead. A value of `1.0` disables scaling.
**Note:** When using the **Nearest** scaling mode, to avoid uneven pixel scaling, it's highly recommended to use a value equal to an integer divisor with a dividend of `1`. For example, it's best to use a scale of `0.5` (1/2), `0.3333` (1/3), `0.25` (1/4), `0.2` (1/5), and so on.

> enum_value ViewportScaling3DMode.VIEWPORT_SCALING_3D_MODE_MAX = 6

Represents the size of the `ViewportScaling3DMode` enum.

> enum ViewportScreenSpaceAA

> enum_value ViewportScreenSpaceAA.VIEWPORT_SCREEN_SPACE_AA_DISABLED = 0

Do not perform any antialiasing in the full screen post-process.

> enum_value ViewportScreenSpaceAA.VIEWPORT_SCREEN_SPACE_AA_FXAA = 1

Use fast approximate antialiasing. FXAA is a popular screen-space antialiasing method, which is fast but will make the image look blurry, especially at lower resolutions. It can still work relatively well at large resolutions such as 1440p and 4K.

> enum_value ViewportScreenSpaceAA.VIEWPORT_SCREEN_SPACE_AA_SMAA = 2

Use subpixel morphological antialiasing. SMAA may produce clearer results than FXAA, but at a slightly higher performance cost.

> enum_value ViewportScreenSpaceAA.VIEWPORT_SCREEN_SPACE_AA_MAX = 3

Represents the size of the `ViewportScreenSpaceAA` enum.

> enum ViewportUpdateMode

> enum_value ViewportUpdateMode.VIEWPORT_UPDATE_DISABLED = 0

Do not update the viewport's render target.

> enum_value ViewportUpdateMode.VIEWPORT_UPDATE_ONCE = 1

Update the viewport's render target once, then switch to `VIEWPORT_UPDATE_DISABLED`.

> enum_value ViewportUpdateMode.VIEWPORT_UPDATE_WHEN_VISIBLE = 2

Update the viewport's render target only when it is visible. This is the default value.

> enum_value ViewportUpdateMode.VIEWPORT_UPDATE_WHEN_PARENT_VISIBLE = 3

Update the viewport's render target only when its parent is visible.

> enum_value ViewportUpdateMode.VIEWPORT_UPDATE_ALWAYS = 4

Always update the viewport's render target.

> enum ViewportVRSMode

> enum_value ViewportVRSMode.VIEWPORT_VRS_DISABLED = 0

Variable rate shading is disabled.

> enum_value ViewportVRSMode.VIEWPORT_VRS_TEXTURE = 1

Variable rate shading uses a texture. Note, for stereoscopic use a texture atlas with a texture for each view.

> enum_value ViewportVRSMode.VIEWPORT_VRS_XR = 2

Variable rate shading texture is supplied by the primary `XRInterface`. Note that this may override the update mode.

> enum_value ViewportVRSMode.VIEWPORT_VRS_MAX = 3

Represents the size of the `ViewportVRSMode` enum.

> enum ViewportVRSUpdateMode

> enum_value ViewportVRSUpdateMode.VIEWPORT_VRS_UPDATE_DISABLED = 0

The input texture for variable rate shading will not be processed.

> enum_value ViewportVRSUpdateMode.VIEWPORT_VRS_UPDATE_ONCE = 1

The input texture for variable rate shading will be processed once.

> enum_value ViewportVRSUpdateMode.VIEWPORT_VRS_UPDATE_ALWAYS = 2

The input texture for variable rate shading will be processed each frame.

> enum_value ViewportVRSUpdateMode.VIEWPORT_VRS_UPDATE_MAX = 3

Represents the size of the `ViewportVRSUpdateMode` enum.

> enum VisibilityRangeFadeMode

> enum_value VisibilityRangeFadeMode.VISIBILITY_RANGE_FADE_DISABLED = 0

Disable visibility range fading for the given instance.

> enum_value VisibilityRangeFadeMode.VISIBILITY_RANGE_FADE_SELF = 1

Fade-out the given instance when it approaches its visibility range limits.

> enum_value VisibilityRangeFadeMode.VISIBILITY_RANGE_FADE_DEPENDENCIES = 2

Fade-in the given instance's dependencies when reaching its visibility range limits.

> enum VoxelGIQuality

> enum_value VoxelGIQuality.VOXEL_GI_QUALITY_LOW = 0

Low `VoxelGI` rendering quality using 4 cones.

> enum_value VoxelGIQuality.VOXEL_GI_QUALITY_HIGH = 1

High `VoxelGI` rendering quality using 6 cones.

## Constants

> constant NO_INDEX_ARRAY = -1

Marks an error that shows that the index array is empty.

> constant ARRAY_WEIGHTS_SIZE = 4

Number of weights/bones per vertex.

> constant CANVAS_ITEM_Z_MIN = -4096

The minimum Z-layer for canvas items.

> constant CANVAS_ITEM_Z_MAX = 4096

The maximum Z-layer for canvas items.

> constant CANVAS_LAYER_MIN = -2147483648

The minimum canvas layer.

> constant CANVAS_LAYER_MAX = 2147483647

The maximum canvas layer.

> constant MAX_GLOW_LEVELS = 7

The maximum number of glow levels that can be used with the glow post-processing effect.

> constant MAX_CURSORS = 8 ; deprecated=This constant is not used by the engine.

> constant MAX_2D_DIRECTIONAL_LIGHTS = 8

The maximum number of directional lights that can be rendered at a given time in 2D.

> constant MAX_MESH_SURFACES = 256

The maximum number of surfaces a mesh can have.

> constant MATERIAL_RENDER_PRIORITY_MIN = -128

The minimum renderpriority of all materials.

> constant MATERIAL_RENDER_PRIORITY_MAX = 127

The maximum renderpriority of all materials.

> constant ARRAY_CUSTOM_COUNT = 4

The number of custom data arrays available (`ARRAY_CUSTOM0`, `ARRAY_CUSTOM1`, `ARRAY_CUSTOM2`, `ARRAY_CUSTOM3`).

> constant PARTICLES_EMIT_FLAG_POSITION = 1

Particle starts at the specified position.

> constant PARTICLES_EMIT_FLAG_ROTATION_SCALE = 2

Particle starts with specified rotation and scale.

> constant PARTICLES_EMIT_FLAG_VELOCITY = 4

Particle starts with the specified velocity vector, which defines the emission direction and speed.

> constant PARTICLES_EMIT_FLAG_COLOR = 8

Particle starts with specified color.

> constant PARTICLES_EMIT_FLAG_CUSTOM = 16

Particle starts with specified `CUSTOM` data.

## Tutorials
- [Optimization using Servers]($DOCS_URL/tutorials/performance/using_servers.html)
