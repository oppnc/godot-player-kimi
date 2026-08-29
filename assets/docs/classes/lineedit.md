# LineEdit

> class LineEdit ; keywords=text, input
> inherits LineEdit Control

## Brief

An input field for single-line text.

## Description

`LineEdit` provides an input field for editing a single line of text.
- When the `LineEdit` control is focused using the keyboard arrow keys, it will only gain focus and not enter edit mode.
- To enter edit mode, click on the control with the mouse, see also `keep_editing_on_text_submit`.
- To exit edit mode, press `ui_text_submit` or `ui_cancel` (by default `Escape`) actions.
- Check `edit`, `unedit`, `is_editing`, and `editing_toggled` for more information.
While entering text, it is possible to insert special characters using Unicode, OEM or Windows alt codes:
- To enter Unicode codepoints, hold `Alt` and type the codepoint on the numpad. For example, to enter the character `á` (U+00E1), hold `Alt` and type `+E1` on the numpad (the leading zeroes can be omitted).
- To enter OEM codepoints, hold `Alt` and type the code on the numpad. For example, to enter the character `á` (OEM 160), hold `Alt` and type `160` on the numpad.
- To enter Windows codepoints, hold `Alt` and type the code on the numpad. For example, to enter the character `á` (Windows 0225), hold `Alt` and type `0`, `2`, `2`, `5` on the numpad. The leading zero here must **not** be omitted, as this is how Windows codepoints are distinguished from OEM codepoints.
**Important:**
- Focusing the `LineEdit` with `ui_focus_next` (by default `Tab`) or `ui_focus_prev` (by default `Shift + Tab`) or `Control.grab_focus` still enters edit mode (for compatibility).
`LineEdit` features many built-in shortcuts that are always available (`Ctrl` here maps to `Cmd` on macOS):
- `Ctrl + C`: Copy
- `Ctrl + X`: Cut
- `Ctrl + V` or `Ctrl + Y`: Paste/"yank"
- `Ctrl + Z`: Undo
- `Ctrl + ~`: Swap input direction.
- `Ctrl + Shift + Z`: Redo
- `Ctrl + U`: Delete text from the caret position to the beginning of the line
- `Ctrl + K`: Delete text from the caret position to the end of the line
- `Ctrl + A`: Select all text
- `Up Arrow`/`Down Arrow`: Move the caret to the beginning/end of the line
On macOS, some extra keyboard shortcuts are available:
- `Cmd + F`: Same as `Right Arrow`, move the caret one character right
- `Cmd + B`: Same as `Left Arrow`, move the caret one character left
- `Cmd + P`: Same as `Up Arrow`, move the caret to the previous line
- `Cmd + N`: Same as `Down Arrow`, move the caret to the next line
- `Cmd + D`: Same as `Delete`, delete the character on the right side of caret
- `Cmd + H`: Same as `Backspace`, delete the character on the left side of the caret
- `Cmd + A`: Same as `Home`, move the caret to the beginning of the line
- `Cmd + E`: Same as `End`, move the caret to the end of the line
- `Cmd + Left Arrow`: Same as `Home`, move the caret to the beginning of the line
- `Cmd + Right Arrow`: Same as `End`, move the caret to the end of the line
**Note:** Caret movement shortcuts listed above are not affected by `shortcut_keys_enabled`.

## Properties

> property alignment : HorizontalAlignment ; default=0 ; setter=set_horizontal_alignment ; getter=get_horizontal_alignment

The text's horizontal alignment.

> property backspace_deletes_composite_character_enabled : bool ; default=false ; setter=set_backspace_deletes_composite_character_enabled ; getter=is_backspace_deletes_composite_character_enabled

If `true` and `caret_mid_grapheme` is `false`, backspace deletes an entire composite character such as ❤️‍🩹, instead of deleting part of the composite character.

> property caret_blink : bool ; default=false ; setter=set_caret_blink_enabled ; getter=is_caret_blink_enabled

If `true`, makes the caret blink.

> property caret_blink_interval : float ; default=0.65 ; setter=set_caret_blink_interval ; getter=get_caret_blink_interval

The interval at which the caret blinks (in seconds).

> property caret_column : int ; default=0 ; setter=set_caret_column ; getter=get_caret_column

The caret's column position inside the `LineEdit`. When set, the text may scroll to accommodate it.

> property caret_force_displayed : bool ; default=false ; setter=set_caret_force_displayed ; getter=is_caret_force_displayed

