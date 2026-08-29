# GraphFrame

> class GraphFrame
> inherits GraphFrame GraphElement

## Brief

GraphFrame is a special `GraphElement` that can be used to organize other `GraphElement`s inside a `GraphEdit`.

## Description

GraphFrame is a special `GraphElement` to which other `GraphElement`s can be attached. It can be configured to automatically resize to enclose all attached `GraphElement`s. If the frame is moved, all the attached `GraphElement`s inside it will be moved as well.
A GraphFrame is always kept behind the connection layer and other `GraphElement`s inside a `GraphEdit`.

## Properties

> property autoshrink_enabled : bool ; default=true ; setter=set_autoshrink_enabled ; getter=is_autoshrink_enabled

If `true`, the frame's rect will be adjusted automatically to enclose all attached `GraphElement`s.

> property autoshrink_margin : int ; default=40 ; setter=set_autoshrink_margin ; getter=get_autoshrink_margin

The margin around the attached nodes that is used to calculate the size of the frame when `autoshrink_enabled` is `true`.

> property drag_margin : int ; default=16 ; setter=set_drag_margin ; getter=get_drag_margin

The margin inside the frame that can be used to drag the frame.

> property mouse_filter : Control.MouseFilter ; default=0 ; setter=set_mouse_filter ; getter=get_mouse_filter ; overrides=Control

> property tint_color : Color ; default=Color(0.3, 0.3, 0.3, 0.75) ; setter=set_tint_color ; getter=get_tint_color

The color of the frame when `tint_color_enabled` is `true`.

> property tint_color_enabled : bool ; default=false ; setter=set_tint_color_enabled ; getter=is_tint_color_enabled

If `true`, the tint color will be used to tint the frame.

> property title : String ; default="" ; setter=set_title ; getter=get_title

Title of the frame.

## Methods

> method get_titlebar_hbox() -> HBoxContainer

Returns the `HBoxContainer` used for the title bar, only containing a `Label` for displaying the title by default.
This can be used to add custom controls to the title bar such as option or close buttons.

## Signals

> signal autoshrink_changed()

Emitted when `autoshrink_enabled` or `autoshrink_margin` changes.

## Theme Properties

> theme_property resizer_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

The color modulation applied to the resizer icon.

> theme_property panel : StyleBox ; data=style

The default `StyleBox` used for the background of the `GraphFrame`.

> theme_property panel_selected : StyleBox ; data=style

The `StyleBox` used for the background of the `GraphFrame` when it is selected.

> theme_property titlebar : StyleBox ; data=style

The `StyleBox` used for the title bar of the `GraphFrame`.

> theme_property titlebar_selected : StyleBox ; data=style

The `StyleBox` used for the title bar of the `GraphFrame` when it is selected.
