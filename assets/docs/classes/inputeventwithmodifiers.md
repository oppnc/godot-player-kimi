# InputEventWithModifiers

> class InputEventWithModifiers
> inherits InputEventWithModifiers InputEventFromWindow

## Brief

Abstract base class for input events affected by modifier keys like `Shift` and `Alt`.

## Description

Stores information about mouse, keyboard, and touch gesture input events. This includes information about which modifier keys are pressed, such as `Shift` or `Alt`. See `Node._input`.
**Note:** Modifier keys are considered modifiers only when used in combination with another key. As a result, their corresponding member variables, such as `ctrl_pressed`, will return `false` if the key is pressed on its own.

## Properties

> property alt_pressed : bool ; default=false ; setter=set_alt_pressed ; getter=is_alt_pressed

State of the `Alt` modifier.

> property command_or_control_autoremap : bool ; default=false ; setter=set_command_or_control_autoremap ; getter=is_command_or_control_autoremap

Automatically use `Meta` (`Cmd`) on macOS and `Ctrl` on other platforms. If `true`, `ctrl_pressed` and `meta_pressed` cannot be set.

> property ctrl_pressed : bool ; default=false ; setter=set_ctrl_pressed ; getter=is_ctrl_pressed

State of the `Ctrl` modifier.

> property device : int ; default=16 ; setter=set_device ; getter=get_device ; overrides=InputEvent

> property meta_pressed : bool ; default=false ; setter=set_meta_pressed ; getter=is_meta_pressed

State of the `Meta` modifier. On Windows and Linux, this represents the Windows key (sometimes called "meta" or "super" on Linux). On macOS, this represents the Command key.

> property shift_pressed : bool ; default=false ; setter=set_shift_pressed ; getter=is_shift_pressed

State of the `Shift` modifier.

## Methods

> method get_modifiers_mask() -> BitField[KeyModifierMask] ; qualifiers=const

Returns the keycode combination of modifier keys.

> method is_command_or_control_pressed() -> bool ; qualifiers=const

On macOS, returns `true` if `Meta` (`Cmd`) is pressed.
On other platforms, returns `true` if `Ctrl` is pressed.

## Tutorials
- [Using InputEvent]($DOCS_URL/tutorials/inputs/inputevent.html)
