# CheckBox

> class CheckBox
> inherits CheckBox Button

## Brief

A button that represents a binary choice.

## Description

`CheckBox` allows the user to choose one of only two possible options. It's similar to `CheckButton` in functionality, but it has a different appearance. To follow established UX patterns, it's recommended to use `CheckBox` when toggling it has **no** immediate effect on something. For example, it could be used when toggling it will only do something once a confirmation button is pressed.
See also `BaseButton` which contains common properties and methods associated with this node.
When `BaseButton.button_group` specifies a `ButtonGroup`, `CheckBox` changes its appearance to that of a radio button and uses the various `radio_*` theme properties.

## Properties

> property alignment : HorizontalAlignment ; default=0 ; setter=set_text_alignment ; getter=get_text_alignment ; overrides=Button

> property toggle_mode : bool ; default=true ; setter=set_toggle_mode ; getter=is_toggle_mode ; overrides=BaseButton

## Theme Properties

> theme_property checkbox_checked_color : Color ; data=color ; default=Color(1, 1, 1, 1)

The color of the checked icon when the checkbox is pressed.

> theme_property checkbox_unchecked_color : Color ; data=color ; default=Color(1, 1, 1, 1)

The color of the unchecked icon when the checkbox is not pressed.

> theme_property check_v_offset : int ; data=constant ; default=0

The vertical offset used when rendering the check icons (in pixels).

> theme_property checked : Texture2D ; data=icon

The check icon to display when the `CheckBox` is checked.

> theme_property checked_disabled : Texture2D ; data=icon

The check icon to display when the `CheckBox` is checked and is disabled.

> theme_property radio_checked : Texture2D ; data=icon

The check icon to display when the `CheckBox` is configured as a radio button and is checked.

> theme_property radio_checked_disabled : Texture2D ; data=icon

The check icon to display when the `CheckBox` is configured as a radio button, is disabled, and is unchecked.

> theme_property radio_unchecked : Texture2D ; data=icon

The check icon to display when the `CheckBox` is configured as a radio button and is unchecked.

> theme_property radio_unchecked_disabled : Texture2D ; data=icon

The check icon to display when the `CheckBox` is configured as a radio button, is disabled, and is unchecked.

> theme_property unchecked : Texture2D ; data=icon

The check icon to display when the `CheckBox` is unchecked.

> theme_property unchecked_disabled : Texture2D ; data=icon

The check icon to display when the `CheckBox` is unchecked and is disabled.
