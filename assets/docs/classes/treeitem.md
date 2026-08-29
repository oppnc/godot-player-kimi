# TreeItem

> class TreeItem
> inherits TreeItem Object

## Brief

An internal control for a single item inside `Tree`.

## Description

A single item of a `Tree` control. It can contain other `TreeItem`s as children, which allows it to create a hierarchy. It can also contain text and buttons. `TreeItem` is not a `Node`, it is internal to the `Tree`.
To create a `TreeItem`, use `Tree.create_item` or `TreeItem.create_child`. To remove a `TreeItem`, use `Object.free`.
**Note:** The ID values used for buttons are 32-bit, unlike `int` which is always 64-bit. They go from `-2147483648` to `2147483647`.

## Properties

> property collapsed : bool ; setter=set_collapsed ; getter=is_collapsed

If `true`, the TreeItem is collapsed.

> property custom_minimum_height : int ; setter=set_custom_minimum_height ; getter=get_custom_minimum_height

The custom minimum height.

> property disable_folding : bool ; setter=set_disable_folding ; getter=is_folding_disabled

If `true`, folding is disabled for this TreeItem.

> property visible : bool ; setter=set_visible ; getter=is_visible

If `true`, the `TreeItem` is visible (default).
Note that if a `TreeItem` is set to not be visible, none of its children will be visible either.

## Methods

> method add_button(column: int, button: Texture2D, id: int = -1, disabled: bool = false, tooltip_text: String = "", description: String = "") -> void

Adds a button with `Texture2D` `button` to the end of the cell at column `column`. The `id` is used to identify the button in the according `Tree.button_clicked` signal and can be different from the buttons index. If not specified, the next available index is used, which may be retrieved by calling `get_button_count` immediately before this method. Optionally, the button can be `disabled` and have a `tooltip_text`. `description` is used as the button description for assistive apps.

> method add_child(child: TreeItem) -> void

Adds a previously unparented `TreeItem` as a direct child of this one. The `child` item must not be a part of any `Tree` or parented to any `TreeItem`. See also `remove_child`.

> method call_recursive(method: StringName) -> void ; qualifiers=vararg

Calls the `method` on the actual TreeItem and its children recursively. Pass parameters as a comma separated list.

> method clear_buttons() -> void

Removes all buttons from all columns of this item.

> method clear_custom_bg_color(column: int) -> void

Resets the background color for the given column to default.

> method clear_custom_color(column: int) -> void

Resets the color for the given column to default.

> method create_child(index: int = -1) -> TreeItem

Creates an item and adds it as a child.
The new item will be inserted as position `index` (the default value `-1` means the last position), or it will be the last child if `index` is higher than the child count.

> method deselect(column: int) -> void

Deselects the given column.

> method erase_button(column: int, button_index: int) -> void

Removes the button at index `button_index` in column `column`.

> method get_auto_translate_mode(column: int) -> Node.AutoTranslateMode ; qualifiers=const

Returns the column's auto translate mode.

> method get_autowrap_mode(column: int) -> TextServer.AutowrapMode ; qualifiers=const

Returns the text autowrap mode in the given `column`. By default it is `TextServer.AUTOWRAP_OFF`.

> method get_autowrap_trim_flags(column: int) -> BitField[TextServer.LineBreakFlag] ; qualifiers=const

Returns the autowrap trim flags for the given `column`. By default, both `TextServer.BREAK_TRIM_START_EDGE_SPACES` and `TextServer.BREAK_TRIM_END_EDGE_SPACES` are enabled.

> method get_button(column: int, button_index: int) -> Texture2D ; qualifiers=const

Returns the `Texture2D` of the button at index `button_index` in column `column`.

> method get_button_by_id(column: int, id: int) -> int ; qualifiers=const

Returns the button index if there is a button with ID `id` in column `column`, otherwise returns -1.

> method get_button_color(column: int, id: int) -> Color ; qualifiers=const

Returns the color of the button with ID `id` in column `column`. If the specified button does not exist, returns `Color.BLACK`.

> method get_button_count(column: int) -> int ; qualifiers=const

Returns the number of buttons in column `column`.

> method get_button_id(column: int, button_index: int) -> int ; qualifiers=const

Returns the ID for the button at index `button_index` in column `column`.

> method get_button_tooltip_text(column: int, button_index: int) -> String ; qualifiers=const

