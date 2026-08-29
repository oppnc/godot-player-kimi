# AccessibilityServer

> class AccessibilityServer
> inherits AccessibilityServer Object

## Brief

A server interface for screen reader support.

## Methods

> method create_element(window_id: int, role: AccessibilityRole) -> RID

Creates a new, empty accessibility element resource.
**Note:** An accessibility element is created and freed automatically for each `Node`. In general, this function should not be called manually.

> method create_sub_element(parent_rid: RID, role: AccessibilityRole, insert_pos: int = -1) -> RID

Creates a new, empty accessibility sub-element resource. Sub-elements can be used to provide accessibility information for objects which are not `Node`s, such as list items, table cells, or menu items. Sub-elements are freed automatically when the parent element is freed, or can be freed early using the `free_element` method.

> method create_sub_text_edit_elements(parent_rid: RID, shaped_text: RID, min_height: float, insert_pos: int = -1, is_last_line: bool = false) -> RID

Creates a new, empty accessibility sub-element from the shaped text buffer. Sub-elements are freed automatically when the parent element is freed, or can be freed early using the `free_element` method.
If `is_last_line` is `true`, no trailing newline is appended to the text content. Set to `true` for the last line in multi-line text fields and for single-line text fields.

> method element_get_meta(id: RID) -> Variant ; qualifiers=const

Returns the metadata of the accessibility element `id`.

> method element_set_meta(id: RID, meta: Variant) -> void

Sets the metadata of the accessibility element `id` to `meta`.

> method free_element(id: RID) -> void

Frees the accessibility element `id` created by `create_element`, `create_sub_element`, or `create_sub_text_edit_elements`.

> method get_window_root(window_id: int) -> RID ; qualifiers=const

Returns the main accessibility element of the OS native window.

> method has_element(id: RID) -> bool ; qualifiers=const

Returns `true` if `id` is a valid accessibility element.

> method is_supported() -> bool ; qualifiers=const

Returns `true` if screen reader is support by this implementation.

> method set_window_focused(window_id: int, focused: bool) -> void

Sets the window focused state for assistive apps.
**Note:** This method is implemented on Linux, macOS, and Windows.
**Note:** Advanced users only! `Window` objects call this method automatically.

> method set_window_rect(window_id: int, rect_out: Rect2, rect_in: Rect2) -> void

Sets window outer (with decorations) and inner (without decorations) bounds for assistive apps.
**Note:** This method is implemented on Linux, macOS, and Windows.
**Note:** Advanced users only! `Window` objects call this method automatically.

> method update_add_action(id: RID, action: AccessibilityAction, callable: Callable) -> void

Adds a callback for the accessibility action (action which can be performed by using a special screen reader command or buttons on the Braille display), and marks this action as supported. The action callback receives one `Variant` argument, which value depends on action type.

> method update_add_child(id: RID, child_id: RID) -> void

Adds a child accessibility element.
**Note:** `Node` children and sub-elements are added to the child list automatically.

> method update_add_custom_action(id: RID, action_id: int, action_description: String) -> void

Adds support for a custom accessibility action. `action_id` is passed as an argument to the callback of `ACTION_CUSTOM` action.

> method update_add_related_controls(id: RID, related_id: RID) -> void

Adds an element that is controlled by this element.

> method update_add_related_described_by(id: RID, related_id: RID) -> void

Adds an element that describes this element.

> method update_add_related_details(id: RID, related_id: RID) -> void

Adds an element that details this element.

> method update_add_related_flow_to(id: RID, related_id: RID) -> void

Adds an element that this element flow into.

> method update_add_related_labeled_by(id: RID, related_id: RID) -> void

Adds an element that labels this element.

> method update_add_related_radio_group(id: RID, related_id: RID) -> void

Adds an element that is part of the same radio group.
**Note:** This method should be called on each element of the group, using all other elements as `related_id`.

> method update_set_active_descendant(id: RID, other_id: RID) -> void

Adds an element that is an active descendant of this element.

> method update_set_background_color(id: RID, color: Color) -> void

Sets element background color.

