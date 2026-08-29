# ConeTwistJoint3D

> class ConeTwistJoint3D
> inherits ConeTwistJoint3D Joint3D

## Brief

A physics joint that connects two 3D physics bodies in a way that simulates a ball-and-socket joint.

## Description

A physics joint that connects two 3D physics bodies in a way that simulates a ball-and-socket joint. The twist axis is initiated as the X axis of the `ConeTwistJoint3D`. Once the physics bodies swing, the twist axis is calculated as the middle of the X axes of the joint in the local space of the two physics bodies. Useful for limbs like shoulders and hips, lamps hanging off a ceiling, etc.

## Properties

> property bias : float ; default=0.3 ; setter=set_param ; getter=get_param

The speed with which the swing or twist will take place.
The higher, the faster.

> property relaxation : float ; default=1.0 ; setter=set_param ; getter=get_param

Defines, how fast the swing- and twist-speed-difference on both sides gets synced.

> property softness : float ; default=0.8 ; setter=set_param ; getter=get_param

The ease with which the joint starts to twist. If it's too low, it takes more force to start twisting the joint.

> property swing_span : float ; default=0.7853982 ; setter=set_param ; getter=get_param

Swing is rotation from side to side, around the axis perpendicular to the twist axis.
The swing span defines, how much rotation will not get corrected along the swing axis.
Could be defined as looseness in the `ConeTwistJoint3D`.
If below 0.05, this behavior is locked.

> property twist_span : float ; default=3.1415927 ; setter=set_param ; getter=get_param

Twist is the rotation around the twist axis, this value defined how far the joint can twist.
Twist is locked if below 0.05.

## Methods

> method get_param(param: Param) -> float ; qualifiers=const

Returns the value of the specified parameter.

> method set_param(param: Param, value: float) -> void

Sets the value of the specified parameter.

## Enumerations

> enum Param

> enum_value Param.PARAM_SWING_SPAN = 0

Swing is rotation from side to side, around the axis perpendicular to the twist axis.
The swing span defines, how much rotation will not get corrected along the swing axis.
Could be defined as looseness in the `ConeTwistJoint3D`.
If below 0.05, this behavior is locked.

> enum_value Param.PARAM_TWIST_SPAN = 1

Twist is the rotation around the twist axis, this value defined how far the joint can twist.
Twist is locked if below 0.05.

> enum_value Param.PARAM_BIAS = 2

The speed with which the swing or twist will take place.
The higher, the faster.

> enum_value Param.PARAM_SOFTNESS = 3

The ease with which the joint starts to twist. If it's too low, it takes more force to start twisting the joint.

> enum_value Param.PARAM_RELAXATION = 4

Defines, how fast the swing- and twist-speed-difference on both sides gets synced.

> enum_value Param.PARAM_MAX = 5

Represents the size of the `Param` enum.
