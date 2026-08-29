# DampedSpringJoint2D

> class DampedSpringJoint2D
> inherits DampedSpringJoint2D Joint2D

## Brief

A physics joint that connects two 2D physics bodies with a spring-like force.

## Description

A physics joint that connects two 2D physics bodies with a spring-like force. This behaves like a spring that always wants to stretch to a given length.

## Properties

> property damping : float ; default=1.0 ; setter=set_damping ; getter=get_damping

The spring joint's damping ratio. A value between `0` and `1`. When the two bodies move into different directions the system tries to align them to the spring axis again. A high `damping` value forces the attached bodies to align faster.

> property length : float ; default=50.0 ; setter=set_length ; getter=get_length

The spring joint's maximum length. The two attached bodies cannot stretch it past this value.

> property rest_length : float ; default=0.0 ; setter=set_rest_length ; getter=get_rest_length

When the bodies attached to the spring joint move they stretch or squash it. The joint always tries to resize towards this length.

> property stiffness : float ; default=20.0 ; setter=set_stiffness ; getter=get_stiffness

The higher the value, the less the bodies attached to the joint will deform it. The joint applies an opposing force to the bodies, the product of the stiffness multiplied by the size difference from its resting length.