> method update_set_bounds(id: RID, rect: Rect2) -> void

Sets element bounding box, relative to the node position.

> method update_set_braille_label(id: RID, name: String) -> void

Sets element accessibility label for Braille display.

> method update_set_braille_role_description(id: RID, description: String) -> void

Sets element accessibility role description for Braille display.

> method update_set_checked(id: RID, checekd: bool) -> void

Sets element checked state.

> method update_set_classname(id: RID, classname: String) -> void

Sets element class name.

> method update_set_color_value(id: RID, color: Color) -> void

Sets element color value.

> method update_set_description(id: RID, description: String) -> void

Sets element accessibility description.

> method update_set_error_message(id: RID, other_id: RID) -> void

Sets an element which contains an error message for this element.

> method update_set_extra_info(id: RID, name: String) -> void

Sets element accessibility extra information added to the element name.

> method update_set_flag(id: RID, flag: AccessibilityFlags, value: bool) -> void

Sets element flag.

> method update_set_focus(id: RID) -> void

Sets currently focused element.

> method update_set_foreground_color(id: RID, color: Color) -> void

Sets element foreground color.

> method update_set_in_page_link_target(id: RID, other_id: RID) -> void

Sets target element for the link.

> method update_set_language(id: RID, language: String) -> void

Sets element text language.

> method update_set_list_item_count(id: RID, size: int) -> void

Sets number of items in the list.

> method update_set_list_item_expanded(id: RID, expanded: bool) -> void

Sets list/tree item expanded status.

> method update_set_list_item_index(id: RID, index: int) -> void

Sets the position of the element in the list.

> method update_set_list_item_level(id: RID, level: int) -> void

Sets the hierarchical level of the element in the list.

> method update_set_list_item_selected(id: RID, selected: bool) -> void

Sets list/tree item selected status.

> method update_set_list_orientation(id: RID, vertical: bool) -> void

Sets the orientation of the list elements.

> method update_set_live(id: RID, live: AccessibilityLiveMode) -> void

Sets the priority of the live region updates.

> method update_set_member_of(id: RID, group_id: RID) -> void

Sets the element to be a member of the group.

> method update_set_name(id: RID, name: String) -> void

Sets element accessibility name.

> method update_set_next_on_line(id: RID, other_id: RID) -> void

Sets next element on the line.

> method update_set_num_jump(id: RID, jump: float) -> void

Sets numeric value jump.

> method update_set_num_range(id: RID, min: float, max: float) -> void

Sets numeric value range.

> method update_set_num_step(id: RID, step: float) -> void

Sets numeric value step.

> method update_set_num_value(id: RID, position: float) -> void

Sets numeric value.

> method update_set_placeholder(id: RID, placeholder: String) -> void

Sets placeholder text.

> method update_set_popup_type(id: RID, popup: AccessibilityPopupType) -> void

Sets popup type for popup buttons.

> method update_set_previous_on_line(id: RID, other_id: RID) -> void

Sets previous element on the line.

> method update_set_role(id: RID, role: AccessibilityRole) -> void

Sets element accessibility role.

> method update_set_role_description(id: RID, description: String) -> void

Sets element accessibility role description text.

> method update_set_scroll_x(id: RID, position: float) -> void

Sets scroll bar x position.

> method update_set_scroll_x_range(id: RID, min: float, max: float) -> void

Sets scroll bar x range.

> method update_set_scroll_y(id: RID, position: float) -> void

Sets scroll bar y position.

> method update_set_scroll_y_range(id: RID, min: float, max: float) -> void

Sets scroll bar y range.

> method update_set_shortcut(id: RID, shortcut: String) -> void

Sets the list of keyboard shortcuts used by element.

> method update_set_state_description(id: RID, description: String) -> void

Sets human-readable description of the current checked state.

> method update_set_table_cell_position(id: RID, row_index: int, column_index: int) -> void

Sets cell position in the table.

> method update_set_table_cell_span(id: RID, row_span: int, column_span: int) -> void

Sets cell row/column span.

> method update_set_table_column_count(id: RID, count: int) -> void

Sets number of columns in the table.

