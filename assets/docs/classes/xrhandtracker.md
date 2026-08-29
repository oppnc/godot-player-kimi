# XRHandTracker

> class XRHandTracker
> inherits XRHandTracker XRPositionalTracker

## Brief

A tracked hand in XR.

## Description

A hand tracking system will create an instance of this object and add it to the `XRServer`. This tracking system will then obtain skeleton data, convert it to the Godot Humanoid hand skeleton and store this data on the `XRHandTracker` object.
Use `XRHandModifier3D` to animate a hand mesh using hand tracking data.

## Properties

> property hand : XRPositionalTracker.TrackerHand ; default=1 ; setter=set_tracker_hand ; getter=get_tracker_hand ; overrides=XRPositionalTracker

> property hand_tracking_source : HandTrackingSource ; default=0 ; setter=set_hand_tracking_source ; getter=get_hand_tracking_source

The source of the hand tracking data.

> property has_tracking_data : bool ; default=false ; setter=set_has_tracking_data ; getter=get_has_tracking_data

If `true`, the hand tracking data is valid.

> property type : XRServer.TrackerType ; default=16 ; setter=set_tracker_type ; getter=get_tracker_type ; overrides=XRTracker

## Methods

> method get_hand_joint_angular_velocity(joint: HandJoint) -> Vector3 ; qualifiers=const

Returns the angular velocity for the given hand joint.

> method get_hand_joint_flags(joint: HandJoint) -> BitField[HandJointFlags] ; qualifiers=const

Returns flags about the validity of the tracking data for the given hand joint.

> method get_hand_joint_linear_velocity(joint: HandJoint) -> Vector3 ; qualifiers=const

Returns the linear velocity for the given hand joint.

> method get_hand_joint_radius(joint: HandJoint) -> float ; qualifiers=const

Returns the radius of the given hand joint.

> method get_hand_joint_transform(joint: HandJoint) -> Transform3D ; qualifiers=const

Returns the transform for the given hand joint.

> method set_hand_joint_angular_velocity(joint: HandJoint, angular_velocity: Vector3) -> void

Sets the angular velocity for the given hand joint.

> method set_hand_joint_flags(joint: HandJoint, flags: BitField[HandJointFlags]) -> void

Sets flags about the validity of the tracking data for the given hand joint.

> method set_hand_joint_linear_velocity(joint: HandJoint, linear_velocity: Vector3) -> void

Sets the linear velocity for the given hand joint.

> method set_hand_joint_radius(joint: HandJoint, radius: float) -> void

Sets the radius of the given hand joint.

> method set_hand_joint_transform(joint: HandJoint, transform: Transform3D) -> void

Sets the transform for the given hand joint.

## Enumerations

> enum HandJoint

> enum_value HandJoint.HAND_JOINT_PALM = 0

Palm joint.

> enum_value HandJoint.HAND_JOINT_WRIST = 1

Wrist joint.

> enum_value HandJoint.HAND_JOINT_THUMB_METACARPAL = 2

Thumb metacarpal joint.

> enum_value HandJoint.HAND_JOINT_THUMB_PHALANX_PROXIMAL = 3

Thumb phalanx proximal joint.

> enum_value HandJoint.HAND_JOINT_THUMB_PHALANX_DISTAL = 4

Thumb phalanx distal joint.

> enum_value HandJoint.HAND_JOINT_THUMB_TIP = 5

Thumb tip joint.

> enum_value HandJoint.HAND_JOINT_INDEX_FINGER_METACARPAL = 6

Index finger metacarpal joint.

> enum_value HandJoint.HAND_JOINT_INDEX_FINGER_PHALANX_PROXIMAL = 7

Index finger phalanx proximal joint.

> enum_value HandJoint.HAND_JOINT_INDEX_FINGER_PHALANX_INTERMEDIATE = 8

Index finger phalanx intermediate joint.

> enum_value HandJoint.HAND_JOINT_INDEX_FINGER_PHALANX_DISTAL = 9

Index finger phalanx distal joint.

> enum_value HandJoint.HAND_JOINT_INDEX_FINGER_TIP = 10

Index finger tip joint.

> enum_value HandJoint.HAND_JOINT_MIDDLE_FINGER_METACARPAL = 11

Middle finger metacarpal joint.