Returns the tooltip text for the button at index `button_index` in column `column`.

> method get_cell_mode(column: int) -> TreeCellMode ; qualifiers=const

Returns the column's cell mode.

> method get_child(index: int) -> TreeItem

Returns a child item by its `index` (see `get_child_count`). This method is often used for iterating all children of an item.
Negative indices access the children from the last one.

> method get_child_count() -> int

Returns the number of child items.

> method get_children() -> Array[TreeItem]

Returns an array of references to the item's children.

> method get_custom_bg_color(column: int) -> Color ; qualifiers=const

Returns the custom background color of column `column`.

> method get_custom_color(column: int) -> Color ; qualifiers=const

Returns the custom color of column `column`.

> method get_custom_draw_callback(column: int) -> Callable ; qualifiers=const

Returns the custom callback of column `column`.

> method get_custom_font(column: int) -> Font ; qualifiers=const

Returns custom font used to draw text in the column `column`.

> method get_custom_font_size(column: int) -> int ; qualifiers=const

Returns custom font size used to draw text in the column `column`.

> method get_custom_stylebox(column: int) -> StyleBox ; qualifiers=const

Returns the given column's custom `StyleBox` used to draw the background.

> method get_description(column: int) -> String ; qualifiers=const

Returns the given column's description for assistive apps.

> method get_expand_right(column: int) -> bool ; qualifiers=const

Returns `true` if `expand_right` is set.

> method get_first_child() -> TreeItem ; qualifiers=const

Returns the TreeItem's first child.

> method get_icon(column: int) -> Texture2D ; qualifiers=const

Returns the given column's icon `Texture2D`. Error if no icon is set.

> method get_icon_max_width(column: int) -> int ; qualifiers=const

Returns the maximum allowed width of the icon in the given `column`.

> method get_icon_modulate(column: int) -> Color ; qualifiers=const

Returns the `Color` modulating the column's icon.

> method get_icon_overlay(column: int) -> Texture2D ; qualifiers=const

Returns the given column's icon overlay `Texture2D`.

> method get_icon_region(column: int) -> Rect2 ; qualifiers=const

Returns the icon `Texture2D` region as `Rect2`.

> method get_index() -> int

Returns the node's order in the tree. For example, if called on the first child item the position is `0`.

> method get_language(column: int) -> String ; qualifiers=const

Returns item's text language code.

> method get_metadata(column: int) -> Variant ; qualifiers=const

Returns the metadata value that was set for the given column using `set_metadata`.

> method get_next() -> TreeItem ; qualifiers=const

Returns the next sibling TreeItem in the tree or a `null` object if there is none.

> method get_next_in_tree(wrap: bool = false) -> TreeItem

Returns the next TreeItem in the tree (in the context of a depth-first search) or a `null` object if there is none.
If `wrap` is enabled, the method will wrap around to the first element in the tree when called on the last element, otherwise it returns `null`.

> method get_next_visible(wrap: bool = false) -> TreeItem

Returns the next visible TreeItem in the tree (in the context of a depth-first search) or a `null` object if there is none.
If `wrap` is enabled, the method will wrap around to the first visible element in the tree when called on the last visible element, otherwise it returns `null`.

> method get_parent() -> TreeItem ; qualifiers=const

Returns the parent TreeItem or a `null` object if there is none.

> method get_prev() -> TreeItem

Returns the previous sibling TreeItem in the tree or a `null` object if there is none.

> method get_prev_in_tree(wrap: bool = false) -> TreeItem

Returns the previous TreeItem in the tree (in the context of a depth-first search) or a `null` object if there is none.
If `wrap` is enabled, the method will wrap around to the last element in the tree when called on the first visible element, otherwise it returns `null`.

> method get_prev_visible(wrap: bool = false) -> TreeItem

Returns the previous visible sibling TreeItem in the tree (in the context of a depth-first search) or a `null` object if there is none.
If `wrap` is enabled, the method will wrap around to the last visible element in the tree when called on the first visible element, otherwise it returns `null`.

> method get_range(column: int) -> float ; qualifiers=const

Returns the value of a `CELL_MODE_RANGE` column.

> method get_range_config(column: int) -> Dictionary

Returns a dictionary containing the range parameters for a given column. The keys are "min", "max", "step", and "expr".

