# ScrollBar

> class ScrollBar
> inherits ScrollBar Range

## Brief

Abstract base class for scrollbars.

## Description

Abstract base class for scrollbars, typically used to navigate through content that extends beyond the visible area of a control. Scrollbars are `Range`-based controls.

## Properties

> property custom_step : float ; default=-1.0 ; setter=set_custom_step ; getter=get_custom_step

Overrides the step used when clicking increment and decrement buttons or when using arrow keys when the `ScrollBar` is focused.

> property focus_mode : Control.FocusMode ; default=3 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property step : float ; default=0.0 ; setter=set_step ; getter=get_step ; overrides=Range

## Signals

> signal scrolling()

Emitted when the scrollbar is being scrolled.

## Theme Properties

> theme_property decrement : Texture2D ; data=icon

Icon used as a button to scroll the `ScrollBar` left/up. Supports custom step using the `ScrollBar.custom_step` property.

> theme_property decrement_highlight : Texture2D ; data=icon

Displayed when the mouse cursor hovers over the decrement button.

> theme_property decrement_pressed : Texture2D ; data=icon

Displayed when the decrement button is being pressed.

> theme_property increment : Texture2D ; data=icon

Icon used as a button to scroll the `ScrollBar` right/down. Supports custom step using the `ScrollBar.custom_step` property.

> theme_property increment_highlight : Texture2D ; data=icon

Displayed when the mouse cursor hovers over the increment button.

> theme_property increment_pressed : Texture2D ; data=icon

Displayed when the increment button is being pressed.

> theme_property grabber : StyleBox ; data=style

Used as texture for the grabber, the draggable element representing current scroll.

> theme_property grabber_highlight : StyleBox ; data=style

Used when the mouse hovers over the grabber.

> theme_property grabber_pressed : StyleBox ; data=style

Used when the grabber is being dragged.

> theme_property scroll : StyleBox ; data=style

Used as background of this `ScrollBar`.

> theme_property scroll_focus : StyleBox ; data=style

Used as background when the `ScrollBar` has the GUI focus.