If `true`, the `LineEdit` will always show the caret, even if not editing or focus is lost.

> property caret_mid_grapheme : bool ; default=false ; setter=set_caret_mid_grapheme_enabled ; getter=is_caret_mid_grapheme_enabled

Allow moving caret, selecting and removing the individual composite character components.
**Note:** `Backspace` is always removing individual composite character components.

> property clear_button_enabled : bool ; default=false ; setter=set_clear_button_enabled ; getter=is_clear_button_enabled

If `true`, the `LineEdit` will show a clear button if `text` is not empty, which can be used to clear the text quickly.

> property context_menu_enabled : bool ; default=true ; setter=set_context_menu_enabled ; getter=is_context_menu_enabled

If `true`, the context menu will appear when right-clicked.

> property deselect_on_focus_loss_enabled : bool ; default=true ; setter=set_deselect_on_focus_loss_enabled ; getter=is_deselect_on_focus_loss_enabled

If `true`, the selected text will be deselected when focus is lost.

> property drag_and_drop_selection_enabled : bool ; default=true ; setter=set_drag_and_drop_selection_enabled ; getter=is_drag_and_drop_selection_enabled

If `true`, allow drag and drop of selected text.

> property draw_control_chars : bool ; default=false ; setter=set_draw_control_chars ; getter=get_draw_control_chars

If `true`, control characters are displayed.

> property editable : bool ; default=true ; setter=set_editable ; getter=is_editable

If `false`, existing text cannot be modified and new text cannot be added.

> property emoji_menu_enabled : bool ; default=true ; setter=set_emoji_menu_enabled ; getter=is_emoji_menu_enabled

If `true`, "Emoji and Symbols" menu is enabled.

> property expand_to_text_length : bool ; default=false ; setter=set_expand_to_text_length_enabled ; getter=is_expand_to_text_length_enabled

If `true`, the `LineEdit` width will increase to stay longer than the `text`. It will **not** compress if the `text` is shortened.

> property flat : bool ; default=false ; setter=set_flat ; getter=is_flat

If `true`, the `LineEdit` doesn't display decoration.

> property focus_mode : Control.FocusMode ; default=2 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property icon_expand_mode : ExpandMode ; default=0 ; setter=set_icon_expand_mode ; getter=get_icon_expand_mode

Define the scaling behavior of the `right_icon`.

> property keep_editing_on_text_submit : bool ; default=false ; setter=set_keep_editing_on_text_submit ; getter=is_editing_kept_on_text_submit

If `true`, the `LineEdit` will not exit edit mode when text is submitted by pressing `ui_text_submit` action (by default: `Enter` or `Kp Enter`).

> property language : String ; default="" ; setter=set_language ; getter=get_language

Language code used for line-breaking and text shaping algorithms. If left empty, the current locale is used instead.

> property max_length : int ; default=0 ; setter=set_max_length ; getter=get_max_length

Maximum number of characters that can be entered inside the `LineEdit`. If `0`, there is no limit.
When a limit is defined, characters that would exceed `max_length` are truncated. This happens both for existing `text` contents when setting the max length, or for new text inserted in the `LineEdit`, including pasting.
If any input text is truncated, the `text_change_rejected` signal is emitted with the truncated substring as a parameter:

```gdscript
            text = "Hello world"
            max_length = 5
            # `text` becomes "Hello".
            max_length = 10
            text += " goodbye"
            # `text` becomes "Hello good".
            # `text_change_rejected` is emitted with "bye" as a parameter.

```

```csharp
            Text = "Hello world";
            MaxLength = 5;
            // `Text` becomes "Hello".
            MaxLength = 10;
            Text += " goodbye";
            // `Text` becomes "Hello good".
            // `text_change_rejected` is emitted with "bye" as a parameter.

```

> property middle_mouse_paste_enabled : bool ; default=true ; setter=set_middle_mouse_paste_enabled ; getter=is_middle_mouse_paste_enabled

If `false`, using middle mouse button to paste clipboard will be disabled.
**Note:** This method is only implemented on Linux.

> property mouse_default_cursor_shape : Control.CursorShape ; default=1 ; setter=set_default_cursor_shape ; getter=get_default_cursor_shape ; overrides=Control

> property placeholder_text : String ; default="" ; setter=set_placeholder ; getter=get_placeholder

Text shown when the `LineEdit` is empty. It is **not** the `LineEdit`'s default value (see `text`).