> method update_set_table_column_index(id: RID, index: int) -> void

Sets position of the column.

> method update_set_table_row_count(id: RID, count: int) -> void

Sets number of rows in the table.

> method update_set_table_row_index(id: RID, index: int) -> void

Sets position of the row in the table.

> method update_set_text_align(id: RID, align: HorizontalAlignment) -> void

Sets element text alignment.

> method update_set_text_decorations(id: RID, underline: bool, strikethrough: bool, overline: bool, color: Color = Color(0, 0, 0, 1)) -> void

Sets text underline/overline/strikethrough.

> method update_set_text_orientation(id: RID, vertical: bool) -> void

Sets text orientation.

> method update_set_text_selection(id: RID, text_start_id: RID, start_char: int, text_end_id: RID, end_char: int) -> void

Sets text selection to the text field. `text_start_id` and `text_end_id` should be elements created by `create_sub_text_edit_elements`. Character offsets are relative to the corresponding element.

> method update_set_tooltip(id: RID, tooltip: String) -> void

Sets tooltip text.

> method update_set_transform(id: RID, transform: Transform2D) -> void

Sets element 2D transform.

> method update_set_url(id: RID, url: String) -> void

Sets link URL.

> method update_set_value(id: RID, value: String) -> void

Sets element text value.

## Enumerations

> enum AccessibilityAction

> enum_value AccessibilityAction.ACTION_CLICK = 0

Single click action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_FOCUS = 1

Focus action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_BLUR = 2

Blur action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_COLLAPSE = 3

Collapse action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_EXPAND = 4

Expand action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_DECREMENT = 5

Decrement action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_INCREMENT = 6

Increment action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_HIDE_TOOLTIP = 7

Hide tooltip action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_SHOW_TOOLTIP = 8

Show tooltip action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_SET_TEXT_SELECTION = 9

Set text selection action, callback argument is set to `Dictionary` with the following keys:
- `"start_element"` accessibility element of the selection start.
- `"start_char"` character offset relative to the accessibility element of the selection start.
- `"end_element"` accessibility element of the selection end.
- `"end_char"` character offset relative to the accessibility element of the selection end.

> enum_value AccessibilityAction.ACTION_REPLACE_SELECTED_TEXT = 10

Replace text action, callback argument is set to `String` with the replacement text.

> enum_value AccessibilityAction.ACTION_SCROLL_BACKWARD = 11

Scroll backward action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_SCROLL_DOWN = 12

Scroll down action, callback argument is set to `AccessibilityScrollUnit`.

> enum_value AccessibilityAction.ACTION_SCROLL_FORWARD = 13

Scroll forward action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_SCROLL_LEFT = 14

Scroll left action, callback argument is set to `AccessibilityScrollUnit`.

> enum_value AccessibilityAction.ACTION_SCROLL_RIGHT = 15

Scroll right action, callback argument is set to `AccessibilityScrollUnit`.

> enum_value AccessibilityAction.ACTION_SCROLL_UP = 16

Scroll up action, callback argument is set to `AccessibilityScrollUnit`.

> enum_value AccessibilityAction.ACTION_SCROLL_INTO_VIEW = 17

Scroll into view action, callback argument is set to `AccessibilityScrollHint`.

> enum_value AccessibilityAction.ACTION_SCROLL_TO_POINT = 18

Scroll to point action, callback argument is set to `Vector2` with the relative point coordinates.

> enum_value AccessibilityAction.ACTION_SET_SCROLL_OFFSET = 19

Set scroll offset action, callback argument is set to `Vector2` with the scroll offset.

> enum_value AccessibilityAction.ACTION_SET_VALUE = 20

Set value action, callback argument is set to `String` or number with the new value.

> enum_value AccessibilityAction.ACTION_SHOW_CONTEXT_MENU = 21

Show context menu action, callback argument is not set.

> enum_value AccessibilityAction.ACTION_CUSTOM = 22

Custom action, callback argument is set to the integer action ID.

> enum AccessibilityFlags

> enum_value AccessibilityFlags.FLAG_HIDDEN = 0

