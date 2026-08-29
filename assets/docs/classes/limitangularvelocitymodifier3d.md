# LimitAngularVelocityModifier3D

> class LimitAngularVelocityModifier3D
> inherits LimitAngularVelocityModifier3D SkeletonModifier3D

## Brief

Limit bone rotation angular velocity.

## Description

This modifier limits bone rotation angular velocity by comparing poses between previous and current frame.
You can add bone chains by specifying their root and end bones, then add the bones between them to a list. Modifier processes either that list or the bones excluding those in the list depending on the option `exclude`.
**Note:** Most methods in this class take an `index` parameter. This parameter specifies which setting list entry to return if the IK has multiple entries (e.g. `settings/<index>/root_bone_name`).

## Properties

> property chain_count : int ; default=0 ; setter=set_chain_count ; getter=get_chain_count

The number of chains.

> property exclude : bool ; default=false ; setter=set_exclude ; getter=is_exclude

If `true`, the modifier processes bones not included in the bone list.
If `false`, the bones processed by the modifier are equal to the bone list.

> property joint_count : int ; default=0 ; getter=_get_joint_count

The number of joints in the list which created by chains dynamically.

> property max_angular_velocity : float ; default=6.2831855 ; setter=set_max_angular_velocity ; getter=get_max_angular_velocity

The maximum angular velocity per second.

## Methods

> method clear_chains() -> void

Clear all chains.

> method get_end_bone(index: int) -> int ; qualifiers=const

Returns the end bone index of the bone chain.

> method get_end_bone_name(index: int) -> String ; qualifiers=const

Returns the end bone name of the bone chain.

> method get_root_bone(index: int) -> int ; qualifiers=const

Returns the root bone index of the bone chain.

> method get_root_bone_name(index: int) -> String ; qualifiers=const

Returns the root bone name of the bone chain.

> method reset() -> void

Sets the reference pose for angle comparison to the current pose with the influence of constraints removed. This function is automatically triggered when joints change or upon activation.

> method set_end_bone(index: int, bone: int) -> void

Sets the end bone index of the bone chain.

> method set_end_bone_name(index: int, bone_name: String) -> void

Sets the end bone name of the bone chain.
**Note:** End bone must be the root bone or a child of the root bone.

> method set_root_bone(index: int, bone: int) -> void

Sets the root bone index of the bone chain.

> method set_root_bone_name(index: int, bone_name: String) -> void

Sets the root bone name of the bone chain.
