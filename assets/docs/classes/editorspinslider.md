# EditorSpinSlider

> class EditorSpinSlider
> inherits EditorSpinSlider Range

## Brief

Godot editor's control for editing numeric values.

## Description

This `Control` node is used in the editor's Inspector dock to allow editing of numeric values. Can be used with `EditorInspectorPlugin` to recreate the same behavior.
If the `Range.step` value is `1`, the `EditorSpinSlider` will display up/down arrows, similar to `SpinBox`. If the `Range.step` value is not `1`, a slider will be displayed instead.

## Properties

> property control_state : ControlState ; default=0 ; setter=set_control_state ; getter=get_control_state

The state in which the control used to manipulate the value will be.

> property deferred_drag_mode : bool ; default=false ; setter=set_deferred_drag_mode_enabled ; getter=is_deferred_drag_mode_enabled

If `true`, changing via dragging is applied only at the end of the input (for example, when the user releases a mouse button).

> property editing_integer : bool ; default=false ; setter=set_editing_integer ; getter=is_editing_integer

If `true`, the `EditorSpinSlider` is considered to be editing an integer value. If `false`, the `EditorSpinSlider` is considered to be editing a floating-point value. This is used to determine whether a slider should be drawn by default. The slider is only drawn for floats; integers use up-down arrows similar to `SpinBox` instead, unless `control_state` is set to `CONTROL_STATE_PREFER_SLIDER`. It will also use `EditorSettings.interface/inspector/integer_drag_speed` instead of `EditorSettings.interface/inspector/float_drag_speed` if the slider is available.

> property flat : bool ; default=false ; setter=set_flat ; getter=is_flat

If `true`, the slider will not draw background.

> property focus_mode : Control.FocusMode ; default=2 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property hide_slider : bool ; default=false ; setter=set_hide_slider ; getter=is_hiding_slider ; deprecated=Use `control_state` instead.

If `true`, the slider and up/down arrows are hidden.

> property label : String ; default="" ; setter=set_label ; getter=get_label

The text that displays to the left of the value.

> property read_only : bool ; default=false ; setter=set_read_only ; getter=is_read_only

If `true`, the slider can't be interacted with.

> property size_flags_vertical : BitField[Control.SizeFlags] ; default=1 ; setter=set_v_size_flags ; getter=get_v_size_flags ; overrides=Control

> property step : float ; default=1.0 ; setter=set_step ; getter=get_step ; overrides=Range

> property suffix : String ; default="" ; setter=set_suffix ; getter=get_suffix

The suffix to display after the value (in a faded color). This should generally be a plural word. You may have to use an abbreviation if the suffix is too long to be displayed.

## Signals

> signal grabbed()

Emitted when the spinner/slider is grabbed.

> signal ungrabbed()

Emitted when the spinner/slider is ungrabbed.

> signal updown_pressed()

Emitted when the updown button is pressed.

> signal value_focus_entered()

Emitted when the value form gains focus.

> signal value_focus_exited()

Emitted when the value form loses focus.

## Enumerations

> enum ControlState

> enum_value ControlState.CONTROL_STATE_DEFAULT = 0

The type of control used will depend on the value of `editing_integer`. Up-down arrows if `true`, a slider if `false`.

> enum_value ControlState.CONTROL_STATE_PREFER_SLIDER = 1

A slider will always be used, even if `editing_integer` is enabled.

> enum_value ControlState.CONTROL_STATE_HIDE = 2

Neither the up-down arrows nor the slider will be shown.

## Theme Properties

> theme_property updown : Texture2D ; data=icon

Single texture representing both the up and down buttons.

> theme_property updown_disabled : Texture2D ; data=icon

Single texture representing both the up and down buttons, when the control is readonly or disabled.