> property right_icon : Texture2D ; setter=set_right_icon ; getter=get_right_icon

Sets the icon that will appear in the right end of the `LineEdit` if there's no `text`, or always, if `clear_button_enabled` is set to `false`.

> property right_icon_scale : float ; default=1.0 ; setter=set_right_icon_scale ; getter=get_right_icon_scale

Scale ratio of the icon when `icon_expand_mode` is set to `EXPAND_MODE_FIT_TO_LINE_EDIT`.

> property secret : bool ; default=false ; setter=set_secret ; getter=is_secret

If `true`, every character is replaced with the secret character (see `secret_character`).

> property secret_character : String ; default="•" ; setter=set_secret_character ; getter=get_secret_character

The character to use to mask secret input. Only a single character can be used as the secret character. If it is longer than one character, only the first one will be used. If it is empty, a space will be used instead.

> property select_all_on_focus : bool ; default=false ; setter=set_select_all_on_focus ; getter=is_select_all_on_focus

If `true`, the `LineEdit` will select the whole text when it gains focus.

> property selecting_enabled : bool ; default=true ; setter=set_selecting_enabled ; getter=is_selecting_enabled

If `false`, it's impossible to select the text using mouse nor keyboard.

> property shortcut_keys_enabled : bool ; default=true ; setter=set_shortcut_keys_enabled ; getter=is_shortcut_keys_enabled

If `true`, shortcut keys for context menu items are enabled, even if the context menu is disabled.

> property structured_text_bidi_override : TextServer.StructuredTextParser ; default=0 ; setter=set_structured_text_bidi_override ; getter=get_structured_text_bidi_override

Set BiDi algorithm override for the structured text.

> property structured_text_bidi_override_options : Array ; default=[] ; setter=set_structured_text_bidi_override_options ; getter=get_structured_text_bidi_override_options

Set additional options for BiDi override.

> property text : String ; default="" ; setter=set_text ; getter=get_text

String value of the `LineEdit`.
**Note:** Changing text using this property won't emit the `text_changed` signal.

> property text_direction : Control.TextDirection ; default=0 ; setter=set_text_direction ; getter=get_text_direction

Base text writing direction.

> property virtual_keyboard_enabled : bool ; default=true ; setter=set_virtual_keyboard_enabled ; getter=is_virtual_keyboard_enabled

If `true`, the native virtual keyboard is enabled on platforms that support it.

> property virtual_keyboard_show_on_focus : bool ; default=true ; setter=set_virtual_keyboard_show_on_focus ; getter=get_virtual_keyboard_show_on_focus

If `true`, the native virtual keyboard is shown on focus events on platforms that support it.

> property virtual_keyboard_type : VirtualKeyboardType ; default=0 ; setter=set_virtual_keyboard_type ; getter=get_virtual_keyboard_type

Specifies the type of virtual keyboard to show.

## Methods

> method apply_ime() -> void

