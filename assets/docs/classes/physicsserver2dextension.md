# PhysicsServer2DExtension

> class PhysicsServer2DExtension
> inherits PhysicsServer2DExtension PhysicsServer2D

## Brief

Provides virtual methods that can be overridden to create custom `PhysicsServer2D` implementations.

## Description

This class extends `PhysicsServer2D` by providing additional virtual methods that can be overridden. When these methods are overridden, they will be called instead of the internal methods of the physics server.
Intended for use with GDExtension to create custom implementations of `PhysicsServer2D`.

## Methods

> method _area_add_shape(area: RID, shape: RID, transform: Transform2D, disabled: bool) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_add_shape`.

> method _area_attach_canvas_instance_id(area: RID, id: int) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_attach_canvas_instance_id`.

> method _area_attach_object_instance_id(area: RID, id: int) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_attach_object_instance_id`.

> method _area_clear_shapes(area: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_clear_shapes`.

> method _area_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_create`.

> method _area_get_canvas_instance_id(area: RID) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.area_get_canvas_instance_id`.

> method _area_get_collision_layer(area: RID) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.area_get_collision_layer`.

> method _area_get_collision_mask(area: RID) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.area_get_collision_mask`.

> method _area_get_object_instance_id(area: RID) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.area_get_object_instance_id`.

> method _area_get_param(area: RID, param: PhysicsServer2D.AreaParameter) -> Variant ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.area_get_param`.

> method _area_get_shape(area: RID, shape_idx: int) -> RID ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.area_get_shape`.

> method _area_get_shape_count(area: RID) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.area_get_shape_count`.

> method _area_get_shape_transform(area: RID, shape_idx: int) -> Transform2D ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.area_get_shape_transform`.

> method _area_get_space(area: RID) -> RID ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.area_get_space`.

> method _area_get_transform(area: RID) -> Transform2D ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.area_get_transform`.

> method _area_remove_shape(area: RID, shape_idx: int) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_remove_shape`.

> method _area_set_area_monitor_callback(area: RID, callback: Callable) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_set_area_monitor_callback`.

> method _area_set_collision_layer(area: RID, layer: int) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_set_collision_layer`.

> method _area_set_collision_mask(area: RID, mask: int) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_set_collision_mask`.

> method _area_set_monitor_callback(area: RID, callback: Callable) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_set_monitor_callback`.

> method _area_set_monitorable(area: RID, monitorable: bool) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_set_monitorable`.

> method _area_set_param(area: RID, param: PhysicsServer2D.AreaParameter, value: Variant) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_set_param`.

> method _area_set_pickable(area: RID, pickable: bool) -> void ; qualifiers=virtual required

If set to `true`, allows the area with the given `RID` to detect mouse inputs when the mouse cursor is hovering on it.
Overridable version of `PhysicsServer2D`'s internal `area_set_pickable` method. Corresponds to `CollisionObject2D.input_pickable`.

