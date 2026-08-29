# SliderJoint3D

> class SliderJoint3D
> inherits SliderJoint3D Joint3D

## Brief

A physics joint that restricts the movement of a 3D physics body along an axis relative to another physics body.

## Description

A physics joint that restricts the movement of a 3D physics body along an axis relative to another physics body. For example, Body A could be a `StaticBody3D` representing a piston base, while Body B could be a `RigidBody3D` representing the piston head, moving up and down.

## Properties

> property angular_limit/damping : float ; default=0.0 ; setter=set_param ; getter=get_param

The amount of damping of the rotation when the limit is surpassed.
A lower damping value allows a rotation initiated by body A to travel to body B slower.

> property angular_limit/lower_angle : float ; default=0.0 ; setter=set_param ; getter=get_param

The lower limit of rotation in the slider.

> property angular_limit/restitution : float ; default=0.7 ; setter=set_param ; getter=get_param

The amount of restitution of the rotation when the limit is surpassed.
Does not affect damping.

> property angular_limit/softness : float ; default=1.0 ; setter=set_param ; getter=get_param

A factor applied to the all rotation once the limit is surpassed.
Makes all rotation slower when between 0 and 1.

> property angular_limit/upper_angle : float ; default=0.0 ; setter=set_param ; getter=get_param

The upper limit of rotation in the slider.

> property angular_motion/damping : float ; default=1.0 ; setter=set_param ; getter=get_param

The amount of damping of the rotation in the limits.

> property angular_motion/restitution : float ; default=0.7 ; setter=set_param ; getter=get_param

The amount of restitution of the rotation in the limits.

> property angular_motion/softness : float ; default=1.0 ; setter=set_param ; getter=get_param

A factor applied to the all rotation in the limits.

> property angular_ortho/damping : float ; default=1.0 ; setter=set_param ; getter=get_param

The amount of damping of the rotation across axes orthogonal to the slider.

> property angular_ortho/restitution : float ; default=0.7 ; setter=set_param ; getter=get_param

The amount of restitution of the rotation across axes orthogonal to the slider.

> property angular_ortho/softness : float ; default=1.0 ; setter=set_param ; getter=get_param

A factor applied to the all rotation across axes orthogonal to the slider.

> property linear_limit/damping : float ; default=1.0 ; setter=set_param ; getter=get_param

The amount of damping that happens once the limit defined by `linear_limit/lower_distance` and `linear_limit/upper_distance` is surpassed.

> property linear_limit/lower_distance : float ; default=-1.0 ; setter=set_param ; getter=get_param

The minimum difference between the pivot points on their X axis before damping happens.

> property linear_limit/restitution : float ; default=0.7 ; setter=set_param ; getter=get_param

The amount of restitution once the limits are surpassed. The lower, the more velocity-energy gets lost.

> property linear_limit/softness : float ; default=1.0 ; setter=set_param ; getter=get_param

A factor applied to the movement across the slider axis once the limits get surpassed. The lower, the slower the movement.

> property linear_limit/upper_distance : float ; default=1.0 ; setter=set_param ; getter=get_param

The maximum difference between the pivot points on their X axis before damping happens.

> property linear_motion/damping : float ; default=0.0 ; setter=set_param ; getter=get_param

The amount of damping inside the slider limits.

> property linear_motion/restitution : float ; default=0.7 ; setter=set_param ; getter=get_param

The amount of restitution inside the slider limits.

> property linear_motion/softness : float ; default=1.0 ; setter=set_param ; getter=get_param

A factor applied to the movement across the slider axis as long as the slider is in the limits. The lower, the slower the movement.

> property linear_ortho/damping : float ; default=1.0 ; setter=set_param ; getter=get_param

The amount of damping when movement is across axes orthogonal to the slider.

> property linear_ortho/restitution : float ; default=0.7 ; setter=set_param ; getter=get_param

The amount of restitution when movement is across axes orthogonal to the slider.

> property linear_ortho/softness : float ; default=1.0 ; setter=set_param ; getter=get_param

A factor applied to the movement across axes orthogonal to the slider.

## Methods

> method get_param(param: Param) -> float ; qualifiers=const

Returns the value of the given parameter.

> method set_param(param: Param, value: float) -> void

Assigns `value` to the given parameter.

## Enumerations

> enum Param

> enum_value Param.PARAM_LINEAR_LIMIT_UPPER = 0

