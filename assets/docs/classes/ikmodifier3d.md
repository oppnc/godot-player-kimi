# IKModifier3D

> class IKModifier3D
> inherits IKModifier3D SkeletonModifier3D

## Brief

A node for inverse kinematics which may modify more than one bone.

## Description

Base class of `SkeletonModifier3D`s that has some joint lists and applies inverse kinematics. This class has some structs, enums, and helper methods which are useful to solve inverse kinematics.

## Properties

> property mutable_bone_axes : bool ; default=true ; setter=set_mutable_bone_axes ; getter=are_bone_axes_mutable

If `true`, the solver retrieves the bone axis from the bone pose every frame.
If `false`, the solver retrieves the bone axis from the bone rest and caches it, which increases performance slightly, but position changes in the bone pose made before processing this `IKModifier3D` are ignored.

## Methods

> method clear_settings() -> void

Clears all settings.

> method get_setting_count() -> int ; qualifiers=const

Returns the number of settings.

> method reset() -> void

Resets a state with respect to the current bone pose.

> method set_setting_count(count: int) -> void

Sets the number of settings.

## Tutorials
- [Inverse Kinematics Returns to Godot 4.6 - IKModifier3D](https://godotengine.org/article/inverse-kinematics-returns-to-godot-4-6/#ikmodifier3d-and-7-child-classes)
