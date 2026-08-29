# PhysicsDirectBodyState3DExtension

> class PhysicsDirectBodyState3DExtension
> inherits PhysicsDirectBodyState3DExtension PhysicsDirectBodyState3D

## Brief

Provides virtual methods that can be overridden to create custom `PhysicsDirectBodyState3D` implementations.

## Description

This class extends `PhysicsDirectBodyState3D` by providing additional virtual methods that can be overridden. When these methods are overridden, they will be called instead of the internal methods of the physics server.
Intended for use with GDExtension to create custom implementations of `PhysicsDirectBodyState3D`.

## Methods

> method _add_constant_central_force(force: Vector3) -> void ; qualifiers=virtual required

> method _add_constant_force(force: Vector3, position: Vector3) -> void ; qualifiers=virtual required

> method _add_constant_torque(torque: Vector3) -> void ; qualifiers=virtual required

> method _apply_central_force(force: Vector3) -> void ; qualifiers=virtual required

> method _apply_central_impulse(impulse: Vector3) -> void ; qualifiers=virtual required

> method _apply_force(force: Vector3, position: Vector3) -> void ; qualifiers=virtual required

> method _apply_impulse(impulse: Vector3, position: Vector3) -> void ; qualifiers=virtual required

> method _apply_torque(torque: Vector3) -> void ; qualifiers=virtual required

> method _apply_torque_impulse(impulse: Vector3) -> void ; qualifiers=virtual required

> method _get_angular_velocity() -> Vector3 ; qualifiers=virtual required const

> method _get_center_of_mass() -> Vector3 ; qualifiers=virtual required const

> method _get_center_of_mass_local() -> Vector3 ; qualifiers=virtual required const

> method _get_collision_layer() -> int ; qualifiers=virtual required const

> method _get_collision_mask() -> int ; qualifiers=virtual required const

> method _get_constant_force() -> Vector3 ; qualifiers=virtual required const

> method _get_constant_torque() -> Vector3 ; qualifiers=virtual required const

> method _get_contact_collider(contact_idx: int) -> RID ; qualifiers=virtual required const

> method _get_contact_collider_id(contact_idx: int) -> int ; qualifiers=virtual required const

> method _get_contact_collider_object(contact_idx: int) -> Object ; qualifiers=virtual required const

> method _get_contact_collider_position(contact_idx: int) -> Vector3 ; qualifiers=virtual required const

> method _get_contact_collider_shape(contact_idx: int) -> int ; qualifiers=virtual required const

> method _get_contact_collider_velocity_at_position(contact_idx: int) -> Vector3 ; qualifiers=virtual required const

> method _get_contact_count() -> int ; qualifiers=virtual required const

> method _get_contact_impulse(contact_idx: int) -> Vector3 ; qualifiers=virtual required const

> method _get_contact_local_normal(contact_idx: int) -> Vector3 ; qualifiers=virtual required const

> method _get_contact_local_position(contact_idx: int) -> Vector3 ; qualifiers=virtual required const

> method _get_contact_local_shape(contact_idx: int) -> int ; qualifiers=virtual required const

> method _get_contact_local_velocity_at_position(contact_idx: int) -> Vector3 ; qualifiers=virtual required const

> method _get_inverse_inertia() -> Vector3 ; qualifiers=virtual required const

> method _get_inverse_inertia_tensor() -> Basis ; qualifiers=virtual required const

> method _get_inverse_mass() -> float ; qualifiers=virtual required const

> method _get_linear_velocity() -> Vector3 ; qualifiers=virtual required const

> method _get_principal_inertia_axes() -> Basis ; qualifiers=virtual required const

> method _get_space_state() -> PhysicsDirectSpaceState3D ; qualifiers=virtual required

> method _get_step() -> float ; qualifiers=virtual required const

> method _get_total_angular_damp() -> float ; qualifiers=virtual required const

> method _get_total_gravity() -> Vector3 ; qualifiers=virtual required const

> method _get_total_linear_damp() -> float ; qualifiers=virtual required const

> method _get_transform() -> Transform3D ; qualifiers=virtual required const

> method _get_velocity_at_local_position(local_position: Vector3) -> Vector3 ; qualifiers=virtual required const

> method _integrate_forces() -> void ; qualifiers=virtual required

> method _is_sleeping() -> bool ; qualifiers=virtual required const

> method _set_angular_velocity(velocity: Vector3) -> void ; qualifiers=virtual required

> method _set_collision_layer(layer: int) -> void ; qualifiers=virtual required

> method _set_collision_mask(mask: int) -> void ; qualifiers=virtual required

> method _set_constant_force(force: Vector3) -> void ; qualifiers=virtual required

> method _set_constant_torque(torque: Vector3) -> void ; qualifiers=virtual required

> method _set_linear_velocity(velocity: Vector3) -> void ; qualifiers=virtual required

> method _set_sleep_state(enabled: bool) -> void ; qualifiers=virtual required

> method _set_transform(transform: Transform3D) -> void ; qualifiers=virtual required