> method get_structured_text_bidi_override(column: int) -> TextServer.StructuredTextParser ; qualifiers=const

Returns the BiDi algorithm override set for this cell.

> method get_structured_text_bidi_override_options(column: int) -> Array ; qualifiers=const

Returns the additional BiDi options set for this cell.

> method get_suffix(column: int) -> String ; qualifiers=const

Gets the suffix string shown after the column value.

> method get_text(column: int) -> String ; qualifiers=const

Returns the given column's text.

> method get_text_alignment(column: int) -> HorizontalAlignment ; qualifiers=const

Returns the given column's text alignment.

> method get_text_direction(column: int) -> Control.TextDirection ; qualifiers=const

Returns item's text base writing direction.

> method get_text_overrun_behavior(column: int) -> TextServer.OverrunBehavior ; qualifiers=const

Returns the clipping behavior when the text exceeds the item's bounding rectangle in the given `column`. By default it is `TextServer.OVERRUN_TRIM_ELLIPSIS`.

> method get_tooltip_text(column: int) -> String ; qualifiers=const

Returns the given column's tooltip text.

> method get_tree() -> Tree ; qualifiers=const

Returns the `Tree` that owns this TreeItem.

> method is_accepting_children() -> bool ; qualifiers=const

Returns `true` if this `TreeItem` is allowed to accept children.

> method is_any_collapsed(only_visible: bool = false) -> bool

Returns `true` if this `TreeItem`, or any of its descendants, is collapsed.
If `only_visible` is `true` it ignores non-visible `TreeItem`s.

> method is_button_disabled(column: int, button_index: int) -> bool ; qualifiers=const

Returns `true` if the button at index `button_index` for the given `column` is disabled.

> method is_checked(column: int) -> bool ; qualifiers=const

Returns `true` if the given `column` is checked.

> method is_custom_set_as_button(column: int) -> bool ; qualifiers=const

Returns `true` if the cell was made into a button with `set_custom_as_button`.

> method is_edit_multiline(column: int) -> bool ; qualifiers=const

Returns `true` if the given `column` is multiline editable.

> method is_editable(column: int) -> bool

Returns `true` if the given `column` is editable.

> method is_indeterminate(column: int) -> bool ; qualifiers=const

Returns `true` if the given `column` is indeterminate.

> method is_selectable(column: int) -> bool ; qualifiers=const

Returns `true` if the given `column` is selectable.

> method is_selected(column: int) -> bool

Returns `true` if the given `column` is selected.

> method is_visible_in_tree() -> bool ; qualifiers=const

Returns `true` if `visible` is `true` and all its ancestors are also visible.

> method move_after(item: TreeItem) -> void

Moves this TreeItem right after the given `item`.
**Note:** You can't move to the root or move the root.

> method move_before(item: TreeItem) -> void

Moves this TreeItem right before the given `item`.
**Note:** You can't move to the root or move the root.

> method propagate_check(column: int, emit_signal: bool = true) -> void

Propagates this item's checked status to its children and parents for the given `column`. It is possible to process the items affected by this method call by connecting to `Tree.check_propagated_to_item`. The order that the items affected will be processed is as follows: the item invoking this method, children of that item, and finally parents of that item. If `emit_signal` is `false`, then `Tree.check_propagated_to_item` will not be emitted.

> method remove_child(child: TreeItem) -> void

Removes the given child `TreeItem` and all its children from the `Tree`. Note that it doesn't free the item from memory, so it can be reused later (see `add_child`). To completely remove a `TreeItem` use `Object.free`.
**Note:** If you want to move a child from one `Tree` to another, then instead of removing and adding it manually you can use `move_before` or `move_after`.

> method select(column: int, set_as_cursor: bool = true) -> void

Selects the given `column`. If `set_as_cursor` is `true`, the `Tree`'s cursor will be moved to this item (only matters if `Tree.select_mode` is set to `Tree.SELECT_MULTI`).

> method set_accept_children(allowed: bool) -> void

Sets `TreeItem`'s ability to accept children.

> method set_auto_translate_mode(column: int, mode: Node.AutoTranslateMode) -> void

Sets the given column's auto translate mode to `mode`.
All columns use `Node.AUTO_TRANSLATE_MODE_INHERIT` by default, which uses the same auto translate mode as the `Tree` itself.

> method set_autowrap_mode(column: int, autowrap_mode: TextServer.AutowrapMode) -> void

