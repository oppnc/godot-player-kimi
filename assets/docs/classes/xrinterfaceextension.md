# XRInterfaceExtension

> class XRInterfaceExtension
> inherits XRInterfaceExtension XRInterface

## Brief

Base class for XR interface extensions (plugins).

## Description

External XR interface plugins should inherit from this class.

## Methods

> method _end_frame() -> void ; qualifiers=virtual

Called if interface is active and queues have been submitted.

> method _get_anchor_detection_is_enabled() -> bool ; qualifiers=virtual const

Return `true` if anchor detection is enabled for this interface.

> method _get_camera_feed_id() -> int ; qualifiers=virtual const

Returns the camera feed ID for the `CameraFeed` registered with the `CameraServer` that should be presented as the background on an AR capable device (if applicable).

> method _get_camera_transform() -> Transform3D ; qualifiers=virtual

Returns the `Transform3D` that positions the `XRCamera3D` in the world.

> method _get_capabilities() -> int ; qualifiers=virtual const

Returns the capabilities of this interface.

> method _get_color_texture() -> RID ; qualifiers=virtual

Return color texture into which to render (if applicable).

> method _get_depth_texture() -> RID ; qualifiers=virtual

Return depth texture into which to render (if applicable).

> method _get_name() -> StringName ; qualifiers=virtual const

Returns the name of this interface.

> method _get_play_area() -> PackedVector3Array ; qualifiers=virtual const

Returns a `PackedVector3Array` that represents the play areas boundaries (if applicable).

> method _get_play_area_mode() -> XRInterface.PlayAreaMode ; qualifiers=virtual const

Returns the play area mode that sets up our play area.

> method _get_projection_for_view(view: int, aspect: float, z_near: float, z_far: float) -> PackedFloat64Array ; qualifiers=virtual

Returns the projection matrix for the given view as a `PackedFloat64Array`.

> method _get_render_target_size() -> Vector2 ; qualifiers=virtual

Returns the size of our render target for this interface, this overrides the size of the `Viewport` marked as the xr viewport.

> method _get_suggested_pose_names(tracker_name: StringName) -> PackedStringArray ; qualifiers=virtual const

Returns a `PackedStringArray` with pose names configured by this interface. Note that user configuration can override this list.

> method _get_suggested_tracker_names() -> PackedStringArray ; qualifiers=virtual const

Returns a `PackedStringArray` with tracker names configured by this interface. Note that user configuration can override this list.

> method _get_system_info() -> Dictionary ; qualifiers=virtual const

Returns a `Dictionary` with system information related to this interface.

> method _get_tracking_status() -> XRInterface.TrackingStatus ; qualifiers=virtual const

Returns the current status of our tracking.

> method _get_transform_for_view(view: int, cam_transform: Transform3D) -> Transform3D ; qualifiers=virtual

Returns a `Transform3D` for a given view.

> method _get_velocity_texture() -> RID ; qualifiers=virtual

Return velocity texture into which to render (if applicable).

> method _get_view_count() -> int ; qualifiers=virtual

Returns the number of views this interface requires, 1 for mono, 2 for stereoscopic.

> method _get_vrs_texture() -> RID ; qualifiers=virtual

> method _get_vrs_texture_format() -> XRInterface.VRSTextureFormat ; qualifiers=virtual

Returns the format of the texture returned by `_get_vrs_texture`.

> method _initialize() -> bool ; qualifiers=virtual

Initializes the interface, returns `true` on success.

> method _is_initialized() -> bool ; qualifiers=virtual const

Returns `true` if this interface has been initialized.

> method _post_draw_viewport(render_target: RID, screen_rect: Rect2) -> void ; qualifiers=virtual

Called after the XR `Viewport` draw logic has completed.

> method _pre_draw_viewport(render_target: RID) -> bool ; qualifiers=virtual

Called if this is our primary `XRInterfaceExtension` before we start processing a `Viewport` for every active XR `Viewport`, returns `true` if that viewport should be rendered. An XR interface may return `false` if the user has taken off their headset and we can pause rendering.

> method _pre_render() -> void ; qualifiers=virtual

Called if this `XRInterfaceExtension` is active before rendering starts. Most XR interfaces will sync tracking at this point in time.

> method _process() -> void ; qualifiers=virtual

Called if this `XRInterfaceExtension` is active before our physics and game process is called. Most XR interfaces will update its `XRPositionalTracker`s at this point in time.

> method _set_anchor_detection_is_enabled(enabled: bool) -> void ; qualifiers=virtual

Enables anchor detection on this interface if supported.

> method _set_play_area_mode(mode: XRInterface.PlayAreaMode) -> bool ; qualifiers=virtual const

Set the play area mode for this interface.

> method _supports_play_area_mode(mode: XRInterface.PlayAreaMode) -> bool ; qualifiers=virtual const

Returns `true` if this interface supports this play area mode.

> method _trigger_haptic_pulse(action_name: String, tracker_name: StringName, frequency: float, amplitude: float, duration_sec: float, delay_sec: float) -> void ; qualifiers=virtual

Triggers a haptic pulse to be emitted on the specified tracker.

> method _uninitialize() -> void ; qualifiers=virtual

Uninitialize the interface.

> method add_blit(render_target: RID, src_rect: Rect2, dst_rect: Rect2i, use_layer: bool, layer: int, apply_lens_distortion: bool, eye_center: Vector2, k1: float, k2: float, upscale: float, aspect_ratio: float) -> void

Blits our render results to screen optionally applying lens distortion. This can only be called while processing `_commit_views`.

> method get_color_texture() -> RID

> method get_depth_texture() -> RID

> method get_render_target_texture(render_target: RID) -> RID

Returns a valid `RID` for a texture to which we should render the current frame if supported by the interface.

> method get_velocity_texture() -> RID

## Tutorials
- [XR documentation index]($DOCS_URL/tutorials/xr/index.html)