Element is hidden for accessibility tools.

> enum_value AccessibilityFlags.FLAG_MULTISELECTABLE = 1

Element supports multiple item selection.

> enum_value AccessibilityFlags.FLAG_REQUIRED = 2

Element require user input.

> enum_value AccessibilityFlags.FLAG_VISITED = 3

Element is a visited link.

> enum_value AccessibilityFlags.FLAG_BUSY = 4

Element content is not ready (e.g. loading).

> enum_value AccessibilityFlags.FLAG_MODAL = 5

Element is modal window.

> enum_value AccessibilityFlags.FLAG_TOUCH_PASSTHROUGH = 6

Element allows touches to be passed through when a screen reader is in touch exploration mode.

> enum_value AccessibilityFlags.FLAG_READONLY = 7

Element is text field with selectable but read-only text.

> enum_value AccessibilityFlags.FLAG_DISABLED = 8

Element is disabled.

> enum_value AccessibilityFlags.FLAG_CLIPS_CHILDREN = 9

Element clips children.

> enum AccessibilityLiveMode

> enum_value AccessibilityLiveMode.LIVE_OFF = 0

Indicates that updates to the live region should not be presented.

> enum_value AccessibilityLiveMode.LIVE_POLITE = 1

Indicates that updates to the live region should be presented at the next opportunity (for example at the end of speaking the current sentence).

> enum_value AccessibilityLiveMode.LIVE_ASSERTIVE = 2

Indicates that updates to the live region have the highest priority and should be presented immediately.

> enum AccessibilityPopupType

> enum_value AccessibilityPopupType.POPUP_MENU = 0

Popup menu.

> enum_value AccessibilityPopupType.POPUP_LIST = 1

Popup list.

> enum_value AccessibilityPopupType.POPUP_TREE = 2

Popup tree view.

> enum_value AccessibilityPopupType.POPUP_DIALOG = 3

Popup dialog.

> enum AccessibilityRole

> enum_value AccessibilityRole.ROLE_UNKNOWN = 0

Unknown or custom role.

> enum_value AccessibilityRole.ROLE_DEFAULT_BUTTON = 1

Default dialog button element.

> enum_value AccessibilityRole.ROLE_AUDIO = 2

Audio player element.

> enum_value AccessibilityRole.ROLE_VIDEO = 3

Video player element.

> enum_value AccessibilityRole.ROLE_STATIC_TEXT = 4

Non-editable text label.

> enum_value AccessibilityRole.ROLE_CONTAINER = 5

Container element. Elements with this role are used for internal structure and ignored by screen readers.

> enum_value AccessibilityRole.ROLE_PANEL = 6

Panel container element.

> enum_value AccessibilityRole.ROLE_BUTTON = 7

Button element.

> enum_value AccessibilityRole.ROLE_LINK = 8

Link element.

> enum_value AccessibilityRole.ROLE_CHECK_BOX = 9

Check box element.

> enum_value AccessibilityRole.ROLE_RADIO_BUTTON = 10

Radio button element.

> enum_value AccessibilityRole.ROLE_CHECK_BUTTON = 11

Check button element.

> enum_value AccessibilityRole.ROLE_SCROLL_BAR = 12

Scroll bar element.

> enum_value AccessibilityRole.ROLE_SCROLL_VIEW = 13

Scroll container element.

> enum_value AccessibilityRole.ROLE_SPLITTER = 14

Container splitter handle element.

> enum_value AccessibilityRole.ROLE_SLIDER = 15

Slider element.

> enum_value AccessibilityRole.ROLE_SPIN_BUTTON = 16

Spin box element.

> enum_value AccessibilityRole.ROLE_PROGRESS_INDICATOR = 17

Progress indicator element.

> enum_value AccessibilityRole.ROLE_TEXT_FIELD = 18

Editable text field element.

> enum_value AccessibilityRole.ROLE_MULTILINE_TEXT_FIELD = 19

Multiline editable text field element.

> enum_value AccessibilityRole.ROLE_COLOR_PICKER = 20

Color picker element.

