# Tree

> class Tree
> inherits Tree Control

## Brief

A control used to show a set of internal `TreeItem`s in a hierarchical structure.

## Description

A control used to show a set of internal `TreeItem`s in a hierarchical structure. The tree items can be selected, expanded and collapsed. The tree can have multiple columns with custom controls like `LineEdit`s, buttons and popups. It can be useful for structured displays and interactions.
Trees are built via code, using `TreeItem` objects to create the structure. They have a single root, but multiple roots can be simulated with `hide_root`:

```gdscript
        func _ready():
            var tree = Tree.new()
            var root = tree.create_item()
            tree.hide_root = true
            var child1 = tree.create_item(root)
            var child2 = tree.create_item(root)
            var subchild1 = tree.create_item(child1)
            subchild1.set_text(0, "Subchild1")

```

```csharp
        public override void _Ready()
        {
            var tree = new Tree();
            TreeItem root = tree.CreateItem();
            tree.HideRoot = true;
            TreeItem child1 = tree.CreateItem(root);
            TreeItem child2 = tree.CreateItem(root);
            TreeItem subchild1 = tree.CreateItem(child1);
            subchild1.SetText(0, "Subchild1");
        }

```

To iterate over all the `TreeItem` objects in a `Tree` object, use `TreeItem.get_next` and `TreeItem.get_first_child` after getting the root through `get_root`. You can use `Object.free` on a `TreeItem` to remove it from the `Tree`.
**Incremental search:** Like `ItemList` and `PopupMenu`, `Tree` supports searching within the list while the control is focused. Press a key that matches the first letter of an item's name to select the first item starting with the given letter. After that point, there are two ways to perform incremental search: 1) Press the same key again before the timeout duration to select the next item starting with the same letter. 2) Press letter keys that match the rest of the word before the timeout duration to match to select the item in question directly. Both of these actions will be reset to the beginning of the list if the timeout duration has passed since the last keystroke was registered. You can adjust the timeout duration by changing `ProjectSettings.gui/timers/incremental_search_max_interval_msec`.

## Properties

> property allow_reselect : bool ; default=false ; setter=set_allow_reselect ; getter=get_allow_reselect

If `true`, the currently selected cell may be selected again.

> property allow_rmb_select : bool ; default=false ; setter=set_allow_rmb_select ; getter=get_allow_rmb_select

If `true`, a right mouse button click can select items.

> property allow_search : bool ; default=true ; setter=set_allow_search ; getter=get_allow_search

If `true`, allows navigating the `Tree` with letter keys through incremental search.

> property auto_tooltip : bool ; default=true ; setter=set_auto_tooltip ; getter=is_auto_tooltip_enabled

If `true`, tree items with no tooltip assigned display their text as their tooltip. See also `TreeItem.get_tooltip_text` and `TreeItem.get_button_tooltip_text`.

> property clip_contents : bool ; default=true ; setter=set_clip_contents ; getter=is_clipping_contents ; overrides=Control

> property column_titles_visible : bool ; default=false ; setter=set_column_titles_visible ; getter=are_column_titles_visible

If `true`, column titles are visible.

> property columns : int ; default=1 ; setter=set_columns ; getter=get_columns

The number of columns.
Prints an error and does not allow setting the columns during mouse selection.

> property drop_mode_flags : int ; default=0 ; setter=set_drop_mode_flags ; getter=get_drop_mode_flags

The drop mode as an OR combination of flags. See `DropModeFlags` constants. Once dropping is done, reverts to `DROP_MODE_DISABLED`. Setting this during `Control._can_drop_data` is recommended.
This controls the drop sections, i.e. the decision and drawing of possible drop locations based on the mouse position.

> property enable_drag_unfolding : bool ; default=true ; setter=set_enable_drag_unfolding ; getter=is_drag_unfolding_enabled

If `true`, tree items will unfold when hovered over during a drag-and-drop. The delay for when this happens is dictated by `dragging_unfold_wait_msec`.

> property enable_recursive_folding : bool ; default=true ; setter=set_enable_recursive_folding ; getter=is_recursive_folding_enabled

