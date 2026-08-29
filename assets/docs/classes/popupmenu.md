# PopupMenu

> class PopupMenu
> inherits PopupMenu Popup

## Brief

A modal window used to display a list of options.

## Description

`PopupMenu` is a modal window used to display a list of options. Useful for toolbars and context menus.
The size of a `PopupMenu` can be limited by using `Window.max_size`. If the height of the list of items is larger than the maximum height of the `PopupMenu`, a `ScrollContainer` within the popup will allow the user to scroll the contents. If no maximum size is set, or if it is set to `0`, the `PopupMenu` height will be limited by its parent rect.
All `set_*` methods allow negative item indices, i.e. `-1` to access the last item, `-2` to select the second-to-last item, and so on.
**Incremental search:** Like `ItemList` and `Tree`, `PopupMenu` supports searching within the list while the control is focused. Press a key that matches the first letter of an item's name to select the first item starting with the given letter. After that point, there are two ways to perform incremental search: 1) Press the same key again before the timeout duration to select the next item starting with the same letter. 2) Press letter keys that match the rest of the word before the timeout duration to match to select the item in question directly. Both of these actions will be reset to the beginning of the list if the timeout duration has passed since the last keystroke was registered. You can adjust the timeout duration by changing `ProjectSettings.gui/timers/incremental_search_max_interval_msec`.
**Note:** `PopupMenu` is invisible by default. To make it visible, call one of the `popup_*` methods from `Window` on the node, such as `Window.popup_centered_clamped`.
**Note:** The ID values used for items are limited to 32 bits, not full 64 bits of `int`. This has a range of `-2^32` to `2^32 - 1`, i.e. `-2147483648` to `2147483647`.

## Properties

> property allow_search : bool ; default=true ; setter=set_allow_search ; getter=get_allow_search

If `true`, allows navigating `PopupMenu` with letter keys.

> property canvas_item_default_texture_filter : Viewport.DefaultCanvasItemTextureFilter ; default=4 ; setter=set_default_canvas_item_texture_filter ; getter=get_default_canvas_item_texture_filter ; overrides=Viewport

> property canvas_item_default_texture_repeat : Viewport.DefaultCanvasItemTextureRepeat ; default=3 ; setter=set_default_canvas_item_texture_repeat ; getter=get_default_canvas_item_texture_repeat ; overrides=Viewport

> property hide_on_checkable_item_selection : bool ; default=true ; setter=set_hide_on_checkable_item_selection ; getter=is_hide_on_checkable_item_selection

If `true`, hides the `PopupMenu` when a checkbox or radio button is selected.

> property hide_on_item_selection : bool ; default=true ; setter=set_hide_on_item_selection ; getter=is_hide_on_item_selection

If `true`, hides the `PopupMenu` when an item is selected.

> property hide_on_state_item_selection : bool ; default=false ; setter=set_hide_on_state_item_selection ; getter=is_hide_on_state_item_selection

If `true`, hides the `PopupMenu` when a state item is selected.

> property item_count : int ; default=0 ; setter=set_item_count ; getter=get_item_count

The number of items currently in the list.

> property item_{index}/checkable : int ; default=0

The checkable item type of the item at `index`.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property item_{index}/checked : bool ; default=false

If `true`, the item at `index` is checked.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property item_{index}/disabled : bool ; default=false

If `true`, the item at `index` is disabled.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property item_{index}/icon : Texture2D

The icon of the item at `index`.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property item_{index}/id : int ; default=0

The ID of the item at `index`.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property item_{index}/separator : bool ; default=false

If `true`, the item at `index` is a separator.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property item_{index}/text : String ; default=""

The text of the item at `index`.
**Note:** `index` is a value in the `0 .. item_count - 1` range.

> property prefer_native_menu : bool ; default=false ; setter=set_prefer_native_menu ; getter=is_prefer_native_menu

If `true`, `MenuBar` will use native menu when supported.
**Note:** If `PopupMenu` is linked to `StatusIndicator`, `MenuBar`, or another `PopupMenu` item it can use native menu regardless of this property, use `is_native_menu` to check it.

> property search_bar_enabled : bool ; default=false ; setter=set_search_bar_enabled ; getter=is_search_bar_enabled

