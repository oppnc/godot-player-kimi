# Slider

> class Slider
> inherits Slider Range

## Brief

Abstract base class for sliders.

## Description

Abstract base class for sliders, used to adjust a value by moving a grabber along a horizontal or vertical axis. Sliders are `Range`-based controls.

## Properties

> property editable : bool ; default=true ; setter=set_editable ; getter=is_editable

If `true`, the slider can be interacted with. If `false`, the value can be changed only by code.

> property focus_mode : Control.FocusMode ; default=2 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property scrollable : bool ; default=true ; setter=set_scrollable ; getter=is_scrollable

If `true`, the value can be changed using the mouse wheel.

> property step : float ; default=1.0 ; setter=set_step ; getter=get_step ; overrides=Range

> property tick_count : int ; default=0 ; setter=set_ticks ; getter=get_ticks

Number of ticks displayed on the slider, including border ticks. Ticks are uniformly-distributed value markers.

> property ticks_on_borders : bool ; default=false ; setter=set_ticks_on_borders ; getter=get_ticks_on_borders

If `true`, the slider will display ticks for minimum and maximum values.

> property ticks_position : TickPosition ; default=0 ; setter=set_ticks_position ; getter=get_ticks_position

Sets the position of the ticks. See `TickPosition` for details.

## Signals

> signal drag_ended(value_changed: bool)

Emitted when the grabber stops being dragged. If `value_changed` is `true`, `Range.value` is different from the value when the dragging was started.

> signal drag_started()

Emitted when the grabber starts being dragged. This is emitted before the corresponding `Range.value_changed` signal.

## Enumerations

> enum TickPosition

> enum_value TickPosition.TICK_POSITION_BOTTOM_RIGHT = 0

Places the ticks at the bottom of the `HSlider`, or right of the `VSlider`.

> enum_value TickPosition.TICK_POSITION_TOP_LEFT = 1

Places the ticks at the top of the `HSlider`, or left of the `VSlider`.

> enum_value TickPosition.TICK_POSITION_BOTH = 2

Places the ticks at the both sides of the slider.

> enum_value TickPosition.TICK_POSITION_CENTER = 3

Places the ticks at the center of the slider.

## Theme Properties

> theme_property center_grabber : int ; data=constant ; default=0

Boolean constant. If `1`, the grabber texture size will be ignored and it will fit within slider's bounds based only on its center position.

> theme_property grabber_offset : int ; data=constant ; default=0

Vertical or horizontal offset of the grabber.

> theme_property tick_offset : int ; data=constant ; default=0

Vertical or horizontal offset of the ticks. The offset is reversed for top or left ticks.

> theme_property grabber : Texture2D ; data=icon

The texture for the grabber (the draggable element).

> theme_property grabber_disabled : Texture2D ; data=icon

The texture for the grabber when it's disabled.

> theme_property grabber_highlight : Texture2D ; data=icon

The texture for the grabber when it's focused.

> theme_property tick : Texture2D ; data=icon

The texture for the ticks, visible when `Slider.tick_count` is greater than 0.

> theme_property grabber_area : StyleBox ; data=style

The background of the area to the left or bottom of the grabber.

> theme_property grabber_area_highlight : StyleBox ; data=style

The background of the area to the left or bottom of the grabber that displays when it's being hovered or focused.

> theme_property slider : StyleBox ; data=style

The background for the whole slider. Affects the height or width of the `grabber_area`.
