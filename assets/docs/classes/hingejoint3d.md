# HingeJoint3D

> class HingeJoint3D
> inherits HingeJoint3D Joint3D

## Brief

A physics joint that restricts the rotation of a 3D physics body around an axis relative to another physics body.

## Description

A physics joint that restricts the rotation of a 3D physics body around an axis relative to another physics body. For example, Body A can be a `StaticBody3D` representing a door hinge that a `RigidBody3D` rotates around.

## Properties

> property angular_limit/bias : float ; default=0.3 ; setter=set_param ; getter=get_param

The speed with which the rotation across the axis perpendicular to the hinge gets corrected.

> property angular_limit/enable : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, the hinges maximum and minimum rotation, defined by `angular_limit/lower` and `angular_limit/upper` has effects.

> property angular_limit/lower : float ; default=-1.5707964 ; setter=set_param ; getter=get_param

The minimum rotation. Only active if `angular_limit/enable` is `true`.

> property angular_limit/relaxation : float ; default=1.0 ; setter=set_param ; getter=get_param

The lower this value, the more the rotation gets slowed down.

> property angular_limit/softness : float ; default=0.9 ; setter=set_param ; getter=get_param ; deprecated=This property is never set by the engine and is kept for compatibility purposes.

> property angular_limit/upper : float ; default=1.5707964 ; setter=set_param ; getter=get_param

The maximum rotation. Only active if `angular_limit/enable` is `true`.

> property motor/enable : bool ; default=false ; setter=set_flag ; getter=get_flag

When activated, a motor turns the hinge.

> property motor/max_impulse : float ; default=1.0 ; setter=set_param ; getter=get_param

Maximum acceleration for the motor.

> property motor/target_velocity : float ; default=1.0 ; setter=set_param ; getter=get_param

Target speed for the motor.

> property params/bias : float ; default=0.3 ; setter=set_param ; getter=get_param

The speed with which the two bodies get pulled together when they move in different directions.

## Methods

> method get_flag(flag: Flag) -> bool ; qualifiers=const

Returns the value of the specified flag.

> method get_param(param: Param) -> float ; qualifiers=const

Returns the value of the specified parameter.

> method set_flag(flag: Flag, enabled: bool) -> void

If `true`, enables the specified flag.

> method set_param(param: Param, value: float) -> void

Sets the value of the specified parameter.

## Enumerations

> enum Flag

> enum_value Flag.FLAG_USE_LIMIT = 0

If `true`, the hinges maximum and minimum rotation, defined by `angular_limit/lower` and `angular_limit/upper` has effects.

> enum_value Flag.FLAG_ENABLE_MOTOR = 1

When activated, a motor turns the hinge.

> enum_value Flag.FLAG_MAX = 2

Represents the size of the `Flag` enum.

> enum Param

> enum_value Param.PARAM_BIAS = 0

The speed with which the two bodies get pulled together when they move in different directions.

> enum_value Param.PARAM_LIMIT_UPPER = 1

The maximum rotation. Only active if `angular_limit/enable` is `true`.

> enum_value Param.PARAM_LIMIT_LOWER = 2

The minimum rotation. Only active if `angular_limit/enable` is `true`.

> enum_value Param.PARAM_LIMIT_BIAS = 3

The speed with which the rotation across the axis perpendicular to the hinge gets corrected.

> enum_value Param.PARAM_LIMIT_SOFTNESS = 4 ; deprecated=This property is never used by the engine and is kept for compatibility purpose.

> enum_value Param.PARAM_LIMIT_RELAXATION = 5

The lower this value, the more the rotation gets slowed down.

> enum_value Param.PARAM_MOTOR_TARGET_VELOCITY = 6

Target speed for the motor.

> enum_value Param.PARAM_MOTOR_MAX_IMPULSE = 7

Maximum acceleration for the motor.

> enum_value Param.PARAM_MAX = 8

Represents the size of the `Param` enum.