If `true`, shows a search bar at the top of the `PopupMenu` for filtering items. See `search_bar_min_item_count` for dynamically controlling its visibility based on the number of items.
**Note:** When enabled, `allow_search` is ignored.

> property search_bar_fuzzy_search_enabled : bool ; default=true ; setter=set_search_bar_fuzzy_search_enabled ; getter=is_search_bar_fuzzy_search_enabled

If `true`, enables fuzzy searching in the `PopupMenu` search bar. This allows the search results to include items that almost match the search query, as well items that match the individual characters of the search query, but not in sequence.
Use `search_bar_fuzzy_search_max_misses` to set the maximum number of mismatches allowed in the search results.

> property search_bar_fuzzy_search_max_misses : int ; default=2 ; setter=set_search_bar_fuzzy_search_max_misses ; getter=get_search_bar_fuzzy_search_max_misses

Sets the maximum number of mismatches allowed in each search result when fuzzy searching is enabled for the `PopupMenu` search bar. Any item with more mismatches will be hidden from the search results.

> property search_bar_min_item_count : int ; default=0 ; setter=set_search_bar_min_item_count ; getter=get_search_bar_min_item_count

Sets the minimum number of items required for the search bar to be visible. `search_bar_enabled` must be `true` for this to have any effect. Separator items are not counted.

> property shrink_height : bool ; default=true ; setter=set_shrink_height ; getter=get_shrink_height

If `true`, shrinks `PopupMenu` to minimum height when it's shown.

> property shrink_width : bool ; default=true ; setter=set_shrink_width ; getter=get_shrink_width

If `true`, shrinks `PopupMenu` to minimum width when it's shown.

> property submenu_popup_delay : float ; default=0.2 ; setter=set_submenu_popup_delay ; getter=get_submenu_popup_delay

Sets the delay time in seconds for the submenu item to popup on mouse hovering. If the popup menu is added as a child of another (acting as a submenu), it will inherit the delay time of the parent menu item.
**Note:** If the mouse is exiting a submenu item with an open submenu and enters a different submenu item, the submenu popup delay time is affected by the direction of the mouse movement toward the open submenu. If the mouse is moving toward the submenu, the open submenu will wait approximately `0.5` seconds before closing, which then allows the hovered submenu item to open. This additional delay allows the mouse time to move to the open submenu across other menu items without prematurely closing. If the mouse is not moving toward the open submenu, for example in a downward direction, the open submenu will close immediately.

> property system_menu_id : NativeMenu.SystemMenus ; default=0 ; setter=set_system_menu ; getter=get_system_menu

If set to one of the values of `NativeMenu.SystemMenus`, this `PopupMenu` is bound to the special system menu. Only one `PopupMenu` can be bound to each special menu at a time.

> property transparent : bool ; default=true ; setter=set_flag ; getter=get_flag ; overrides=Window

> property transparent_bg : bool ; default=true ; setter=set_transparent_background ; getter=has_transparent_background ; overrides=Viewport

## Methods

> method activate_item_by_event(event: InputEvent, for_global_only: bool = false) -> bool

Checks the provided `event` against the `PopupMenu`'s shortcuts and accelerators, and activates the first item with matching events. If `for_global_only` is `true`, only shortcuts and accelerators with `global` set to `true` will be called.
Returns `true` if an item was successfully activated.
**Note:** Certain `Control`s, such as `MenuButton`, will call this method automatically.

> method add_check_item(label: String, id: int = -1, accel: Key = 0) -> void

