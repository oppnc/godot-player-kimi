# MenuButton

> class MenuButton ; keywords=dropdown
> inherits MenuButton Button

## Brief

A button that brings up a `PopupMenu` when clicked.

## Description

A button that brings up a `PopupMenu` when clicked. To create new items inside this `PopupMenu`, use `get_popup().add_item("My Item Name")`. You can also create them directly from Godot editor's inspector.
See also `BaseButton` which contains common properties and methods associated with this node.

## Properties

> property action_mode : BaseButton.ActionMode ; default=0 ; setter=set_action_mode ; getter=get_action_mode ; overrides=BaseButton

> property flat : bool ; default=true ; setter=set_flat ; getter=is_flat ; overrides=Button

> property focus_mode : Control.FocusMode ; default=3 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property item_count : int ; default=0 ; setter=set_item_count ; getter=get_item_count

The number of items currently in the list.

> property popup/item_{index}/checkable : int ; default=0

The checkable item type of the item at `index`.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property popup/item_{index}/checked : bool ; default=false

If `true`, the item at `index` is checked.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property popup/item_{index}/disabled : bool ; default=false

If `true`, the item at `index` is disabled.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property popup/item_{index}/icon : Texture2D

The icon of the item at `index`.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property popup/item_{index}/id : int ; default=0

The ID of the item at `index`.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property popup/item_{index}/separator : bool ; default=false

If `true`, the item at `index` is a separator.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property popup/item_{index}/text : String ; default=""

The text of the item at `index`.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property switch_on_hover : bool ; default=false ; setter=set_switch_on_hover ; getter=is_switch_on_hover

If `true`, when the cursor hovers above another `MenuButton` within the same parent which also has `switch_on_hover` enabled, it will close the current `MenuButton` and open the other one.

> property toggle_mode : bool ; default=true ; setter=set_toggle_mode ; getter=is_toggle_mode ; overrides=BaseButton

## Methods

> method get_popup() -> PopupMenu ; qualifiers=const

Returns the `PopupMenu` contained in this button.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `Window.visible` property.

> method set_disable_shortcuts(disabled: bool) -> void

If `true`, shortcuts are disabled and cannot be used to trigger the button.

> method show_popup() -> void

Adjusts popup position and sizing for the `MenuButton`, then shows the `PopupMenu`. Prefer this over using `get_popup().popup()`.

## Signals

> signal about_to_popup()

Emitted when the `PopupMenu` of this MenuButton is about to show.
