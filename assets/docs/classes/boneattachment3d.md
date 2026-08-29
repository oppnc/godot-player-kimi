# BoneAttachment3D

> class BoneAttachment3D ; keywords=tag
> inherits BoneAttachment3D Node3D

## Brief

А node that dynamically copies or overrides the 3D transform of a bone in its parent `Skeleton3D`.

## Description

This node selects a bone in a `Skeleton3D` and attaches to it. This means that the `BoneAttachment3D` node will either dynamically copy or override the 3D transform of the selected bone.

## Properties

> property bone_idx : int ; default=-1 ; setter=set_bone_idx ; getter=get_bone_idx

The index of the attached bone.

> property bone_name : String ; default="" ; setter=set_bone_name ; getter=get_bone_name

The name of the attached bone.

> property external_skeleton : NodePath ; setter=set_external_skeleton ; getter=get_external_skeleton

The `NodePath` to the external `Skeleton3D` node.

> property override_pose : bool ; default=false ; setter=set_override_pose ; getter=get_override_pose

Whether the `BoneAttachment3D` node will override the bone pose of the bone it is attached to. When set to `true`, the `BoneAttachment3D` node can change the pose of the bone. When set to `false`, the `BoneAttachment3D` will always be set to the bone's transform.
**Note:** This override performs interruptively in the skeleton update process using signals due to the old design. It may cause unintended behavior when used at the same time with `SkeletonModifier3D`.

> property physics_interpolation_mode : Node.PhysicsInterpolationMode ; default=2 ; setter=set_physics_interpolation_mode ; getter=get_physics_interpolation_mode ; overrides=Node

> property use_external_skeleton : bool ; default=false ; setter=set_use_external_skeleton ; getter=get_use_external_skeleton

Whether the `BoneAttachment3D` node will use an external `Skeleton3D` node rather than attempting to use its parent node as the `Skeleton3D`. When set to `true`, the `BoneAttachment3D` node will use the external `Skeleton3D` node set in `external_skeleton`.

## Methods

> method get_skeleton() -> Skeleton3D

Returns the parent or external `Skeleton3D` node if it exists, otherwise returns `null`.

> method on_skeleton_update() -> void

A function that is called automatically when the `Skeleton3D` is updated. This function is where the `BoneAttachment3D` node updates its position so it is correctly bound when it is *not* set to override the bone pose.
