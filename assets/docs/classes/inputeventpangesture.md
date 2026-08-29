# InputEventPanGesture

> class InputEventPanGesture
> inherits InputEventPanGesture InputEventGesture

## Brief

Represents a panning touch gesture.

## Description

Stores information about pan gestures. A pan gesture is performed when the user swipes the touch screen with two fingers. It's typically used for panning/scrolling.
**Note:** On Android, this requires the `ProjectSettings.input_devices/pointing/android/enable_pan_and_scale_gestures` project setting to be enabled.

## Properties

> property delta : Vector2 ; default=Vector2(0, 0) ; setter=set_delta ; getter=get_delta

Panning amount since last pan event.

## Tutorials
- [Using InputEvent]($DOCS_URL/tutorials/inputs/inputevent.html)
