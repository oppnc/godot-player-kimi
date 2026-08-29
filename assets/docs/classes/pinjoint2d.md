# PinJoint2D

> class PinJoint2D
> inherits PinJoint2D Joint2D

## Brief

A physics joint that attaches two 2D physics bodies at a single point, allowing them to freely rotate.

## Description

A physics joint that attaches two 2D physics bodies at a single point, allowing them to freely rotate. For example, a `RigidBody2D` can be attached to a `StaticBody2D` to create a pendulum or a seesaw.

## Properties

> property angular_limit_enabled : bool ; default=false ; setter=set_angular_limit_enabled ; getter=is_angular_limit_enabled

If `true`, the pin maximum and minimum rotation, defined by `angular_limit_lower` and `angular_limit_upper` are applied.

> property angular_limit_lower : float ; default=0.0 ; setter=set_angular_limit_lower ; getter=get_angular_limit_lower

The minimum rotation. Only active if `angular_limit_enabled` is `true`.

> property angular_limit_upper : float ; default=0.0 ; setter=set_angular_limit_upper ; getter=get_angular_limit_upper

The maximum rotation. Only active if `angular_limit_enabled` is `true`.

> property motor_enabled : bool ; default=false ; setter=set_motor_enabled ; getter=is_motor_enabled

When activated, a motor turns the pin.

> property motor_target_velocity : float ; default=0.0 ; setter=set_motor_target_velocity ; getter=get_motor_target_velocity

Target speed for the motor. In radians per second.

> property softness : float ; default=0.0 ; setter=set_softness ; getter=get_softness

The higher this value, the more the bond to the pinned partner can flex.
