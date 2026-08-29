# TabBar

> class TabBar
> inherits TabBar Control

## Brief

A control that provides a horizontal bar with tabs.

## Description

A control that provides a horizontal bar with tabs. Similar to `TabContainer` but is only in charge of drawing tabs, not interacting with children.

## Properties

> property clip_tabs : bool ; default=true ; setter=set_clip_tabs ; getter=get_clip_tabs

If `true`, tabs overflowing this node's width will be hidden, displaying two navigation buttons instead. Otherwise, this node's minimum size is updated so that all tabs are visible.

> property close_with_middle_mouse : bool ; default=true ; setter=set_close_with_middle_mouse ; getter=get_close_with_middle_mouse

If `true`, middle-clicking on a tab will emit the `tab_close_pressed` signal.

> property current_tab : int ; default=-1 ; setter=set_current_tab ; getter=get_current_tab

The index of the current selected tab. A value of `-1` means that no tab is selected and can only be set when `deselect_enabled` is `true` or if all tabs are hidden or disabled.

> property deselect_enabled : bool ; default=false ; setter=set_deselect_enabled ; getter=get_deselect_enabled

If `true`, all tabs can be deselected so that no tab is selected. Click on the current tab to deselect it.

> property drag_to_rearrange_enabled : bool ; default=false ; setter=set_drag_to_rearrange_enabled ; getter=get_drag_to_rearrange_enabled

If `true`, tabs can be rearranged with mouse drag.

> property focus_mode : Control.FocusMode ; default=2 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property max_tab_width : int ; default=0 ; setter=set_max_tab_width ; getter=get_max_tab_width

Sets the maximum width which all tabs should be limited to. Unlimited if set to `0`.

> property scroll_to_selected : bool ; default=true ; setter=set_scroll_to_selected ; getter=get_scroll_to_selected

If `true`, the tab offset will be changed to keep the currently selected tab visible.

> property scrolling_enabled : bool ; default=true ; setter=set_scrolling_enabled ; getter=get_scrolling_enabled

if `true`, the mouse's scroll wheel can be used to navigate the scroll view.

> property select_with_rmb : bool ; default=false ; setter=set_select_with_rmb ; getter=get_select_with_rmb

If `true`, enables selecting a tab with the right mouse button.

> property switch_on_drag_hover : bool ; default=true ; setter=set_switch_on_drag_hover ; getter=get_switch_on_drag_hover

If `true`, hovering over a tab while dragging something will switch to that tab. Does not have effect when hovering another tab to rearrange. The delay for when this happens is dictated by `hover_switch_wait_msec`.

> property tab_alignment : AlignmentMode ; default=0 ; setter=set_tab_alignment ; getter=get_tab_alignment

The horizontal alignment of the tabs.

> property tab_close_display_policy : CloseButtonDisplayPolicy ; default=0 ; setter=set_tab_close_display_policy ; getter=get_tab_close_display_policy

When the close button will appear on the tabs.

> property tab_count : int ; default=0 ; setter=set_tab_count ; getter=get_tab_count

The number of tabs currently in the bar.

> property tab_{index}/disabled : bool ; default=false

If `true`, the tab at `index` is disabled.
**Note:** `index` is a value in the `0 .. tab_count - 1` range.

> property tab_{index}/icon : Texture2D

If `true`, the tab at `index` is hidden.
**Note:** `index` is a value in the `0 .. tab_count - 1` range.

> property tab_{index}/title : String ; default=""

The title text of the tab at `index`.
**Note:** `index` is a value in the `0 .. tab_count - 1` range.

> property tab_{index}/tooltip : String ; default=""

The tooltip text of the tab at `index`.
**Note:** `index` is a value in the `0 .. tab_count - 1` range.

> property tabs_rearrange_group : int ; default=-1 ; setter=set_tabs_rearrange_group ; getter=get_tabs_rearrange_group

