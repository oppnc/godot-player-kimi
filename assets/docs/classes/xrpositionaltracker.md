# XRPositionalTracker

> class XRPositionalTracker
> inherits XRPositionalTracker XRTracker

## Brief

A tracked object.

## Description

An instance of this object represents a device that is tracked, such as a controller or anchor point. HMDs aren't represented here as they are handled internally.
As controllers are turned on and the `XRInterface` detects them, instances of this object are automatically added to this list of active tracking objects accessible through the `XRServer`.
The `XRNode3D` and `XRAnchor3D` both consume objects of this type and should be used in your project. The positional trackers are just under-the-hood objects that make this all work. These are mostly exposed so that GDExtension-based interfaces can interact with them.

## Properties

> property hand : TrackerHand ; default=0 ; setter=set_tracker_hand ; getter=get_tracker_hand

Defines which hand this tracker relates to.

> property profile : String ; default="" ; setter=set_tracker_profile ; getter=get_tracker_profile

The profile associated with this tracker, interface dependent but will indicate the type of controller being tracked.

## Methods

> method get_input(name: StringName) -> Variant ; qualifiers=const ; deprecated=Use through `XRControllerTracker`.

Returns an input for this tracker. It can return a boolean, float or `Vector2` value depending on whether the input is a button, trigger or thumbstick/thumbpad.

> method get_pose(name: StringName) -> XRPose ; qualifiers=const

Returns the current `XRPose` state object for the bound `name` pose.

> method has_pose(name: StringName) -> bool ; qualifiers=const

Returns `true` if the tracker is available and is currently tracking the bound `name` pose.

> method invalidate_pose(name: StringName) -> void

Marks this pose as invalid, we don't clear the last reported state but it allows users to decide if trackers need to be hidden if we lose tracking or just remain at their last known position.

> method set_input(name: StringName, value: Variant) -> void ; deprecated=Use through `XRControllerTracker`.

Changes the value for the given input. This method is called by an `XRInterface` implementation and should not be used directly.

> method set_pose(name: StringName, transform: Transform3D, linear_velocity: Vector3, angular_velocity: Vector3, tracking_confidence: XRPose.TrackingConfidence) -> void

Sets the transform, linear velocity, angular velocity and tracking confidence for the given pose. This method is called by an `XRInterface` implementation and should not be used directly.

## Signals

> signal button_pressed(action_name: String)

Emitted when a button on this tracker is pressed. Note that many XR runtimes allow other inputs to be mapped to buttons.

> signal button_released(action_name: String)

Emitted when a button on this tracker is released.

> signal input_float_changed(action_name: String, value: float)

Emitted when a trigger or similar input on this tracker changes value.

> signal input_vector2_changed(action_name: String, vector: Vector2)

Emitted when a thumbstick or thumbpad on this tracker moves.

> signal pose_changed(pose: XRPose)

Emitted when the state of a pose tracked by this tracker changes.

> signal pose_lost_tracking(pose: XRPose)

Emitted when a pose tracked by this tracker stops getting updated tracking data.

> signal profile_changed(role: String)

Emitted when the profile of our tracker changes.

## Enumerations

> enum TrackerHand

> enum_value TrackerHand.TRACKER_HAND_UNKNOWN = 0

The hand this tracker is held in is unknown or not applicable.

> enum_value TrackerHand.TRACKER_HAND_LEFT = 1

This tracker is the left hand controller.

> enum_value TrackerHand.TRACKER_HAND_RIGHT = 2

This tracker is the right hand controller.

> enum_value TrackerHand.TRACKER_HAND_MAX = 3

Represents the size of the `TrackerHand` enum.

## Tutorials
- [XR documentation index]($DOCS_URL/tutorials/xr/index.html)
