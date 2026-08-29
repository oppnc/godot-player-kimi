# OptionButton

> class OptionButton ; keywords=select, dropdown
> inherits OptionButton Button

## Brief

A button that brings up a dropdown with selectable options when pressed.

## Description

`OptionButton` is a type of button that brings up a dropdown with selectable items when pressed. The item selected becomes the "current" item and is displayed as the button text.
See also `BaseButton` which contains common properties and methods associated with this node.
**Note:** The IDs used for items are limited to signed 32-bit integers, not the full 64 bits of `int`. These have a range of `-2^31` to `2^31 - 1`, that is, `-2147483648` to `2147483647`.
**Note:** The `Button.text` and `Button.icon` properties are set automatically based on the selected item. They shouldn't be changed manually.

## Properties

> property action_mode : BaseButton.ActionMode ; default=0 ; setter=set_action_mode ; getter=get_action_mode ; overrides=BaseButton

> property alignment : HorizontalAlignment ; default=0 ; setter=set_text_alignment ; getter=get_text_alignment ; overrides=Button

> property allow_reselect : bool ; default=false ; setter=set_allow_reselect ; getter=get_allow_reselect

If `true`, the currently selected item can be selected again.

> property fit_to_longest_item : bool ; default=true ; setter=set_fit_to_longest_item ; getter=is_fit_to_longest_item

If `true`, minimum size will be determined by the longest item's width, instead of the currently selected one's. It will also take the popup's margins into account, making the button match its total width.
**Note:** For performance reasons, the minimum size doesn't update immediately when adding, removing or modifying items.

> property item_count : int ; default=0 ; setter=set_item_count ; getter=get_item_count

The number of items to select from.

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

> property search_bar_enabled : bool ; default=false ; setter=set_search_bar_enabled ; getter=is_search_bar_enabled

If `true`, shows a search bar at the top of the `PopupMenu` for filtering items. See `search_bar_min_item_count` for dynamically controlling its visibility based on the number of items.

> property search_bar_fuzzy_search_enabled : bool ; default=true ; setter=set_search_bar_fuzzy_search_enabled ; getter=is_search_bar_fuzzy_search_enabled

If `true`, enables fuzzy searching in the `PopupMenu` search bar. This allows the search results to include items that almost match the search query, as well items that match the individual characters of the search query, but not in sequence.
Use `search_bar_fuzzy_search_max_misses` to set the maximum number of mismatches allowed in the search results.

> property search_bar_fuzzy_search_max_misses : int ; default=2 ; setter=set_search_bar_fuzzy_search_max_misses ; getter=get_search_bar_fuzzy_search_max_misses

Sets the maximum number of mismatches allowed in each search result when fuzzy searching is enabled for the `PopupMenu` search bar. Any item with more mismatches will be hidden from the search results.

> property search_bar_min_item_count : int ; default=0 ; setter=set_search_bar_min_item_count ; getter=get_search_bar_min_item_count

Sets the minimum number of items required for the `PopupMenu` search bar to be visible. `search_bar_enabled` must be `true` for this to have any effect.

> property selected : int ; default=-1 ; setter=_select_int ; getter=get_selected

The index of the currently selected item, or `-1` if no item is selected.

> property toggle_mode : bool ; default=true ; setter=set_toggle_mode ; getter=is_toggle_mode ; overrides=BaseButton

## Methods

> method add_icon_item(texture: Texture2D, label: String, id: int = -1) -> void

Adds an item, with a `texture` icon, text `label` and (optionally) `id`. If no `id` is passed, the item index will be used as the item's ID. New items are appended at the end.
**Note:** The item will be selected if there are no other items.

> method add_item(label: String, id: int = -1) -> void

Adds an item, with text `label` and (optionally) `id`. If no `id` is passed, the item index will be used as the item's ID. New items are appended at the end.
**Note:** The item will be selected if there are no other items.

> method add_separator(text: String = "") -> void

Adds a separator to the list of items. Separators help to group items, and can optionally be given a `text` header. A separator also gets an index assigned, and is appended at the end of the item list.

> method clear() -> void

Clears all the items in the `OptionButton`.

> method get_item_auto_translate_mode(idx: int) -> Node.AutoTranslateMode ; qualifiers=const

