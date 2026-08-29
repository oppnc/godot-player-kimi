# XRBodyModifier3D

> class XRBodyModifier3D ; experimental=This class may be changed or removed in future versions.
> inherits XRBodyModifier3D SkeletonModifier3D

## Brief

A node for driving body meshes from `XRBodyTracker` data.

## Description

This node uses body tracking data from an `XRBodyTracker` to pose the skeleton of a body mesh.
Positioning of the body is performed by creating an `XRNode3D` ancestor of the body mesh driven by the same `XRBodyTracker`.
The body tracking position-data is scaled by `Skeleton3D.motion_scale` when applied to the skeleton, which can be used to adjust the tracked body to match the scale of the body model.

## Properties

> property body_tracker : StringName ; default=&"/user/body_tracker" ; setter=set_body_tracker ; getter=get_body_tracker

The name of the `XRBodyTracker` registered with `XRServer` to obtain the body tracking data from.

> property body_update : BitField[BodyUpdate] ; default=7 ; setter=set_body_update ; getter=get_body_update

Specifies the body parts to update.

> property bone_update : BoneUpdate ; default=0 ; setter=set_bone_update ; getter=get_bone_update

Specifies the type of updates to perform on the bones.

## Enumerations

> enum BodyUpdate ; bitfield=true

> enum_value BodyUpdate.BODY_UPDATE_UPPER_BODY = 1

The skeleton's upper body joints are updated.

> enum_value BodyUpdate.BODY_UPDATE_LOWER_BODY = 2

The skeleton's lower body joints are updated.

> enum_value BodyUpdate.BODY_UPDATE_HANDS = 4

The skeleton's hand joints are updated.

> enum BoneUpdate

> enum_value BoneUpdate.BONE_UPDATE_FULL = 0

The skeleton's bones are fully updated (both position and rotation) to match the tracked bones.

> enum_value BoneUpdate.BONE_UPDATE_ROTATION_ONLY = 1

The skeleton's bones are only rotated to align with the tracked bones, preserving bone length.

> enum_value BoneUpdate.BONE_UPDATE_MAX = 2

Represents the size of the `BoneUpdate` enum.

## Tutorials
- [XR documentation index]($DOCS_URL/tutorials/xr/index.html)
