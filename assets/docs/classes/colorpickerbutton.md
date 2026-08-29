# ColorPickerButton

> class ColorPickerButton
> inherits ColorPickerButton Button

## Brief

A button that brings up a `ColorPicker` when pressed.

## Description

Encapsulates a `ColorPicker`, making it accessible by pressing a button. Pressing the button will toggle the `ColorPicker`'s visibility.
See also `BaseButton` which contains common properties and methods associated with this node.
**Note:** By default, the button may not be wide enough for the color preview swatch to be visible. Make sure to set `Control.custom_minimum_size` to a big enough value to give the button enough space.

## Properties

> property color : Color ; default=Color(0, 0, 0, 1) ; setter=set_pick_color ; getter=get_pick_color

The currently selected color.

> property edit_alpha : bool ; default=true ; setter=set_edit_alpha ; getter=is_editing_alpha

If `true`, the alpha channel in the displayed `ColorPicker` will be visible.

> property edit_intensity : bool ; default=true ; setter=set_edit_intensity ; getter=is_editing_intensity

If `true`, the intensity slider in the displayed `ColorPicker` will be visible.

> property toggle_mode : bool ; default=true ; setter=set_toggle_mode ; getter=is_toggle_mode ; overrides=BaseButton

## Methods

> method get_picker() -> ColorPicker

Returns the `ColorPicker` that this node toggles.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `CanvasItem.visible` property.

> method get_popup() -> PopupPanel

Returns the control's `PopupPanel` which allows you to connect to popup signals. This allows you to handle events when the ColorPicker is shown or hidden.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `Window.visible` property.

## Signals

> signal color_changed(color: Color)

Emitted when the color changes.

> signal picker_created()

Emitted when the `ColorPicker` is created (the button is pressed for the first time).

> signal popup_closed()

Emitted when the `ColorPicker` is closed.

## Theme Properties

> theme_property bg : Texture2D ; data=icon

The background of the color preview rect on the button.

## Tutorials
- [2D GD Paint Demo](https://godotengine.org/asset-library/asset/2768)
- [GUI Drag And Drop Demo](https://godotengine.org/asset-library/asset/2767)
