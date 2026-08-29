# ChainIK3D

> class ChainIK3D
> inherits ChainIK3D IKModifier3D

## Brief

A `SkeletonModifier3D` to apply inverse kinematics to bone chains containing an arbitrary number of bones.

## Description

Base class of `SkeletonModifier3D` that automatically generates a joint list from the bones between the root bone and the end bone.
**Note:** All the methods in this class take an `index` parameter. This parameter specifies which setting list entry to return if the IK has multiple entries (e.g. `settings/<index>/root_bone_name`).

## Methods

> method get_end_bone(index: int) -> int ; qualifiers=const

Returns the end bone index of the bone chain.

> method get_end_bone_direction(index: int) -> SkeletonModifier3D.BoneDirection ; qualifiers=const

Returns the tail direction of the end bone of the bone chain when `is_end_bone_extended` is `true`.

> method get_end_bone_length(index: int) -> float ; qualifiers=const

Returns the end bone tail length of the bone chain when `is_end_bone_extended` is `true`.

> method get_end_bone_name(index: int) -> String ; qualifiers=const

Returns the end bone name of the bone chain.

> method get_joint_bone(index: int, joint: int) -> int ; qualifiers=const

Returns the bone index at `joint` in the bone chain's joint list.

> method get_joint_bone_name(index: int, joint: int) -> String ; qualifiers=const

Returns the bone name at `joint` in the bone chain's joint list.

> method get_joint_count(index: int) -> int ; qualifiers=const

Returns the joint count of the bone chain's joint list.

> method get_root_bone(index: int) -> int ; qualifiers=const

Returns the root bone index of the bone chain.

> method get_root_bone_name(index: int) -> String ; qualifiers=const

Returns the root bone name of the bone chain.

> method is_end_bone_extended(index: int) -> bool ; qualifiers=const

Returns `true` if the end bone is extended to have a tail.

> method set_end_bone(index: int, bone: int) -> void

Sets the end bone index of the bone chain.

> method set_end_bone_direction(index: int, bone_direction: SkeletonModifier3D.BoneDirection) -> void

Sets the end bone tail direction of the bone chain when `is_end_bone_extended` is `true`.

> method set_end_bone_length(index: int, length: float) -> void

Sets the end bone tail length of the bone chain when `is_end_bone_extended` is `true`.

> method set_end_bone_name(index: int, bone_name: String) -> void

Sets the end bone name of the bone chain.
**Note:** The end bone must be the root bone or a child of the root bone. If they are the same, the tail must be extended by `set_extend_end_bone` to modify the bone.

> method set_extend_end_bone(index: int, enabled: bool) -> void

If `enabled` is `true`, the end bone is extended to have a tail.
The extended tail config is allocated to the last element in the joint list. In other words, if you set `enabled` to `false`, the config of the last element in the joint list has no effect in the simulated result.

> method set_root_bone(index: int, bone: int) -> void

Sets the root bone index of the bone chain.

> method set_root_bone_name(index: int, bone_name: String) -> void

Sets the root bone name of the bone chain.
