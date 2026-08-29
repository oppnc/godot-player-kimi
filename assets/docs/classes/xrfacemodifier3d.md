# XRFaceModifier3D

> class XRFaceModifier3D ; experimental=This class may be changed or removed in future versions.
> inherits XRFaceModifier3D Node3D

## Brief

A node for driving standard face meshes from `XRFaceTracker` weights.

## Description

This node applies weights from an `XRFaceTracker` to a mesh with supporting face blend shapes.
The [Unified Expressions](https://docs.vrcft.io/docs/tutorial-avatars/tutorial-avatars-extras/unified-blendshapes) blend shapes are supported, as well as ARKit and SRanipal blend shapes.
The node attempts to identify blend shapes based on name matching. Blend shapes should match the names listed in the [Unified Expressions Compatibility](https://docs.vrcft.io/docs/tutorial-avatars/tutorial-avatars-extras/compatibility/overview) chart.

## Properties

> property face_tracker : StringName ; default=&"/user/face_tracker" ; setter=set_face_tracker ; getter=get_face_tracker

The `XRFaceTracker` path.

> property target : NodePath ; default=NodePath("") ; setter=set_target ; getter=get_target

The `NodePath` of the face `MeshInstance3D`.

## Tutorials
- [XR documentation index]($DOCS_URL/tutorials/xr/index.html)
