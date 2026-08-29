# TextEdit

> class TextEdit ; keywords=textarea
> inherits TextEdit Control

## Brief

A multiline text editor.

## Description

A multiline text editor. It also has limited facilities for editing code, such as syntax highlighting support. For more advanced facilities for editing code, see `CodeEdit`.
While entering text, it is possible to insert special characters using Unicode, OEM or Windows alt codes:
- To enter Unicode codepoints, hold `Alt` and type the codepoint on the numpad. For example, to enter the character `á` (U+00E1), hold `Alt` and type `+E1` on the numpad (the leading zeroes can be omitted).
- To enter OEM codepoints, hold `Alt` and type the code on the numpad. For example, to enter the character `á` (OEM 160), hold `Alt` and type `160` on the numpad.
- To enter Windows codepoints, hold `Alt` and type the code on the numpad. For example, to enter the character `á` (Windows 0225), hold `Alt` and type `0`, `2`, `2`, `5` on the numpad. The leading zero here must **not** be omitted, as this is how Windows codepoints are distinguished from OEM codepoints.
**Note:** Most viewport, caret, and edit methods contain a `caret_index` argument for `caret_multiple` support. The argument should be one of the following: `-1` for all carets, `0` for the main caret, or greater than `0` for secondary carets in the order they were created.
**Note:** When holding down `Alt`, the vertical scroll wheel will scroll 5 times as fast as it would normally do. This also works in the Godot script editor.

## Properties

> property autowrap_mode : TextServer.AutowrapMode ; default=3 ; setter=set_autowrap_mode ; getter=get_autowrap_mode

If `wrap_mode` is set to `LINE_WRAPPING_BOUNDARY`, sets text wrapping mode.

> property backspace_deletes_composite_character_enabled : bool ; default=false ; setter=set_backspace_deletes_composite_character_enabled ; getter=is_backspace_deletes_composite_character_enabled

If `true` and `caret_mid_grapheme` is `false`, backspace deletes an entire composite character such as ❤️‍🩹, instead of deleting part of the composite character.

> property caret_blink : bool ; default=false ; setter=set_caret_blink_enabled ; getter=is_caret_blink_enabled

If `true`, makes the caret blink.

> property caret_blink_interval : float ; default=0.65 ; setter=set_caret_blink_interval ; getter=get_caret_blink_interval

The interval at which the caret blinks (in seconds).

> property caret_draw_when_editable_disabled : bool ; default=false ; setter=set_draw_caret_when_editable_disabled ; getter=is_drawing_caret_when_editable_disabled

If `true`, caret will be visible when `editable` is disabled.

> property caret_mid_grapheme : bool ; default=false ; setter=set_caret_mid_grapheme_enabled ; getter=is_caret_mid_grapheme_enabled

Allow moving caret, selecting and removing the individual composite character components.
**Note:** `Backspace` is always removing individual composite character components.

> property caret_move_on_right_click : bool ; default=true ; setter=set_move_caret_on_right_click_enabled ; getter=is_move_caret_on_right_click_enabled

If `true`, a right-click moves the caret at the mouse position before displaying the context menu.
If `false`, the context menu ignores mouse location.

> property caret_multiple : bool ; default=true ; setter=set_multiple_carets_enabled ; getter=is_multiple_carets_enabled

If `true`, multiple carets are allowed. Left-clicking with `Alt` adds a new caret. See `add_caret` and `get_caret_count`.

> property caret_type : CaretType ; default=0 ; setter=set_caret_type ; getter=get_caret_type

Set the type of caret to draw.

> property context_menu_enabled : bool ; default=true ; setter=set_context_menu_enabled ; getter=is_context_menu_enabled

If `true`, a right-click displays the context menu.

> property custom_word_separators : String ; default="" ; setter=set_custom_word_separators ; getter=get_custom_word_separators

The characters to consider as word delimiters if `use_custom_word_separators` is `true`. The characters should be defined without separation, for example `#_!`.

> property deselect_on_focus_loss_enabled : bool ; default=true ; setter=set_deselect_on_focus_loss_enabled ; getter=is_deselect_on_focus_loss_enabled

If `true`, the selected text will be deselected when focus is lost.

> property drag_and_drop_selection_enabled : bool ; default=true ; setter=set_drag_and_drop_selection_enabled ; getter=is_drag_and_drop_selection_enabled

If `true`, allow drag and drop of selected text. Text can still be dropped from other sources.

> property draw_control_chars : bool ; default=false ; setter=set_draw_control_chars ; getter=get_draw_control_chars

If `true`, control characters are displayed.

> property draw_spaces : bool ; default=false ; setter=set_draw_spaces ; getter=is_drawing_spaces

If `true`, the "space" character will have a visible representation.

> property draw_tabs : bool ; default=false ; setter=set_draw_tabs ; getter=is_drawing_tabs

If `true`, the "tab" character will have a visible representation.

> property editable : bool ; default=true ; setter=set_editable ; getter=is_editable

If `false`, existing text cannot be modified and new text cannot be added.

> property emoji_menu_enabled : bool ; default=true ; setter=set_emoji_menu_enabled ; getter=is_emoji_menu_enabled

If `true`, "Emoji and Symbols" menu is enabled.

> property empty_selection_clipboard_enabled : bool ; default=true ; setter=set_empty_selection_clipboard_enabled ; getter=is_empty_selection_clipboard_enabled

If `true`, copying or cutting without a selection is performed on all lines with a caret. Otherwise, copy and cut require a selection.

> property focus_mode : Control.FocusMode ; default=2 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property highlight_all_occurrences : bool ; default=false ; setter=set_highlight_all_occurrences ; getter=is_highlight_all_occurrences_enabled

If `true`, all occurrences of the selected text will be highlighted.

> property highlight_current_line : bool ; default=false ; setter=set_highlight_current_line ; getter=is_highlight_current_line_enabled

If `true`, the line containing the cursor is highlighted.

> property indent_wrapped_lines : bool ; default=false ; setter=set_indent_wrapped_lines ; getter=is_indent_wrapped_lines

If `true`, all wrapped lines are indented to the same amount as the unwrapped line.

> property language : String ; default="" ; setter=set_language ; getter=get_language

Language code used for line-breaking and text shaping algorithms. If left empty, the current locale is used instead.

> property middle_mouse_paste_enabled : bool ; default=true ; setter=set_middle_mouse_paste_enabled ; getter=is_middle_mouse_paste_enabled

If `false`, using middle mouse button to paste clipboard will be disabled.
**Note:** This method is only implemented on Linux.

> property minimap_draw : bool ; default=false ; setter=set_draw_minimap ; getter=is_drawing_minimap

If `true`, a minimap is shown, providing an outline of your source code. The minimap uses a fixed-width text size.

> property minimap_width : int ; default=80 ; setter=set_minimap_width ; getter=get_minimap_width