Sets the autowrap mode in the given `column`. If set to something other than `TextServer.AUTOWRAP_OFF`, the text gets wrapped inside the cell's bounding rectangle.

> method set_autowrap_trim_flags(column: int, flags: BitField[TextServer.LineBreakFlag]) -> void

Sets the autowrap trim flags for the given `column`. These flags control whether leading and trailing spaces are trimmed on wrapped lines. Set to `0` to disable all trimming.

> method set_button(column: int, button_index: int, button: Texture2D) -> void

Sets the given column's button `Texture2D` at index `button_index` to `button`.

> method set_button_color(column: int, button_index: int, color: Color) -> void

Sets the given column's button color at index `button_index` to `color`.

> method set_button_description(column: int, button_index: int, description: String) -> void

Sets the given column's button description at index `button_index` for assistive apps.

> method set_button_disabled(column: int, button_index: int, disabled: bool) -> void

If `true`, disables the button at index `button_index` in the given `column`.

> method set_button_tooltip_text(column: int, button_index: int, tooltip: String) -> void

Sets the tooltip text for the button at index `button_index` in the given `column`.

> method set_cell_mode(column: int, mode: TreeCellMode) -> void

Sets the given column's cell mode to `mode`. This determines how the cell is displayed and edited.

> method set_checked(column: int, checked: bool) -> void

If `checked` is `true`, the given `column` is checked. Clears column's indeterminate status.

> method set_collapsed_recursive(enable: bool) -> void

Collapses or uncollapses this `TreeItem` and all the descendants of this item.

> method set_custom_as_button(column: int, enable: bool) -> void

Makes a cell with `CELL_MODE_CUSTOM` display as a non-flat button with a `StyleBox`.

> method set_custom_bg_color(column: int, color: Color, just_outline: bool = false) -> void

Sets the given column's custom background color and whether to just use it as an outline.
**Note:** If a custom `StyleBox` is set, the background color will be drawn behind it.

> method set_custom_color(column: int, color: Color) -> void

Sets the given column's custom color.

> method set_custom_draw(column: int, object: Object, callback: StringName) -> void ; deprecated=Use `TreeItem.set_custom_draw_callback` instead.

Sets the given column's custom draw callback to the `callback` method on `object`.
The method named `callback` should accept two arguments: the `TreeItem` that is drawn and its position and size as a `Rect2`.

> method set_custom_draw_callback(column: int, callback: Callable) -> void

Sets the given column's custom draw callback. Use an empty `Callable` (`Callable()`) to clear the custom callback. The cell has to be in `CELL_MODE_CUSTOM` to use this feature.
The `callback` should accept two arguments: the `TreeItem` that is drawn and its position and size as a `Rect2`.
To draw custom content over the native style, please use `Tree.get_custom_drawing_canvas_item`.

> method set_custom_font(column: int, font: Font) -> void

Sets custom font used to draw text in the given `column`.

> method set_custom_font_size(column: int, font_size: int) -> void

Sets custom font size used to draw text in the given `column`.

> method set_custom_stylebox(column: int, stylebox: StyleBox) -> void

Sets the given column's custom `StyleBox` used to draw the background.
**Note:** If a custom background color is set, the `StyleBox` will be drawn in front of it.

> method set_description(column: int, description: String) -> void

Sets the given column's description for assistive apps.

> method set_edit_multiline(column: int, multiline: bool) -> void

If `multiline` is `true`, the given `column` is multiline editable.
**Note:** This option only affects the type of control (`LineEdit` or `TextEdit`) that appears when editing the column. You can set multiline values with `set_text` even if the column is not multiline editable.

> method set_editable(column: int, enabled: bool) -> void

If `enabled` is `true`, the given `column` is editable.

> method set_expand_right(column: int, enable: bool) -> void

If `enable` is `true`, the given `column` is expanded to the right.

> method set_icon(column: int, texture: Texture2D) -> void

Sets the given cell's icon `Texture2D`. If the cell is in `CELL_MODE_ICON` mode, the icon is displayed in the center of the cell. Otherwise, the icon is displayed before the cell's text. `CELL_MODE_RANGE` does not display an icon.

> method set_icon_max_width(column: int, width: int) -> void

Sets the maximum allowed width of the icon in the given `column`. This limit is applied on top of the default size of the icon and on top of `Tree.icon_max_width`. The height is adjusted according to the icon's ratio.