Adds a new checkable item with text `label`.
An `id` can optionally be provided, as well as an accelerator (`accel`). If no `id` is provided, one will be created from the index. If no `accel` is provided, then the default value of 0 (corresponding to `@GlobalScope.KEY_NONE`) will be assigned to the item (which means it won't have any accelerator). See `get_item_accelerator` for more info on accelerators.
**Note:** Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See `set_item_checked` for more info on how to control it.

> method add_check_shortcut(shortcut: Shortcut, id: int = -1, global: bool = false) -> void

Adds a new checkable item and assigns the specified `Shortcut` to it. Sets the label of the checkbox to the `Shortcut`'s name.
An `id` can optionally be provided. If no `id` is provided, one will be created from the index.
**Note:** Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See `set_item_checked` for more info on how to control it.

> method add_icon_check_item(texture: Texture2D, label: String, id: int = -1, accel: Key = 0) -> void

Adds a new checkable item with text `label` and icon `texture`.
An `id` can optionally be provided, as well as an accelerator (`accel`). If no `id` is provided, one will be created from the index. If no `accel` is provided, then the default value of 0 (corresponding to `@GlobalScope.KEY_NONE`) will be assigned to the item (which means it won't have any accelerator). See `get_item_accelerator` for more info on accelerators.
**Note:** Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See `set_item_checked` for more info on how to control it.

> method add_icon_check_shortcut(texture: Texture2D, shortcut: Shortcut, id: int = -1, global: bool = false) -> void

Adds a new checkable item and assigns the specified `Shortcut` and icon `texture` to it. Sets the label of the checkbox to the `Shortcut`'s name.
An `id` can optionally be provided. If no `id` is provided, one will be created from the index.
**Note:** Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See `set_item_checked` for more info on how to control it.

> method add_icon_item(texture: Texture2D, label: String, id: int = -1, accel: Key = 0) -> void

Adds a new item with text `label` and icon `texture`.
An `id` can optionally be provided, as well as an accelerator (`accel`). If no `id` is provided, one will be created from the index. If no `accel` is provided, then the default value of 0 (corresponding to `@GlobalScope.KEY_NONE`) will be assigned to the item (which means it won't have any accelerator). See `get_item_accelerator` for more info on accelerators.

> method add_icon_radio_check_item(texture: Texture2D, label: String, id: int = -1, accel: Key = 0) -> void

Same as `add_icon_check_item`, but uses a radio check button.

> method add_icon_radio_check_shortcut(texture: Texture2D, shortcut: Shortcut, id: int = -1, global: bool = false) -> void

Same as `add_icon_check_shortcut`, but uses a radio check button.

> method add_icon_shortcut(texture: Texture2D, shortcut: Shortcut, id: int = -1, global: bool = false, allow_echo: bool = false) -> void

Adds a new item and assigns the specified `Shortcut` and icon `texture` to it. Sets the label of the checkbox to the `Shortcut`'s name.
An `id` can optionally be provided. If no `id` is provided, one will be created from the index.
If `allow_echo` is `true`, the shortcut can be activated with echo events.

> method add_item(label: String, id: int = -1, accel: Key = 0) -> void

Adds a new item with text `label`.
An `id` can optionally be provided, as well as an accelerator (`accel`). If no `id` is provided, one will be created from the index. If no `accel` is provided, then the default value of 0 (corresponding to `@GlobalScope.KEY_NONE`) will be assigned to the item (which means it won't have any accelerator). See `get_item_accelerator` for more info on accelerators.
**Note:** The provided `id` is used only in `id_pressed` and `id_focused` signals. It's not related to the `index` arguments in e.g. `set_item_checked`.

> method add_multistate_item(label: String, max_states: int, default_state: int = 0, id: int = -1, accel: Key = 0) -> void

Adds a new multistate item with text `label`.
Contrarily to normal binary items, multistate items can have more than two states, as defined by `max_states`. The default value is defined by `default_state`.
An `id` can optionally be provided, as well as an accelerator (`accel`). If no `id` is provided, one will be created from the index. If no `accel` is provided, then the default value of 0 (corresponding to `@GlobalScope.KEY_NONE`) will be assigned to the item (which means it won't have any accelerator). See `get_item_accelerator` for more info on accelerators.

```text
                func _ready():
                    add_multistate_item("Item", 3, 0)

                    index_pressed.connect(func(index: int):
                            toggle_item_multistate(index)
                            match get_item_multistate(index):
                                0:
                                    print("First state")
                                1:
                                    print("Second state")
                                2:
                                    print("Third state")
                        )

```

**Note:** Multistate items don't update their state automatically and must be done manually. See `toggle_item_multistate`, `set_item_multistate` and `get_item_multistate` for more info on how to control it.

> method add_radio_check_item(label: String, id: int = -1, accel: Key = 0) -> void

Adds a new radio check button with text `label`.
An `id` can optionally be provided, as well as an accelerator (`accel`). If no `id` is provided, one will be created from the index. If no `accel` is provided, then the default value of 0 (corresponding to `@GlobalScope.KEY_NONE`) will be assigned to the item (which means it won't have any accelerator). See `get_item_accelerator` for more info on accelerators.
**Note:** Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See `set_item_checked` for more info on how to control it.

> method add_radio_check_shortcut(shortcut: Shortcut, id: int = -1, global: bool = false) -> void

Adds a new radio check button and assigns a `Shortcut` to it. Sets the label of the checkbox to the `Shortcut`'s name.
An `id` can optionally be provided. If no `id` is provided, one will be created from the index.
**Note:** Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See `set_item_checked` for more info on how to control it.

> method add_separator(label: String = "", id: int = -1) -> void

Adds a separator between items. Separators also occupy an index, which you can set by using the `id` parameter.
A `label` can optionally be provided, which will appear at the center of the separator.

> method add_shortcut(shortcut: Shortcut, id: int = -1, global: bool = false, allow_echo: bool = false) -> void

Adds a `Shortcut`.
An `id` can optionally be provided. If no `id` is provided, one will be created from the index.
If `allow_echo` is `true`, the shortcut can be activated with echo events.

> method add_submenu_item(label: String, submenu: String, id: int = -1) -> void ; deprecated=Prefer using `add_submenu_node_item` instead.

Adds an item that will act as a submenu of the parent `PopupMenu` node when clicked. The `submenu` argument must be the name of an existing `PopupMenu` that has been added as a child to this node. This submenu will be shown when the item is clicked, hovered for long enough, or activated using the `ui_select` or `ui_right` input actions.
An `id` can optionally be provided. If no `id` is provided, one will be created from the index.

> method add_submenu_node_item(label: String, submenu: PopupMenu, id: int = -1) -> void

Adds an item that will act as a submenu of the parent `PopupMenu` node when clicked. This submenu will be shown when the item is clicked, hovered for long enough, or activated using the `ui_select` or `ui_right` input actions.
`submenu` must be either child of this `PopupMenu` or has no parent node (in which case it will be automatically added as a child). If the `submenu` popup has another parent, this method will fail.
An `id` can optionally be provided. If no `id` is provided, one will be created from the index.

> method clear(free_submenus: bool = false) -> void

Removes all items from the `PopupMenu`. If `free_submenus` is `true`, the submenu nodes are automatically freed.

> method get_focused_item() -> int ; qualifiers=const

Returns the index of the currently focused item. Returns `-1` if no item is focused.

> method get_item_accelerator(index: int) -> Key ; qualifiers=const

Returns the accelerator of the item at the given `index`. An accelerator is a keyboard shortcut that can be pressed to trigger the menu button even if it's not currently open. The return value is an integer which is generally a combination of `KeyModifierMask`s and `Key`s using bitwise OR such as `KEY_MASK_CTRL | KEY_A` (`Ctrl + A`). If no accelerator is defined for the specified `index`, `get_item_accelerator` returns `0` (corresponding to `@GlobalScope.KEY_NONE`).

> method get_item_auto_translate_mode(index: int) -> Node.AutoTranslateMode ; qualifiers=const

Returns the auto translate mode of the item at the given `index`.

> method get_item_icon(index: int) -> Texture2D ; qualifiers=const

Returns the icon of the item at the given `index`.

> method get_item_icon_max_width(index: int) -> int ; qualifiers=const

Returns the maximum allowed width of the icon for the item at the given `index`.

> method get_item_icon_modulate(index: int) -> Color ; qualifiers=const

Returns a `Color` modulating the item's icon at the given `index`.

> method get_item_id(index: int) -> int ; qualifiers=const

Returns the ID of the item at the given `index`.

> method get_item_indent(index: int) -> int ; qualifiers=const

Returns the horizontal offset of the item at the given `index`.

> method get_item_index(id: int) -> int ; qualifiers=const

Returns the index of the item containing the specified `id`. The index is automatically assigned to each item by the engine when added and represents the order items will be displayed.

> method get_item_language(index: int) -> String ; qualifiers=const

Returns item's text language code.

> method get_item_metadata(index: int) -> Variant ; qualifiers=const

Returns the metadata of the specified item, which might be of any type. You can set it with `set_item_metadata`, which provides a simple way of assigning context data to items.

> method get_item_multistate(index: int) -> int ; qualifiers=const

Returns the state of the item at the given `index`.

> method get_item_multistate_max(index: int) -> int ; qualifiers=const

Returns the max states of the item at the given `index`.

> method get_item_shortcut(index: int) -> Shortcut ; qualifiers=const

Returns the `Shortcut` associated with the item at the given `index`.

> method get_item_submenu(index: int) -> String ; qualifiers=const ; deprecated=Prefer using `get_item_submenu_node` instead.

Returns the submenu name of the item at the given `index`. See `add_submenu_item` for more info on how to add a submenu.

> method get_item_submenu_node(index: int) -> PopupMenu ; qualifiers=const

Returns the submenu of the item at the given `index`, or `null` if no submenu was added. See `add_submenu_node_item` for more info on how to add a submenu.

> method get_item_text(index: int) -> String ; qualifiers=const

Returns the text of the item at the given `index`.

> method get_item_text_direction(index: int) -> Control.TextDirection ; qualifiers=const

Returns item's text base writing direction.

> method get_item_tooltip(index: int) -> String ; qualifiers=const

Returns the tooltip associated with the item at the given `index`.

> method is_item_checkable(index: int) -> bool ; qualifiers=const

Returns `true` if the item at the given `index` is checkable in some way, i.e. if it has a checkbox or radio button.
**Note:** Checkable items just display a checkmark or radio button, but don't have any built-in checking behavior and must be checked/unchecked manually.

> method is_item_checked(index: int) -> bool ; qualifiers=const

Returns `true` if the item at the given `index` is checked.

> method is_item_disabled(index: int) -> bool ; qualifiers=const

Returns `true` if the item at the given `index` is disabled. When it is disabled it can't be selected, or its action invoked.
See `set_item_disabled` for more info on how to disable an item.

> method is_item_radio_checkable(index: int) -> bool ; qualifiers=const

Returns `true` if the item at the given `index` has radio button-style checkability.
**Note:** This is purely cosmetic; you must add the logic for checking/unchecking items in radio groups.

> method is_item_separator(index: int) -> bool ; qualifiers=const

Returns `true` if the item is a separator. If it is, it will be displayed as a line. See `add_separator` for more info on how to add a separator.

> method is_item_shortcut_disabled(index: int) -> bool ; qualifiers=const

Returns `true` if the specified item's shortcut is disabled.

> method is_native_menu() -> bool ; qualifiers=const

Returns `true` if the system native menu is supported and currently used by this `PopupMenu`.

> method is_system_menu() -> bool ; qualifiers=const

Returns `true` if the menu is bound to the special system menu.

> method remove_item(index: int) -> void

Removes the item at the given `index` from the menu.
**Note:** The indices of items after the removed item will be shifted by one.

> method scroll_to_item(index: int) -> void

Moves the scroll view to make the item at the given `index` visible.

> method set_focused_item(index: int) -> void

Sets the currently focused item as the given `index`.
Passing `-1` as the index makes so that no item is focused.

> method set_item_accelerator(index: int, accel: Key) -> void

Sets the accelerator of the item at the given `index`. An accelerator is a keyboard shortcut that can be pressed to trigger the menu button even if it's not currently open. `accel` is generally a combination of `KeyModifierMask`s and `Key`s using bitwise OR such as `KEY_MASK_CTRL | KEY_A` (`Ctrl + A`).

> method set_item_as_checkable(index: int, enable: bool) -> void

Sets whether the item at the given `index` has a checkbox. If `false`, sets the type of the item to plain text.
**Note:** Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually.

> method set_item_as_radio_checkable(index: int, enable: bool) -> void

Sets the type of the item at the given `index` to radio button. If `false`, sets the type of the item to plain text.

> method set_item_as_separator(index: int, enable: bool) -> void

Mark the item at the given `index` as a separator, which means that it would be displayed as a line. If `false`, sets the type of the item to plain text.

> method set_item_auto_translate_mode(index: int, mode: Node.AutoTranslateMode) -> void

Sets the auto translate mode of the item at the given `index`.
Items use `Node.AUTO_TRANSLATE_MODE_INHERIT` by default, which uses the same auto translate mode as the `PopupMenu` itself.

> method set_item_checked(index: int, checked: bool) -> void

Sets the checkstate status of the item at the given `index`.

> method set_item_disabled(index: int, disabled: bool) -> void

Enables/disables the item at the given `index`. When it is disabled, it can't be selected and its action can't be invoked.

> method set_item_icon(index: int, icon: Texture2D) -> void

Replaces the `Texture2D` icon of the item at the given `index`.

> method set_item_icon_max_width(index: int, width: int) -> void

Sets the maximum allowed width of the icon for the item at the given `index`. This limit is applied on top of the default size of the icon and on top of `icon_max_width`. The height is adjusted according to the icon's ratio.

> method set_item_icon_modulate(index: int, modulate: Color) -> void

Sets a modulating `Color` of the item's icon at the given `index`.

> method set_item_id(index: int, id: int) -> void

Sets the `id` of the item at the given `index`.
The `id` is used in `id_pressed` and `id_focused` signals.

> method set_item_indent(index: int, indent: int) -> void

Sets the horizontal offset of the item at the given `index`.

> method set_item_index(index: int, target_index: int) -> void

Changes the index of the item at index `index` to be at index `target_index`. This can be used to move an item above other items. The moved item will keep the same ID, even if it was generated from the original index.
**Note:** The indices of any items between index `index` and index `target_index` will be shifted by one.

> method set_item_language(index: int, language: String) -> void

Sets the language code of the text for the item at the given index to `language`. This is used for line-breaking and text shaping algorithms. If `language` is empty, the current locale is used.

> method set_item_metadata(index: int, metadata: Variant) -> void

Sets the metadata of an item, which may be of any type. You can later get it with `get_item_metadata`, which provides a simple way of assigning context data to items.

> method set_item_multistate(index: int, state: int) -> void

Sets the state of a multistate item. See `add_multistate_item` for details.

> method set_item_multistate_max(index: int, max_states: int) -> void

Sets the max states of a multistate item. See `add_multistate_item` for details.

> method set_item_shortcut(index: int, shortcut: Shortcut, global: bool = false) -> void

Sets a `Shortcut` for the item at the given `index`.

> method set_item_shortcut_disabled(index: int, disabled: bool) -> void

Disables the `Shortcut` of the item at the given `index`.

> method set_item_submenu(index: int, submenu: String) -> void ; deprecated=Prefer using `set_item_submenu_node` instead.

Sets the submenu of the item at the given `index`. The submenu is the name of a child `PopupMenu` node that would be shown when the item is clicked.

> method set_item_submenu_node(index: int, submenu: PopupMenu) -> void

Sets the submenu of the item at the given `index`. The submenu is a `PopupMenu` node that would be shown when the item is clicked. It must either be a child of this `PopupMenu` or has no parent (in which case it will be automatically added as a child). If the `submenu` popup has another parent, this method will fail.

> method set_item_text(index: int, text: String) -> void

Sets the text of the item at the given `index`.

> method set_item_text_direction(index: int, direction: Control.TextDirection) -> void

Sets item's text base writing direction.

> method set_item_tooltip(index: int, tooltip: String) -> void

Sets the `String` tooltip of the item at the given `index`.

> method toggle_item_checked(index: int) -> void

Toggles the check state of the item at the given `index`.

> method toggle_item_multistate(index: int) -> void

Cycle to the next state of a multistate item. See `add_multistate_item` for details.

## Signals

> signal id_focused(id: int)

Emitted when the user navigated to an item of some `id` using the `ProjectSettings.input/ui_up` or `ProjectSettings.input/ui_down` input action.

> signal id_pressed(id: int)

Emitted when an item of some `id` is pressed. Also emitted when its accelerator is activated on macOS.
**Note:** If `id` is negative (either explicitly or due to overflow), this will return the corresponding index instead.

> signal index_pressed(index: int)

Emitted when an item of some `index` is pressed. Also emitted when its accelerator is activated on macOS.

> signal menu_changed()

Emitted when any item is added, modified or removed.

## Theme Properties

> theme_property font_accelerator_color : Color ; data=color ; default=Color(0.7, 0.7, 0.7, 0.8)

The text `Color` used for shortcuts and accelerators that show next to the menu item name when defined. See `get_item_accelerator` for more info on accelerators.

> theme_property font_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

The default text `Color` for menu items' names.

> theme_property font_disabled_color : Color ; data=color ; default=Color(0.4, 0.4, 0.4, 0.8)

`Color` used for disabled menu items' text.

> theme_property font_hover_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

`Color` used for the hovered text.

> theme_property font_outline_color : Color ; data=color ; default=Color(0, 0, 0, 1)

The tint of text outline of the menu item.

> theme_property font_separator_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

`Color` used for labeled separators' text. See `add_separator`.

> theme_property font_separator_outline_color : Color ; data=color ; default=Color(0, 0, 0, 1)

The tint of text outline of the labeled separator.

> theme_property gutter_compact : int ; data=constant ; default=1

If not `0`, the icon gutter will be merged with the checkbox gutter when possible. This acts as a boolean.

> theme_property h_separation : int ; data=constant ; default=4

The horizontal space between the item's elements.

> theme_property icon_max_width : int ; data=constant ; default=0

The maximum allowed width of the item's icon. This limit is applied on top of the default size of the icon, but before the value set with `set_item_icon_max_width`. The height is adjusted according to the icon's ratio.

> theme_property indent : int ; data=constant ; default=10

Width of the single indentation level.

> theme_property item_end_padding : int ; data=constant ; default=2

Horizontal padding to the right of the items (or left, in RTL layout).

> theme_property item_start_padding : int ; data=constant ; default=2

Horizontal padding to the left of the items (or right, in RTL layout).

> theme_property outline_size : int ; data=constant ; default=0

The size of the item text outline.
**Note:** If using a font with `FontFile.multichannel_signed_distance_field` enabled, its `FontFile.msdf_pixel_range` must be set to at least *twice* the value of `outline_size` for outline rendering to look correct. Otherwise, the outline may appear to be cut off earlier than intended.

> theme_property search_bar_separation : int ; data=constant ; default=4

The vertical space between search bar and menu items.

> theme_property separator_outline_size : int ; data=constant ; default=0

The size of the labeled separator text outline.

> theme_property v_separation : int ; data=constant ; default=4

The vertical space between each menu item.

> theme_property font : Font ; data=font

`Font` used for the menu items.

> theme_property font_separator : Font ; data=font

`Font` used for the labeled separator.

> theme_property font_separator_size : int ; data=font_size

Font size of the labeled separator.

> theme_property font_size : int ; data=font_size

Font size of the menu items.

> theme_property checked : Texture2D ; data=icon

`Texture2D` icon for the checked checkbox items.

> theme_property checked_disabled : Texture2D ; data=icon

`Texture2D` icon for the checked checkbox items when they are disabled.

> theme_property radio_checked : Texture2D ; data=icon

`Texture2D` icon for the checked radio button items.

> theme_property radio_checked_disabled : Texture2D ; data=icon

`Texture2D` icon for the checked radio button items when they are disabled.

> theme_property radio_unchecked : Texture2D ; data=icon

`Texture2D` icon for the unchecked radio button items.

> theme_property radio_unchecked_disabled : Texture2D ; data=icon

`Texture2D` icon for the unchecked radio button items when they are disabled.

> theme_property search : Texture2D ; data=icon

`Texture2D` icon for the search bar's search icon.

> theme_property submenu : Texture2D ; data=icon

`Texture2D` icon for the submenu arrow (for left-to-right layouts).

> theme_property submenu_mirrored : Texture2D ; data=icon

`Texture2D` icon for the submenu arrow (for right-to-left layouts).

> theme_property unchecked : Texture2D ; data=icon

`Texture2D` icon for the unchecked checkbox items.

> theme_property unchecked_disabled : Texture2D ; data=icon

`Texture2D` icon for the unchecked checkbox items when they are disabled.

> theme_property hover : StyleBox ; data=style

`StyleBox` displayed when the `PopupMenu` item is hovered.

> theme_property labeled_separator_left : StyleBox ; data=style

`StyleBox` for the left side of labeled separator. See `add_separator`.

> theme_property labeled_separator_right : StyleBox ; data=style

`StyleBox` for the right side of labeled separator. See `add_separator`.

> theme_property panel : StyleBox ; data=style

`StyleBox` for the background panel.

> theme_property separator : StyleBox ; data=style

`StyleBox` used for the separators. See `add_separator`.