`TabBar`s with the same rearrange group ID will allow dragging the tabs between them. Enable drag with `drag_to_rearrange_enabled`.
Setting this to `-1` will disable rearranging between `TabBar`s.

## Methods

> method add_tab(title: String = "", icon: Texture2D = null) -> void

Adds a new tab.

> method clear_tabs() -> void

Clears all tabs.

> method ensure_tab_visible(idx: int) -> void

Moves the scroll view to make the tab visible.

> method get_offset_buttons_visible() -> bool ; qualifiers=const

Returns `true` if the offset buttons (the ones that appear when there's not enough space for all tabs) are visible.

> method get_previous_tab() -> int ; qualifiers=const

Returns the previously active tab index.

> method get_tab_button_icon(tab_idx: int) -> Texture2D ; qualifiers=const

Returns the icon for the right button of the tab at index `tab_idx` or `null` if the right button has no icon.

> method get_tab_icon(tab_idx: int) -> Texture2D ; qualifiers=const

Returns the icon for the tab at index `tab_idx` or `null` if the tab has no icon.

> method get_tab_icon_max_width(tab_idx: int) -> int ; qualifiers=const

Returns the maximum allowed width of the icon for the tab at index `tab_idx`.

> method get_tab_idx_at_point(point: Vector2) -> int ; qualifiers=const

Returns the index of the tab at local coordinates `point`. Returns `-1` if the point is outside the control boundaries or if there's no tab at the queried position.

> method get_tab_language(tab_idx: int) -> String ; qualifiers=const

Returns tab title language code.

> method get_tab_metadata(tab_idx: int) -> Variant ; qualifiers=const

Returns the metadata value set to the tab at index `tab_idx` using `set_tab_metadata`. If no metadata was previously set, returns `null` by default.

> method get_tab_offset() -> int ; qualifiers=const

Returns the number of hidden tabs offsetted to the left.

> method get_tab_rect(tab_idx: int) -> Rect2 ; qualifiers=const

Returns tab `Rect2` with local position and size.

> method get_tab_text_direction(tab_idx: int) -> Control.TextDirection ; qualifiers=const

Returns tab title text base writing direction.

> method get_tab_title(tab_idx: int) -> String ; qualifiers=const

Returns the title of the tab at index `tab_idx`.

> method get_tab_tooltip(tab_idx: int) -> String ; qualifiers=const

Returns the tooltip text of the tab at index `tab_idx`.

> method is_tab_disabled(tab_idx: int) -> bool ; qualifiers=const

Returns `true` if the tab at index `tab_idx` is disabled.

> method is_tab_hidden(tab_idx: int) -> bool ; qualifiers=const

Returns `true` if the tab at index `tab_idx` is hidden.

> method move_tab(from: int, to: int) -> void

Moves a tab from `from` to `to`.

> method remove_tab(tab_idx: int) -> void

Removes the tab at index `tab_idx`.

> method select_next_available() -> bool

Selects the first available tab with greater index than the currently selected. Returns `true` if tab selection changed.

> method select_previous_available() -> bool

Selects the first available tab with lower index than the currently selected. Returns `true` if tab selection changed.

> method set_tab_button_icon(tab_idx: int, icon: Texture2D) -> void

Sets an `icon` for the button of the tab at index `tab_idx` (located to the right, before the close button), making it visible and clickable (See `tab_button_pressed`). Giving it a `null` value will hide the button.

> method set_tab_disabled(tab_idx: int, disabled: bool) -> void

If `disabled` is `true`, disables the tab at index `tab_idx`, making it non-interactable.

> method set_tab_hidden(tab_idx: int, hidden: bool) -> void

If `hidden` is `true`, hides the tab at index `tab_idx`, making it disappear from the tab area.

> method set_tab_icon(tab_idx: int, icon: Texture2D) -> void

Sets an `icon` for the tab at index `tab_idx`.

> method set_tab_icon_max_width(tab_idx: int, width: int) -> void

Sets the maximum allowed width of the icon for the tab at index `tab_idx`. This limit is applied on top of the default size of the icon and on top of `icon_max_width`. The height is adjusted according to the icon's ratio.

> method set_tab_language(tab_idx: int, language: String) -> void

Sets the language code of the title for the tab at index `tab_idx` to `language`. This is used for line-breaking and text shaping algorithms. If `language` is empty, the current locale is used.

> method set_tab_metadata(tab_idx: int, metadata: Variant) -> void

Sets the metadata value for the tab at index `tab_idx`, which can be retrieved later using `get_tab_metadata`.

> method set_tab_text_direction(tab_idx: int, direction: Control.TextDirection) -> void

Sets tab title base writing direction.

> method set_tab_title(tab_idx: int, title: String) -> void

Sets a `title` for the tab at index `tab_idx`.

> method set_tab_tooltip(tab_idx: int, tooltip: String) -> void

Sets a `tooltip` for tab at index `tab_idx`.
**Note:** By default, if the `tooltip` is empty and the tab text is truncated (not all characters fit into the tab), the title will be displayed as a tooltip. To hide the tooltip, assign `" "` as the `tooltip` text.

## Signals

> signal active_tab_rearranged(idx_to: int)

Emitted when the active tab is rearranged via mouse drag. See `drag_to_rearrange_enabled`.

> signal tab_button_pressed(tab: int)

Emitted when a tab's right button is pressed. See `set_tab_button_icon`.

> signal tab_changed(tab: int)

Emitted when switching to another tab.

> signal tab_clicked(tab: int)

Emitted when a tab is clicked, even if it is the current tab.

> signal tab_close_pressed(tab: int)

Emitted when a tab's close button is pressed or, if `close_with_middle_mouse` is `true`, when middle-clicking on a tab.
**Note:** Tabs are not removed automatically; this behavior needs to be coded manually. For example:

```gdscript
                $TabBar.tab_close_pressed.connect($TabBar.remove_tab)

```

```csharp
                GetNode<TabBar>("TabBar").TabClosePressed += GetNode<TabBar>("TabBar").RemoveTab;

```

> signal tab_hovered(tab: int)

Emitted when a tab is hovered by the mouse.

> signal tab_rmb_clicked(tab: int)

Emitted when a tab is right-clicked.

> signal tab_selected(tab: int)

Emitted when a tab is selected via click, directional input, or script, even if it is the current tab.

## Enumerations

> enum AlignmentMode

> enum_value AlignmentMode.ALIGNMENT_LEFT = 0

Aligns tabs to the left.

> enum_value AlignmentMode.ALIGNMENT_CENTER = 1

Aligns tabs in the middle.

> enum_value AlignmentMode.ALIGNMENT_RIGHT = 2

Aligns tabs to the right.

> enum_value AlignmentMode.ALIGNMENT_MAX = 3

Represents the size of the `AlignmentMode` enum.

> enum CloseButtonDisplayPolicy

> enum_value CloseButtonDisplayPolicy.CLOSE_BUTTON_SHOW_NEVER = 0

Never show the close buttons.

> enum_value CloseButtonDisplayPolicy.CLOSE_BUTTON_SHOW_ACTIVE_ONLY = 1

Only show the close button on the currently active tab.

> enum_value CloseButtonDisplayPolicy.CLOSE_BUTTON_SHOW_ALWAYS = 2

Show the close button on all tabs.

> enum_value CloseButtonDisplayPolicy.CLOSE_BUTTON_MAX = 3

Represents the size of the `CloseButtonDisplayPolicy` enum.

## Theme Properties

> theme_property drop_mark_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Modulation color for the `drop_mark` icon.

> theme_property font_disabled_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 0.5)

