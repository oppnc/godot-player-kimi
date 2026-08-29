# PhysicsDirectBodyState2D

> class PhysicsDirectBodyState2D
> inherits PhysicsDirectBodyState2D Object

## Brief

Provides direct access to a physics body in the `PhysicsServer2D`.

## Description

Provides direct access to a physics body in the `PhysicsServer2D`, allowing safe changes to physics properties. This object is passed via the direct state callback of `RigidBody2D`, and is intended for changing the direct state of that body. See `RigidBody2D._integrate_forces`.

## Properties

> property angular_velocity : float ; setter=set_angular_velocity ; getter=get_angular_velocity

The body's rotational velocity in *radians* per second.

> property center_of_mass : Vector2 ; getter=get_center_of_mass

The body's center of mass position relative to the body's center in the global coordinate system.

> property center_of_mass_local : Vector2 ; getter=get_center_of_mass_local

The body's center of mass position in the body's local coordinate system.

> property collision_layer : int ; setter=set_collision_layer ; getter=get_collision_layer

The body's collision layer.

> property collision_mask : int ; setter=set_collision_mask ; getter=get_collision_mask

The body's collision mask.

> property inverse_inertia : float ; getter=get_inverse_inertia

The inverse of the inertia of the body.

> property inverse_mass : float ; getter=get_inverse_mass

The inverse of the mass of the body.

> property linear_velocity : Vector2 ; setter=set_linear_velocity ; getter=get_linear_velocity

The body's linear velocity in pixels per second.

> property sleeping : bool ; setter=set_sleep_state ; getter=is_sleeping

If `true`, this body is currently sleeping (not active).

> property step : float ; getter=get_step

The timestep (delta) used for the simulation.

> property total_angular_damp : float ; getter=get_total_angular_damp

The rate at which the body stops rotating, if there are not any other forces moving it.

> property total_gravity : Vector2 ; getter=get_total_gravity

The total gravity vector being currently applied to this body.

> property total_linear_damp : float ; getter=get_total_linear_damp

The rate at which the body stops moving, if there are not any other forces moving it.

> property transform : Transform2D ; setter=set_transform ; getter=get_transform

The body's transformation matrix.

## Methods

> method add_constant_central_force(force: Vector2 = Vector2(0, 0)) -> void

Adds a constant directional force without affecting rotation that keeps being applied over time until cleared with `constant_force = Vector2(0, 0)`.
This is equivalent to using `add_constant_force` at the body's center of mass.

> method add_constant_force(force: Vector2, position: Vector2 = Vector2(0, 0)) -> void

Adds a constant positioned force to the body that keeps being applied over time until cleared with `constant_force = Vector2(0, 0)`.
`position` is the offset from the body origin in global coordinates.

> method add_constant_torque(torque: float) -> void

Adds a constant rotational force without affecting position that keeps being applied over time until cleared with `constant_torque = 0`.

> method apply_central_force(force: Vector2 = Vector2(0, 0)) -> void

Applies a directional force without affecting rotation. A force is time dependent and meant to be applied every physics update.
This is equivalent to using `apply_force` at the body's center of mass.

> method apply_central_impulse(impulse: Vector2) -> void

Applies a directional impulse without affecting rotation.
An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason, it should only be used when simulating one-time impacts (use the "_force" functions otherwise).
This is equivalent to using `apply_impulse` at the body's center of mass.

> method apply_force(force: Vector2, position: Vector2 = Vector2(0, 0)) -> void

Applies a positioned force to the body. A force is time dependent and meant to be applied every physics update.
`position` is the offset from the body origin in global coordinates.

> method apply_impulse(impulse: Vector2, position: Vector2 = Vector2(0, 0)) -> void

Applies a positioned impulse to the body.
An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason, it should only be used when simulating one-time impacts (use the "_force" functions otherwise).
`position` is the offset from the body origin in global coordinates.

> method apply_torque(torque: float) -> void

Applies a rotational force without affecting position. A force is time dependent and meant to be applied every physics update.
**Note:** `inverse_inertia` is required for this to work. To have `inverse_inertia`, an active `CollisionShape2D` must be a child of the node, or you can manually set `inverse_inertia`.

> method apply_torque_impulse(impulse: float) -> void

Applies a rotational impulse to the body without affecting the position.
An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason, it should only be used when simulating one-time impacts (use the "_force" functions otherwise).
**Note:** `inverse_inertia` is required for this to work. To have `inverse_inertia`, an active `CollisionShape2D` must be a child of the node, or you can manually set `inverse_inertia`.

> method get_constant_force() -> Vector2 ; qualifiers=const

Returns the body's total constant positional forces applied during each physics update.
See `add_constant_force` and `add_constant_central_force`.

> method get_constant_torque() -> float ; qualifiers=const

Returns the body's total constant rotational forces applied during each physics update.
See `add_constant_torque`.

> method get_contact_collider(contact_idx: int) -> RID ; qualifiers=const

Returns the collider's `RID`.

> method get_contact_collider_id(contact_idx: int) -> int ; qualifiers=const

Returns the collider's object id.

> method get_contact_collider_object(contact_idx: int) -> Object ; qualifiers=const

Returns the collider object. This depends on how it was created (will return a scene node if such was used to create it).

> method get_contact_collider_position(contact_idx: int) -> Vector2 ; qualifiers=const

Returns the position of the contact point on the collider in the global coordinate system.

> method get_contact_collider_shape(contact_idx: int) -> int ; qualifiers=const

Returns the collider's shape index.

> method get_contact_collider_velocity_at_position(contact_idx: int) -> Vector2 ; qualifiers=const

Returns the velocity vector at the collider's contact point.

> method get_contact_count() -> int ; qualifiers=const

Returns the number of contacts this body has with other bodies.
**Note:** By default, this returns 0 unless bodies are configured to monitor contacts. See `RigidBody2D.contact_monitor`.

> method get_contact_impulse(contact_idx: int) -> Vector2 ; qualifiers=const

Returns the impulse created by the contact.

> method get_contact_local_normal(contact_idx: int) -> Vector2 ; qualifiers=const

Returns the local normal at the contact point.

> method get_contact_local_position(contact_idx: int) -> Vector2 ; qualifiers=const

Returns the position of the contact point on the body in the global coordinate system.

> method get_contact_local_shape(contact_idx: int) -> int ; qualifiers=const

Returns the local shape index of the collision.

> method get_contact_local_velocity_at_position(contact_idx: int) -> Vector2 ; qualifiers=const

Returns the velocity vector at the body's contact point.

> method get_space_state() -> PhysicsDirectSpaceState2D

Returns the current state of the space, useful for queries.

> method get_velocity_at_local_position(local_position: Vector2) -> Vector2 ; qualifiers=const

Returns the body's velocity at the given relative position.
`local_position` is the offset from the body origin in global coordinates.

> method integrate_forces() -> void

Updates the body's linear and angular velocity by applying gravity and damping for the equivalent of one physics tick.

> method set_constant_force(force: Vector2) -> void

Sets the body's total constant positional forces applied during each physics update.
See `add_constant_force` and `add_constant_central_force`.

> method set_constant_torque(torque: float) -> void

Sets the body's total constant rotational forces applied during each physics update.
See `add_constant_torque`.

## Tutorials
- [Physics introduction]($DOCS_URL/tutorials/physics/physics_introduction.html)
- [Ray-casting]($DOCS_URL/tutorials/physics/ray-casting.html)
