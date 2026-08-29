# InputEventMouseButton

> class InputEventMouseButton ; keywords=click, press
> inherits InputEventMouseButton InputEventMouse

## Brief

Represents a mouse button being pressed or released.

## Description

Stores information about mouse click events. See `Node._input`.
**Note:** On Wear OS devices, rotary input is mapped to `MOUSE_BUTTON_WHEEL_UP` and `MOUSE_BUTTON_WHEEL_DOWN`. This can be changed to `MOUSE_BUTTON_WHEEL_LEFT` and `MOUSE_BUTTON_WHEEL_RIGHT` with the `ProjectSettings.input_devices/pointing/android/rotary_input_scroll_axis` setting.

## Properties

> property button_index : MouseButton ; default=0 ; setter=set_button_index ; getter=get_button_index

The mouse button identifier, one of the `MouseButton` button or button wheel constants.

> property canceled : bool ; default=false ; setter=set_canceled ; getter=is_canceled

If `true`, the mouse button event has been canceled.

> property double_click : bool ; default=false ; setter=set_double_click ; getter=is_double_click

If `true`, the mouse button's state is a double-click.

> property factor : float ; default=1.0 ; setter=set_factor ; getter=get_factor

The amount (or delta) of the event. When used for high-precision scroll events, this indicates the scroll amount (vertical or horizontal). This is only supported on some platforms; the reported sensitivity varies depending on the platform. May be `0` if not supported.

> property pressed : bool ; default=false ; setter=set_pressed ; getter=is_pressed

If `true`, the mouse button's state is pressed. If `false`, the mouse button's state is released.

## Tutorials
- [Using InputEvent]($DOCS_URL/tutorials/inputs/inputevent.html)
- [Mouse and input coordinates]($DOCS_URL/tutorials/inputs/mouse_and_input_coordinates.html)