Font color of disabled tabs.

> theme_property font_hovered_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Font color of the currently hovered tab. Does not apply to the selected tab.

> theme_property font_outline_color : Color ; data=color ; default=Color(0, 0, 0, 1)

The tint of text outline of the tab name.

> theme_property font_selected_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Font color of the currently selected tab.

> theme_property font_unselected_color : Color ; data=color ; default=Color(0.7, 0.7, 0.7, 1)

Font color of the other, unselected tabs.

> theme_property icon_disabled_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Icon color of disabled tabs.

> theme_property icon_hovered_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Icon color of the currently hovered tab. Does not apply to the selected tab.

> theme_property icon_selected_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Icon color of the currently selected tab.

> theme_property icon_unselected_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Icon color of the other, unselected tabs.

> theme_property h_separation : int ; data=constant ; default=4

The horizontal separation between the elements inside tabs.

> theme_property hover_switch_wait_msec : int ; data=constant ; default=500

During a drag-and-drop, this is how many milliseconds to wait before switching the tab.

> theme_property icon_max_width : int ; data=constant ; default=0

The maximum allowed width of the tab's icon. This limit is applied on top of the default size of the icon, but before the value set with `set_tab_icon_max_width`. The height is adjusted according to the icon's ratio.

> theme_property outline_size : int ; data=constant ; default=0