If `true`, recursive folding is enabled for this `Tree`. Holding down `Shift` while clicking the fold arrow or using `ui_right`/`ui_left` shortcuts collapses or uncollapses the `TreeItem` and all its descendants.

> property focus_mode : Control.FocusMode ; default=2 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property hide_folding : bool ; default=false ; setter=set_hide_folding ; getter=is_folding_hidden

If `true`, the folding arrow is hidden.

> property hide_root : bool ; default=false ; setter=set_hide_root ; getter=is_root_hidden

If `true`, the tree's root is hidden.

> property scroll_hint_mode : ScrollHintMode ; default=0 ; setter=set_scroll_hint_mode ; getter=get_scroll_hint_mode

The way which scroll hints (indicators that show that the content can still be scrolled in a certain direction) will be shown.

> property scroll_horizontal_enabled : bool ; default=true ; setter=set_h_scroll_enabled ; getter=is_h_scroll_enabled

If `true`, enables horizontal scrolling.

> property scroll_vertical_enabled : bool ; default=true ; setter=set_v_scroll_enabled ; getter=is_v_scroll_enabled

If `true`, enables vertical scrolling.

> property select_mode : SelectMode ; default=0 ; setter=set_select_mode ; getter=get_select_mode

Allows single or multiple selection. See the `SelectMode` constants.

> property tile_scroll_hint : bool ; default=false ; setter=set_tile_scroll_hint ; getter=is_scroll_hint_tiled

If `true`, the scroll hint texture will be tiled instead of stretched. See `scroll_hint_mode`.

## Methods

> method clear() -> void

Clears the tree. This removes all items.
Prints an error and does not allow clearing the tree if called during mouse selection.

> method create_item(parent: TreeItem = null, index: int = -1) -> TreeItem

Creates an item in the tree and adds it as a child of `parent`, which can be either a valid `TreeItem` or `null`.
If `parent` is `null`, the root item will be the parent, or the new item will be the root itself if the tree is empty.
The new item will be the `index`-th child of parent, or it will be the last child if there are not enough siblings.
Prints an error and returns `null` if called during mouse selection, or if the `parent` does not belong to this tree.

> method deselect_all() -> void

Deselects all tree items (rows and columns). In `SELECT_MULTI` mode also removes selection cursor.

> method edit_selected(force_edit: bool = false) -> bool

Edits the selected tree item as if it was clicked.
Either the item must be set editable with `TreeItem.set_editable` or `force_edit` must be `true`.
Returns `true` if the item could be edited. Fails if no item is selected.

> method ensure_cursor_is_visible() -> void

Makes the currently focused cell visible.
This will scroll the tree if necessary. In `SELECT_ROW` mode, this will not do horizontal scrolling, as all the cells in the selected row is focused logically.
**Note:** Despite the name of this method, the focus cursor itself is only visible in `SELECT_MULTI` mode.

> method get_button_id_at_position(position: Vector2) -> int ; qualifiers=const

Returns the button ID at `position`, or -1 if no button is there.

> method get_column_at_position(position: Vector2) -> int ; qualifiers=const

Returns the column index at `position`, or -1 if no item is there.

> method get_column_expand_ratio(column: int) -> int ; qualifiers=const

Returns the expand ratio assigned to the column.

> method get_column_title(column: int) -> String ; qualifiers=const

Returns the column's title.

> method get_column_title_alignment(column: int) -> HorizontalAlignment ; qualifiers=const

Returns the column title alignment.

> method get_column_title_direction(column: int) -> Control.TextDirection ; qualifiers=const

Returns column title base writing direction.

> method get_column_title_language(column: int) -> String ; qualifiers=const

Returns column title language code.

> method get_column_title_tooltip_text(column: int) -> String ; qualifiers=const

Returns the column title's tooltip text.

> method get_column_width(column: int) -> int ; qualifiers=const

Returns the column's width in pixels.

> method get_custom_drawing_canvas_item() -> RID ; qualifiers=const

Returns the internal canvas item designated for custom drawing. See `TreeItem.set_custom_draw_callback`.
**Note:** This canvas item clears automatically on each Tree draw call.

> method get_custom_popup_rect() -> Rect2 ; qualifiers=const

