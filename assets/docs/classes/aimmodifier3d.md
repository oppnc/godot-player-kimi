# AimModifier3D

> class AimModifier3D
> inherits AimModifier3D BoneConstraint3D

## Brief

The `AimModifier3D` rotates a bone to look at a reference bone.

## Description

This is a simple version of `LookAtModifier3D` that only allows bone to the reference without advanced options such as angle limitation or time-based interpolation.
The feature is simplified, but instead it is implemented with smooth tracking without euler, see `set_use_euler`.

## Properties

> property setting_count : int ; default=0 ; setter=set_setting_count ; getter=get_setting_count

The number of settings in the modifier.

## Methods

> method get_forward_axis(index: int) -> SkeletonModifier3D.BoneAxis ; qualifiers=const

Returns the forward axis of the bone.

> method get_primary_rotation_axis(index: int) -> Vector3.Axis ; qualifiers=const

Returns the axis of the first rotation. It is enabled only if `is_using_euler` is `true`.

> method is_relative(index: int) -> bool ; qualifiers=const

Returns `true` if the relative option is enabled in the setting at `index`.

> method is_using_euler(index: int) -> bool ; qualifiers=const

Returns `true` if it provides rotation with using euler.

> method is_using_secondary_rotation(index: int) -> bool ; qualifiers=const

Returns `true` if it provides rotation by two axes. It is enabled only if `is_using_euler` is `true`.

> method set_forward_axis(index: int, axis: SkeletonModifier3D.BoneAxis) -> void

Sets the forward axis of the bone.

> method set_primary_rotation_axis(index: int, axis: Vector3.Axis) -> void

Sets the axis of the first rotation. It is enabled only if `is_using_euler` is `true`.

> method set_relative(index: int, enabled: bool) -> void

Sets relative option in the setting at `index` to `enabled`.
If sets `enabled` to `true`, the rotation is applied relative to the pose.
If sets `enabled` to `false`, the rotation is applied relative to the rest. It means to replace the current pose with the `AimModifier3D`'s result.

> method set_use_euler(index: int, enabled: bool) -> void

If sets `enabled` to `true`, it provides rotation with using euler.
If sets `enabled` to `false`, it provides rotation with using rotation by arc generated from the forward axis vector and the vector toward the reference.

> method set_use_secondary_rotation(index: int, enabled: bool) -> void

If sets `enabled` to `true`, it provides rotation by two axes. It is enabled only if `is_using_euler` is `true`.
