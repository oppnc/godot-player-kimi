# ModifierBoneTarget3D

> class ModifierBoneTarget3D
> inherits ModifierBoneTarget3D SkeletonModifier3D

## Brief

А node that dynamically copies the 3D transform of a bone in its parent `Skeleton3D`.

## Description

This node selects a bone in a `Skeleton3D` and attaches to it. This means that the `ModifierBoneTarget3D` node will dynamically copy the 3D transform of the selected bone.
The functionality is similar to `BoneAttachment3D`, but this node adopts the `SkeletonModifier3D` cycle and is intended to be used as another `SkeletonModifier3D`'s target.

## Properties

> property bone : int ; default=-1 ; setter=set_bone ; getter=get_bone

The index of the attached bone.

> property bone_name : String ; default="" ; setter=set_bone_name ; getter=get_bone_name

The name of the attached bone.
