# GrooveJoint2D

> class GrooveJoint2D
> inherits GrooveJoint2D Joint2D

## Brief

A physics joint that restricts the movement of two 2D physics bodies to a fixed axis.

## Description

A physics joint that restricts the movement of two 2D physics bodies to a fixed axis. For example, a `StaticBody2D` representing a piston base can be attached to a `RigidBody2D` representing the piston head, moving up and down.

## Properties

> property initial_offset : float ; default=25.0 ; setter=set_initial_offset ; getter=get_initial_offset

The body B's initial anchor position defined by the joint's origin and a local offset `initial_offset` along the joint's Y axis (along the groove).

> property length : float ; default=50.0 ; setter=set_length ; getter=get_length

The groove's length. The groove is from the joint's origin towards `length` along the joint's local Y axis.