The size of the tab text outline.
**Note:** If using a font with `FontFile.multichannel_signed_distance_field` enabled, its `FontFile.msdf_pixel_range` must be set to at least *twice* the value of `outline_size` for outline rendering to look correct. Otherwise, the outline may appear to be cut off earlier than intended.

> theme_property tab_separation : int ; data=constant ; default=0

The space between tabs in the tab bar.

> theme_property font : Font ; data=font

The font used to draw tab names.

> theme_property font_size : int ; data=font_size

Font size of the tab names.

> theme_property close : Texture2D ; data=icon

The icon for the close button (see `tab_close_display_policy`).

> theme_property decrement : Texture2D ; data=icon

Icon for the left arrow button that appears when there are too many tabs to fit in the container width. When the button is disabled (i.e. the first tab is visible), it appears semi-transparent.

> theme_property decrement_highlight : Texture2D ; data=icon

Icon for the left arrow button that appears when there are too many tabs to fit in the container width. Used when the button is being hovered with the cursor.

> theme_property drop_mark : Texture2D ; data=icon

Icon shown to indicate where a dragged tab will be dropped (see `drag_to_rearrange_enabled`).

> theme_property increment : Texture2D ; data=icon

Icon for the right arrow button that appears when there are too many tabs to fit in the container width. When the button is disabled (i.e. the last tab is visible) it appears semi-transparent.

> theme_property increment_highlight : Texture2D ; data=icon

Icon for the right arrow button that appears when there are too many tabs to fit in the container width. Used when the button is being hovered with the cursor.

> theme_property button_highlight : StyleBox ; data=style

Background of the tab and close buttons when they're being hovered with the cursor.

> theme_property button_pressed : StyleBox ; data=style

Background of the tab and close buttons when it's being pressed.

> theme_property tab_disabled : StyleBox ; data=style

The style of disabled tabs.

> theme_property tab_focus : StyleBox ; data=style

`StyleBox` used when the `TabBar` is focused. The `tab_focus` `StyleBox` is displayed *over* the base `StyleBox` of the selected tab, so a partially transparent `StyleBox` should be used to ensure the base `StyleBox` remains visible. A `StyleBox` that represents an outline or an underline works well for this purpose. To disable the focus visual effect, assign a `StyleBoxEmpty` resource. Note that disabling the focus visual effect will harm keyboard/controller navigation usability, so this is not recommended for accessibility reasons.

> theme_property tab_hovered : StyleBox ; data=style

The style of the currently hovered tab. Does not apply to the selected tab.
**Note:** This style will be drawn with the same width as `tab_unselected` at minimum.

> theme_property tab_selected : StyleBox ; data=style

The style of the currently selected tab.

> theme_property tab_unselected : StyleBox ; data=style

The style of the other, unselected tabs.