Returns the rectangle for custom popups. Helper to create custom cell controls that display a popup. See `TreeItem.set_cell_mode`.

> method get_drop_section_at_position(position: Vector2) -> int ; qualifiers=const

Returns the drop section at `position`, as permitted by enabled `DropModeFlags`.
- `-1` if the position is **above** the item. Typically used to insert as the item's previous sibling.
- `0` if the position is **on** the item. Typically used to insert as the item's last child.
- `1` if the position is **below** the item, when the item has no children. Typically used to insert as the item's next sibling. If the item *does* have children, this section is still reachable by hovering to the left of the item's collapse arrow, and below.
- `2` if the position is **below** the item, when the item has children. Typically used to insert as the item's first child.
- `-100` if the position is not over any item, or no `DropModeFlags` are set.
See `DropModeFlags` for a description of each drop region. To get the item which the returned drop section refers to, use `get_item_at_position`.

> method get_edited() -> TreeItem ; qualifiers=const

Returns the currently edited item. Can be used with `item_edited` to get the item that was modified.

```gdscript
                func _ready():
                    $Tree.item_edited.connect(on_Tree_item_edited)

                func on_Tree_item_edited():
                    print($Tree.get_edited()) # This item just got edited (e.g. checked).

```

```csharp
                public override void _Ready()
                {
                    GetNode<Tree>("Tree").ItemEdited += OnTreeItemEdited;
                }

                public void OnTreeItemEdited()
                {
                    GD.Print(GetNode<Tree>("Tree").GetEdited()); // This item just got edited (e.g. checked).
                }

```

> method get_edited_column() -> int ; qualifiers=const

Returns the column for the currently edited item.

> method get_item_area_rect(item: TreeItem, column: int = -1, button_index: int = -1) -> Rect2 ; qualifiers=const

Returns the rectangle area for the specified `TreeItem`. If `column` is specified, only get the position and size of that column, otherwise get the rectangle containing all columns. If a button index is specified, the rectangle of that button will be returned.

> method get_item_at_position(position: Vector2) -> TreeItem ; qualifiers=const

Returns the tree item at the specified position (relative to the tree origin position).

> method get_next_selected(from: TreeItem) -> TreeItem

Returns the next selected `TreeItem` after the given one, or `null` if the end is reached.
If `from` is `null`, this returns the first selected item.

> method get_pressed_button() -> int ; qualifiers=const

Returns the last pressed button's index.

> method get_root() -> TreeItem ; qualifiers=const

Returns the tree's root item, or `null` if the tree is empty.

> method get_scroll() -> Vector2 ; qualifiers=const

Returns the current scrolling position.

> method get_selected() -> TreeItem ; qualifiers=const

Returns the currently focused item, or `null` if no item is focused.
In `SELECT_ROW` and `SELECT_SINGLE` modes, the focused item is same as the selected item. In `SELECT_MULTI` mode, the focused item is the item under the focus cursor, not necessarily selected.
To get the currently selected item(s), use `get_next_selected`.

> method get_selected_column() -> int ; qualifiers=const

Returns the currently focused column, or -1 if no column is focused.
In `SELECT_SINGLE` mode, the focused column is the selected column. In `SELECT_ROW` mode, the focused column is always 0 if any item is selected. In `SELECT_MULTI` mode, the focused column is the column under the focus cursor, and there are not necessarily any column selected.
To tell whether a column of an item is selected, use `TreeItem.is_selected`.

> method is_column_clipping_content(column: int) -> bool ; qualifiers=const

Returns `true` if the column has enabled clipping (see `set_column_clip_content`).

> method is_column_expanding(column: int) -> bool ; qualifiers=const

Returns `true` if the column has enabled expanding (see `set_column_expand`).

> method scroll_to_item(item: TreeItem, center_on_item: bool = false) -> void

Causes the `Tree` to jump to the specified `TreeItem`.

> method set_column_clip_content(column: int, enable: bool) -> void

Allows to enable clipping for column's content, making the content size ignored.

> method set_column_custom_minimum_width(column: int, min_width: int) -> void

Overrides the calculated minimum width of a column. It can be set to `0` to restore the default behavior. Columns that have the "Expand" flag will use their "min_width" in a similar fashion to `Control.size_flags_stretch_ratio`.