The width, in pixels, of the minimap.

> property mouse_default_cursor_shape : Control.CursorShape ; default=1 ; setter=set_default_cursor_shape ; getter=get_default_cursor_shape ; overrides=Control

> property placeholder_text : String ; default="" ; setter=set_placeholder ; getter=get_placeholder

Text shown when the `TextEdit` is empty. It is **not** the `TextEdit`'s default value (see `text`).

> property scroll_fit_content_height : bool ; default=false ; setter=set_fit_content_height_enabled ; getter=is_fit_content_height_enabled

If `true`, `TextEdit` fits its minimum height to the number of visible lines instead of scrolling vertically. If a maximum height is set (for example via `Control.custom_maximum_size`) and content exceeds it, a vertical scrollbar is shown.

> property scroll_fit_content_width : bool ; default=false ; setter=set_fit_content_width_enabled ; getter=is_fit_content_width_enabled

If `true`, `TextEdit` fits its minimum width to the widest line instead of scrolling horizontally. If a maximum width is set (for example via `Control.custom_maximum_size`) and content exceeds it, a horizontal scrollbar is shown.

> property scroll_horizontal : int ; default=0 ; setter=set_h_scroll ; getter=get_h_scroll

If there is a horizontal scrollbar, this determines the current horizontal scroll value in pixels.

> property scroll_past_end_of_file : bool ; default=false ; setter=set_scroll_past_end_of_file_enabled ; getter=is_scroll_past_end_of_file_enabled

Allow scrolling past the last line into "virtual" space.

> property scroll_smooth : bool ; default=false ; setter=set_smooth_scroll_enabled ; getter=is_smooth_scroll_enabled

Scroll smoothly over the text rather than jumping to the next location.

> property scroll_v_scroll_speed : float ; default=80.0 ; setter=set_v_scroll_speed ; getter=get_v_scroll_speed

Sets the scroll speed with the minimap or when `scroll_smooth` is enabled.

> property scroll_vertical : float ; default=0.0 ; setter=set_v_scroll ; getter=get_v_scroll

If there is a vertical scrollbar, this determines the current vertical scroll value in line numbers, starting at 0 for the top line.

> property selecting_enabled : bool ; default=true ; setter=set_selecting_enabled ; getter=is_selecting_enabled

If `true`, text can be selected.
If `false`, text can not be selected by the user or by the `select` or `select_all` methods.

> property shortcut_keys_enabled : bool ; default=true ; setter=set_shortcut_keys_enabled ; getter=is_shortcut_keys_enabled

If `true`, shortcut keys for context menu items are enabled, even if the context menu is disabled.

> property structured_text_bidi_override : TextServer.StructuredTextParser ; default=0 ; setter=set_structured_text_bidi_override ; getter=get_structured_text_bidi_override

Set BiDi algorithm override for the structured text.

> property structured_text_bidi_override_options : Array ; default=[] ; setter=set_structured_text_bidi_override_options ; getter=get_structured_text_bidi_override_options

Set additional options for BiDi override.

> property syntax_highlighter : SyntaxHighlighter ; setter=set_syntax_highlighter ; getter=get_syntax_highlighter

The syntax highlighter to use.
**Note:** A `SyntaxHighlighter` instance should not be used across multiple `TextEdit` nodes.

> property tab_input_mode : bool ; default=true ; setter=set_tab_input_mode ; getter=get_tab_input_mode

If `true`, `ProjectSettings.input/ui_text_indent` input `Tab` character, otherwise it moves keyboard focus to the next `Control` in the scene.

> property text : String ; default="" ; setter=set_text ; getter=get_text

String value of the `TextEdit`.

> property text_direction : Control.TextDirection ; default=0 ; setter=set_text_direction ; getter=get_text_direction

Base text writing direction.

> property use_custom_word_separators : bool ; default=false ; setter=set_use_custom_word_separators ; getter=is_custom_word_separators_enabled

If `false`, using `Ctrl + Left` or `Ctrl + Right` (`Cmd + Left` or `Cmd + Right` on macOS) bindings will use the behavior of `use_default_word_separators`. If `true`, it will also stop the caret if a character within `custom_word_separators` is detected. Useful for subword moving. This behavior also will be applied to the behavior of text selection.

> property use_default_word_separators : bool ; default=true ; setter=set_use_default_word_separators ; getter=is_default_word_separators_enabled

If `false`, using `Ctrl + Left` or `Ctrl + Right` (`Cmd + Left` or `Cmd + Right` on macOS) bindings will stop moving caret only if a space or punctuation is detected. If `true`, it will also stop the caret if a character is part of `!"#$%&'()*+,-./:;<=>?@[\]^\`{|}~`, the Unicode General Punctuation table, or the Unicode CJK Punctuation table. Useful for subword moving. This behavior also will be applied to the behavior of text selection.

> property virtual_keyboard_enabled : bool ; default=true ; setter=set_virtual_keyboard_enabled ; getter=is_virtual_keyboard_enabled

If `true`, the native virtual keyboard is enabled on platforms that support it.

> property virtual_keyboard_show_on_focus : bool ; default=true ; setter=set_virtual_keyboard_show_on_focus ; getter=get_virtual_keyboard_show_on_focus

If `true`, the native virtual keyboard is shown on focus events on platforms that support it.

> property wrap_mode : LineWrappingMode ; default=0 ; setter=set_line_wrapping_mode ; getter=get_line_wrapping_mode

Sets the line wrapping mode to use.

## Methods

> method _backspace(caret_index: int) -> void ; qualifiers=virtual

Override this method to define what happens when the user presses the backspace key.

> method _copy(caret_index: int) -> void ; qualifiers=virtual

Override this method to define what happens when the user performs a copy operation.

> method _cut(caret_index: int) -> void ; qualifiers=virtual

Override this method to define what happens when the user performs a cut operation.

> method _handle_unicode_input(unicode_char: int, caret_index: int) -> void ; qualifiers=virtual

Override this method to define what happens when the user types in the provided key `unicode_char`.

> method _paste(caret_index: int) -> void ; qualifiers=virtual

Override this method to define what happens when the user performs a paste operation.

> method _paste_primary_clipboard(caret_index: int) -> void ; qualifiers=virtual

Override this method to define what happens when the user performs a paste operation with middle mouse button.
**Note:** This method is only implemented on Linux.

> method add_caret(line: int, column: int) -> int

Adds a new caret at the given location. Returns the index of the new caret, or `-1` if the location is invalid.

> method add_caret_at_carets(below: bool) -> void

Adds an additional caret above or below every caret. If `below` is `true` the new caret will be added below and above otherwise.

> method add_gutter(at: int = -1) -> void

Register a new gutter to this `TextEdit`. Use `at` to have a specific gutter order. A value of `-1` appends the gutter to the right.

> method add_selection_for_next_occurrence() -> void

