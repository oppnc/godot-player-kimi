# BaseButton

> class BaseButton
> inherits BaseButton Control

## Brief

Abstract base class for GUI buttons.

## Description

`BaseButton` is an abstract base class for GUI buttons. It doesn't display anything by itself.

## Properties

> property action_mode : ActionMode ; default=1 ; setter=set_action_mode ; getter=get_action_mode

Determines when the button is considered clicked.

> property button_group : ButtonGroup ; setter=set_button_group ; getter=get_button_group

The `ButtonGroup` associated with the button. Not to be confused with node groups.
**Note:** The button will be configured as a radio button if a `ButtonGroup` is assigned to it.

> property button_mask : BitField[MouseButtonMask] ; default=1 ; setter=set_button_mask ; getter=get_button_mask

Binary mask to choose which mouse buttons this button will respond to.
To allow both left-click and right-click, use `MOUSE_BUTTON_MASK_LEFT | MOUSE_BUTTON_MASK_RIGHT`.

> property button_pressed : bool ; default=false ; setter=set_pressed ; getter=is_pressed

If `true`, the button's state is pressed. Means the button is pressed down or toggled (if `toggle_mode` is active). Only works if `toggle_mode` is `true`.
**Note:** Changing the value of `button_pressed` will result in `toggled` to be emitted. If you want to change the pressed state without emitting that signal, use `set_pressed_no_signal`.

> property disabled : bool ; default=false ; setter=set_disabled ; getter=is_disabled

If `true`, the button is in disabled state and can't be clicked or toggled.
**Note:** If the button is disabled while held down, `button_up` will be emitted.

> property focus_mode : Control.FocusMode ; default=2 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property keep_pressed_outside : bool ; default=false ; setter=set_keep_pressed_outside ; getter=is_keep_pressed_outside

If `true`, the button stays pressed when moving the cursor outside the button while pressing it.
**Note:** This property only affects the button's visual appearance. Signals will be emitted at the same moment regardless of this property's value.

> property shortcut : Shortcut ; setter=set_shortcut ; getter=get_shortcut

`Shortcut` associated to the button.

> property shortcut_feedback : bool ; default=true ; setter=set_shortcut_feedback ; getter=is_shortcut_feedback

If `true`, the button will highlight for a short amount of time when its shortcut is activated. If `false` and `toggle_mode` is `false`, the shortcut will activate without any visual feedback.

> property shortcut_in_tooltip : bool ; default=true ; setter=set_shortcut_in_tooltip ; getter=is_shortcut_in_tooltip_enabled

If `true`, the button will add information about its shortcut in the tooltip. This includes the shortcut's events and its `Resource.resource_name`. If both events and name are empty, the shortcut will not be included.
**Note:** This property does nothing when the tooltip control is customized using `Control._make_custom_tooltip`.

> property toggle_mode : bool ; default=false ; setter=set_toggle_mode ; getter=is_toggle_mode

If `true`, the button is in toggle mode. Makes the button flip state between pressed and unpressed each time its area is clicked.

## Methods

> method _pressed() -> void ; qualifiers=virtual

Called when the button is pressed. If you need to know the button's pressed state (and `toggle_mode` is active), use `_toggled` instead.

> method _toggled(toggled_on: bool) -> void ; qualifiers=virtual

Called when the button is toggled (only if `toggle_mode` is active).

> method get_draw_mode() -> DrawMode ; qualifiers=const

Returns the visual state used to draw the button. This is useful mainly when implementing your own draw code by either overriding _draw() or connecting to "draw" signal. The visual state of the button is defined by the `DrawMode` enum.

> method is_hovered() -> bool ; qualifiers=const

Returns `true` if the mouse has entered the button and has not left it yet.

> method set_pressed_no_signal(pressed: bool) -> void

Changes the `button_pressed` state of the button, without emitting `toggled`. Use when you just want to change the state of the button without sending the pressed event (e.g. when initializing scene). Only works if `toggle_mode` is `true`.
**Note:** This method doesn't unpress other buttons in `button_group`.

## Signals

> signal button_down()

Emitted when the button starts being held down.

> signal button_up()

Emitted when the button stops being held down.

> signal pressed()

Emitted when the button is toggled or pressed. This is on `button_down` if `action_mode` is `ACTION_MODE_BUTTON_PRESS` and on `button_up` otherwise.
If you need to know the button's pressed state (and `toggle_mode` is active), use `toggled` instead.

> signal toggled(toggled_on: bool)

Emitted when the button was just toggled between pressed and normal states (only if `toggle_mode` is active). The new state is contained in the `toggled_on` argument.

## Enumerations

> enum ActionMode

> enum_value ActionMode.ACTION_MODE_BUTTON_PRESS = 0

Require just a press to consider the button clicked.

> enum_value ActionMode.ACTION_MODE_BUTTON_RELEASE = 1

Require a press and a subsequent release before considering the button clicked.

> enum DrawMode

> enum_value DrawMode.DRAW_NORMAL = 0

The normal state (i.e. not pressed, not hovered, not toggled and enabled) of buttons.

> enum_value DrawMode.DRAW_PRESSED = 1

The state of buttons are pressed.

> enum_value DrawMode.DRAW_HOVER = 2

The state of buttons are hovered.

> enum_value DrawMode.DRAW_DISABLED = 3

The state of buttons are disabled.

> enum_value DrawMode.DRAW_HOVER_PRESSED = 4

The state of buttons are both hovered and pressed.
