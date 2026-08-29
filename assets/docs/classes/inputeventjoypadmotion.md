# InputEventJoypadMotion

> class InputEventJoypadMotion ; keywords=gamepad, controller
> inherits InputEventJoypadMotion InputEvent

## Brief

Represents axis motions (such as joystick or analog triggers) from a gamepad.

## Description

Stores information about joystick motions. One `InputEventJoypadMotion` represents one axis at a time. For gamepad buttons, see `InputEventJoypadButton`.

## Properties

> property axis : JoyAxis ; default=0 ; setter=set_axis ; getter=get_axis

Axis identifier.

> property axis_value : float ; default=0.0 ; setter=set_axis_value ; getter=get_axis_value

Current position of the joystick on the given axis. The value ranges from `-1.0` to `1.0`. A value of `0` means the axis is in its resting position.

## Tutorials
- [Using InputEvent]($DOCS_URL/tutorials/inputs/inputevent.html)
