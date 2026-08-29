# ScrollContainer

> class ScrollContainer
> inherits ScrollContainer Container

## Brief

A container used to provide scrollbars to a child control when needed.

## Description

A container used to provide a child control with scrollbars when needed. Scrollbars will automatically be drawn at the right (for vertical) or bottom (for horizontal) and will enable dragging to move the viewable Control (and its children) within the ScrollContainer. Scrollbars will also automatically resize the grabber based on the `Control.custom_minimum_size` of the Control relative to the ScrollContainer.

## Properties

> property clip_contents : bool ; default=true ; setter=set_clip_contents ; getter=is_clipping_contents ; overrides=Control

> property draw_focus_border : bool ; default=false ; setter=set_draw_focus_border ; getter=get_draw_focus_border

If `true`, `focus` is drawn when the ScrollContainer or one of its descendant nodes is focused.

> property follow_focus : bool ; default=false ; setter=set_follow_focus ; getter=is_following_focus

If `true`, the ScrollContainer will automatically scroll to focused children (including indirect children) to make sure they are fully visible.

> property horizontal_scroll_mode : ScrollMode ; default=1 ; setter=set_horizontal_scroll_mode ; getter=get_horizontal_scroll_mode

Controls whether horizontal scrollbar can be used and when it should be visible.

> property propagate_maximum_size : bool ; default=false ; setter=set_propagate_maximum_size ; getter=is_propagating_maximum_size ; overrides=Control

> property scroll_deadzone : int ; default=0 ; setter=set_deadzone ; getter=get_deadzone

Deadzone for touch scrolling. Lower deadzone makes the scrolling more sensitive.

> property scroll_hint_mode : ScrollHintMode ; default=0 ; setter=set_scroll_hint_mode ; getter=get_scroll_hint_mode

The way which scroll hints (indicators that show that the content can still be scrolled in a certain direction) will be shown.
**Note:** Hints won't be shown if the content can be scrolled both vertically and horizontally.

> property scroll_horizontal : int ; default=0 ; setter=set_h_scroll ; getter=get_h_scroll

The current horizontal scroll value.
**Note:** If you are setting this value in the `Node._ready` function or earlier, it needs to be wrapped with `Object.set_deferred`, since scroll bar's `Range.max_value` is not initialized yet.

```text
            func _ready():
                set_deferred("scroll_horizontal", 600)

```

> property scroll_horizontal_by_default : bool ; default=false ; setter=set_scroll_horizontal_by_default ; getter=is_scroll_horizontal_by_default

If `true`, the mouse wheel scrolls the view horizontally, and holding `Shift` scrolls vertically.
If `false` (default), the mouse wheel scrolls the view vertically, and holding `Shift` scrolls horizontally.

> property scroll_horizontal_custom_step : float ; default=-1.0 ; setter=set_horizontal_custom_step ; getter=get_horizontal_custom_step

Overrides the `ScrollBar.custom_step` used when clicking the internal scroll bar's horizontal increment and decrement buttons or when using arrow keys when the `ScrollBar` is focused.

> property scroll_vertical : int ; default=0 ; setter=set_v_scroll ; getter=get_v_scroll

The current vertical scroll value.
**Note:** Setting it early needs to be deferred, just like in `scroll_horizontal`.

```text
            func _ready():
                set_deferred("scroll_vertical", 600)

```

> property scroll_vertical_custom_step : float ; default=-1.0 ; setter=set_vertical_custom_step ; getter=get_vertical_custom_step

Overrides the `ScrollBar.custom_step` used when clicking the internal scroll bar's vertical increment and decrement buttons or when using arrow keys when the `ScrollBar` is focused.

> property tile_scroll_hint : bool ; default=false ; setter=set_tile_scroll_hint ; getter=is_scroll_hint_tiled

If `true`, the scroll hint texture will be tiled instead of stretched. See `scroll_hint_mode`.

> property vertical_scroll_mode : ScrollMode ; default=1 ; setter=set_vertical_scroll_mode ; getter=get_vertical_scroll_mode

Controls whether vertical scrollbar can be used and when it should be visible.

## Methods

> method ensure_control_visible(control: Control) -> void

Ensures the given `control` is visible (must be a direct or indirect child of the ScrollContainer). Used by `follow_focus`.
**Note:** This will not work on a node that was just added during the same frame. If you want to scroll to a newly added child, you must wait until the next frame using `SceneTree.process_frame`:

```text
                add_child(child_node)
                await get_tree().process_frame
                ensure_control_visible(child_node)

```

> method get_h_scroll_bar() -> HScrollBar

Returns the horizontal scrollbar `HScrollBar` of this `ScrollContainer`.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to disable or hide a scrollbar, you can use `horizontal_scroll_mode`.