Applies text from the [Input Method Editor](https://en.wikipedia.org/wiki/Input_method) (IME) and closes the IME if it is open.

> method cancel_ime() -> void

Closes the [Input Method Editor](https://en.wikipedia.org/wiki/Input_method) (IME) if it is open. Any text in the IME will be lost.

> method clear() -> void

Erases the `LineEdit`'s `text`.

> method delete_char_at_caret() -> void

Deletes one character at the caret's current position (equivalent to pressing `Delete`).

> method delete_text(from_column: int, to_column: int) -> void

Deletes a section of the `text` going from position `from_column` to `to_column`. Both parameters should be within the text's length.

> method deselect() -> void

Clears the current selection.

> method edit(hide_focus: bool = false) -> void

Allows entering edit mode whether the `LineEdit` is focused or not. If `hide_focus` is `true`, the focused state will not be shown (see `Control.grab_focus`).
See also `keep_editing_on_text_submit`.

> method get_menu() -> PopupMenu ; qualifiers=const

Returns the `PopupMenu` of this `LineEdit`. By default, this menu is displayed when right-clicking on the `LineEdit`.
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
                    menu.ItemCount = menu.GetItemIndex(LineEdit.MenuItems.Redo) + 1;
                    // Add custom items.
                    menu.AddSeparator();
                    menu.AddItem("Insert Date", LineEdit.MenuItems.Max + 1);
                    // Add event handler.
                    menu.IdPressed += OnItemPressed;
                }

                public void OnItemPressed(int id)
                {
                    if (id == LineEdit.MenuItems.Max + 1)
                    {
                        InsertTextAtCaret(Time.GetDateStringFromSystem());
                    }
                }

```

**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `Window.visible` property.

> method get_next_composite_character_column(column: int) -> int ; qualifiers=const

Returns the correct column at the end of a composite character like ❤️‍🩹 (mending heart; Unicode: `U+2764 U+FE0F U+200D U+1FA79`) which is comprised of more than one Unicode code point, if the caret is at the start of the composite character. Also returns the correct column with the caret at mid grapheme and for non-composite characters.
**Note:** To check at caret location use `get_next_composite_character_column(get_caret_column())`

> method get_previous_composite_character_column(column: int) -> int ; qualifiers=const

Returns the correct column at the start of a composite character like ❤️‍🩹 (mending heart; Unicode: `U+2764 U+FE0F U+200D U+1FA79`) which is comprised of more than one Unicode code point, if the caret is at the end of the composite character. Also returns the correct column with the caret at mid grapheme and for non-composite characters.
**Note:** To check at caret location use `get_previous_composite_character_column(get_caret_column())`

> method get_scroll_offset() -> float ; qualifiers=const

Returns the scroll offset due to `caret_column`, as a number of characters.

> method get_selected_text() -> String

Returns the text inside the selection.

> method get_selection_from_column() -> int ; qualifiers=const

Returns the selection begin column.

> method get_selection_to_column() -> int ; qualifiers=const

Returns the selection end column.

> method has_ime_text() -> bool ; qualifiers=const

Returns `true` if the user has text in the [Input Method Editor](https://en.wikipedia.org/wiki/Input_method) (IME).

> method has_redo() -> bool ; qualifiers=const

Returns `true` if a "redo" action is available.

> method has_selection() -> bool ; qualifiers=const

Returns `true` if the user has selected text.

> method has_undo() -> bool ; qualifiers=const

Returns `true` if an "undo" action is available.

> method insert_text_at_caret(text: String) -> void

Inserts `text` at the caret. If the resulting value is longer than `max_length`, nothing happens.

> method is_editing() -> bool ; qualifiers=const

Returns whether the `LineEdit` is being edited.

> method is_menu_visible() -> bool ; qualifiers=const

Returns whether the menu is visible. Use this instead of `get_menu().visible` to improve performance (so the creation of the menu is avoided).

> method menu_option(option: int) -> void

Executes a given action as defined in the `MenuItems` enum.

> method select(from: int = 0, to: int = -1) -> void

Selects characters inside `LineEdit` between `from` and `to`. By default, `from` is at the beginning and `to` at the end.

```gdscript
                text = "Welcome"
                select() # Will select "Welcome".
                select(4) # Will select "ome".
                select(2, 5) # Will select "lco".

```

```csharp
                Text = "Welcome";
                Select(); // Will select "Welcome".
                Select(4); // Will select "ome".
                Select(2, 5); // Will select "lco".

```

> method select_all() -> void

Selects the whole `String`.

> method unedit() -> void

Allows exiting edit mode while preserving focus.

## Signals

> signal editing_toggled(toggled_on: bool)

Emitted when the `LineEdit` switches in or out of edit mode.

> signal text_change_rejected(rejected_substring: String)

Emitted when appending text that overflows the `max_length`. The appended text is truncated to fit `max_length`, and the part that couldn't fit is passed as the `rejected_substring` argument.

> signal text_changed(new_text: String)

Emitted when the text changes.

> signal text_submitted(new_text: String)

Emitted when the user presses the `ui_text_submit` action (by default: `Enter` or `Kp Enter`) while the `LineEdit` has focus.

## Enumerations

> enum ExpandMode

> enum_value ExpandMode.EXPAND_MODE_ORIGINAL_SIZE = 0

Use the original size for the right icon.

> enum_value ExpandMode.EXPAND_MODE_FIT_TO_TEXT = 1

Scale the right icon's size to match the size of the text.

> enum_value ExpandMode.EXPAND_MODE_FIT_TO_LINE_EDIT = 2

Scale the right icon to fit the LineEdit.

> enum MenuItems

> enum_value MenuItems.MENU_CUT = 0

Cuts (copies and clears) the selected text.

> enum_value MenuItems.MENU_COPY = 1

Copies the selected text.

> enum_value MenuItems.MENU_PASTE = 2

Pastes the clipboard text over the selected text (or at the caret's position).
Non-printable escape characters are automatically stripped from the OS clipboard via `String.strip_escapes`.

> enum_value MenuItems.MENU_CLEAR = 3

Erases the whole `LineEdit` text.

> enum_value MenuItems.MENU_SELECT_ALL = 4

Selects the whole `LineEdit` text.

> enum_value MenuItems.MENU_UNDO = 5

Undoes the previous action.

> enum_value MenuItems.MENU_REDO = 6

Reverse the last undo action.

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

> enum VirtualKeyboardType

> enum_value VirtualKeyboardType.KEYBOARD_TYPE_DEFAULT = 0

Default text virtual keyboard.

> enum_value VirtualKeyboardType.KEYBOARD_TYPE_MULTILINE = 1

Multiline virtual keyboard.

> enum_value VirtualKeyboardType.KEYBOARD_TYPE_NUMBER = 2

Virtual number keypad, useful for PIN entry.

> enum_value VirtualKeyboardType.KEYBOARD_TYPE_NUMBER_DECIMAL = 3

Virtual number keypad, useful for entering fractional numbers.

> enum_value VirtualKeyboardType.KEYBOARD_TYPE_PHONE = 4

Virtual phone number keypad.

> enum_value VirtualKeyboardType.KEYBOARD_TYPE_EMAIL_ADDRESS = 5

Virtual keyboard with additional keys to assist with typing email addresses.

> enum_value VirtualKeyboardType.KEYBOARD_TYPE_PASSWORD = 6

Virtual keyboard for entering a password. On most platforms, this should disable autocomplete and autocapitalization.
**Note:** This is not supported on Web. Instead, this behaves identically to `KEYBOARD_TYPE_DEFAULT`.

> enum_value VirtualKeyboardType.KEYBOARD_TYPE_URL = 7

Virtual keyboard with additional keys to assist with typing URLs.

## Theme Properties

> theme_property caret_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Color of the `LineEdit`'s caret (text cursor). This can be set to a fully transparent color to hide the caret entirely.

> theme_property clear_button_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

Color used as default tint for the clear button.

> theme_property clear_button_color_pressed : Color ; data=color ; default=Color(1, 1, 1, 1)

Color used for the clear button when it's pressed.

> theme_property font_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

Default font color.

> theme_property font_outline_color : Color ; data=color ; default=Color(0, 0, 0, 1)

The tint of text outline of the `LineEdit`.

> theme_property font_placeholder_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 0.6)

Font color for `placeholder_text`.

> theme_property font_selected_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Font color for selected text (inside the selection rectangle).

> theme_property font_uneditable_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 0.5)

Font color when editing is disabled.

> theme_property selection_color : Color ; data=color ; default=Color(0.5, 0.5, 0.5, 1)

Color of the selection rectangle.

> theme_property caret_width : int ; data=constant ; default=1

The caret's width in pixels. Greater values can be used to improve accessibility by ensuring the caret is easily visible, or to ensure consistency with a large font size.

> theme_property minimum_character_width : int ; data=constant ; default=4

Minimum horizontal space for the text (not counting the clear button and content margins). This value is measured in count of 'M' characters (i.e. this number of 'M' characters can be displayed without scrolling).

> theme_property outline_size : int ; data=constant ; default=0

The size of the text outline.
**Note:** If using a font with `FontFile.multichannel_signed_distance_field` enabled, its `FontFile.msdf_pixel_range` must be set to at least *twice* the value of `outline_size` for outline rendering to look correct. Otherwise, the outline may appear to be cut off earlier than intended.

> theme_property font : Font ; data=font

Font used for the text.

> theme_property font_size : int ; data=font_size

Font size of the `LineEdit`'s text.

> theme_property clear : Texture2D ; data=icon

Texture for the clear button. See `clear_button_enabled`.

> theme_property focus : StyleBox ; data=style

Background used when `LineEdit` has GUI focus. The `focus` `StyleBox` is displayed *over* the base `StyleBox`, so a partially transparent `StyleBox` should be used to ensure the base `StyleBox` remains visible. A `StyleBox` that represents an outline or an underline works well for this purpose. To disable the focus visual effect, assign a `StyleBoxEmpty` resource. Note that disabling the focus visual effect will harm keyboard/controller navigation usability, so this is not recommended for accessibility reasons.

> theme_property normal : StyleBox ; data=style

Default background for the `LineEdit`.

> theme_property read_only : StyleBox ; data=style

Background used when `LineEdit` is in read-only mode (`editable` is set to `false`).