> method set_icon_modulate(column: int, modulate: Color) -> void

Modulates the given column's icon with `modulate`.

> method set_icon_overlay(column: int, texture: Texture2D) -> void

Sets the given cell's icon overlay `Texture2D`. The cell has to be in `CELL_MODE_ICON` mode, and icon has to be set. Overlay is drawn on top of icon, in the bottom left corner.

> method set_icon_region(column: int, region: Rect2) -> void

Sets the given column's icon's texture region.

> method set_indeterminate(column: int, indeterminate: bool) -> void

If `indeterminate` is `true`, the given `column` is marked indeterminate.
**Note:** If set `true` from `false`, then column is cleared of checked status.

> method set_language(column: int, language: String) -> void

Sets the language code of the given `column`'s text to `language`. This is used for line-breaking and text shaping algorithms. If `language` is empty, the current locale is used.

> method set_metadata(column: int, meta: Variant) -> void

Sets the metadata value for the given column, which can be retrieved later using `get_metadata`. This can be used, for example, to store a reference to the original data.

> method set_range(column: int, value: float) -> void

Sets the value of a `CELL_MODE_RANGE` column.

> method set_range_config(column: int, min: float, max: float, step: float, expr: bool = false) -> void

Sets the range of accepted values for a column. The column must be in the `CELL_MODE_RANGE` mode.
If `expr` is `true`, the edit mode slider will use an exponential scale as with `Range.exp_edit`.

> method set_selectable(column: int, selectable: bool) -> void

If `selectable` is `true`, the given `column` is selectable.

> method set_structured_text_bidi_override(column: int, parser: TextServer.StructuredTextParser) -> void

Set BiDi algorithm override for the structured text. Has effect for cells that display text.

> method set_structured_text_bidi_override_options(column: int, args: Array) -> void

Set additional options for BiDi override. Has effect for cells that display text.

> method set_suffix(column: int, text: String) -> void

Sets a string to be shown after a column's value (for example, a unit abbreviation).

> method set_text(column: int, text: String) -> void

Sets the given column's text value.

> method set_text_alignment(column: int, text_alignment: HorizontalAlignment) -> void

Sets the given column's text alignment to `text_alignment`.

> method set_text_direction(column: int, direction: Control.TextDirection) -> void

Sets item's text base writing direction.

> method set_text_overrun_behavior(column: int, overrun_behavior: TextServer.OverrunBehavior) -> void

Sets the clipping behavior when the text exceeds the item's bounding rectangle in the given `column`.

> method set_tooltip_text(column: int, tooltip: String) -> void

Sets the given column's tooltip text.

> method uncollapse_tree() -> void

Uncollapses all `TreeItem`s necessary to reveal this `TreeItem`, i.e. all ancestor `TreeItem`s.

## Enumerations

> enum TreeCellMode

> enum_value TreeCellMode.CELL_MODE_STRING = 0

Cell shows a string label, optionally with an icon. When editable, the text can be edited using a `LineEdit`, or a `TextEdit` popup if `set_edit_multiline` is used.

> enum_value TreeCellMode.CELL_MODE_CHECK = 1

Cell shows a checkbox, optionally with text and an icon. The checkbox can be pressed, released, or indeterminate (via `set_indeterminate`). The checkbox can't be clicked unless the cell is editable.

> enum_value TreeCellMode.CELL_MODE_RANGE = 2

Cell shows a numeric range. When editable, it can be edited using a range slider. Use `set_range` to set the value and `set_range_config` to configure the range.
This cell can also be used in a text dropdown mode when you assign a text with `set_text`. Separate options with a comma, e.g. `"Option1,Option2,Option3"`.

> enum_value TreeCellMode.CELL_MODE_ICON = 3

Cell shows an icon. It can't be edited nor display text. The icon is always centered within the cell.

> enum_value TreeCellMode.CELL_MODE_CUSTOM = 4

Cell shows as a clickable button. It will display an arrow similar to `OptionButton`, but doesn't feature a dropdown (for that you can use `CELL_MODE_RANGE`). Clicking the button emits the `Tree.item_edited` signal. The button is flat by default, you can use `set_custom_as_button` to display it with a `StyleBox`.
This mode also supports custom drawing using `set_custom_draw_callback`.
