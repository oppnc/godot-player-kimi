# ButtonGroup

> class ButtonGroup ; keywords=radio
> inherits ButtonGroup Resource

## Brief

A group of buttons that doesn't allow more than one button to be pressed at a time.

## Description

A group of `BaseButton`-derived buttons. The buttons in a `ButtonGroup` are treated like radio buttons: No more than one button can be pressed at a time. Some types of buttons (such as `CheckBox`) may have a special appearance in this state.
Every member of a `ButtonGroup` should have `BaseButton.toggle_mode` set to `true`.

## Properties

> property allow_unpress : bool ; default=false ; setter=set_allow_unpress ; getter=is_allow_unpress

If `true`, it is possible to unpress all buttons in this `ButtonGroup`.

> property resource_local_to_scene : bool ; default=true ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

## Methods

> method get_buttons() -> Array[BaseButton]

Returns an `Array` of `Button`s who have this as their `ButtonGroup` (see `BaseButton.button_group`).

> method get_pressed_button() -> BaseButton

Returns the current pressed button.

## Signals

> signal pressed(button: BaseButton)

Emitted when one of the buttons of the group is pressed.
