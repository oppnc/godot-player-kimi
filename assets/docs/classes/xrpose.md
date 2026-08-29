# XRPose

> class XRPose
> inherits XRPose RefCounted

## Brief

This object contains all data related to a pose on a tracked object.

## Description

XR runtimes often identify multiple locations on devices such as controllers that are spatially tracked.
Orientation, location, linear velocity and angular velocity are all provided for each pose by the XR runtime. This object contains this state of a pose.

## Properties

> property angular_velocity : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_angular_velocity ; getter=get_angular_velocity

The angular velocity for this pose.

> property has_tracking_data : bool ; default=false ; setter=set_has_tracking_data ; getter=get_has_tracking_data

If `true` our tracking data is up to date. If `false` we're no longer receiving new tracking data and our state is whatever that last valid state was.

> property linear_velocity : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_linear_velocity ; getter=get_linear_velocity

The linear velocity of this pose.

> property name : StringName ; default=&"" ; setter=set_name ; getter=get_name

The name of this pose. Usually, this name is derived from an action map set up by the user. Godot also suggests some pose names that `XRInterface` objects are expected to implement:
- `root` is the root location, often used for tracked objects that do not have further nodes.
- `aim` is the tip of a controller with its orientation pointing outwards, often used for raycasts.
- `grip` is the location where the user grips the controller.
- `skeleton` is the root location for a hand mesh, when using hand tracking and an animated skeleton is supplied by the XR runtime.

> property tracking_confidence : TrackingConfidence ; default=0 ; setter=set_tracking_confidence ; getter=get_tracking_confidence

The tracking confidence for this pose, provides insight on how accurate the spatial positioning of this record is.

> property transform : Transform3D ; default=Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0) ; setter=set_transform ; getter=get_transform

The transform containing the original and transform as reported by the XR runtime.

## Methods

> method get_adjusted_transform() -> Transform3D ; qualifiers=const

Returns the `transform` with world scale and our reference frame applied. This is the transform used to position `XRNode3D` objects.

## Enumerations

> enum TrackingConfidence

> enum_value TrackingConfidence.XR_TRACKING_CONFIDENCE_NONE = 0

No tracking information is available for this pose.

> enum_value TrackingConfidence.XR_TRACKING_CONFIDENCE_LOW = 1

Tracking information may be inaccurate or estimated. For example, with inside out tracking this would indicate a controller may be (partially) obscured.

> enum_value TrackingConfidence.XR_TRACKING_CONFIDENCE_HIGH = 2

Tracking information is considered accurate and up to date.

## Tutorials
- [XR documentation index]($DOCS_URL/tutorials/xr/index.html)
