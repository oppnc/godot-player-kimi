# InputEventMouse

> class InputEventMouse
> inherits InputEventMouse InputEventWithModifiers

## Brief

Base input event type for mouse events.

## Description

Stores general information about mouse events.

## Properties

> property button_mask : BitField[MouseButtonMask] ; default=0 ; setter=set_button_mask ; getter=get_button_mask

The mouse button mask identifier, one of or a bitwise combination of the `MouseButton` button masks.

> property device : int ; default=32 ; setter=set_device ; getter=get_device ; overrides=InputEvent

> property global_position : Vector2 ; default=Vector2(0, 0) ; setter=set_global_position ; getter=get_global_position

When received in `Node._input` or `Node._unhandled_input`, returns the mouse's position in the root `Viewport` using the coordinate system of the root `Viewport`.
When received in `Control._gui_input`, returns the mouse's position in the `CanvasLayer` that the `Control` is in using the coordinate system of the `CanvasLayer`.

> property position : Vector2 ; default=Vector2(0, 0) ; setter=set_position ; getter=get_position

When received in `Node._input` or `Node._unhandled_input`, returns the mouse's position in the `Viewport` this `Node` is in using the coordinate system of this `Viewport`.
When received in `Control._gui_input`, returns the mouse's position in the `Control` using the local coordinate system of the `Control`.

## Tutorials
- [Using InputEvent]($DOCS_URL/tutorials/inputs/inputevent.html)
