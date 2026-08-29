# InputEventGesture

> class InputEventGesture
> inherits InputEventGesture InputEventWithModifiers

## Brief

Abstract base class for touch gestures.

## Description

InputEventGestures are sent when a user performs a supported gesture on a touch screen. Gestures can't be emulated using mouse, because they typically require multi-touch.

## Properties

> property device : int ; default=0 ; setter=set_device ; getter=get_device ; overrides=InputEvent

> property position : Vector2 ; default=Vector2(0, 0) ; setter=set_position ; getter=get_position

The local gesture position relative to the `Viewport`. If used in `Control._gui_input`, the position is relative to the current `Control` that received this gesture.

## Tutorials
- [Using InputEvent]($DOCS_URL/tutorials/inputs/inputevent.html)
