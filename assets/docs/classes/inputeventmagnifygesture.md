# InputEventMagnifyGesture

> class InputEventMagnifyGesture
> inherits InputEventMagnifyGesture InputEventGesture

## Brief

Represents a magnifying touch gesture.

## Description

Stores the factor of a magnifying touch gesture. This is usually performed when the user pinches the touch screen and used for zooming in/out.
**Note:** On Android, this requires the `ProjectSettings.input_devices/pointing/android/enable_pan_and_scale_gestures` project setting to be enabled.

## Properties

> property factor : float ; default=1.0 ; setter=set_factor ; getter=get_factor

The amount (or delta) of the event. This value is closer to `1.0` the slower the gesture is performed.

## Tutorials
- [Using InputEvent]($DOCS_URL/tutorials/inputs/inputevent.html)
