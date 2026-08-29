# PopupPanel

> class PopupPanel
> inherits PopupPanel Popup

## Brief

A popup with a panel background.

## Description

A popup with a configurable panel background. Any child controls added to this node will be stretched to fit the panel's size (similar to how `PanelContainer` works). If you are making windows, see `Window`.

## Properties

> property canvas_item_default_texture_filter : Viewport.DefaultCanvasItemTextureFilter ; default=4 ; setter=set_default_canvas_item_texture_filter ; getter=get_default_canvas_item_texture_filter ; overrides=Viewport

> property canvas_item_default_texture_repeat : Viewport.DefaultCanvasItemTextureRepeat ; default=3 ; setter=set_default_canvas_item_texture_repeat ; getter=get_default_canvas_item_texture_repeat ; overrides=Viewport

> property transparent : bool ; default=true ; setter=set_flag ; getter=get_flag ; overrides=Window

> property transparent_bg : bool ; default=true ; setter=set_transparent_background ; getter=has_transparent_background ; overrides=Viewport

## Theme Properties

> theme_property panel : StyleBox ; data=style

`StyleBox` for the background panel.
