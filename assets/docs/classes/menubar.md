# MenuBar

> class MenuBar
> inherits MenuBar Control

## Brief

A horizontal menu bar that creates a menu for each `PopupMenu` child.

## Description

A horizontal menu bar that creates a menu for each `PopupMenu` child. New items are created by adding `PopupMenu`s to this node. Item title is determined by `Window.title`, or node name if `Window.title` is empty. Item title can be overridden using `set_menu_title`.

## Properties

> property flat : bool ; default=false ; setter=set_flat ; getter=is_flat

Flat `MenuBar` don't display item decoration.

> property focus_mode : Control.FocusMode ; default=3 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property language : String ; default="" ; setter=set_language ; getter=get_language

Language code used for line-breaking and text shaping algorithms. If left empty, the current locale is used instead.

> property prefer_global_menu : bool ; default=true ; setter=set_prefer_global_menu ; getter=is_prefer_global_menu

If `true`, `MenuBar` will use system global menu when supported.
**Note:** If `true` and global menu is supported, this node is not displayed, has zero size, and all its child nodes except `PopupMenu`s are inaccessible.
**Note:** This property overrides the value of the `PopupMenu.prefer_native_menu` property of the child nodes.

> property start_index : int ; default=-1 ; setter=set_start_index ; getter=get_start_index

Position order in the global menu to insert `MenuBar` items at. All menu items in the `MenuBar` are always inserted as a continuous range. Menus with lower `start_index` are inserted first. Menus with `start_index` equal to `-1` are inserted last.

> property switch_on_hover : bool ; default=true ; setter=set_switch_on_hover ; getter=is_switch_on_hover

If `true`, when the cursor hovers above menu item, it will close the current `PopupMenu` and open the other one.

> property text_direction : Control.TextDirection ; default=0 ; setter=set_text_direction ; getter=get_text_direction

Base text writing direction.

## Methods

> method get_menu_count() -> int ; qualifiers=const

Returns number of menu items.

> method get_menu_popup(menu: int) -> PopupMenu ; qualifiers=const

Returns `PopupMenu` associated with menu item.

> method get_menu_title(menu: int) -> String ; qualifiers=const

Returns menu item title.

> method get_menu_tooltip(menu: int) -> String ; qualifiers=const

Returns menu item tooltip.

> method is_menu_disabled(menu: int) -> bool ; qualifiers=const

Returns `true` if the menu item is disabled.

> method is_menu_hidden(menu: int) -> bool ; qualifiers=const

Returns `true` if the menu item is hidden.

> method is_native_menu() -> bool ; qualifiers=const

Returns `true` if the current system's global menu is supported and used by this `MenuBar`.

> method set_disable_shortcuts(disabled: bool) -> void

If `true`, shortcuts are disabled and cannot be used to trigger the button.

> method set_menu_disabled(menu: int, disabled: bool) -> void

If `true`, menu item is disabled.

> method set_menu_hidden(menu: int, hidden: bool) -> void

If `true`, menu item is hidden.

> method set_menu_title(menu: int, title: String) -> void

Sets menu item title.

> method set_menu_tooltip(menu: int, tooltip: String) -> void

Sets menu item tooltip.

## Theme Properties

> theme_property font_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

Default text `Color` of the menu item.

> theme_property font_disabled_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 0.5)

Text `Color` used when the menu item is disabled.

> theme_property font_focus_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Text `Color` used when the menu item is focused. Only replaces the normal text color of the menu item. Disabled, hovered, and pressed states take precedence over this color.

> theme_property font_hover_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Text `Color` used when the menu item is being hovered.

> theme_property font_hover_pressed_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Text `Color` used when the menu item is being hovered and pressed.

> theme_property font_outline_color : Color ; data=color ; default=Color(0, 0, 0, 1)

The tint of text outline of the menu item.

> theme_property font_pressed_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Text `Color` used when the menu item is being pressed.

> theme_property h_separation : int ; data=constant ; default=4

The horizontal space between menu items.

> theme_property outline_size : int ; data=constant ; default=0

The size of the text outline.
**Note:** If using a font with `FontFile.multichannel_signed_distance_field` enabled, its `FontFile.msdf_pixel_range` must be set to at least *twice* the value of `outline_size` for outline rendering to look correct. Otherwise, the outline may appear to be cut off earlier than intended.

> theme_property font : Font ; data=font

`Font` of the menu item's text.

> theme_property font_size : int ; data=font_size

Font size of the menu item's text.

> theme_property disabled : StyleBox ; data=style

`StyleBox` used when the menu item is disabled.

> theme_property disabled_mirrored : StyleBox ; data=style

`StyleBox` used when the menu item is disabled (for right-to-left layouts).

> theme_property hover : StyleBox ; data=style

`StyleBox` used when the menu item is being hovered.

> theme_property hover_mirrored : StyleBox ; data=style

`StyleBox` used when the menu item is being hovered (for right-to-left layouts).

> theme_property hover_pressed : StyleBox ; data=style

`StyleBox` used when the menu item is being pressed and hovered at the same time.

> theme_property hover_pressed_mirrored : StyleBox ; data=style

`StyleBox` used when the menu item is being pressed and hovered at the same time (for right-to-left layouts).

> theme_property normal : StyleBox ; data=style

Default `StyleBox` for the menu item.

> theme_property normal_mirrored : StyleBox ; data=style

Default `StyleBox` for the menu item (for right-to-left layouts).

> theme_property pressed : StyleBox ; data=style

`StyleBox` used when the menu item is being pressed.

> theme_property pressed_mirrored : StyleBox ; data=style

`StyleBox` used when the menu item is being pressed (for right-to-left layouts).