> method _area_set_shape(area: RID, shape_idx: int, shape: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_set_shape`.

> method _area_set_shape_disabled(area: RID, shape_idx: int, disabled: bool) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_set_shape_disabled`.

> method _area_set_shape_transform(area: RID, shape_idx: int, transform: Transform2D) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_set_shape_transform`.

> method _area_set_space(area: RID, space: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_set_space`.

> method _area_set_transform(area: RID, transform: Transform2D) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.area_set_transform`.

> method _body_add_collision_exception(body: RID, excepted_body: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_add_collision_exception`.

> method _body_add_constant_central_force(body: RID, force: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_add_constant_central_force`.

> method _body_add_constant_force(body: RID, force: Vector2, position: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_add_constant_force`.

> method _body_add_constant_torque(body: RID, torque: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_add_constant_torque`.

> method _body_add_shape(body: RID, shape: RID, transform: Transform2D, disabled: bool) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_add_shape`.

> method _body_apply_central_force(body: RID, force: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_apply_central_force`.

> method _body_apply_central_impulse(body: RID, impulse: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_apply_central_impulse`.

> method _body_apply_force(body: RID, force: Vector2, position: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_apply_force`.

> method _body_apply_impulse(body: RID, impulse: Vector2, position: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_apply_impulse`.

> method _body_apply_torque(body: RID, torque: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_apply_torque`.

> method _body_apply_torque_impulse(body: RID, impulse: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_apply_torque_impulse`.

> method _body_attach_canvas_instance_id(body: RID, id: int) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_attach_canvas_instance_id`.

> method _body_attach_object_instance_id(body: RID, id: int) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_attach_object_instance_id`.

> method _body_clear_shapes(body: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_clear_shapes`.

> method _body_collide_shape(body: RID, body_shape: int, shape: RID, shape_xform: Transform2D, motion: Vector2, r_results: void*, result_max: int, r_result_count: int32_t*) -> bool ; qualifiers=virtual required

Given a `body`, a `shape`, and their respective parameters, this method should return `true` if a collision between the two would occur, with additional details passed in `r_results`.
Overridable version of `PhysicsServer2D`'s internal `shape_collide` method. Corresponds to `PhysicsDirectSpaceState2D.collide_shape`.

> method _body_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_create`.

> method _body_get_canvas_instance_id(body: RID) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_canvas_instance_id`.

> method _body_get_collision_exceptions(body: RID) -> Array[RID] ; qualifiers=virtual required const

Returns the `RID`s of all bodies added as collision exceptions for the given `body`. See also `_body_add_collision_exception` and `_body_remove_collision_exception`.
Overridable version of `PhysicsServer2D`'s internal `body_get_collision_exceptions` method. Corresponds to `PhysicsBody2D.get_collision_exceptions`.

> method _body_get_collision_layer(body: RID) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_collision_layer`.

> method _body_get_collision_mask(body: RID) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_collision_mask`.

> method _body_get_collision_priority(body: RID) -> float ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_collision_priority`.

> method _body_get_constant_force(body: RID) -> Vector2 ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_constant_force`.

> method _body_get_constant_torque(body: RID) -> float ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_constant_torque`.

> method _body_get_contacts_reported_depth_threshold(body: RID) -> float ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D`'s internal `body_get_contacts_reported_depth_threshold` method.
**Note:** This method is currently unused by Godot's default physics implementation.

> method _body_get_continuous_collision_detection_mode(body: RID) -> PhysicsServer2D.CCDMode ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_continuous_collision_detection_mode`.

> method _body_get_direct_state(body: RID) -> PhysicsDirectBodyState2D ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_get_direct_state`.

> method _body_get_max_contacts_reported(body: RID) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_max_contacts_reported`.

> method _body_get_mode(body: RID) -> PhysicsServer2D.BodyMode ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_mode`.

> method _body_get_object_instance_id(body: RID) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_object_instance_id`.

> method _body_get_param(body: RID, param: PhysicsServer2D.BodyParameter) -> Variant ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_param`.

> method _body_get_shape(body: RID, shape_idx: int) -> RID ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_shape`.

> method _body_get_shape_count(body: RID) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_shape_count`.

> method _body_get_shape_transform(body: RID, shape_idx: int) -> Transform2D ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_shape_transform`.

> method _body_get_space(body: RID) -> RID ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_space`.

> method _body_get_state(body: RID, state: PhysicsServer2D.BodyState) -> Variant ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_get_state`.

> method _body_is_omitting_force_integration(body: RID) -> bool ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_is_omitting_force_integration`.

> method _body_remove_collision_exception(body: RID, excepted_body: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_remove_collision_exception`.

> method _body_remove_shape(body: RID, shape_idx: int) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_remove_shape`.

> method _body_reset_mass_properties(body: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_reset_mass_properties`.

> method _body_set_axis_velocity(body: RID, axis_velocity: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_axis_velocity`.

> method _body_set_collision_layer(body: RID, layer: int) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_collision_layer`.

> method _body_set_collision_mask(body: RID, mask: int) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_collision_mask`.

> method _body_set_collision_priority(body: RID, priority: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_collision_priority`.

> method _body_set_constant_force(body: RID, force: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_constant_force`.

> method _body_set_constant_torque(body: RID, torque: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_constant_torque`.

> method _body_set_contacts_reported_depth_threshold(body: RID, threshold: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D`'s internal `body_set_contacts_reported_depth_threshold` method.
**Note:** This method is currently unused by Godot's default physics implementation.

> method _body_set_continuous_collision_detection_mode(body: RID, mode: PhysicsServer2D.CCDMode) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_continuous_collision_detection_mode`.

> method _body_set_force_integration_callback(body: RID, callable: Callable, userdata: Variant) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_force_integration_callback`.

> method _body_set_max_contacts_reported(body: RID, amount: int) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_max_contacts_reported`.

> method _body_set_mode(body: RID, mode: PhysicsServer2D.BodyMode) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_mode`.

> method _body_set_omit_force_integration(body: RID, enable: bool) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_omit_force_integration`.

> method _body_set_param(body: RID, param: PhysicsServer2D.BodyParameter, value: Variant) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_param`.

> method _body_set_pickable(body: RID, pickable: bool) -> void ; qualifiers=virtual required

If set to `true`, allows the body with the given `RID` to detect mouse inputs when the mouse cursor is hovering on it.
Overridable version of `PhysicsServer2D`'s internal `body_set_pickable` method. Corresponds to `CollisionObject2D.input_pickable`.

> method _body_set_shape(body: RID, shape_idx: int, shape: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_shape`.

> method _body_set_shape_as_one_way_collision(body: RID, shape_idx: int, enable: bool, margin: float, direction: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_shape_as_one_way_collision`.

> method _body_set_shape_disabled(body: RID, shape_idx: int, disabled: bool) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_shape_disabled`.

> method _body_set_shape_transform(body: RID, shape_idx: int, transform: Transform2D) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_shape_transform`.

> method _body_set_space(body: RID, space: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_space`.

> method _body_set_state(body: RID, state: PhysicsServer2D.BodyState, value: Variant) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.body_set_state`.

> method _body_set_state_sync_callback(body: RID, callable: Callable) -> void ; qualifiers=virtual required

Assigns the `body` to call the given `callable` during the synchronization phase of the loop, before `_step` is called. See also `_sync`.
Overridable version of `PhysicsServer2D.body_set_state_sync_callback`.

> method _body_test_motion(body: RID, from: Transform2D, motion: Vector2, margin: float, collide_separation_ray: bool, recovery_as_collision: bool, r_result: PhysicsServer2DExtensionMotionResult*) -> bool ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.body_test_motion`. Unlike the exposed implementation, this method does not receive all of the arguments inside a `PhysicsTestMotionParameters2D`.

> method _capsule_shape_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.capsule_shape_create`.

> method _circle_shape_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.circle_shape_create`.

> method _concave_polygon_shape_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.concave_polygon_shape_create`.

> method _convex_polygon_shape_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.convex_polygon_shape_create`.

> method _damped_spring_joint_get_param(joint: RID, param: PhysicsServer2D.DampedSpringParam) -> float ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.damped_spring_joint_get_param`.

> method _damped_spring_joint_set_param(joint: RID, param: PhysicsServer2D.DampedSpringParam, value: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.damped_spring_joint_set_param`.

> method _end_sync() -> void ; qualifiers=virtual required

Called to indicate that the physics server has stopped synchronizing. It is in the loop's iteration/physics phase, and can access physics objects even if running on a separate thread. See also `_sync`.
Overridable version of `PhysicsServer2D`'s internal `end_sync` method.

> method _finish() -> void ; qualifiers=virtual required

Called when the main loop finalizes to shut down the physics server. See also `MainLoop._finalize` and `_init`.
Overridable version of `PhysicsServer2D`'s internal `finish` method.

> method _flush_queries() -> void ; qualifiers=virtual required

Called every physics step before `_step` to process all remaining queries.
Overridable version of `PhysicsServer2D`'s internal `flush_queries` method.

> method _free_rid(rid: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.free_rid`.

> method _get_process_info(process_info: PhysicsServer2D.ProcessInfo) -> int ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.get_process_info`.

> method _init() -> void ; qualifiers=virtual required

Called when the main loop is initialized and creates a new instance of this physics server. See also `MainLoop._initialize` and `_finish`.
Overridable version of `PhysicsServer2D`'s internal `init` method.

> method _is_flushing_queries() -> bool ; qualifiers=virtual required const

Overridable method that should return `true` when the physics server is processing queries. See also `_flush_queries`.
Overridable version of `PhysicsServer2D`'s internal `is_flushing_queries` method.

> method _joint_clear(joint: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.joint_clear`.

> method _joint_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.joint_create`.

> method _joint_disable_collisions_between_bodies(joint: RID, disable: bool) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.joint_disable_collisions_between_bodies`.

> method _joint_get_param(joint: RID, param: PhysicsServer2D.JointParam) -> float ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.joint_get_param`.

> method _joint_get_type(joint: RID) -> PhysicsServer2D.JointType ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.joint_get_type`.

> method _joint_is_disabled_collisions_between_bodies(joint: RID) -> bool ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.joint_is_disabled_collisions_between_bodies`.

> method _joint_make_damped_spring(joint: RID, anchor_a: Vector2, anchor_b: Vector2, body_a: RID, body_b: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.joint_make_damped_spring`.

> method _joint_make_groove(joint: RID, a_groove1: Vector2, a_groove2: Vector2, b_anchor: Vector2, body_a: RID, body_b: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.joint_make_groove`.

> method _joint_make_pin(joint: RID, anchor: Vector2, body_a: RID, body_b: RID) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.joint_make_pin`.

> method _joint_set_param(joint: RID, param: PhysicsServer2D.JointParam, value: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.joint_set_param`.

> method _pin_joint_get_flag(joint: RID, flag: PhysicsServer2D.PinJointFlag) -> bool ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.pin_joint_get_flag`.

> method _pin_joint_get_param(joint: RID, param: PhysicsServer2D.PinJointParam) -> float ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.pin_joint_get_param`.

> method _pin_joint_set_flag(joint: RID, flag: PhysicsServer2D.PinJointFlag, enabled: bool) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.pin_joint_set_flag`.

> method _pin_joint_set_param(joint: RID, param: PhysicsServer2D.PinJointParam, value: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.pin_joint_set_param`.

> method _rectangle_shape_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.rectangle_shape_create`.

> method _segment_shape_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.segment_shape_create`.

> method _separation_ray_shape_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.separation_ray_shape_create`.

> method _set_active(active: bool) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.set_active`.

> method _shape_collide(shape_A: RID, xform_A: Transform2D, motion_A: Vector2, shape_B: RID, xform_B: Transform2D, motion_B: Vector2, r_results: void*, result_max: int, r_result_count: int32_t*) -> bool ; qualifiers=virtual required

Given two shapes and their parameters, should return `true` if a collision between the two would occur, with additional details passed in `r_results`.
Overridable version of `PhysicsServer2D`'s internal `shape_collide` method. Corresponds to `PhysicsDirectSpaceState2D.collide_shape`.

> method _shape_get_custom_solver_bias(shape: RID) -> float ; qualifiers=virtual required const

Should return the custom solver bias of the given `shape`, which defines how much bodies are forced to separate on contact when this shape is involved.
Overridable version of `PhysicsServer2D`'s internal `shape_get_custom_solver_bias` method. Corresponds to `Shape2D.custom_solver_bias`.

> method _shape_get_data(shape: RID) -> Variant ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.shape_get_data`.

> method _shape_get_type(shape: RID) -> PhysicsServer2D.ShapeType ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.shape_get_type`.

> method _shape_set_custom_solver_bias(shape: RID, bias: float) -> void ; qualifiers=virtual required

Should set the custom solver bias for the given `shape`. It defines how much bodies are forced to separate on contact.
Overridable version of `PhysicsServer2D`'s internal `shape_get_custom_solver_bias` method. Corresponds to `Shape2D.custom_solver_bias`.

> method _shape_set_data(shape: RID, data: Variant) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.shape_set_data`.

> method _space_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.space_create`.

> method _space_get_contact_count(space: RID) -> int ; qualifiers=virtual required const

Should return how many contacts have occurred during the last physics step in the given `space`. See also `_space_get_contacts` and `_space_set_debug_contacts`.
Overridable version of `PhysicsServer2D`'s internal `space_get_contact_count` method.

> method _space_get_contacts(space: RID) -> PackedVector2Array ; qualifiers=virtual required const

Should return the positions of all contacts that have occurred during the last physics step in the given `space`. See also `_space_get_contact_count` and `_space_set_debug_contacts`.
Overridable version of `PhysicsServer2D`'s internal `space_get_contacts` method.

> method _space_get_direct_state(space: RID) -> PhysicsDirectSpaceState2D ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.space_get_direct_state`.

> method _space_get_param(space: RID, param: PhysicsServer2D.SpaceParameter) -> float ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.space_get_param`.

> method _space_is_active(space: RID) -> bool ; qualifiers=virtual required const

Overridable version of `PhysicsServer2D.space_is_active`.

> method _space_set_active(space: RID, active: bool) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.space_set_active`.

> method _space_set_debug_contacts(space: RID, max_contacts: int) -> void ; qualifiers=virtual required

Used internally to allow the given `space` to store contact points, up to `max_contacts`. This is automatically set for the main `World2D`'s space when `SceneTree.debug_collisions_hint` is `true`, or by checking "Visible Collision Shapes" in the editor. Only works in debug builds.
Overridable version of `PhysicsServer2D`'s internal `space_set_debug_contacts` method.

> method _space_set_param(space: RID, param: PhysicsServer2D.SpaceParameter, value: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.space_set_param`.

> method _step(step: float) -> void ; qualifiers=virtual required

Called every physics step to process the physics simulation. `step` is the time elapsed since the last physics step, in seconds. It is usually the same as the value returned by `Node.get_physics_process_delta_time`.
Overridable version of `PhysicsServer2D`'s internal `step` method.

> method _sync() -> void ; qualifiers=virtual required

Called to indicate that the physics server is synchronizing and cannot access physics states if running on a separate thread. See also `_end_sync`.
Overridable version of `PhysicsServer2D`'s internal `sync` method.

> method _world_boundary_shape_create() -> RID ; qualifiers=virtual required

Overridable version of `PhysicsServer2D.world_boundary_shape_create`.

> method body_test_motion_is_excluding_body(body: RID) -> bool ; qualifiers=const

Returns `true` if the body with the given `RID` is being excluded from `_body_test_motion`. See also `Object.get_instance_id`.

> method body_test_motion_is_excluding_object(object: int) -> bool ; qualifiers=const

Returns `true` if the object with the given instance ID is being excluded from `_body_test_motion`. See also `Object.get_instance_id`.
