# CheckButton

> class CheckButton ; keywords=switch, toggle
> inherits CheckButton Button

## Brief

A button that represents a binary choice.

## Description

`CheckButton` is a toggle button displayed as a check field. It's similar to `CheckBox` in functionality, but it has a different appearance. To follow established UX patterns, it's recommended to use `CheckButton` when toggling it has an **immediate** effect on something. For example, it can be used when pressing it shows or hides advanced settings, without asking the user to confirm this action.
See also `BaseButton` which contains common properties and methods associated with this node.

## Properties

> property alignment : HorizontalAlignment ; default=0 ; setter=set_text_alignment ; getter=get_text_alignment ; overrides=Button

> property toggle_mode : bool ; default=true ; setter=set_toggle_mode ; getter=is_toggle_mode ; overrides=BaseButton

## Theme Properties

> theme_property button_checked_color : Color ; data=color ; default=Color(1, 1, 1, 1)

The color of the checked icon when the checkbox is pressed.

> theme_property button_unchecked_color : Color ; data=color ; default=Color(1, 1, 1, 1)

The color of the unchecked icon when the checkbox is not pressed.

> theme_property check_v_offset : int ; data=constant ; default=0

The vertical offset used when rendering the toggle icons (in pixels).

> theme_property checked : Texture2D ; data=icon

The icon to display when the `CheckButton` is checked (for left-to-right layouts).

> theme_property checked_disabled : Texture2D ; data=icon

The icon to display when the `CheckButton` is checked and disabled (for left-to-right layouts).

> theme_property checked_disabled_mirrored : Texture2D ; data=icon

The icon to display when the `CheckButton` is checked and disabled (for right-to-left layouts).

> theme_property checked_mirrored : Texture2D ; data=icon

The icon to display when the `CheckButton` is checked (for right-to-left layouts).

> theme_property unchecked : Texture2D ; data=icon

The icon to display when the `CheckButton` is unchecked (for left-to-right layouts).

> theme_property unchecked_disabled : Texture2D ; data=icon

The icon to display when the `CheckButton` is unchecked and disabled (for left-to-right layouts).

> theme_property unchecked_disabled_mirrored : Texture2D ; data=icon

The icon to display when the `CheckButton` is unchecked and disabled (for right-to-left layouts).

> theme_property unchecked_mirrored : Texture2D ; data=icon

The icon to display when the `CheckButton` is unchecked (for right-to-left layouts).
