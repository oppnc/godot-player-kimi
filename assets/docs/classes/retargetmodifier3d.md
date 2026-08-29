# RetargetModifier3D

> class RetargetModifier3D
> inherits RetargetModifier3D SkeletonModifier3D

## Brief

A modifier to transfer parent skeleton poses (or global poses) to child skeletons in model space with different rests.

## Description

Retrieves the pose (or global pose) relative to the parent Skeleton's rest in model space and transfers it to the child Skeleton.
This modifier rewrites the pose of the child skeleton directly in the parent skeleton's update process. This means that it overwrites the mapped bone pose set in the normal process on the target skeleton. If you want to set the target skeleton bone pose after retargeting, you will need to add a `SkeletonModifier3D` child to the target skeleton and thereby modify the pose.
**Note:** When the `use_global_pose` is enabled, even if it is an unmapped bone, it can cause visual problems because the global pose is applied ignoring the parent bone's pose **if it has mapped bone children**. See also `use_global_pose`.

## Properties

> property enable : BitField[TransformFlag] ; default=7 ; setter=set_enable_flags ; getter=get_enable_flags

Flags to control the process of the transform elements individually when `use_global_pose` is disabled.

> property profile : SkeletonProfile ; setter=set_profile ; getter=get_profile

`SkeletonProfile` for retargeting bones with names matching the bone list.

> property use_global_pose : bool ; default=false ; setter=set_use_global_pose ; getter=is_using_global_pose

If `false`, in case the target skeleton has fewer bones than the source skeleton, the source bone parent's transform will be ignored.
Instead, it is possible to retarget between models with different body shapes, and position, rotation, and scale can be retargeted separately.
If `true`, retargeting is performed taking into account global pose.
In case the target skeleton has fewer bones than the source skeleton, the source bone parent's transform is taken into account. However, bone length between skeletons must match exactly, if not, the bones will be forced to expand or shrink.
This is useful for using dummy bone with length `0` to match postures when retargeting between models with different number of bones.

## Methods

> method is_position_enabled() -> bool ; qualifiers=const

Returns `true` if `enable` has `TRANSFORM_FLAG_POSITION`.

> method is_rotation_enabled() -> bool ; qualifiers=const

Returns `true` if `enable` has `TRANSFORM_FLAG_ROTATION`.

> method is_scale_enabled() -> bool ; qualifiers=const

Returns `true` if `enable` has `TRANSFORM_FLAG_SCALE`.

> method set_position_enabled(enabled: bool) -> void

Sets `TRANSFORM_FLAG_POSITION` into `enable`.

> method set_rotation_enabled(enabled: bool) -> void

Sets `TRANSFORM_FLAG_ROTATION` into `enable`.

> method set_scale_enabled(enabled: bool) -> void

Sets `TRANSFORM_FLAG_SCALE` into `enable`.

## Enumerations

> enum TransformFlag ; bitfield=true

> enum_value TransformFlag.TRANSFORM_FLAG_POSITION = 1

If set, allows to retarget the position.

> enum_value TransformFlag.TRANSFORM_FLAG_ROTATION = 2

If set, allows to retarget the rotation.

> enum_value TransformFlag.TRANSFORM_FLAG_SCALE = 4

If set, allows to retarget the scale.

> enum_value TransformFlag.TRANSFORM_FLAG_ALL = 7

If set, allows to retarget the position/rotation/scale.