> method set_column_expand(column: int, expand: bool) -> void

If `true`, the column will have the "Expand" flag of `Control`. Columns that have the "Expand" flag will use their expand ratio in a similar fashion to `Control.size_flags_stretch_ratio` (see `set_column_expand_ratio`).

> method set_column_expand_ratio(column: int, ratio: int) -> void

Sets the relative expand ratio for a column. See `set_column_expand`.

> method set_column_title(column: int, title: String) -> void

Sets the title of a column.

> method set_column_title_alignment(column: int, title_alignment: HorizontalAlignment) -> void

Sets the column title alignment. Note that `@GlobalScope.HORIZONTAL_ALIGNMENT_FILL` is not supported for column titles.

> method set_column_title_direction(column: int, direction: Control.TextDirection) -> void

Sets column title base writing direction.

> method set_column_title_language(column: int, language: String) -> void

Sets the language code of the given `column`'s title to `language`. This is used for line-breaking and text shaping algorithms. If `language` is empty, the current locale is used.

> method set_column_title_tooltip_text(column: int, tooltip_text: String) -> void

Sets the column title's tooltip text.

> method set_selected(item: TreeItem, column: int) -> void

Selects the specified `TreeItem` and column.

## Signals

> signal button_clicked(item: TreeItem, column: int, id: int, mouse_button_index: int)

Emitted when a button on the tree was pressed (see `TreeItem.add_button`).

> signal cell_selected()

Emitted when a cell is selected.

> signal check_propagated_to_item(item: TreeItem, column: int)

Emitted when `TreeItem.propagate_check` is called. Connect to this signal to process the items that are affected when `TreeItem.propagate_check` is invoked. The order that the items affected will be processed is as follows: the item that invoked the method, children of that item, and finally parents of that item.

> signal column_title_clicked(column: int, mouse_button_index: int)

Emitted when a column's title is clicked with either `MOUSE_BUTTON_LEFT` or `MOUSE_BUTTON_RIGHT`.

> signal custom_item_clicked(mouse_button_index: int)

Emitted when an item with `TreeItem.CELL_MODE_CUSTOM` is clicked with a mouse button.

> signal custom_popup_edited(arrow_clicked: bool)

Emitted when a cell with the `TreeItem.CELL_MODE_CUSTOM` is clicked to be edited.

> signal empty_clicked(click_position: Vector2, mouse_button_index: int)

Emitted when a mouse button is clicked in the empty space of the tree.

> signal item_activated()

Emitted when an item is double-clicked, or selected with a `ui_accept` input event (e.g. using `Enter` or `Space` on the keyboard).

> signal item_collapsed(item: TreeItem)

Emitted when an item is expanded or collapsed by clicking on the folding arrow or through code.
**Note:** Despite its name, this signal is also emitted when an item is expanded.

> signal item_edited()

Emitted when an item is edited.

> signal item_icon_double_clicked()

Emitted when an item's icon is double-clicked. For a signal that emits when any part of the item is double-clicked, see `item_activated`.

> signal item_mouse_selected(mouse_position: Vector2, mouse_button_index: int)

Emitted when an item is selected with a mouse button.

> signal item_selected()

Emitted when an item is selected.

> signal multi_selected(item: TreeItem, column: int, selected: bool)

Emitted instead of `item_selected` if `select_mode` is set to `SELECT_MULTI`.

> signal nothing_selected()

Emitted when a left mouse button click does not select any item.

## Enumerations

> enum DropModeFlags

> enum_value DropModeFlags.DROP_MODE_DISABLED = 0

Disables all drop sections.
**Note:** This is the default flag, it has no effect when combined with other flags.

> enum_value DropModeFlags.DROP_MODE_ON_ITEM = 1

Enables the "on item" drop section. This drop section covers the entire item.
When combined with `DROP_MODE_INBETWEEN`, this drop section halves in height and stays centered vertically.

> enum_value DropModeFlags.DROP_MODE_INBETWEEN = 2

