# InputEventFromWindow

> class InputEventFromWindow
> inherits InputEventFromWindow InputEvent

## Brief

Abstract base class for `Viewport`-based input events.

## Description

InputEventFromWindow represents events specifically received by windows. This includes mouse events, keyboard events in focused windows or touch screen actions.

## Properties

> property window_id : int ; default=0 ; setter=set_window_id ; getter=get_window_id

The ID of a `Window` that received this event.
