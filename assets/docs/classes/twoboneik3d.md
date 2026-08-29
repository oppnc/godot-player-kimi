# TwoBoneIK3D

> class TwoBoneIK3D
> inherits TwoBoneIK3D IKModifier3D

## Brief

Rotation based intersection of two circles inverse kinematics solver.

## Description

This `IKModifier3D` requires a pole target. It provides deterministic results by constructing a plane from each joint and pole target and finding the intersection of two circles (disks in 3D).
This IK can handle twist by setting the pole direction. If there are more than one bone between each set bone, their rotations are ignored, and the straight line connecting the root-middle and middle-end joints are treated as virtual bones.
**Note:** All the methods in this class take an `index` parameter. This parameter specifies which setting list entry to return if the IK has multiple entries (e.g. `settings/<index>/root_bone_name`).

## Properties

> property setting_count : int ; default=0 ; setter=set_setting_count ; getter=get_setting_count

The number of settings.

## Methods

> method get_end_bone(index: int) -> int ; qualifiers=const

Returns the end bone index.

> method get_end_bone_direction(index: int) -> SkeletonModifier3D.BoneDirection ; qualifiers=const

Returns the end bone's tail direction when `is_end_bone_extended` is `true`.

> method get_end_bone_length(index: int) -> float ; qualifiers=const

Returns the end bone tail length of the bone chain when `is_end_bone_extended` is `true`.

> method get_end_bone_name(index: int) -> String ; qualifiers=const

Returns the end bone name.

> method get_middle_bone(index: int) -> int ; qualifiers=const

Returns the middle bone index.

> method get_middle_bone_name(index: int) -> String ; qualifiers=const

Returns the middle bone name.

> method get_pole_direction(index: int) -> SkeletonModifier3D.SecondaryDirection ; qualifiers=const

Returns the pole direction.

> method get_pole_direction_vector(index: int) -> Vector3 ; qualifiers=const

Returns the pole direction vector.
If `get_pole_direction` is `SkeletonModifier3D.SECONDARY_DIRECTION_NONE`, this method returns `Vector3(0, 0, 0)`.

> method get_pole_node(index: int) -> NodePath ; qualifiers=const

Returns the pole target node that constructs a plane which the joints are all on and the pole is trying to direct.

> method get_root_bone(index: int) -> int ; qualifiers=const

Returns the root bone index.

> method get_root_bone_name(index: int) -> String ; qualifiers=const

Returns the root bone name.

> method get_target_node(index: int) -> NodePath ; qualifiers=const

Returns the target node that the end bone is trying to reach.

> method is_end_bone_extended(index: int) -> bool ; qualifiers=const

Returns `true` if the end bone is extended to have a tail.

> method is_using_virtual_end(index: int) -> bool ; qualifiers=const

Returns `true` if the end bone is extended from the middle bone as a virtual bone.

> method set_end_bone(index: int, bone: int) -> void

Sets the end bone index.

> method set_end_bone_direction(index: int, bone_direction: SkeletonModifier3D.BoneDirection) -> void

Sets the end bone tail direction when `is_end_bone_extended` is `true`.

> method set_end_bone_length(index: int, length: float) -> void

Sets the end bone tail length when `is_end_bone_extended` is `true`.

> method set_end_bone_name(index: int, bone_name: String) -> void

Sets the end bone name.
**Note:** The end bone must be a child of the middle bone.

> method set_extend_end_bone(index: int, enabled: bool) -> void

If `enabled` is `true`, the end bone is extended to have a tail.

> method set_middle_bone(index: int, bone: int) -> void

Sets the middle bone index.

> method set_middle_bone_name(index: int, bone_name: String) -> void

Sets the middle bone name.
**Note:** The middle bone must be a child of the root bone.

> method set_pole_direction(index: int, direction: SkeletonModifier3D.SecondaryDirection) -> void

Sets the pole direction.
The pole is on the middle bone and will direct to the pole target.
The rotation axis is a vector that is orthogonal to this and the forward vector.
**Note:** The pole direction and the forward vector shouldn't be colinear to avoid unintended rotation.

> method set_pole_direction_vector(index: int, vector: Vector3) -> void

Sets the pole direction vector.
This vector is normalized by an internal process.
If the vector length is `0`, it is considered synonymous with `SkeletonModifier3D.SECONDARY_DIRECTION_NONE`.

> method set_pole_node(index: int, pole_node: NodePath) -> void

Sets the pole target node that constructs a plane which the joints are all on and the pole is trying to direct.

> method set_root_bone(index: int, bone: int) -> void

Sets the root bone index.

> method set_root_bone_name(index: int, bone_name: String) -> void

Sets the root bone name.

> method set_target_node(index: int, target_node: NodePath) -> void

Sets the target node that the end bone is trying to reach.

> method set_use_virtual_end(index: int, enabled: bool) -> void

If `enabled` is `true`, the end bone is extended from the middle bone as a virtual bone.