> method get_v_scroll_bar() -> VScrollBar

Returns the vertical scrollbar `VScrollBar` of this `ScrollContainer`.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to disable or hide a scrollbar, you can use `vertical_scroll_mode`.

## Signals

> signal scroll_ended()

Emitted when scrolling stops when dragging the scrollable area *with a touch event*. This signal is *not* emitted when scrolling by dragging the scrollbar, scrolling with the mouse wheel or scrolling with keyboard/gamepad events.
**Note:** This signal is only emitted on Android or iOS, or on desktop/web platforms when `ProjectSettings.input_devices/pointing/emulate_touch_from_mouse` is enabled.

> signal scroll_started()

Emitted when scrolling starts when dragging the scrollable area *with a touch event*. This signal is *not* emitted when scrolling by dragging the scrollbar, scrolling with the mouse wheel or scrolling with keyboard/gamepad events.
**Note:** This signal is only emitted on Android or iOS, or on desktop/web platforms when `ProjectSettings.input_devices/pointing/emulate_touch_from_mouse` is enabled.

## Enumerations

> enum ScrollHintMode

> enum_value ScrollHintMode.SCROLL_HINT_MODE_DISABLED = 0

Scroll hints will never be shown.

> enum_value ScrollHintMode.SCROLL_HINT_MODE_ALL = 1

Scroll hints will be shown at the top and bottom (if vertical), or left and right (if horizontal).

> enum_value ScrollHintMode.SCROLL_HINT_MODE_TOP_AND_LEFT = 2

Scroll hints will be shown at the top (if vertical), or the left (if horizontal).

> enum_value ScrollHintMode.SCROLL_HINT_MODE_BOTTOM_AND_RIGHT = 3

Scroll hints will be shown at the bottom (if horizontal), or the right (if horizontal).

> enum ScrollMode

> enum_value ScrollMode.SCROLL_MODE_DISABLED = 0

Scrolling disabled, scrollbar will be invisible.

> enum_value ScrollMode.SCROLL_MODE_AUTO = 1

Scrolling enabled, scrollbar will be visible only if necessary, i.e. container's content is bigger than the container.

> enum_value ScrollMode.SCROLL_MODE_SHOW_ALWAYS = 2

Scrolling enabled, scrollbar will be always visible.

> enum_value ScrollMode.SCROLL_MODE_SHOW_NEVER = 3

Scrolling enabled, scrollbar will be hidden.

> enum_value ScrollMode.SCROLL_MODE_RESERVE = 4

Combines `SCROLL_MODE_AUTO` and `SCROLL_MODE_SHOW_ALWAYS`. The scrollbar is only visible if necessary, but the content size is adjusted as if it was always visible. It's useful for ensuring that content size stays the same regardless if the scrollbar is visible.

> enum_value ScrollMode.SCROLL_MODE_MAXIMIZE_FIRST = 5

Behaves like `SCROLL_MODE_AUTO`, but makes the `ScrollContainer` report a minimum size based on its content (limited by `Control.custom_maximum_size` when set on the corresponding axis). This allows it to grow first and only start scrolling once constrained.

## Theme Properties

> theme_property scroll_hint_horizontal_color : Color ; data=color ; default=Color(0, 0, 0, 1)

`Color` used to modulate the `scroll_hint_horizontal` texture.

> theme_property scroll_hint_vertical_color : Color ; data=color ; default=Color(0, 0, 0, 1)

`Color` used to modulate the `scroll_hint_vertical` texture.

> theme_property scrollbar_h_separation : int ; data=constant ; default=0

The space between the ScrollContainer's vertical scroll bar and its content, in pixels. No space will be added when the content's minimum size is larger than the ScrollContainer's size.

> theme_property scrollbar_v_separation : int ; data=constant ; default=0

The space between the ScrollContainer's horizontal scroll bar and its content, in pixels. No space will be added when the content's minimum size is larger than the ScrollContainer's size.

> theme_property scroll_hint_horizontal : Texture2D ; data=icon

The indicator that will be shown when the content can still be scrolled horizontally. See `scroll_hint_mode`.

> theme_property scroll_hint_vertical : Texture2D ; data=icon

The indicator that will be shown when the content can still be scrolled vertically. See `scroll_hint_mode`.

> theme_property focus : StyleBox ; data=style

The focus border `StyleBox` of the `ScrollContainer`. Only used if `draw_focus_border` is `true`.

> theme_property panel : StyleBox ; data=style

The background `StyleBox` of the `ScrollContainer`.

## Tutorials
- [Using Containers]($DOCS_URL/tutorials/ui/gui_containers.html)