Constant for accessing `linear_limit/upper_distance`. The maximum difference between the pivot points on their X axis before damping happens.

> enum_value Param.PARAM_LINEAR_LIMIT_LOWER = 1

Constant for accessing `linear_limit/lower_distance`. The minimum difference between the pivot points on their X axis before damping happens.

> enum_value Param.PARAM_LINEAR_LIMIT_SOFTNESS = 2

Constant for accessing `linear_limit/softness`. A factor applied to the movement across the slider axis once the limits get surpassed. The lower, the slower the movement.

> enum_value Param.PARAM_LINEAR_LIMIT_RESTITUTION = 3

Constant for accessing `linear_limit/restitution`. The amount of restitution once the limits are surpassed. The lower, the more velocity-energy gets lost.

> enum_value Param.PARAM_LINEAR_LIMIT_DAMPING = 4

Constant for accessing `linear_limit/damping`. The amount of damping once the slider limits are surpassed.

> enum_value Param.PARAM_LINEAR_MOTION_SOFTNESS = 5

Constant for accessing `linear_motion/softness`. A factor applied to the movement across the slider axis as long as the slider is in the limits. The lower, the slower the movement.

> enum_value Param.PARAM_LINEAR_MOTION_RESTITUTION = 6

Constant for accessing `linear_motion/restitution`. The amount of restitution inside the slider limits.

> enum_value Param.PARAM_LINEAR_MOTION_DAMPING = 7

Constant for accessing `linear_motion/damping`. The amount of damping inside the slider limits.

> enum_value Param.PARAM_LINEAR_ORTHOGONAL_SOFTNESS = 8

Constant for accessing `linear_ortho/softness`. A factor applied to the movement across axes orthogonal to the slider.

> enum_value Param.PARAM_LINEAR_ORTHOGONAL_RESTITUTION = 9

Constant for accessing `linear_motion/restitution`. The amount of restitution when movement is across axes orthogonal to the slider.

> enum_value Param.PARAM_LINEAR_ORTHOGONAL_DAMPING = 10

Constant for accessing `linear_motion/damping`. The amount of damping when movement is across axes orthogonal to the slider.

> enum_value Param.PARAM_ANGULAR_LIMIT_UPPER = 11

Constant for accessing `angular_limit/upper_angle`. The upper limit of rotation in the slider.

> enum_value Param.PARAM_ANGULAR_LIMIT_LOWER = 12

Constant for accessing `angular_limit/lower_angle`. The lower limit of rotation in the slider.

> enum_value Param.PARAM_ANGULAR_LIMIT_SOFTNESS = 13

Constant for accessing `angular_limit/softness`. A factor applied to the all rotation once the limit is surpassed.

> enum_value Param.PARAM_ANGULAR_LIMIT_RESTITUTION = 14

Constant for accessing `angular_limit/restitution`. The amount of restitution of the rotation when the limit is surpassed.

> enum_value Param.PARAM_ANGULAR_LIMIT_DAMPING = 15

Constant for accessing `angular_limit/damping`. The amount of damping of the rotation when the limit is surpassed.

> enum_value Param.PARAM_ANGULAR_MOTION_SOFTNESS = 16

Constant for accessing `angular_motion/softness`. A factor applied to the all rotation in the limits.

> enum_value Param.PARAM_ANGULAR_MOTION_RESTITUTION = 17

Constant for accessing `angular_motion/restitution`. The amount of restitution of the rotation in the limits.

> enum_value Param.PARAM_ANGULAR_MOTION_DAMPING = 18

Constant for accessing `angular_motion/damping`. The amount of damping of the rotation in the limits.

> enum_value Param.PARAM_ANGULAR_ORTHOGONAL_SOFTNESS = 19

Constant for accessing `angular_ortho/softness`. A factor applied to the all rotation across axes orthogonal to the slider.

> enum_value Param.PARAM_ANGULAR_ORTHOGONAL_RESTITUTION = 20

Constant for accessing `angular_ortho/restitution`. The amount of restitution of the rotation across axes orthogonal to the slider.

> enum_value Param.PARAM_ANGULAR_ORTHOGONAL_DAMPING = 21

Constant for accessing `angular_ortho/damping`. The amount of damping of the rotation across axes orthogonal to the slider.

> enum_value Param.PARAM_MAX = 22

Represents the size of the `Param` enum.
