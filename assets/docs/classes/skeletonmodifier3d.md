# SkeletonModifier3D

> class SkeletonModifier3D
> inherits SkeletonModifier3D Node3D

## Brief

A node that may modify a Skeleton3D's bones.

## Description

`SkeletonModifier3D` retrieves a target `Skeleton3D` by having a `Skeleton3D` parent.
If there is an `AnimationMixer`, a modification always performs after playback process of the `AnimationMixer`.
This node should be used to implement custom IK solvers, constraints, or skeleton physics.

## Properties

> property active : bool ; default=true ; setter=set_active ; getter=is_active

If `true`, the `SkeletonModifier3D` will be processing.

> property influence : float ; default=1.0 ; setter=set_influence ; getter=get_influence

Sets the influence of the modification.
**Note:** This value is used by `Skeleton3D` to blend, so the `SkeletonModifier3D` should always apply only 100% of the result without interpolation.

## Methods

> method _process_modification() -> void ; qualifiers=virtual ; deprecated=Use `_process_modification_with_delta` instead.

Override this virtual method to implement a custom skeleton modifier. You should do things like get the `Skeleton3D`'s current pose and apply the pose here.
`_process_modification` must not apply `influence` to bone poses because the `Skeleton3D` automatically applies influence to all bone poses set by the modifier.

> method _process_modification_with_delta(delta: float) -> void ; qualifiers=virtual

Override this virtual method to implement a custom skeleton modifier. You should do things like get the `Skeleton3D`'s current pose and apply the pose here.
`_process_modification_with_delta` must not apply `influence` to bone poses because the `Skeleton3D` automatically applies influence to all bone poses set by the modifier.
`delta` is passed from parent `Skeleton3D`. See also `Skeleton3D.advance`.
**Note:** This method may be called outside `Node._process` and `Node._physics_process` with `delta` is `0.0`, since the modification should be processed immediately after initialization of the `Skeleton3D`.

> method _skeleton_changed(old_skeleton: Skeleton3D, new_skeleton: Skeleton3D) -> void ; qualifiers=virtual

Called when the skeleton is changed.

> method _validate_bone_names() -> void ; qualifiers=virtual

Called when bone names and indices need to be validated, such as when entering the scene tree or changing skeleton.

> method get_skeleton() -> Skeleton3D ; qualifiers=const

Returns the parent `Skeleton3D` node if it exists. Otherwise, returns `null`.

## Signals

> signal modification_processed()

Notifies when the modification have been finished.
**Note:** If you want to get the modified bone pose by the modifier, you must use `Skeleton3D.get_bone_pose` or `Skeleton3D.get_bone_global_pose` at the moment this signal is fired.

## Enumerations

> enum BoneAxis

> enum_value BoneAxis.BONE_AXIS_PLUS_X = 0

Enumerated value for the +X axis.

> enum_value BoneAxis.BONE_AXIS_MINUS_X = 1

Enumerated value for the -X axis.

> enum_value BoneAxis.BONE_AXIS_PLUS_Y = 2

Enumerated value for the +Y axis.

> enum_value BoneAxis.BONE_AXIS_MINUS_Y = 3

Enumerated value for the -Y axis.

> enum_value BoneAxis.BONE_AXIS_PLUS_Z = 4

Enumerated value for the +Z axis.

> enum_value BoneAxis.BONE_AXIS_MINUS_Z = 5

Enumerated value for the -Z axis.

> enum BoneDirection

> enum_value BoneDirection.BONE_DIRECTION_PLUS_X = 0

Enumerated value for the +X axis.

> enum_value BoneDirection.BONE_DIRECTION_MINUS_X = 1

Enumerated value for the -X axis.

> enum_value BoneDirection.BONE_DIRECTION_PLUS_Y = 2

Enumerated value for the +Y axis.

> enum_value BoneDirection.BONE_DIRECTION_MINUS_Y = 3

Enumerated value for the -Y axis.

> enum_value BoneDirection.BONE_DIRECTION_PLUS_Z = 4

Enumerated value for the +Z axis.

> enum_value BoneDirection.BONE_DIRECTION_MINUS_Z = 5

Enumerated value for the -Z axis.

> enum_value BoneDirection.BONE_DIRECTION_FROM_PARENT = 6

Enumerated value for the axis from a parent bone to the child bone.

> enum RotationAxis

> enum_value RotationAxis.ROTATION_AXIS_X = 0

Enumerated value for the rotation of the X axis.

> enum_value RotationAxis.ROTATION_AXIS_Y = 1

Enumerated value for the rotation of the Y axis.

> enum_value RotationAxis.ROTATION_AXIS_Z = 2

Enumerated value for the rotation of the Z axis.

> enum_value RotationAxis.ROTATION_AXIS_ALL = 3

Enumerated value for the unconstrained rotation.

> enum_value RotationAxis.ROTATION_AXIS_CUSTOM = 4

Enumerated value for an optional rotation axis.

> enum SecondaryDirection

> enum_value SecondaryDirection.SECONDARY_DIRECTION_NONE = 0

Enumerated value for the case when the axis is undefined.

> enum_value SecondaryDirection.SECONDARY_DIRECTION_PLUS_X = 1

Enumerated value for the +X axis.

> enum_value SecondaryDirection.SECONDARY_DIRECTION_MINUS_X = 2

Enumerated value for the -X axis.

> enum_value SecondaryDirection.SECONDARY_DIRECTION_PLUS_Y = 3

Enumerated value for the +Y axis.

> enum_value SecondaryDirection.SECONDARY_DIRECTION_MINUS_Y = 4

Enumerated value for the -Y axis.

> enum_value SecondaryDirection.SECONDARY_DIRECTION_PLUS_Z = 5

Enumerated value for the +Z axis.

> enum_value SecondaryDirection.SECONDARY_DIRECTION_MINUS_Z = 6

Enumerated value for the -Z axis.

> enum_value SecondaryDirection.SECONDARY_DIRECTION_CUSTOM = 7

Enumerated value for an optional axis.

## Tutorials
- [Design of the Skeleton Modifier 3D](https://godotengine.org/article/design-of-the-skeleton-modifier-3d/)