Returns the auto translate mode of the item at index `idx`.

> method get_item_icon(idx: int) -> Texture2D ; qualifiers=const

Returns the icon of the item at index `idx`.

> method get_item_id(idx: int) -> int ; qualifiers=const

Returns the ID of the item at index `idx`.

> method get_item_index(id: int) -> int ; qualifiers=const

Returns the index of the item with the given `id`.

> method get_item_metadata(idx: int) -> Variant ; qualifiers=const

Retrieves the metadata of an item. Metadata may be any type and can be used to store extra information about an item, such as an external string ID.

> method get_item_text(idx: int) -> String ; qualifiers=const

Returns the text of the item at index `idx`.

> method get_item_tooltip(idx: int) -> String ; qualifiers=const

Returns the tooltip of the item at index `idx`.

> method get_popup() -> PopupMenu ; qualifiers=const

Returns the `PopupMenu` contained in this button.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `Window.visible` property.

> method get_selectable_item(from_last: bool = false) -> int ; qualifiers=const

Returns the index of the first item which is not disabled, or marked as a separator. If `from_last` is `true`, the items will be searched in reverse order.
Returns `-1` if no item is found.

> method get_selected_id() -> int ; qualifiers=const

Returns the ID of the selected item, or `-1` if no item is selected.

> method get_selected_metadata() -> Variant ; qualifiers=const

Gets the metadata of the selected item. Metadata for items can be set using `set_item_metadata`.

> method has_selectable_items() -> bool ; qualifiers=const

Returns `true` if this button contains at least one item which is not disabled, or marked as a separator.

> method is_item_disabled(idx: int) -> bool ; qualifiers=const

Returns `true` if the item at index `idx` is disabled.

> method is_item_separator(idx: int) -> bool ; qualifiers=const

Returns `true` if the item at index `idx` is marked as a separator.

> method remove_item(idx: int) -> void

Removes the item at index `idx`.

> method select(idx: int) -> void

Selects an item by index and makes it the current item. This will work even if the item is disabled.
Passing `-1` as the index deselects any currently selected item.

> method set_disable_shortcuts(disabled: bool) -> void

If `true`, shortcuts are disabled and cannot be used to trigger the button.

> method set_item_auto_translate_mode(idx: int, mode: Node.AutoTranslateMode) -> void

Sets the auto translate mode of the item at index `idx`.
Items use `Node.AUTO_TRANSLATE_MODE_INHERIT` by default, which uses the same auto translate mode as the `OptionButton` itself.

> method set_item_disabled(idx: int, disabled: bool) -> void

Sets whether the item at index `idx` is disabled.
Disabled items are drawn differently in the dropdown and are not selectable by the user. If the current selected item is set as disabled, it will remain selected.

> method set_item_icon(idx: int, texture: Texture2D) -> void

Sets the icon of the item at index `idx`.

> method set_item_id(idx: int, id: int) -> void

Sets the ID of the item at index `idx`.

> method set_item_metadata(idx: int, metadata: Variant) -> void

Sets the metadata of an item. Metadata may be of any type and can be used to store extra information about an item, such as an external string ID.

> method set_item_text(idx: int, text: String) -> void

Sets the text of the item at index `idx`.

> method set_item_tooltip(idx: int, tooltip: String) -> void

Sets the tooltip of the item at index `idx`.

> method show_popup() -> void

Adjusts popup position and sizing for the `OptionButton`, then shows the `PopupMenu`. Prefer this over using `get_popup().popup()`.

## Signals

> signal item_focused(index: int)

Emitted when the user navigates to an item using the `ProjectSettings.input/ui_up` or `ProjectSettings.input/ui_down` input actions. The index of the item focused is passed as argument.

> signal item_selected(index: int)

Emitted when the current item has been changed by the user. The index of the item selected is passed as argument.
`allow_reselect` must be enabled to reselect an item.

## Theme Properties

> theme_property arrow_margin : int ; data=constant ; default=4

The horizontal space between the arrow icon and the right edge of the button.

> theme_property modulate_arrow : int ; data=constant ; default=0

If different than `0`, the arrow icon will be modulated to the font color.

> theme_property arrow : Texture2D ; data=icon

The arrow icon to be drawn on the right end of the button.
