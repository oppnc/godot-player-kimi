# BoneMap

> class BoneMap
> inherits BoneMap Resource

## Brief

Describes a mapping of bone names for retargeting `Skeleton3D` into common names defined by a `SkeletonProfile`.

## Description

This class contains a dictionary that uses a list of bone names in `SkeletonProfile` as key names.
By assigning the actual `Skeleton3D` bone name as the key value, it maps the `Skeleton3D` to the `SkeletonProfile`.

## Properties

> property profile : SkeletonProfile ; setter=set_profile ; getter=get_profile

A `SkeletonProfile` of the mapping target. Key names in the `BoneMap` are synchronized with it.

## Methods

> method find_profile_bone_name(skeleton_bone_name: StringName) -> StringName ; qualifiers=const

Returns a profile bone name having `skeleton_bone_name`. If not found, an empty `StringName` will be returned.
In the retargeting process, the returned bone name is the bone name of the target skeleton.

> method get_skeleton_bone_name(profile_bone_name: StringName) -> StringName ; qualifiers=const

Returns a skeleton bone name is mapped to `profile_bone_name`.
In the retargeting process, the returned bone name is the bone name of the source skeleton.

> method set_skeleton_bone_name(profile_bone_name: StringName, skeleton_bone_name: StringName) -> void

Maps a skeleton bone name to `profile_bone_name`.
In the retargeting process, the setting bone name is the bone name of the source skeleton.

## Signals

> signal bone_map_updated()

This signal is emitted when change the key value in the `BoneMap`. This is used to validate mapping and to update `BoneMap` editor.

> signal profile_updated()

This signal is emitted when change the value in profile or change the reference of profile. This is used to update key names in the `BoneMap` and to redraw the `BoneMap` editor.

## Tutorials
- [Retargeting 3D Skeletons]($DOCS_URL/tutorials/assets_pipeline/retargeting_3d_skeletons.html)