Enables "above item" and "below item" drop sections. The "above item" drop section covers the top half of the item, while the "below item" drop section covers the bottom half, and extends downward to the left of any children.
When combined with `DROP_MODE_ON_ITEM`, these drop sections halve in height and stay at the top and bottom respectively.

> enum ScrollHintMode

> enum_value ScrollHintMode.SCROLL_HINT_MODE_DISABLED = 0

Scroll hints will never be shown.

> enum_value ScrollHintMode.SCROLL_HINT_MODE_BOTH = 1

Scroll hints will be shown at the top and bottom.

> enum_value ScrollHintMode.SCROLL_HINT_MODE_TOP = 2

Only the top scroll hint will be shown.

> enum_value ScrollHintMode.SCROLL_HINT_MODE_BOTTOM = 3

Only the bottom scroll hint will be shown.

> enum SelectMode

> enum_value SelectMode.SELECT_SINGLE = 0

Allows selection of a single cell at a time. From the perspective of items, only a single item is allowed to be selected. And there is only one column selected in the selected item.
The focus cursor is always hidden in this mode, but it is positioned at the current selection, making the currently selected item the currently focused item.

> enum_value SelectMode.SELECT_ROW = 1

Allows selection of a single row at a time. From the perspective of items, only a single items is allowed to be selected. And all the columns are selected in the selected item.
The focus cursor is always hidden in this mode, but it is positioned at the first column of the current selection, making the currently selected item the currently focused item.

> enum_value SelectMode.SELECT_MULTI = 2

Allows selection of multiple cells at the same time. From the perspective of items, multiple items are allowed to be selected. And there can be multiple columns selected in each selected item.
The focus cursor is visible in this mode, the item or column under the cursor is not necessarily selected.

## Theme Properties

> theme_property children_hl_line_color : Color ; data=color ; default=Color(0.27, 0.27, 0.27, 1)

The `Color` of the relationship lines between the selected `TreeItem` and its children.

> theme_property custom_button_font_highlight : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Text `Color` for a `TreeItem.CELL_MODE_CUSTOM` mode cell when it's hovered.

> theme_property drop_on_item_color : Color ; data=color ; default=Color(1, 1, 1, 1)

`Color` used to draw the highlight outline when dragging items that can only be dropped "on" other items.

> theme_property drop_position_color : Color ; data=color ; default=Color(1, 1, 1, 1)

`Color` used to draw possible drop locations. See `DropModeFlags` constants for further description of drop locations.

> theme_property font_color : Color ; data=color ; default=Color(0.7, 0.7, 0.7, 1)

Default text `Color` of the item.

> theme_property font_disabled_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 0.5)

Text `Color` for a `TreeItem.CELL_MODE_CHECK` mode cell when it's non-editable (see `TreeItem.set_editable`).

> theme_property font_hovered_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Text `Color` used when the item is hovered and not selected yet.

> theme_property font_hovered_dimmed_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

Text `Color` used when the item is hovered, while a button of the same item is hovered as the same time.

> theme_property font_hovered_selected_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Text `Color` used when the item is hovered and selected.

> theme_property font_outline_color : Color ; data=color ; default=Color(0, 0, 0, 1)

The tint of text outline of the item.

> theme_property font_selected_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Text `Color` used when the item is selected.

> theme_property guide_color : Color ; data=color ; default=Color(0.7, 0.7, 0.7, 0.25)

`Color` of the guideline.

> theme_property parent_hl_line_color : Color ; data=color ; default=Color(0.27, 0.27, 0.27, 1)

The `Color` of the relationship lines between the selected `TreeItem` and its parents.

> theme_property relationship_line_color : Color ; data=color ; default=Color(0.27, 0.27, 0.27, 1)

The default `Color` of the relationship lines.

> theme_property scroll_hint_color : Color ; data=color ; default=Color(0, 0, 0, 1)

`Color` used to modulate the `scroll_hint` texture.

> theme_property title_button_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

Default text `Color` of the title button.

> theme_property button_margin : int ; data=constant ; default=4

The horizontal space between each button in a cell.

> theme_property check_h_separation : int ; data=constant ; default=4

The horizontal space between the checkbox and the text in a `TreeItem.CELL_MODE_CHECK` mode cell.

