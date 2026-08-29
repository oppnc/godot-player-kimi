# VScrollBar

> class VScrollBar
> inherits VScrollBar ScrollBar

## Brief

A vertical scrollbar that goes from top (min) to bottom (max).

## Description

A vertical scrollbar, typically used to navigate through content that extends beyond the visible height of a control. It is a `Range`-based control and goes from top (min) to bottom (max). Note that this direction is the opposite of `VSlider`'s.

## Properties

> property size_flags_horizontal : BitField[Control.SizeFlags] ; default=0 ; setter=set_h_size_flags ; getter=get_h_size_flags ; overrides=Control

> property size_flags_vertical : BitField[Control.SizeFlags] ; default=1 ; setter=set_v_size_flags ; getter=get_v_size_flags ; overrides=Control

## Theme Properties

> theme_property padding_left : int ; data=constant ; default=0

Padding between the left of the `ScrollBar.scroll` element and the `ScrollBar.grabber`.
**Note:** To apply vertical padding, modify the top/bottom content margins of `ScrollBar.scroll` instead.

> theme_property padding_right : int ; data=constant ; default=0

Padding between the right of the `ScrollBar.scroll` element and the `ScrollBar.grabber`.
**Note:** To apply vertical padding, modify the top/bottom content margins of `ScrollBar.scroll` instead.
