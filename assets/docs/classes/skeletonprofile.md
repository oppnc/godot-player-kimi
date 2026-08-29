# SkeletonProfile

> class SkeletonProfile
> inherits SkeletonProfile Resource

## Brief

Base class for a profile of a virtual skeleton used as a target for retargeting.

## Description

This resource is used in `EditorScenePostImport`. Some parameters are referring to bones in `Skeleton3D`, `Skin`, `Animation`, and some other nodes are rewritten based on the parameters of `SkeletonProfile`.
**Note:** These parameters need to be set only when creating a custom profile. In `SkeletonProfileHumanoid`, they are defined internally as read-only values.

## Properties

> property bone_size : int ; default=0 ; setter=set_bone_size ; getter=get_bone_size

The amount of bones in retargeting section's `BoneMap` editor. For example, `SkeletonProfileHumanoid` has 56 bones.
The size of elements in `BoneMap` updates when changing this property in it's assigned `SkeletonProfile`.

> property group_size : int ; default=0 ; setter=set_group_size ; getter=get_group_size

The amount of groups of bones in retargeting section's `BoneMap` editor. For example, `SkeletonProfileHumanoid` has 4 groups.
This property exists to separate the bone list into several sections in the editor.

> property root_bone : StringName ; default=&"" ; setter=set_root_bone ; getter=get_root_bone

A bone name that will be used as the root bone in `AnimationTree`. This should be the bone of the parent of hips that exists at the world origin.

> property scale_base_bone : StringName ; default=&"" ; setter=set_scale_base_bone ; getter=get_scale_base_bone

A bone name which will use model's height as the coefficient for normalization. For example, `SkeletonProfileHumanoid` defines it as `Hips`.

## Methods

> method find_bone(bone_name: StringName) -> int ; qualifiers=const

Returns the bone index that matches `bone_name` as its name.

> method get_bone_name(bone_idx: int) -> StringName ; qualifiers=const

Returns the name of the bone at `bone_idx` that will be the key name in the `BoneMap`.
In the retargeting process, the returned bone name is the bone name of the target skeleton.

> method get_bone_parent(bone_idx: int) -> StringName ; qualifiers=const

Returns the name of the bone which is the parent to the bone at `bone_idx`. The result is empty if the bone has no parent.

> method get_bone_tail(bone_idx: int) -> StringName ; qualifiers=const

Returns the name of the bone which is the tail of the bone at `bone_idx`.

> method get_group(bone_idx: int) -> StringName ; qualifiers=const

Returns the group of the bone at `bone_idx`.

> method get_group_name(group_idx: int) -> StringName ; qualifiers=const

Returns the name of the group at `group_idx` that will be the drawing group in the `BoneMap` editor.

> method get_handle_offset(bone_idx: int) -> Vector2 ; qualifiers=const

Returns the offset of the bone at `bone_idx` that will be the button position in the `BoneMap` editor.
This is the offset with origin at the top left corner of the square.

> method get_reference_pose(bone_idx: int) -> Transform3D ; qualifiers=const

Returns the reference pose transform for bone `bone_idx`.

> method get_tail_direction(bone_idx: int) -> TailDirection ; qualifiers=const

Returns the tail direction of the bone at `bone_idx`.

> method get_texture(group_idx: int) -> Texture2D ; qualifiers=const

Returns the texture of the group at `group_idx` that will be the drawing group background image in the `BoneMap` editor.

> method is_required(bone_idx: int) -> bool ; qualifiers=const

Returns whether the bone at `bone_idx` is required for retargeting.
This value is used by the bone map editor. If this method returns `true`, and no bone is assigned, the handle color will be red on the bone map editor.

> method set_bone_name(bone_idx: int, bone_name: StringName) -> void

Sets the name of the bone at `bone_idx` that will be the key name in the `BoneMap`.
In the retargeting process, the setting bone name is the bone name of the target skeleton.

> method set_bone_parent(bone_idx: int, bone_parent: StringName) -> void

Sets the bone with name `bone_parent` as the parent of the bone at `bone_idx`. If an empty string is passed, then the bone has no parent.

> method set_bone_tail(bone_idx: int, bone_tail: StringName) -> void

Sets the bone with name `bone_tail` as the tail of the bone at `bone_idx`.

> method set_group(bone_idx: int, group: StringName) -> void

Sets the group of the bone at `bone_idx`.

> method set_group_name(group_idx: int, group_name: StringName) -> void

Sets the name of the group at `group_idx` that will be the drawing group in the `BoneMap` editor.

> method set_handle_offset(bone_idx: int, handle_offset: Vector2) -> void

Sets the offset of the bone at `bone_idx` that will be the button position in the `BoneMap` editor.
This is the offset with origin at the top left corner of the square.

> method set_reference_pose(bone_idx: int, bone_name: Transform3D) -> void

Sets the reference pose transform for bone `bone_idx`.

> method set_required(bone_idx: int, required: bool) -> void

Sets the required status for bone `bone_idx` to `required`.

> method set_tail_direction(bone_idx: int, tail_direction: TailDirection) -> void

Sets the tail direction of the bone at `bone_idx`.
**Note:** This only specifies the method of calculation. The actual coordinates required should be stored in an external skeleton, so the calculation itself needs to be done externally.

> method set_texture(group_idx: int, texture: Texture2D) -> void

Sets the texture of the group at `group_idx` that will be the drawing group background image in the `BoneMap` editor.

## Signals

> signal profile_updated()

This signal is emitted when change the value in profile. This is used to update key name in the `BoneMap` and to redraw the `BoneMap` editor.
**Note:** This signal is not connected directly to editor to simplify the reference, instead it is passed on to editor through the `BoneMap`.

## Enumerations

> enum TailDirection

> enum_value TailDirection.TAIL_DIRECTION_AVERAGE_CHILDREN = 0

Direction to the average coordinates of bone children.

> enum_value TailDirection.TAIL_DIRECTION_SPECIFIC_CHILD = 1

Direction to the coordinates of specified bone child.

> enum_value TailDirection.TAIL_DIRECTION_END = 2

Direction is not calculated.

## Tutorials
- [Retargeting 3D Skeletons]($DOCS_URL/tutorials/assets_pipeline/retargeting_3d_skeletons.html)