> theme_property children_hl_line_width : int ; data=constant ; default=1

The width of the relationship lines between the selected `TreeItem` and its children.

> theme_property dragging_unfold_wait_msec : int ; data=constant ; default=500

During a drag-and-drop, this is how many milliseconds to wait over a section before the section unfolds.

> theme_property draw_guides : int ; data=constant ; default=1

Draws the guidelines if not zero, this acts as a boolean. The guideline is a horizontal line drawn at the bottom of each item.

> theme_property draw_relationship_lines : int ; data=constant ; default=0

Draws the relationship lines if not zero, this acts as a boolean. Relationship lines are drawn at the start of child items to show hierarchy.

> theme_property h_separation : int ; data=constant ; default=4

The horizontal space between item cells. This is also used as the margin at the start of an item when folding is disabled.

> theme_property icon_h_separation : int ; data=constant ; default=4

The horizontal space between the icon and the text in item's cells.

> theme_property icon_max_width : int ; data=constant ; default=0

The maximum allowed width of the icon in item's cells. This limit is applied on top of the default size of the icon, but before the value set with `TreeItem.set_icon_max_width`. The height is adjusted according to the icon's ratio.

> theme_property inner_item_margin_bottom : int ; data=constant ; default=0

The inner bottom margin of a cell.

> theme_property inner_item_margin_left : int ; data=constant ; default=0

The inner left margin of a cell.

> theme_property inner_item_margin_right : int ; data=constant ; default=0

The inner right margin of a cell.

> theme_property inner_item_margin_top : int ; data=constant ; default=0

The inner top margin of a cell.

> theme_property item_margin : int ; data=constant ; default=16

The horizontal margin at the start of an item. This is used when folding is enabled for the item.

> theme_property outline_size : int ; data=constant ; default=0

The size of the text outline.
**Note:** If using a font with `FontFile.multichannel_signed_distance_field` enabled, its `FontFile.msdf_pixel_range` must be set to at least *twice* the value of `outline_size` for outline rendering to look correct. Otherwise, the outline may appear to be cut off earlier than intended.

> theme_property parent_hl_line_margin : int ; data=constant ; default=0

The space between the parent relationship lines for the selected `TreeItem` and the relationship lines to its siblings that are not selected.

> theme_property parent_hl_line_width : int ; data=constant ; default=1

The width of the relationship lines between the selected `TreeItem` and its parents.

> theme_property relationship_line_width : int ; data=constant ; default=1

The default width of the relationship lines.

> theme_property scroll_border : int ; data=constant ; default=4

The maximum distance between the mouse cursor and the control's border to trigger border scrolling when dragging.

> theme_property scroll_speed : int ; data=constant ; default=12

The speed of border scrolling.

> theme_property scrollbar_h_separation : int ; data=constant ; default=4

The horizontal separation of tree content and scrollbar.

> theme_property scrollbar_margin_bottom : int ; data=constant ; default=-1

The bottom margin of the scrollbars. When negative, uses `panel` bottom margin.

> theme_property scrollbar_margin_left : int ; data=constant ; default=-1

The left margin of the horizontal scrollbar. When negative, uses `panel` left margin.

> theme_property scrollbar_margin_right : int ; data=constant ; default=-1

The right margin of the scrollbars. When negative, uses `panel` right margin.

> theme_property scrollbar_margin_top : int ; data=constant ; default=-1

The top margin of the vertical scrollbar. When negative, uses `panel` top margin.

> theme_property scrollbar_v_separation : int ; data=constant ; default=4

The vertical separation of tree content and scrollbar.

> theme_property v_separation : int ; data=constant ; default=4

The vertical padding inside each item, i.e. the distance between the item's content and top/bottom border.

> theme_property font : Font ; data=font

`Font` of the item's text.

> theme_property title_button_font : Font ; data=font

`Font` of the title button's text.

> theme_property font_size : int ; data=font_size

Font size of the item's text.

> theme_property title_button_font_size : int ; data=font_size

Font size of the title button's text.

> theme_property arrow : Texture2D ; data=icon

The arrow icon used when a foldable item is not collapsed.

> theme_property arrow_collapsed : Texture2D ; data=icon

