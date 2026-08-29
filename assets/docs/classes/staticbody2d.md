# StaticBody2D

> class StaticBody2D
> inherits StaticBody2D PhysicsBody2D

## Brief

A 2D physics body that can't be moved by external forces. When moved manually, it doesn't affect other bodies in its path.

## Description

A static 2D physics body. It can't be moved by external forces or contacts, but can be moved manually by other means such as code, `AnimationMixer`s (with `AnimationMixer.callback_mode_process` set to `AnimationMixer.ANIMATION_CALLBACK_MODE_PROCESS_PHYSICS`), and `RemoteTransform2D`.
When `StaticBody2D` is moved, it is teleported to its new position without affecting other physics bodies in its path. If this is not desired, use `AnimatableBody2D` instead.
`StaticBody2D` is useful for completely static objects like floors and walls, as well as moving surfaces like conveyor belts and circular revolving platforms (by using `constant_linear_velocity` and `constant_angular_velocity`).

## Properties

> property constant_angular_velocity : float ; default=0.0 ; setter=set_constant_angular_velocity ; getter=get_constant_angular_velocity

The body's constant angular velocity. This does not rotate the body, but affects touching bodies, as if it were rotating.

> property constant_linear_velocity : Vector2 ; default=Vector2(0, 0) ; setter=set_constant_linear_velocity ; getter=get_constant_linear_velocity

The body's constant linear velocity. This does not move the body, but affects touching bodies, as if it were moving.

> property physics_material_override : PhysicsMaterial ; setter=set_physics_material_override ; getter=get_physics_material_override

The physics material override for the body.
If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.

## Tutorials
- [Physics introduction]($DOCS_URL/tutorials/physics/physics_introduction.html)
- [Troubleshooting physics issues]($DOCS_URL/tutorials/physics/troubleshooting_physics_issues.html)
