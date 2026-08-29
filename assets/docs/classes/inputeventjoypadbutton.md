# InputEventJoypadButton

> class InputEventJoypadButton ; keywords=gamepad, controller
> inherits InputEventJoypadButton InputEvent

## Brief

Represents a gamepad button being pressed or released.

## Description

Input event type for gamepad buttons. For gamepad analog sticks and joysticks, see `InputEventJoypadMotion`.

## Properties

> property button_index : JoyButton ; default=0 ; setter=set_button_index ; getter=get_button_index

Button identifier. One of the `JoyButton` button constants.

> property pressed : bool ; default=false ; setter=set_pressed ; getter=is_pressed

If `true`, the button's state is pressed. If `false`, the button's state is released.

> property pressure : float ; default=0.0 ; setter=set_pressure ; getter=get_pressure ; deprecated=This property is never set by the engine and is always `0`.

## Tutorials
- [Using InputEvent]($DOCS_URL/tutorials/inputs/inputevent.html)
