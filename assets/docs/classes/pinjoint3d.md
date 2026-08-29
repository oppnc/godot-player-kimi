# PinJoint3D

> class PinJoint3D
> inherits PinJoint3D Joint3D

## Brief

A physics joint that attaches two 3D physics bodies at a single point, allowing them to freely rotate.

## Description

A physics joint that attaches two 3D physics bodies at a single point, allowing them to freely rotate. For example, a `RigidBody3D` can be attached to a `StaticBody3D` to create a pendulum or a seesaw.

## Properties

> property params/bias : float ; default=0.3 ; setter=set_param ; getter=get_param

The force with which the pinned objects stay in positional relation to each other. The higher, the stronger.

> property params/damping : float ; default=1.0 ; setter=set_param ; getter=get_param

The force with which the pinned objects stay in velocity relation to each other. The higher, the stronger.

> property params/impulse_clamp : float ; default=0.0 ; setter=set_param ; getter=get_param

If above 0, this value is the maximum value for an impulse that this Joint3D produces.

## Methods

> method get_param(param: Param) -> float ; qualifiers=const

Returns the value of the specified parameter.

> method set_param(param: Param, value: float) -> void

Sets the value of the specified parameter.

## Enumerations

> enum Param

> enum_value Param.PARAM_BIAS = 0

The force with which the pinned objects stay in positional relation to each other. The higher, the stronger.

> enum_value Param.PARAM_DAMPING = 1

The force with which the pinned objects stay in velocity relation to each other. The higher, the stronger.

> enum_value Param.PARAM_IMPULSE_CLAMP = 2

If above 0, this value is the maximum value for an impulse that this Joint3D produces.
