# VirtualJoystick

> class VirtualJoystick
> inherits VirtualJoystick Control

## Brief

A virtual joystick control for touchscreen devices.

## Description

A customizable on-screen joystick control designed for touchscreen devices. It allows users to provide directional input by dragging a virtual tip within a defined circular area.
This control can simulate directional actions (see `action_up`, `action_down`, `action_left`, and `action_right`), which are triggered when the joystick is moved in the corresponding directions.

## Properties

> property action_down : StringName ; default=&"ui_down" ; setter=set_action_down ; getter=get_action_down

The action to trigger when the joystick is moved down.

> property action_left : StringName ; default=&"ui_left" ; setter=set_action_left ; getter=get_action_left

The action to trigger when the joystick is moved left.

> property action_right : StringName ; default=&"ui_right" ; setter=set_action_right ; getter=get_action_right

The action to trigger when the joystick is moved right.

> property action_up : StringName ; default=&"ui_up" ; setter=set_action_up ; getter=get_action_up

The action to trigger when the joystick is moved up.

> property clampzone_ratio : float ; default=1.0 ; setter=set_clampzone_ratio ; getter=get_clampzone_ratio

The multiplier applied to the joystick's radius that defines the clamp zone.
This zone limits how far the joystick tip can move from its center before being clamped.
A value of `1.0` means the tip can move up to the edge of the joystick's visual size.
In `JOYSTICK_FOLLOWING` mode, this radius also determines how far the finger can move before the joystick base starts following the touch input.

> property deadzone_ratio : float ; default=0.0 ; setter=set_deadzone_ratio ; getter=get_deadzone_ratio

The ratio of the joystick size that defines the joystick deadzone. The joystick tip must move beyond this ratio before being considered active.
This deadzone is applied before triggering input actions and affects the joystick's input vector and all related signals.
Note that input actions may also define their own deadzones in the InputMap. If both are set, the joystick deadzone is applied first, followed by the action's deadzone.
By default, this value is `0.0`, meaning the joystick does not apply its own deadzone and relies entirely on the InputMap action deadzones.

> property initial_offset_ratio : Vector2 ; default=Vector2(0.5, 0.5) ; setter=set_initial_offset_ratio ; getter=get_initial_offset_ratio

The initial position of the joystick as a ratio of the control's size. `(0, 0)` is top-left and `(1, 1)` is bottom-right.

> property joystick_mode : JoystickMode ; default=0 ; setter=set_joystick_mode ; getter=get_joystick_mode

The joystick mode to use.

> property joystick_size : float ; default=100.0 ; setter=set_joystick_size ; getter=get_joystick_size

The size of the joystick in pixels.

> property tip_size : float ; default=50.0 ; setter=set_tip_size ; getter=get_tip_size

The size of the joystick tip in pixels.

> property visibility_mode : VisibilityMode ; default=0 ; setter=set_visibility_mode ; getter=get_visibility_mode

The visibility mode to use.

## Signals

> signal flick_canceled()

Emitted when the tip enters the deadzone after being outside of it.

> signal flicked(input_vector: Vector2)

Emitted when the tip moved outside the deadzone and the joystick is released. The `input_vector` contains the last input direction and strength before release. Its length is between `0.0` and `1.0`.

> signal pressed()

Emitted when the joystick is pressed.

> signal released(input_vector: Vector2)

Emitted when the joystick is released. The `input_vector` is the final input direction and strength, with a length between `0.0` and `1.0`.

> signal tapped()

Emitted when the joystick is released without moving the tip.

## Enumerations

> enum JoystickMode

> enum_value JoystickMode.JOYSTICK_FIXED = 0

The joystick doesn't move.

> enum_value JoystickMode.JOYSTICK_DYNAMIC = 1

The joystick is moved to the initial touch position as long as it's within the joystick's bounds. It moves back to its original position when released.

> enum_value JoystickMode.JOYSTICK_FOLLOWING = 2

The joystick is moved to the initial touch position as long as it's within the joystick's bounds. It will follow the touch input if it goes outside the joystick's range. It moves back to its original position when released.

> enum VisibilityMode

> enum_value VisibilityMode.VISIBILITY_ALWAYS = 0

The joystick is always visible.

> enum_value VisibilityMode.VISIBILITY_WHEN_TOUCHED = 1

The joystick is only visible when being touched.

## Theme Properties

> theme_property normal_joystick : StyleBox ; data=style

Base joystick `StyleBox`.

> theme_property normal_tip : StyleBox ; data=style

Tip joystick `StyleBox`.

> theme_property pressed_joystick : StyleBox ; data=style

Base joystick `StyleBox` when pressed.

> theme_property pressed_tip : StyleBox ; data=style

Tip joystick `StyleBox` when pressed.