Adds a selection and a caret for the next occurrence of the current selection. If there is no active selection, selects word under caret.

> method adjust_carets_after_edit(caret: int, from_line: int, from_col: int, to_line: int, to_col: int) -> void ; deprecated=No longer necessary since methods now adjust carets themselves.

This method does nothing.

> method adjust_viewport_to_caret(caret_index: int = 0) -> void

Adjust the viewport so the caret is visible.

> method apply_ime() -> void

Applies text from the [Input Method Editor](https://en.wikipedia.org/wiki/Input_method) (IME) to each caret and closes the IME if it is open.

> method backspace(caret_index: int = -1) -> void

Called when the user presses the backspace key. Can be overridden with `_backspace`.

> method begin_complex_operation() -> void

Starts a multipart edit. All edits will be treated as one action until `end_complex_operation` is called.

> method begin_multicaret_edit() -> void

Starts an edit for multiple carets. The edit must be ended with `end_multicaret_edit`. Multicaret edits can be used to edit text at multiple carets and delay merging the carets until the end, so the caret indexes aren't affected immediately. `begin_multicaret_edit` and `end_multicaret_edit` can be nested, and the merge will happen at the last `end_multicaret_edit`.

```text
                begin_complex_operation()
                begin_multicaret_edit()
                for i in range(get_caret_count()):
                    if multicaret_edit_ignore_caret(i):
                        continue
                    # Logic here.
                end_multicaret_edit()
                end_complex_operation()

```

> method cancel_ime() -> void

Closes the [Input Method Editor](https://en.wikipedia.org/wiki/Input_method) (IME) if it is open. Any text in the IME will be lost.

> method center_viewport_to_caret(caret_index: int = 0) -> void

Centers the viewport on the line the editing caret is at. This also resets the `scroll_horizontal` value to `0`.

> method clear() -> void

Performs a full reset of `TextEdit`, including undo history.

> method clear_undo_history() -> void

Clears the undo history.

> method collapse_carets(from_line: int, from_column: int, to_line: int, to_column: int, inclusive: bool = false) -> void

Collapse all carets in the given range to the `from_line` and `from_column` position.
`inclusive` applies to both ends.
If `is_in_mulitcaret_edit` is `true`, carets that are collapsed will be `true` for `multicaret_edit_ignore_caret`.
`merge_overlapping_carets` will be called if any carets were collapsed.

> method copy(caret_index: int = -1) -> void

Copies the current text selection. Can be overridden with `_copy`.

> method cut(caret_index: int = -1) -> void

Cut's the current selection. Can be overridden with `_cut`.

> method delete_selection(caret_index: int = -1) -> void

Deletes the selected text.

> method deselect(caret_index: int = -1) -> void

Deselects the current selection.

> method end_action() -> void

Marks the end of steps in the current action started with `start_action`.

> method end_complex_operation() -> void

Ends a multipart edit, started with `begin_complex_operation`. If called outside a complex operation, the current operation is pushed onto the undo/redo stack.

> method end_multicaret_edit() -> void

Ends an edit for multiple carets, that was started with `begin_multicaret_edit`. If this was the last `end_multicaret_edit` and `merge_overlapping_carets` was called, carets will be merged.

> method get_caret_column(caret_index: int = 0) -> int ; qualifiers=const

Returns the column the editing caret is at.

> method get_caret_count() -> int ; qualifiers=const

Returns the number of carets in this `TextEdit`.

> method get_caret_draw_pos(caret_index: int = 0) -> Vector2 ; qualifiers=const

Returns the caret pixel draw position.

> method get_caret_index_edit_order() -> PackedInt32Array ; deprecated=Carets no longer need to be edited in any specific order. If the carets need to be sorted, use `get_sorted_carets` instead.

Returns a list of caret indexes in their edit order, this done from bottom to top. Edit order refers to the way actions such as `insert_text_at_caret` are applied.

> method get_caret_line(caret_index: int = 0) -> int ; qualifiers=const

Returns the line the editing caret is on.

> method get_caret_wrap_index(caret_index: int = 0) -> int ; qualifiers=const

Returns the wrap index the editing caret is on.

> method get_first_non_whitespace_column(line: int) -> int ; qualifiers=const

Returns the first column containing a non-whitespace character on the given line. If there is only whitespace, returns the number of characters.

> method get_first_visible_line() -> int ; qualifiers=const

Returns the first visible line.

> method get_gutter_count() -> int ; qualifiers=const

Returns the number of gutters registered.

> method get_gutter_name(gutter: int) -> String ; qualifiers=const

Returns the name of the gutter at the given index.

> method get_gutter_type(gutter: int) -> GutterType ; qualifiers=const

Returns the type of the gutter at the given index. Gutters can contain icons, text, or custom visuals.

> method get_gutter_width(gutter: int) -> int ; qualifiers=const

Returns the width of the gutter at the given index.

> method get_h_scroll_bar() -> HScrollBar ; qualifiers=const

Returns the `HScrollBar` used by `TextEdit`.

> method get_indent_level(line: int) -> int ; qualifiers=const

Returns the indent level of the given line. This is the number of spaces and tabs at the beginning of the line, with the tabs taking the tab size into account (see `get_tab_size`).

> method get_last_full_visible_line() -> int ; qualifiers=const

Returns the last visible line. Use `get_last_full_visible_line_wrap_index` for the wrap index.

> method get_last_full_visible_line_wrap_index() -> int ; qualifiers=const

Returns the last visible wrap index of the last visible line.

> method get_last_unhidden_line() -> int ; qualifiers=const

Returns the last unhidden line in the entire `TextEdit`.

> method get_line(line: int) -> String ; qualifiers=const

Returns the text of a specific line.

> method get_line_background_color(line: int) -> Color ; qualifiers=const

Returns the custom background color of the given line. If no color is set, returns `Color(0, 0, 0, 0)`.

> method get_line_column_at_pos(position: Vector2i, clamp_line: bool = true, clamp_column: bool = true) -> Vector2i ; qualifiers=const

Returns the line and column at the given position. In the returned vector, `x` is the column and `y` is the line.
If `clamp_line` is `false` and `position` is below the last line, `Vector2i(-1, -1)` is returned.
If `clamp_column` is `false` and `position` is outside the column range of the line, `Vector2i(-1, -1)` is returned.

> method get_line_count() -> int ; qualifiers=const

Returns the number of lines in the text.

> method get_line_gutter_icon(line: int, gutter: int) -> Texture2D ; qualifiers=const

Returns the icon currently in `gutter` at `line`. This only works when the gutter type is `GUTTER_TYPE_ICON` (see `set_gutter_type`).

> method get_line_gutter_item_color(line: int, gutter: int) -> Color ; qualifiers=const

Returns the color currently in `gutter` at `line`.

> method get_line_gutter_metadata(line: int, gutter: int) -> Variant ; qualifiers=const

Returns the metadata currently in `gutter` at `line`.

> method get_line_gutter_text(line: int, gutter: int) -> String ; qualifiers=const

Returns the text currently in `gutter` at `line`. This only works when the gutter type is `GUTTER_TYPE_STRING` (see `set_gutter_type`).

> method get_line_height() -> int ; qualifiers=const

Returns the maximum value of the line height among all lines.
**Note:** The return value is influenced by `line_spacing` and `font_size`. And it will not be less than `1`.

> method get_line_ranges_from_carets(only_selections: bool = false, merge_adjacent: bool = true) -> Array[Vector2i] ; qualifiers=const

Returns an `Array` of line ranges where `x` is the first line and `y` is the last line. All lines within these ranges will have a caret on them or be part of a selection. Each line will only be part of one line range, even if it has multiple carets on it.
If a selection's end column (`get_selection_to_column`) is at column `0`, that line will not be included. If a selection begins on the line after another selection ends and `merge_adjacent` is `true`, or they begin and end on the same line, one line range will include both selections.

> method get_line_width(line: int, wrap_index: int = -1) -> int ; qualifiers=const

Returns the width in pixels of the `wrap_index` on `line`.

> method get_line_with_ime(line: int) -> String ; qualifiers=const

Returns line text as it is currently displayed, including IME composition string.

> method get_line_wrap_count(line: int) -> int ; qualifiers=const

Returns the number of times the given line is wrapped.

> method get_line_wrap_index_at_column(line: int, column: int) -> int ; qualifiers=const

Returns the wrap index of the given column on the given line. This ranges from `0` to `get_line_wrap_count`.

> method get_line_wrapped_text(line: int) -> PackedStringArray ; qualifiers=const

Returns an array of `String`s representing each wrapped index.

> method get_local_mouse_pos() -> Vector2 ; qualifiers=const

Returns the local mouse position adjusted for the text direction.

> method get_menu() -> PopupMenu ; qualifiers=const

Returns the `PopupMenu` of this `TextEdit`. By default, this menu is displayed when right-clicking on the `TextEdit`.
You can add custom menu items or remove standard ones. Make sure your IDs don't conflict with the standard ones (see `MenuItems`). For example:

```gdscript
                func _ready():
                    var menu = get_menu()
                    # Remove all items after "Redo".
                    menu.item_count = menu.get_item_index(MENU_REDO) + 1
                    # Add custom items.
                    menu.add_separator()
                    menu.add_item("Insert Date", MENU_MAX + 1)
                    # Connect callback.
                    menu.id_pressed.connect(_on_item_pressed)

                func _on_item_pressed(id):
                    if id == MENU_MAX + 1:
                        insert_text_at_caret(Time.get_date_string_from_system())

```

```csharp
                public override void _Ready()
                {
                    var menu = GetMenu();
                    // Remove all items after "Redo".
                    menu.ItemCount = menu.GetItemIndex(TextEdit.MenuItems.Redo) + 1;
                    // Add custom items.
                    menu.AddSeparator();
                    menu.AddItem("Insert Date", TextEdit.MenuItems.Max + 1);
                    // Add event handler.
                    menu.IdPressed += OnItemPressed;
                }

                public void OnItemPressed(int id)
                {
                    if (id == TextEdit.MenuItems.Max + 1)
                    {
                        InsertTextAtCaret(Time.GetDateStringFromSystem());
                    }
                }

```

**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `Window.visible` property.

> method get_minimap_line_at_pos(position: Vector2i) -> int ; qualifiers=const

Returns the equivalent minimap line at `position`.

> method get_minimap_visible_lines() -> int ; qualifiers=const

Returns the number of lines that may be drawn on the minimap.

> method get_next_composite_character_column(line: int, column: int) -> int ; qualifiers=const

Returns the correct column at the end of a composite character like ❤️‍🩹 (mending heart; Unicode: `U+2764 U+FE0F U+200D U+1FA79`) which is comprised of more than one Unicode code point, if the caret is at the start of the composite character. Also returns the correct column with the caret at mid grapheme and for non-composite characters.
**Note:** To check at caret location use `get_next_composite_character_column(get_caret_line(), get_caret_column())`

> method get_next_visible_line_index_offset_from(line: int, wrap_index: int, visible_amount: int) -> Vector2i ; qualifiers=const

Similar to `get_next_visible_line_offset_from`, but takes into account the line wrap indexes. In the returned vector, `x` is the line, `y` is the wrap index.

> method get_next_visible_line_offset_from(line: int, visible_amount: int) -> int ; qualifiers=const

Returns the count to the next visible line from `line` to `line + visible_amount`. Can also count backwards. For example if a `TextEdit` has 5 lines with lines 2 and 3 hidden, calling this with `line = 1, visible_amount = 1` would return 3.

> method get_pos_at_line_column(line: int, column: int) -> Vector2i ; qualifiers=const

Returns the local position for the given `line` and `column`. If `x` or `y` of the returned vector equal `-1`, the position is outside of the viewable area of the control.
**Note:** The Y position corresponds to the bottom side of the line. Use `get_rect_at_line_column` to get the top side position.

> method get_previous_composite_character_column(line: int, column: int) -> int ; qualifiers=const

Returns the correct column at the start of a composite character like ❤️‍🩹 (mending heart; Unicode: `U+2764 U+FE0F U+200D U+1FA79`) which is comprised of more than one Unicode code point, if the caret is at the end of the composite character. Also returns the correct column with the caret at mid grapheme and for non-composite characters.
**Note:** To check at caret location use `get_previous_composite_character_column(get_caret_line(), get_caret_column())`

> method get_rect_at_line_column(line: int, column: int) -> Rect2i ; qualifiers=const

Returns the local position and size for the grapheme at the given `line` and `column`. If `x` or `y` position of the returned rect equal `-1`, the position is outside of the viewable area of the control.
**Note:** The Y position of the returned rect corresponds to the top side of the line, unlike `get_pos_at_line_column` which returns the bottom side.

> method get_saved_version() -> int ; qualifiers=const

Returns the last tagged saved version from `tag_saved_version`.

> method get_scroll_pos_for_line(line: int, wrap_index: int = 0) -> float ; qualifiers=const

Returns the scroll position for `wrap_index` of `line`.

> method get_selected_text(caret_index: int = -1) -> String

Returns the text inside the selection of a caret, or all the carets if `caret_index` is its default value `-1`.

> method get_selection_at_line_column(line: int, column: int, include_edges: bool = true, only_selections: bool = true) -> int ; qualifiers=const

Returns the caret index of the selection at the given `line` and `column`, or `-1` if there is none.
If `include_edges` is `false`, the position must be inside the selection and not at either end. If `only_selections` is `false`, carets without a selection will also be considered.

> method get_selection_column(caret_index: int = 0) -> int ; qualifiers=const ; deprecated=Use `get_selection_origin_column` instead.

Returns the original start column of the selection.

> method get_selection_from_column(caret_index: int = 0) -> int ; qualifiers=const

Returns the selection begin column. Returns the caret column if there is no selection.

> method get_selection_from_line(caret_index: int = 0) -> int ; qualifiers=const

Returns the selection begin line. Returns the caret line if there is no selection.

> method get_selection_line(caret_index: int = 0) -> int ; qualifiers=const ; deprecated=Use `get_selection_origin_line` instead.

Returns the original start line of the selection.

> method get_selection_mode() -> SelectionMode ; qualifiers=const

Returns the current selection mode.

> method get_selection_origin_column(caret_index: int = 0) -> int ; qualifiers=const

Returns the origin column of the selection. This is the opposite end from the caret.

> method get_selection_origin_line(caret_index: int = 0) -> int ; qualifiers=const

Returns the origin line of the selection. This is the opposite end from the caret.

> method get_selection_to_column(caret_index: int = 0) -> int ; qualifiers=const

Returns the selection end column. Returns the caret column if there is no selection.

> method get_selection_to_line(caret_index: int = 0) -> int ; qualifiers=const

Returns the selection end line. Returns the caret line if there is no selection.

> method get_sorted_carets(include_ignored_carets: bool = false) -> PackedInt32Array ; qualifiers=const

Returns the carets sorted by selection beginning from lowest line and column to highest (from top to bottom of text).
If `include_ignored_carets` is `false`, carets from `multicaret_edit_ignore_caret` will be ignored.

> method get_tab_size() -> int ; qualifiers=const

Returns the `TextEdit`'s' tab size.

> method get_total_gutter_width() -> int ; qualifiers=const

Returns the total width of all gutters and internal padding.

> method get_total_visible_line_count() -> int ; qualifiers=const

Returns the total number of lines in the text. This includes wrapped lines and excludes folded lines. If `wrap_mode` is set to `LINE_WRAPPING_NONE` and no lines are folded (see `CodeEdit.is_line_folded`) then this is equivalent to `get_line_count`. See `get_visible_line_count_in_range` for a limited range of lines.

> method get_v_scroll_bar() -> VScrollBar ; qualifiers=const

Returns the `VScrollBar` of the `TextEdit`.

> method get_version() -> int ; qualifiers=const

Returns the current version of the `TextEdit`. The version is a count of recorded operations by the undo/redo history.

> method get_visible_line_count() -> int ; qualifiers=const

Returns the number of lines that can visually fit, rounded down, based on this control's height.

> method get_visible_line_count_in_range(from_line: int, to_line: int) -> int ; qualifiers=const

Returns the total number of lines between `from_line` and `to_line` (inclusive) in the text. This includes wrapped lines and excludes folded lines. If the range covers all lines it is equivalent to `get_total_visible_line_count`.

> method get_word_at_pos(position: Vector2) -> String ; qualifiers=const

Returns the word at `position`.

> method get_word_under_caret(caret_index: int = -1) -> String ; qualifiers=const

Returns a `String` text with the word under the caret's location.

> method has_ime_text() -> bool ; qualifiers=const

Returns `true` if the user has text in the [Input Method Editor](https://en.wikipedia.org/wiki/Input_method) (IME).

> method has_redo() -> bool ; qualifiers=const

Returns `true` if a "redo" action is available.

> method has_selection(caret_index: int = -1) -> bool ; qualifiers=const

Returns `true` if the user has selected text.

> method has_undo() -> bool ; qualifiers=const

Returns `true` if an "undo" action is available.

> method insert_line_at(line: int, text: String) -> void

Inserts a new line with `text` at `line`.

> method insert_text(text: String, line: int, column: int, before_selection_begin: bool = true, before_selection_end: bool = false) -> void

Inserts the `text` at `line` and `column`.
If `before_selection_begin` is `true`, carets and selections that begin at `line` and `column` will moved to the end of the inserted text, along with all carets after it.
If `before_selection_end` is `true`, selections that end at `line` and `column` will be extended to the end of the inserted text. These parameters can be used to insert text inside of or outside of selections.

> method insert_text_at_caret(text: String, caret_index: int = -1) -> void

Insert the specified text at the caret position.

> method is_caret_after_selection_origin(caret_index: int = 0) -> bool ; qualifiers=const

Returns `true` if the caret of the selection is after the selection origin. This can be used to determine the direction of the selection.

> method is_caret_visible(caret_index: int = 0) -> bool ; qualifiers=const

Returns `true` if the caret is visible, `false` otherwise. A caret will be considered hidden if it is outside the scrollable area when scrolling is enabled.
**Note:** `is_caret_visible` does not account for a caret being off-screen if it is still within the scrollable area. It will return `true` even if the caret is off-screen as long as it meets `TextEdit`'s own conditions for being visible. This includes uses of `scroll_fit_content_width` and `scroll_fit_content_height` that cause the `TextEdit` to expand beyond the viewport's bounds.
**Note:** This method does *not* guarantee an accurate visibility check immediately after setting the caret position. The correct value may only be available in the next frame after the `TextEdit` has finished drawing. This also applies to any operation that causes the `TextEdit` to change in size.

> method is_dragging_cursor() -> bool ; qualifiers=const

Returns `true` if the user is dragging their mouse for scrolling, selecting, or text dragging.

> method is_gutter_clickable(gutter: int) -> bool ; qualifiers=const

Returns `true` if the gutter at the given index is clickable. See `set_gutter_clickable`.

> method is_gutter_drawn(gutter: int) -> bool ; qualifiers=const

Returns `true` if the gutter at the given index is currently drawn. See `set_gutter_draw`.

> method is_gutter_overwritable(gutter: int) -> bool ; qualifiers=const

Returns `true` if the gutter at the given index is overwritable. See `set_gutter_overwritable`.

> method is_in_mulitcaret_edit() -> bool ; qualifiers=const

Returns `true` if a `begin_multicaret_edit` has been called and `end_multicaret_edit` has not yet been called.

> method is_line_gutter_clickable(line: int, gutter: int) -> bool ; qualifiers=const

Returns `true` if the gutter at the given index on the given line is clickable. See `set_line_gutter_clickable`.

> method is_line_in_viewport(line: int) -> bool ; qualifiers=const

Returns `true` if the given line is within the scope of the scrollable area of the viewport.

> method is_line_wrapped(line: int) -> bool ; qualifiers=const

Returns if the given line is wrapped.

> method is_menu_visible() -> bool ; qualifiers=const

Returns `true` if the menu is visible. Use this instead of `get_menu().visible` to improve performance (so the creation of the menu is avoided). See `get_menu`.

> method is_mouse_over_selection(edges: bool, caret_index: int = -1) -> bool ; qualifiers=const

Returns `true` if the mouse is over a selection. If `edges` is `true`, the edges are considered part of the selection.

> method is_overtype_mode_enabled() -> bool ; qualifiers=const

Returns `true` if overtype mode is enabled. See `set_overtype_mode_enabled`.

> method menu_option(option: int) -> void

Executes a given action as defined in the `MenuItems` enum.

> method merge_gutters(from_line: int, to_line: int) -> void

Merge the gutters from `from_line` into `to_line`. Only overwritable gutters will be copied. See `set_gutter_overwritable`.

> method merge_overlapping_carets() -> void

Merges any overlapping carets. Will favor the newest caret, or the caret with a selection.
If `is_in_mulitcaret_edit` is `true`, the merge will be queued to happen at the end of the multicaret edit. See `begin_multicaret_edit` and `end_multicaret_edit`.
**Note:** This is not called when a caret changes position but after certain actions, so it is possible to get into a state where carets overlap.

> method multicaret_edit_ignore_caret(caret_index: int) -> bool ; qualifiers=const

Returns `true` if the given `caret_index` should be ignored as part of a multicaret edit. See `begin_multicaret_edit` and `end_multicaret_edit`. Carets that should be ignored are ones that were part of removed text and will likely be merged at the end of the edit, or carets that were added during the edit.
It is recommended to `continue` within a loop iterating on multiple carets if a caret should be ignored.

> method paste(caret_index: int = -1) -> void

Paste at the current location. Can be overridden with `_paste`.

> method paste_primary_clipboard(caret_index: int = -1) -> void

Pastes the primary clipboard.

> method redo() -> void

Perform redo operation.

> method remove_caret(caret: int) -> void

Removes the given caret index.
**Note:** This can result in adjustment of all other caret indices.

> method remove_gutter(gutter: int) -> void

Removes the gutter at the given index.

> method remove_line_at(line: int, move_carets_down: bool = true) -> void

Removes the line of text at `line`. Carets on this line will attempt to match their previous visual x position.
If `move_carets_down` is `true` carets will move to the next line down, otherwise carets will move up.

> method remove_secondary_carets() -> void

Removes all additional carets.

> method remove_text(from_line: int, from_column: int, to_line: int, to_column: int) -> void

Removes text between the given positions.

> method search(text: String, flags: int, from_line: int, from_column: int) -> Vector2i ; qualifiers=const

Perform a search inside the text. Search flags can be specified in the `SearchFlags` enum.
In the returned vector, `x` is the column, `y` is the line. If no results are found, both are equal to `-1`.

```gdscript
                var result = search("print", SEARCH_WHOLE_WORDS, 0, 0)
                if result.x != -1:
                    # Result found.
                    var line_number = result.y
                    var column_number = result.x

```

```csharp
                Vector2I result = Search("print", (uint)TextEdit.SearchFlags.WholeWords, 0, 0);
                if (result.X != -1)
                {
                    // Result found.
                    int lineNumber = result.Y;
                    int columnNumber = result.X;
                }

```

> method select(origin_line: int, origin_column: int, caret_line: int, caret_column: int, caret_index: int = 0) -> void

Selects text from `origin_line` and `origin_column` to `caret_line` and `caret_column` for the given `caret_index`. This moves the selection origin and the caret. If the positions are the same, the selection will be deselected.
If `selecting_enabled` is `false`, no selection will occur.
**Note:** If supporting multiple carets this will not check for any overlap. See `merge_overlapping_carets`.

> method select_all() -> void

Select all the text.
If `selecting_enabled` is `false`, no selection will occur.

> method select_word_under_caret(caret_index: int = -1) -> void

Selects the word under the caret.

> method set_caret_column(column: int, adjust_viewport: bool = true, caret_index: int = 0) -> void

Moves the caret to the specified `column` index.
If `adjust_viewport` is `true`, the viewport will center at the caret position after the move occurs.
**Note:** If supporting multiple carets this will not check for any overlap. See `merge_overlapping_carets`.

> method set_caret_line(line: int, adjust_viewport: bool = true, can_be_hidden: bool = true, wrap_index: int = 0, caret_index: int = 0) -> void

Moves the caret to the specified `line` index. The caret column will be moved to the same visual position it was at the last time `set_caret_column` was called, or clamped to the end of the line.
If `adjust_viewport` is `true`, the viewport will center at the caret position after the move occurs.
If `can_be_hidden` is `true`, the specified `line` can be hidden.
If `wrap_index` is `-1`, the caret column will be clamped to the `line`'s length. If `wrap_index` is greater than `-1`, the column will be moved to attempt to match the visual x position on the line's `wrap_index` to the position from the last time `set_caret_column` was called.
**Note:** If supporting multiple carets this will not check for any overlap. See `merge_overlapping_carets`.

> method set_gutter_clickable(gutter: int, clickable: bool) -> void

If `true`, the mouse cursor will change to a pointing hand (`Control.CURSOR_POINTING_HAND`) when hovering over the gutter at the given index. See `is_gutter_clickable` and `set_line_gutter_clickable`.

> method set_gutter_custom_draw(column: int, draw_callback: Callable) -> void

Set a custom draw callback for the gutter at the given index. `draw_callback` must take the following arguments: A line index `int`, a gutter index `int`, and an area `Rect2`. This callback only works when the gutter type is `GUTTER_TYPE_CUSTOM` (see `set_gutter_type`).

> method set_gutter_draw(gutter: int, draw: bool) -> void

If `true`, the gutter at the given index is drawn. The gutter type (`set_gutter_type`) determines how it is drawn. See `is_gutter_drawn`.

> method set_gutter_name(gutter: int, name: String) -> void

Sets the name of the gutter at the given index.

> method set_gutter_overwritable(gutter: int, overwritable: bool) -> void

If `true`, the line data of the gutter at the given index can be overridden when using `merge_gutters`. See `is_gutter_overwritable`.

> method set_gutter_type(gutter: int, type: GutterType) -> void

Sets the type of gutter at the given index. Gutters can contain icons, text, or custom visuals.

> method set_gutter_width(gutter: int, width: int) -> void

Set the width of the gutter at the given index.

> method set_line(line: int, new_text: String) -> void

Sets the text for a specific `line`.
Carets on the line will attempt to keep their visual x position.

> method set_line_as_center_visible(line: int, wrap_index: int = 0) -> void

Positions the `wrap_index` of `line` at the center of the viewport.

> method set_line_as_first_visible(line: int, wrap_index: int = 0) -> void

Positions the `wrap_index` of `line` at the top of the viewport.

> method set_line_as_last_visible(line: int, wrap_index: int = 0) -> void

Positions the `wrap_index` of `line` at the bottom of the viewport.

> method set_line_background_color(line: int, color: Color) -> void

Sets the custom background color of the given line. If transparent, this color is applied on top of the default background color (See `background_color`). If set to `Color(0, 0, 0, 0)`, no additional color is applied.

> method set_line_gutter_clickable(line: int, gutter: int, clickable: bool) -> void

If `clickable` is `true`, makes the `gutter` on the given `line` clickable. This is like `set_gutter_clickable`, but for a single line. If `is_gutter_clickable` is `true`, this will not have any effect. See `is_line_gutter_clickable` and `gutter_clicked`.

> method set_line_gutter_icon(line: int, gutter: int, icon: Texture2D) -> void

Sets the icon for `gutter` on `line` to `icon`. This only works when the gutter type is `GUTTER_TYPE_ICON` (see `set_gutter_type`).

> method set_line_gutter_item_color(line: int, gutter: int, color: Color) -> void

Sets the color for `gutter` on `line` to `color`.

> method set_line_gutter_metadata(line: int, gutter: int, metadata: Variant) -> void

Sets the metadata for `gutter` on `line` to `metadata`.

> method set_line_gutter_text(line: int, gutter: int, text: String) -> void

Sets the text for `gutter` on `line` to `text`. This only works when the gutter type is `GUTTER_TYPE_STRING` (see `set_gutter_type`).

> method set_overtype_mode_enabled(enabled: bool) -> void

If `true`, enables overtype mode. In this mode, typing overrides existing text instead of inserting text. The `ProjectSettings.input/ui_text_toggle_insert_mode` action toggles overtype mode. See `is_overtype_mode_enabled`.

> method set_search_flags(flags: int) -> void

Sets the search `flags`. This is used with `set_search_text` to highlight occurrences of the searched text. Search flags can be specified from the `SearchFlags` enum.

> method set_search_text(search_text: String) -> void

Sets the search text. See `set_search_flags`.

> method set_selection_mode(mode: SelectionMode) -> void

Sets the current selection mode.

> method set_selection_origin_column(column: int, caret_index: int = 0) -> void

Sets the selection origin column to the `column` for the given `caret_index`. If the selection origin is moved to the caret position, the selection will deselect.

> method set_selection_origin_line(line: int, can_be_hidden: bool = true, wrap_index: int = -1, caret_index: int = 0) -> void

Sets the selection origin line to the `line` for the given `caret_index`. If the selection origin is moved to the caret position, the selection will deselect.
If `can_be_hidden` is `false`, The line will be set to the nearest unhidden line below or above.
If `wrap_index` is `-1`, the selection origin column will be clamped to the `line`'s length. If `wrap_index` is greater than `-1`, the column will be moved to attempt to match the visual x position on the line's `wrap_index` to the position from the last time `set_selection_origin_column` or `select` was called.

> method set_tab_size(size: int) -> void

Sets the tab size for the `TextEdit` to use.

> method set_tooltip_request_func(callback: Callable) -> void

Provide custom tooltip text. The callback method must take the following args: `hovered_word: String`.

> method skip_selection_for_next_occurrence() -> void

Moves a selection and a caret for the next occurrence of the current selection. If there is no active selection, moves to the next occurrence of the word under caret.

> method start_action(action: EditAction) -> void

Starts an action, will end the current action if `action` is different.
An action will also end after a call to `end_action`, after `ProjectSettings.gui/timers/text_edit_idle_detect_sec` is triggered or a new undoable step outside the `start_action` and `end_action` calls.

> method swap_lines(from_line: int, to_line: int) -> void

Swaps the two lines. Carets will be swapped with the lines.

> method tag_saved_version() -> void

Tag the current version as saved.

> method undo() -> void

Perform undo operation.

## Signals

> signal caret_changed()

Emitted when any caret changes position.

> signal gutter_added()

Emitted when a gutter is added.

> signal gutter_clicked(line: int, gutter: int)

Emitted when a gutter is clicked.

> signal gutter_removed()

Emitted when a gutter is removed.

> signal lines_edited_from(from_line: int, to_line: int)

Emitted immediately when the text changes.
When text is added `from_line` will be less than `to_line`. On a remove `to_line` will be less than `from_line`.

> signal text_changed()

Emitted when the text changes.

> signal text_set()

Emitted when `clear` is called or `text` is set.

## Enumerations

> enum CaretType

> enum_value CaretType.CARET_TYPE_LINE = 0

Vertical line caret.

> enum_value CaretType.CARET_TYPE_BLOCK = 1

Block caret.

> enum EditAction

> enum_value EditAction.ACTION_NONE = 0

No current action.

> enum_value EditAction.ACTION_TYPING = 1

A typing action.

> enum_value EditAction.ACTION_BACKSPACE = 2

A backwards delete action.

> enum_value EditAction.ACTION_DELETE = 3

A forward delete action.

> enum GutterType

> enum_value GutterType.GUTTER_TYPE_STRING = 0

When a gutter is set to string using `set_gutter_type`, it is used to contain text set via the `set_line_gutter_text` method.

> enum_value GutterType.GUTTER_TYPE_ICON = 1

When a gutter is set to icon using `set_gutter_type`, it is used to contain an icon set via the `set_line_gutter_icon` method.

> enum_value GutterType.GUTTER_TYPE_CUSTOM = 2

When a gutter is set to custom using `set_gutter_type`, it is used to contain custom visuals controlled by a callback method set via the `set_gutter_custom_draw` method.

> enum LineWrappingMode

> enum_value LineWrappingMode.LINE_WRAPPING_NONE = 0

Line wrapping is disabled.

> enum_value LineWrappingMode.LINE_WRAPPING_BOUNDARY = 1

Line wrapping occurs at the control boundary, beyond what would normally be visible.

> enum MenuItems

> enum_value MenuItems.MENU_CUT = 0

Cuts (copies and clears) the selected text.

> enum_value MenuItems.MENU_COPY = 1

Copies the selected text.

> enum_value MenuItems.MENU_PASTE = 2

Pastes the clipboard text over the selected text (or at the cursor's position).

> enum_value MenuItems.MENU_CLEAR = 3

Erases the whole `TextEdit` text.

> enum_value MenuItems.MENU_SELECT_ALL = 4

Selects the whole `TextEdit` text.

> enum_value MenuItems.MENU_UNDO = 5

Undoes the previous action.

> enum_value MenuItems.MENU_REDO = 6

Redoes the previous action.

> enum_value MenuItems.MENU_SUBMENU_TEXT_DIR = 7

ID of "Text Writing Direction" submenu.

> enum_value MenuItems.MENU_DIR_INHERITED = 8

Sets text direction to inherited.

> enum_value MenuItems.MENU_DIR_AUTO = 9

Sets text direction to automatic.

> enum_value MenuItems.MENU_DIR_LTR = 10

Sets text direction to left-to-right.

> enum_value MenuItems.MENU_DIR_RTL = 11

Sets text direction to right-to-left.

> enum_value MenuItems.MENU_DISPLAY_UCC = 12

Toggles control character display.

> enum_value MenuItems.MENU_SUBMENU_INSERT_UCC = 13

ID of "Insert Control Character" submenu.

> enum_value MenuItems.MENU_INSERT_LRM = 14

Inserts left-to-right mark (LRM) character.

> enum_value MenuItems.MENU_INSERT_RLM = 15

Inserts right-to-left mark (RLM) character.

> enum_value MenuItems.MENU_INSERT_LRE = 16

Inserts start of left-to-right embedding (LRE) character.

> enum_value MenuItems.MENU_INSERT_RLE = 17

Inserts start of right-to-left embedding (RLE) character.

> enum_value MenuItems.MENU_INSERT_LRO = 18

Inserts start of left-to-right override (LRO) character.

> enum_value MenuItems.MENU_INSERT_RLO = 19

Inserts start of right-to-left override (RLO) character.

> enum_value MenuItems.MENU_INSERT_PDF = 20

Inserts pop direction formatting (PDF) character.

> enum_value MenuItems.MENU_INSERT_ALM = 21

Inserts Arabic letter mark (ALM) character.

> enum_value MenuItems.MENU_INSERT_LRI = 22

Inserts left-to-right isolate (LRI) character.

> enum_value MenuItems.MENU_INSERT_RLI = 23

Inserts right-to-left isolate (RLI) character.

> enum_value MenuItems.MENU_INSERT_FSI = 24

Inserts first strong isolate (FSI) character.

> enum_value MenuItems.MENU_INSERT_PDI = 25

Inserts pop direction isolate (PDI) character.

> enum_value MenuItems.MENU_INSERT_ZWJ = 26

Inserts zero width joiner (ZWJ) character.

> enum_value MenuItems.MENU_INSERT_ZWNJ = 27

Inserts zero width non-joiner (ZWNJ) character.

> enum_value MenuItems.MENU_INSERT_WJ = 28

Inserts word joiner (WJ) character.

> enum_value MenuItems.MENU_INSERT_SHY = 29

Inserts soft hyphen (SHY) character.

> enum_value MenuItems.MENU_EMOJI_AND_SYMBOL = 30

Opens system emoji and symbol picker.

> enum_value MenuItems.MENU_MAX = 31

Represents the size of the `MenuItems` enum.

> enum SearchFlags

> enum_value SearchFlags.SEARCH_MATCH_CASE = 1

Match case when searching.

> enum_value SearchFlags.SEARCH_WHOLE_WORDS = 2

Match whole words when searching.

> enum_value SearchFlags.SEARCH_BACKWARDS = 4

Search from end to beginning.

> enum SelectionMode

> enum_value SelectionMode.SELECTION_MODE_NONE = 0

Not selecting.

> enum_value SelectionMode.SELECTION_MODE_SHIFT = 1

Select as if `shift` is pressed.

> enum_value SelectionMode.SELECTION_MODE_POINTER = 2

Select single characters as if the user single clicked.

> enum_value SelectionMode.SELECTION_MODE_WORD = 3

Select whole words as if the user double clicked.

> enum_value SelectionMode.SELECTION_MODE_LINE = 4

Select whole lines as if the user triple clicked.

## Theme Properties

> theme_property background_color : Color ; data=color ; default=Color(0, 0, 0, 0)

Sets the background `Color` of this `TextEdit`.

> theme_property caret_background_color : Color ; data=color ; default=Color(0, 0, 0, 1)

`Color` of the text behind the caret when using a block caret.

> theme_property caret_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

`Color` of the caret. This can be set to a fully transparent color to hide the caret entirely.

> theme_property current_line_color : Color ; data=color ; default=Color(0.25, 0.25, 0.26, 0.8)

Background `Color` of the line containing the caret.

> theme_property font_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

Sets the font `Color`.

> theme_property font_outline_color : Color ; data=color ; default=Color(0, 0, 0, 1)

The tint of text outline of the `TextEdit`.

> theme_property font_placeholder_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 0.6)

Font color for `placeholder_text`.

> theme_property font_readonly_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 0.5)

Sets the font `Color` when `editable` is disabled.

> theme_property font_selected_color : Color ; data=color ; default=Color(0, 0, 0, 0)

Sets the `Color` of the selected text. If equal to `Color(0, 0, 0, 0)`, it will be ignored.

> theme_property search_result_border_color : Color ; data=color ; default=Color(0.3, 0.3, 0.3, 0.4)

`Color` of the border around text that matches the search query.

> theme_property search_result_color : Color ; data=color ; default=Color(0.3, 0.3, 0.3, 1)

`Color` behind the text that matches the search query.

> theme_property selection_color : Color ; data=color ; default=Color(0.5, 0.5, 0.5, 1)

Sets the highlight `Color` of text selections.

> theme_property word_highlighted_color : Color ; data=color ; default=Color(0.5, 0.5, 0.5, 0.25)

Sets the highlight `Color` of multiple occurrences. `highlight_all_occurrences` has to be enabled.

> theme_property caret_width : int ; data=constant ; default=1

The caret's width in pixels. Greater values can be used to improve accessibility by ensuring the caret is easily visible, or to ensure consistency with a large font size. If set to `0` or lower, the caret width is automatically set to 1 pixel and multiplied by the display scaling factor.

> theme_property line_spacing : int ; data=constant ; default=4

Additional vertical spacing between lines (in pixels), spacing is added to line descent. This value can be negative.

> theme_property outline_size : int ; data=constant ; default=0

The size of the text outline.
**Note:** If using a font with `FontFile.multichannel_signed_distance_field` enabled, its `FontFile.msdf_pixel_range` must be set to at least *twice* the value of `outline_size` for outline rendering to look correct. Otherwise, the outline may appear to be cut off earlier than intended.

> theme_property wrap_offset : int ; data=constant ; default=10

Sets an additional margin for line wrapping width.

> theme_property font : Font ; data=font

Sets the default `Font`.

> theme_property font_size : int ; data=font_size

Sets default font size.

> theme_property space : Texture2D ; data=icon

Sets a custom `Texture2D` for space text characters.

> theme_property tab : Texture2D ; data=icon

Sets a custom `Texture2D` for tab text characters.

> theme_property focus : StyleBox ; data=style

Sets the `StyleBox` when in focus. The `focus` `StyleBox` is displayed *over* the base `StyleBox`, so a partially transparent `StyleBox` should be used to ensure the base `StyleBox` remains visible. A `StyleBox` that represents an outline or an underline works well for this purpose. To disable the focus visual effect, assign a `StyleBoxEmpty` resource. Note that disabling the focus visual effect will harm keyboard/controller navigation usability, so this is not recommended for accessibility reasons.

> theme_property normal : StyleBox ; data=style

Sets the `StyleBox` of this `TextEdit`.

> theme_property read_only : StyleBox ; data=style

Sets the `StyleBox` of this `TextEdit` when `editable` is disabled.