The arrow icon used when a foldable item is collapsed (for left-to-right layouts).

> theme_property arrow_collapsed_mirrored : Texture2D ; data=icon

The arrow icon used when a foldable item is collapsed (for right-to-left layouts).

> theme_property checked : Texture2D ; data=icon

The check icon to display when the `TreeItem.CELL_MODE_CHECK` mode cell is checked and editable (see `TreeItem.set_editable`).

> theme_property checked_disabled : Texture2D ; data=icon

The check icon to display when the `TreeItem.CELL_MODE_CHECK` mode cell is checked and non-editable (see `TreeItem.set_editable`).

> theme_property indeterminate : Texture2D ; data=icon

The check icon to display when the `TreeItem.CELL_MODE_CHECK` mode cell is indeterminate and editable (see `TreeItem.set_editable`).

> theme_property indeterminate_disabled : Texture2D ; data=icon

The check icon to display when the `TreeItem.CELL_MODE_CHECK` mode cell is indeterminate and non-editable (see `TreeItem.set_editable`).

> theme_property scroll_hint : Texture2D ; data=icon

The indicator that will be shown when the content can still be scrolled. See `scroll_hint_mode`.

> theme_property select_arrow : Texture2D ; data=icon

The arrow icon to display for the `TreeItem.CELL_MODE_RANGE` mode cell.

> theme_property unchecked : Texture2D ; data=icon

The check icon to display when the `TreeItem.CELL_MODE_CHECK` mode cell is unchecked and editable (see `TreeItem.set_editable`).

> theme_property unchecked_disabled : Texture2D ; data=icon

The check icon to display when the `TreeItem.CELL_MODE_CHECK` mode cell is unchecked and non-editable (see `TreeItem.set_editable`).

> theme_property updown : Texture2D ; data=icon

The updown arrow icon to display for the `TreeItem.CELL_MODE_RANGE` mode cell.

> theme_property button_hover : StyleBox ; data=style

`StyleBox` used when a button in the tree is hovered.

> theme_property button_pressed : StyleBox ; data=style

`StyleBox` used when a button in the tree is pressed.

> theme_property cursor : StyleBox ; data=style

`StyleBox` used for the cursor, when the `Tree` is being focused.

> theme_property cursor_unfocused : StyleBox ; data=style

`StyleBox` used for the cursor, when the `Tree` is not being focused.

> theme_property custom_button : StyleBox ; data=style

Default `StyleBox` for a `TreeItem.CELL_MODE_CUSTOM` mode cell when button is enabled with `TreeItem.set_custom_as_button`.

> theme_property custom_button_hover : StyleBox ; data=style

`StyleBox` for a `TreeItem.CELL_MODE_CUSTOM` mode button cell when it's hovered.

> theme_property custom_button_pressed : StyleBox ; data=style

`StyleBox` for a `TreeItem.CELL_MODE_CUSTOM` mode button cell when it's pressed.

> theme_property focus : StyleBox ; data=style

The focused style for the `Tree`, drawn on top of everything.

> theme_property hovered : StyleBox ; data=style

`StyleBox` for the item being hovered, but not selected.

> theme_property hovered_dimmed : StyleBox ; data=style

`StyleBox` for the item being hovered, while a button of the same item is hovered as the same time.

> theme_property hovered_selected : StyleBox ; data=style

`StyleBox` for the hovered and selected items, used when the `Tree` is not being focused.

> theme_property hovered_selected_focus : StyleBox ; data=style

`StyleBox` for the hovered and selected items, used when the `Tree` is being focused.

> theme_property panel : StyleBox ; data=style

The background style for the `Tree`.

> theme_property selected : StyleBox ; data=style

`StyleBox` for the selected items, used when the `Tree` is not being focused.

> theme_property selected_focus : StyleBox ; data=style

`StyleBox` for the selected items, used when the `Tree` is being focused.

> theme_property title_button_hover : StyleBox ; data=style

`StyleBox` used when the title button is being hovered.

> theme_property title_button_normal : StyleBox ; data=style

Default `StyleBox` for the title button.

> theme_property title_button_pressed : StyleBox ; data=style

`StyleBox` used when the title button is being pressed.