> enum_value AccessibilityRole.ROLE_TABLE = 21

Table element.

> enum_value AccessibilityRole.ROLE_CELL = 22

Table/tree cell element.

> enum_value AccessibilityRole.ROLE_ROW = 23

Table/tree row element.

> enum_value AccessibilityRole.ROLE_ROW_GROUP = 24

Table/tree row group element.

> enum_value AccessibilityRole.ROLE_ROW_HEADER = 25

Table/tree row header element.

> enum_value AccessibilityRole.ROLE_COLUMN_HEADER = 26

Table/tree column header element.

> enum_value AccessibilityRole.ROLE_TREE = 27

Tree view element.

> enum_value AccessibilityRole.ROLE_TREE_ITEM = 28

Tree view item element.

> enum_value AccessibilityRole.ROLE_LIST = 29

List element.

> enum_value AccessibilityRole.ROLE_LIST_ITEM = 30

List item element.

> enum_value AccessibilityRole.ROLE_LIST_BOX = 31

List view element.

> enum_value AccessibilityRole.ROLE_LIST_BOX_OPTION = 32

List view item element.

> enum_value AccessibilityRole.ROLE_TAB_BAR = 33

Tab bar element.

> enum_value AccessibilityRole.ROLE_TAB = 34

Tab bar item element.

> enum_value AccessibilityRole.ROLE_TAB_PANEL = 35

Tab panel element.

> enum_value AccessibilityRole.ROLE_MENU_BAR = 36

Menu bar element.

> enum_value AccessibilityRole.ROLE_MENU = 37

Popup menu element.

> enum_value AccessibilityRole.ROLE_MENU_ITEM = 38

Popup menu item element.

> enum_value AccessibilityRole.ROLE_MENU_ITEM_CHECK_BOX = 39

Popup menu check button item element.

> enum_value AccessibilityRole.ROLE_MENU_ITEM_RADIO = 40

Popup menu radio button item element.

> enum_value AccessibilityRole.ROLE_IMAGE = 41

Image element.

> enum_value AccessibilityRole.ROLE_WINDOW = 42

Window element.

> enum_value AccessibilityRole.ROLE_TITLE_BAR = 43

Embedded window title bar element.

> enum_value AccessibilityRole.ROLE_DIALOG = 44

Dialog window element.

> enum_value AccessibilityRole.ROLE_TOOLTIP = 45

Tooltip element.

> enum_value AccessibilityRole.ROLE_REGION = 46

Region/landmark element. Screen readers can navigate between regions using landmark navigation.

> enum_value AccessibilityRole.ROLE_TEXT_RUN = 47

Unifor text run.
Note: This role is used for internal text elements, and should not be assigned to nodes.

> enum AccessibilityScrollHint

> enum_value AccessibilityScrollHint.SCROLL_HINT_TOP_LEFT = 0

A preferred position for the node scrolled into view. Top-left edge of the scroll container.

> enum_value AccessibilityScrollHint.SCROLL_HINT_BOTTOM_RIGHT = 1

A preferred position for the node scrolled into view. Bottom-right edge of the scroll container.

> enum_value AccessibilityScrollHint.SCROLL_HINT_TOP_EDGE = 2

A preferred position for the node scrolled into view. Top edge of the scroll container.

> enum_value AccessibilityScrollHint.SCROLL_HINT_BOTTOM_EDGE = 3

A preferred position for the node scrolled into view. Bottom edge of the scroll container.

> enum_value AccessibilityScrollHint.SCROLL_HINT_LEFT_EDGE = 4

A preferred position for the node scrolled into view. Left edge of the scroll container.

> enum_value AccessibilityScrollHint.SCROLL_HINT_RIGHT_EDGE = 5

A preferred position for the node scrolled into view. Right edge of the scroll container.

> enum AccessibilityScrollUnit

> enum_value AccessibilityScrollUnit.SCROLL_UNIT_ITEM = 0

The amount by which to scroll. A single item of a list, line of text.

> enum_value AccessibilityScrollUnit.SCROLL_UNIT_PAGE = 1

The amount by which to scroll. A single page.
