# PhysicsDirectBodyState2DExtension

> class PhysicsDirectBodyState2DExtension
> inherits PhysicsDirectBodyState2DExtension PhysicsDirectBodyState2D

## Brief

Provides virtual methods that can be overridden to create custom `PhysicsDirectBodyState2D` implementations.

## Description

This class extends `PhysicsDirectBodyState2D` by providing additional virtual methods that can be overridden. When these methods are overridden, they will be called instead of the internal methods of the physics server.
Intended for use with GDExtension to create custom implementations of `PhysicsDirectBodyState2D`.

## Methods

> method _add_constant_central_force(force: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.add_constant_central_force`.

> method _add_constant_force(force: Vector2, position: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.add_constant_force`.

> method _add_constant_torque(torque: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.add_constant_torque`.

> method _apply_central_force(force: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.apply_central_force`.

> method _apply_central_impulse(impulse: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.apply_central_impulse`.

> method _apply_force(force: Vector2, position: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.apply_force`.

> method _apply_impulse(impulse: Vector2, position: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.apply_impulse`.

> method _apply_torque(torque: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.apply_torque`.

> method _apply_torque_impulse(impulse: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.apply_torque_impulse`.

> method _get_angular_velocity() -> float ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.angular_velocity` and its respective getter.

> method _get_center_of_mass() -> Vector2 ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.center_of_mass` and its respective getter.

> method _get_center_of_mass_local() -> Vector2 ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.center_of_mass_local` and its respective getter.

> method _get_collision_layer() -> int ; qualifiers=virtual required const

> method _get_collision_mask() -> int ; qualifiers=virtual required const

> method _get_constant_force() -> Vector2 ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_constant_force`.

> method _get_constant_torque() -> float ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_constant_torque`.

> method _get_contact_collider(contact_idx: int) -> RID ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_collider`.

> method _get_contact_collider_id(contact_idx: int) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_collider_id`.

> method _get_contact_collider_object(contact_idx: int) -> Object ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_collider_object`.

> method _get_contact_collider_position(contact_idx: int) -> Vector2 ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_collider_position`.

> method _get_contact_collider_shape(contact_idx: int) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_collider_shape`.

> method _get_contact_collider_velocity_at_position(contact_idx: int) -> Vector2 ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_collider_velocity_at_position`.

> method _get_contact_count() -> int ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_count`.

> method _get_contact_impulse(contact_idx: int) -> Vector2 ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_impulse`.

> method _get_contact_local_normal(contact_idx: int) -> Vector2 ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_local_normal`.

> method _get_contact_local_position(contact_idx: int) -> Vector2 ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_local_position`.

> method _get_contact_local_shape(contact_idx: int) -> int ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_local_shape`.

> method _get_contact_local_velocity_at_position(contact_idx: int) -> Vector2 ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_contact_local_velocity_at_position`.

> method _get_inverse_inertia() -> float ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.inverse_inertia` and its respective getter.

> method _get_inverse_mass() -> float ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.inverse_mass` and its respective getter.

> method _get_linear_velocity() -> Vector2 ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.linear_velocity` and its respective getter.

> method _get_space_state() -> PhysicsDirectSpaceState2D ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.get_space_state`.

> method _get_step() -> float ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.step` and its respective getter.

> method _get_total_angular_damp() -> float ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.total_angular_damp` and its respective getter.

> method _get_total_gravity() -> Vector2 ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.total_gravity` and its respective getter.

> method _get_total_linear_damp() -> float ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.total_linear_damp` and its respective getter.

> method _get_transform() -> Transform2D ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.transform` and its respective getter.

> method _get_velocity_at_local_position(local_position: Vector2) -> Vector2 ; qualifiers=virtual required const

Overridable version of `PhysicsDirectBodyState2D.get_velocity_at_local_position`.

> method _integrate_forces() -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.integrate_forces`.

> method _is_sleeping() -> bool ; qualifiers=virtual required const

Implement to override the behavior of `PhysicsDirectBodyState2D.sleeping` and its respective getter.

> method _set_angular_velocity(velocity: float) -> void ; qualifiers=virtual required

Implement to override the behavior of `PhysicsDirectBodyState2D.angular_velocity` and its respective setter.

> method _set_collision_layer(layer: int) -> void ; qualifiers=virtual required

> method _set_collision_mask(mask: int) -> void ; qualifiers=virtual required

> method _set_constant_force(force: Vector2) -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.set_constant_force`.

> method _set_constant_torque(torque: float) -> void ; qualifiers=virtual required

Overridable version of `PhysicsDirectBodyState2D.set_constant_torque`.

> method _set_linear_velocity(velocity: Vector2) -> void ; qualifiers=virtual required

Implement to override the behavior of `PhysicsDirectBodyState2D.linear_velocity` and its respective setter.

> method _set_sleep_state(enabled: bool) -> void ; qualifiers=virtual required

Implement to override the behavior of `PhysicsDirectBodyState2D.sleeping` and its respective setter.

> method _set_transform(transform: Transform2D) -> void ; qualifiers=virtual required

Implement to override the behavior of `PhysicsDirectBodyState2D.transform` and its respective setter.
