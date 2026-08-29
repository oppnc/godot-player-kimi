# XRHandModifier3D

> class XRHandModifier3D
> inherits XRHandModifier3D SkeletonModifier3D

## Brief

A node for driving hand meshes from `XRHandTracker` data.

## Description

This node uses hand tracking data from an `XRHandTracker` to pose the skeleton of a hand mesh.
Positioning of hands is performed by creating an `XRNode3D` ancestor of the hand mesh driven by the same `XRHandTracker`.
The hand tracking position-data is scaled by `Skeleton3D.motion_scale` when applied to the skeleton, which can be used to adjust the tracked hand to match the scale of the hand model.

## Properties

> property bone_update : BoneUpdate ; default=0 ; setter=set_bone_update ; getter=get_bone_update

Specifies the type of updates to perform on the bones.

> property hand_tracker : StringName ; default=&"/user/hand_tracker/left" ; setter=set_hand_tracker ; getter=get_hand_tracker

The name of the `XRHandTracker` registered with `XRServer` to obtain the hand tracking data from.

## Enumerations

> enum BoneUpdate

> enum_value BoneUpdate.BONE_UPDATE_FULL = 0

The skeleton's bones are fully updated (both position and rotation) to match the tracked bones.

> enum_value BoneUpdate.BONE_UPDATE_ROTATION_ONLY = 1

The skeleton's bones are only rotated to align with the tracked bones, preserving bone length.

> enum_value BoneUpdate.BONE_UPDATE_MAX = 2

Represents the size of the `BoneUpdate` enum.

## Tutorials
- [XR documentation index]($DOCS_URL/tutorials/xr/index.html)