> enum_value HandJoint.HAND_JOINT_MIDDLE_FINGER_PHALANX_PROXIMAL = 12

Middle finger phalanx proximal joint.

> enum_value HandJoint.HAND_JOINT_MIDDLE_FINGER_PHALANX_INTERMEDIATE = 13

Middle finger phalanx intermediate joint.

> enum_value HandJoint.HAND_JOINT_MIDDLE_FINGER_PHALANX_DISTAL = 14

Middle finger phalanx distal joint.

> enum_value HandJoint.HAND_JOINT_MIDDLE_FINGER_TIP = 15

Middle finger tip joint.

> enum_value HandJoint.HAND_JOINT_RING_FINGER_METACARPAL = 16

Ring finger metacarpal joint.

> enum_value HandJoint.HAND_JOINT_RING_FINGER_PHALANX_PROXIMAL = 17

Ring finger phalanx proximal joint.

> enum_value HandJoint.HAND_JOINT_RING_FINGER_PHALANX_INTERMEDIATE = 18

Ring finger phalanx intermediate joint.

> enum_value HandJoint.HAND_JOINT_RING_FINGER_PHALANX_DISTAL = 19

Ring finger phalanx distal joint.

> enum_value HandJoint.HAND_JOINT_RING_FINGER_TIP = 20

Ring finger tip joint.

> enum_value HandJoint.HAND_JOINT_PINKY_FINGER_METACARPAL = 21

Pinky finger metacarpal joint.

> enum_value HandJoint.HAND_JOINT_PINKY_FINGER_PHALANX_PROXIMAL = 22

Pinky finger phalanx proximal joint.

> enum_value HandJoint.HAND_JOINT_PINKY_FINGER_PHALANX_INTERMEDIATE = 23

Pinky finger phalanx intermediate joint.

> enum_value HandJoint.HAND_JOINT_PINKY_FINGER_PHALANX_DISTAL = 24

Pinky finger phalanx distal joint.

> enum_value HandJoint.HAND_JOINT_PINKY_FINGER_TIP = 25

Pinky finger tip joint.

> enum_value HandJoint.HAND_JOINT_MAX = 26

Represents the size of the `HandJoint` enum.

> enum HandJointFlags ; bitfield=true

> enum_value HandJointFlags.HAND_JOINT_FLAG_ORIENTATION_VALID = 1

The hand joint's orientation data is valid.

> enum_value HandJointFlags.HAND_JOINT_FLAG_ORIENTATION_TRACKED = 2

The hand joint's orientation is actively tracked. May not be set if tracking has been temporarily lost.

> enum_value HandJointFlags.HAND_JOINT_FLAG_POSITION_VALID = 4

The hand joint's position data is valid.

> enum_value HandJointFlags.HAND_JOINT_FLAG_POSITION_TRACKED = 8

The hand joint's position is actively tracked. May not be set if tracking has been temporarily lost.

> enum_value HandJointFlags.HAND_JOINT_FLAG_LINEAR_VELOCITY_VALID = 16

The hand joint's linear velocity data is valid.

> enum_value HandJointFlags.HAND_JOINT_FLAG_ANGULAR_VELOCITY_VALID = 32

The hand joint's angular velocity data is valid.

> enum HandTrackingSource

> enum_value HandTrackingSource.HAND_TRACKING_SOURCE_UNKNOWN = 0

The source of hand tracking data is unknown.

> enum_value HandTrackingSource.HAND_TRACKING_SOURCE_UNOBSTRUCTED = 1

The source of hand tracking data is unobstructed, meaning that an accurate method of hand tracking is used. These include optical hand tracking, data gloves, etc.

> enum_value HandTrackingSource.HAND_TRACKING_SOURCE_CONTROLLER = 2

The source of hand tracking data is a controller, meaning that joint positions are inferred from controller inputs.

> enum_value HandTrackingSource.HAND_TRACKING_SOURCE_NOT_TRACKED = 3

No hand tracking data is tracked, this either means the hand is obscured, the controller is turned off, or tracking is not supported for the current input type.

> enum_value HandTrackingSource.HAND_TRACKING_SOURCE_MAX = 4

Represents the size of the `HandTrackingSource` enum.

## Tutorials
- [XR documentation index]($DOCS_URL/tutorials/xr/index.html)
