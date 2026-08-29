# BoneTwistDisperser3D

> class BoneTwistDisperser3D
> inherits BoneTwistDisperser3D SkeletonModifier3D

## Brief

A node that propagates and disperses the child bone's twist to the parent bones.

## Description

This `BoneTwistDisperser3D` allows for smooth twist interpolation between multiple bones by dispersing the end bone's twist to the parents. This only changes the twist without changing the global position of each joint.
This is useful for smoothly twisting bones in combination with `CopyTransformModifier3D` and IK.
**Note:** If an extracted twist is greater than 180 degrees, flipping occurs. This is similar to `ConvertTransformModifier3D`.
**Note:** Most methods in this class take an `index` parameter. This parameter specifies which setting list entry to return if the IK has multiple entries (e.g. `settings/<index>/root_bone_name`).

## Properties

> property mutable_bone_axes : bool ; default=true ; setter=set_mutable_bone_axes ; getter=are_bone_axes_mutable

If `true`, the solver retrieves the bone axis from the bone pose every frame.
If `false`, the solver retrieves the bone axis from the bone rest and caches it.

> property setting_count : int ; default=0 ; setter=set_setting_count ; getter=get_setting_count

The number of settings.

## Methods

> method clear_settings() -> void

Clears all settings.

> method get_damping_curve(index: int) -> Curve ; qualifiers=const

Returns the damping curve when `get_disperse_mode` is `DISPERSE_MODE_CUSTOM`.

> method get_disperse_mode(index: int) -> DisperseMode ; qualifiers=const

Returns whether to use automatic amount assignment or to allow manual assignment.

> method get_end_bone(index: int) -> int ; qualifiers=const

Returns the end bone index of the bone chain.

> method get_end_bone_direction(index: int) -> SkeletonModifier3D.BoneDirection ; qualifiers=const

Returns the tail direction of the end bone of the bone chain when `is_end_bone_extended` is `true`.

> method get_end_bone_name(index: int) -> String ; qualifiers=const

Returns the end bone name of the bone chain.

> method get_joint_bone(index: int, joint: int) -> int ; qualifiers=const

Returns the bone index at `joint` in the bone chain's joint list.

> method get_joint_bone_name(index: int, joint: int) -> String ; qualifiers=const

Returns the bone name at `joint` in the bone chain's joint list.

> method get_joint_count(index: int) -> int ; qualifiers=const

Returns the joint count of the bone chain's joint list.

> method get_joint_twist_amount(index: int, joint: int) -> float ; qualifiers=const

Returns the twist amount at `joint` in the bone chain's joint list when `get_disperse_mode` is `DISPERSE_MODE_CUSTOM`.

> method get_reference_bone(index: int) -> int ; qualifiers=const

Returns the reference bone to extract twist of the setting at `index`.
This bone is either the end of the chain or its parent, depending on `is_end_bone_extended`.

> method get_reference_bone_name(index: int) -> String ; qualifiers=const

Returns the reference bone name to extract twist of the setting at `index`.
This bone is either the end of the chain or its parent, depending on `is_end_bone_extended`.

> method get_root_bone(index: int) -> int ; qualifiers=const

Returns the root bone index of the bone chain.

> method get_root_bone_name(index: int) -> String ; qualifiers=const

Returns the root bone name of the bone chain.

> method get_twist_from(index: int) -> Quaternion ; qualifiers=const

Returns the rotation to an arbitrary state before twisting for the current bone pose to extract the twist when `is_twist_from_rest` is `false`.

> method get_weight_position(index: int) -> float ; qualifiers=const

Returns the position at which to divide the segment between joints for weight assignment when `get_disperse_mode` is `DISPERSE_MODE_WEIGHTED`.

> method is_end_bone_extended(index: int) -> bool ; qualifiers=const

Returns `true` if the end bone is extended to have a tail.

> method is_twist_from_rest(index: int) -> bool ; qualifiers=const

Returns `true` if extracting the twist amount from the difference between the bone rest and the current bone pose.

> method set_damping_curve(index: int, curve: Curve) -> void

Sets the damping curve when `get_disperse_mode` is `DISPERSE_MODE_CUSTOM`.

> method set_disperse_mode(index: int, disperse_mode: DisperseMode) -> void

Sets whether to use automatic amount assignment or to allow manual assignment.

> method set_end_bone(index: int, bone: int) -> void

Sets the end bone index of the bone chain.

> method set_end_bone_direction(index: int, bone_direction: SkeletonModifier3D.BoneDirection) -> void

Sets the end bone tail direction of the bone chain when `is_end_bone_extended` is `true`.

> method set_end_bone_name(index: int, bone_name: String) -> void

Sets the end bone name of the bone chain.
**Note:** The end bone must be a child of the root bone.

> method set_extend_end_bone(index: int, enabled: bool) -> void

If `enabled` is `true`, the end bone is extended to have a tail.
If `enabled` is `false`, `get_reference_bone` becomes a parent of the end bone and it uses the vector to the end bone as a twist axis.

> method set_joint_twist_amount(index: int, joint: int, twist_amount: float) -> void

Sets the twist amount at `joint` in the bone chain's joint list when `get_disperse_mode` is `DISPERSE_MODE_CUSTOM`.

> method set_root_bone(index: int, bone: int) -> void

Sets the root bone index of the bone chain.

> method set_root_bone_name(index: int, bone_name: String) -> void

Sets the root bone name of the bone chain.

> method set_twist_from(index: int, from: Quaternion) -> void

Sets the rotation to an arbitrary state before twisting for the current bone pose to extract the twist when `is_twist_from_rest` is `false`.
In other words, by calling `set_twist_from` by `SkeletonModifier3D.modification_processed` of a specific `SkeletonModifier3D`, you can extract only the twists generated by modifiers processed after that but before this `BoneTwistDisperser3D`.

> method set_twist_from_rest(index: int, enabled: bool) -> void

If `enabled` is `true`, it extracts the twist amount from the difference between the bone rest and the current bone pose.
If `enabled` is `false`, it extracts the twist amount from the difference between `get_twist_from` and the current bone pose. See also `set_twist_from`.

> method set_weight_position(index: int, weight_position: float) -> void

Sets the position at which to divide the segment between joints for weight assignment when `get_disperse_mode` is `DISPERSE_MODE_WEIGHTED`.
For example, when `weight_position` is `0.5`, if two bone segments with a length of `1.0` exist between three joints, weights are assigned to each joint from root to end at ratios of `0.5`, `1.0`, and `0.5`. Then amounts become `0.25`, `0.75`, and `1.0` respectively.

## Enumerations

> enum DisperseMode

> enum_value DisperseMode.DISPERSE_MODE_EVEN = 0

Assign amounts so that they monotonically increase from `0.0` to `1.0`, ensuring all weights are equal. For example, with five joints, the amounts would be `0.2`, `0.4`, `0.6`, `0.8`, and `1.0` starting from the root bone.

> enum_value DisperseMode.DISPERSE_MODE_WEIGHTED = 1

Assign amounts so that they monotonically increase from `0.0` to `1.0`, based on the length of the bones between joint segments. See also `set_weight_position`.

> enum_value DisperseMode.DISPERSE_MODE_CUSTOM = 2

You can assign arbitrary amounts to the joint list. See also `set_joint_twist_amount`.
When `is_end_bone_extended` is `false`, a child of the reference bone exists solely to determine the twist axis, so its custom amount has absolutely no effect at all.
