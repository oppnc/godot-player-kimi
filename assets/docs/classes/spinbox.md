# SpinBox

> class SpinBox ; keywords=number, numeric, input
> inherits SpinBox Range

## Brief

An input field for numbers.

## Description

`SpinBox` is a numerical input text field. It allows entering integers and floating-point numbers. The `SpinBox` also has up and down buttons that can be clicked to increase or decrease the value. The value can also be changed by dragging the mouse up or down over the `SpinBox`'s arrows.
Additionally, mathematical expressions can be entered. These are evaluated when the user presses `Enter` while editing the `SpinBox`'s text field. This uses the `Expression` class to parse and evaluate the expression. The result of the expression is then set as the value of the `SpinBox`. Some examples of valid expressions are `5 + 2 * 3`, `pow(2, 4)`, and `PI + sin(0.5)`. Expressions are case-sensitive.
**Example:** Create a `SpinBox`, disable its context menu and set its text alignment to right.

```gdscript
        var spin_box = SpinBox.new()
        add_child(spin_box)
        var line_edit = spin_box.get_line_edit()
        line_edit.context_menu_enabled = false
        spin_box.horizontal_alignment = LineEdit.HORIZONTAL_ALIGNMENT_RIGHT

```

```csharp
        var spinBox = new SpinBox();
        AddChild(spinBox);
        var lineEdit = spinBox.GetLineEdit();
        lineEdit.ContextMenuEnabled = false;
        spinBox.AlignHorizontal = LineEdit.HorizontalAlignEnum.Right;

```

See `Range` class for more options over the `SpinBox`.
**Note:** With the `SpinBox`'s context menu disabled, you can right-click the bottom half of the spinbox to set the value to its minimum, while right-clicking the top half sets the value to its maximum.
**Note:** `SpinBox` relies on an underlying `LineEdit` node. To theme a `SpinBox`'s background, add theme items for `LineEdit` and customize them. The `LineEdit` has the `SpinBoxInnerLineEdit` theme variation, so that you can give it a distinct appearance from regular `LineEdit`s.
**Note:** If you want to implement drag and drop for the underlying `LineEdit`, you can use `Control.set_drag_forwarding` on the node returned by `get_line_edit`.

## Properties

> property alignment : HorizontalAlignment ; default=0 ; setter=set_horizontal_alignment ; getter=get_horizontal_alignment

Changes the alignment of the underlying `LineEdit`.

> property custom_arrow_round : bool ; default=false ; setter=set_custom_arrow_round ; getter=is_custom_arrow_rounding

If `true`, the value will be rounded to a multiple of `custom_arrow_step` when interacting with the arrow buttons. Otherwise, increments the value by `custom_arrow_step` and then rounds it according to `Range.step`.

> property custom_arrow_step : float ; default=0.0 ; setter=set_custom_arrow_step ; getter=get_custom_arrow_step

If not `0`, sets the step when interacting with the arrow buttons of the `SpinBox`.
**Note:** `Range.value` will still be rounded to a multiple of `Range.step`.

> property editable : bool ; default=true ; setter=set_editable ; getter=is_editable

If `true`, the `SpinBox` will be editable. Otherwise, it will be read only.

> property prefix : String ; default="" ; setter=set_prefix ; getter=get_prefix

Adds the specified prefix string before the numerical value of the `SpinBox`.

> property select_all_on_focus : bool ; default=false ; setter=set_select_all_on_focus ; getter=is_select_all_on_focus

If `true`, the `SpinBox` will select the whole text when the `LineEdit` gains focus. Clicking the up and down arrows won't trigger this behavior.

> property size_flags_vertical : BitField[Control.SizeFlags] ; default=1 ; setter=set_v_size_flags ; getter=get_v_size_flags ; overrides=Control

> property step : float ; default=1.0 ; setter=set_step ; getter=get_step ; overrides=Range

> property suffix : String ; default="" ; setter=set_suffix ; getter=get_suffix

Adds the specified suffix string after the numerical value of the `SpinBox`.

> property update_on_text_changed : bool ; default=false ; setter=set_update_on_text_changed ; getter=get_update_on_text_changed

Sets the value of the `Range` for this `SpinBox` when the `LineEdit` text is *changed* instead of *submitted*. See `LineEdit.text_changed` and `LineEdit.text_submitted`.
**Note:** If set to `true`, this will interfere with entering mathematical expressions in the `SpinBox`. The `SpinBox` will try to evaluate the expression as you type, which means symbols like a trailing `+` are removed immediately by the expression being evaluated.

## Methods

> method apply() -> void

Applies the current value of this `SpinBox`. This is equivalent to pressing `Enter` while editing the `LineEdit` used by the `SpinBox`. This will cause `LineEdit.text_submitted` to be emitted and its currently contained expression to be evaluated.

> method get_line_edit() -> LineEdit

Returns the `LineEdit` instance from this `SpinBox`. You can use it to access properties and methods of `LineEdit`.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `CanvasItem.visible` property.

## Theme Properties

> theme_property down_disabled_icon_modulate : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 0.5)

Down button icon modulation color, when the button is disabled.

> theme_property down_hover_icon_modulate : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Down button icon modulation color, when the button is hovered.

> theme_property down_icon_modulate : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

Down button icon modulation color.

> theme_property down_pressed_icon_modulate : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Down button icon modulation color, when the button is being pressed.

> theme_property up_disabled_icon_modulate : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 0.5)

Up button icon modulation color, when the button is disabled.

> theme_property up_hover_icon_modulate : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Up button icon modulation color, when the button is hovered.

> theme_property up_icon_modulate : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

Up button icon modulation color.

> theme_property up_pressed_icon_modulate : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Up button icon modulation color, when the button is being pressed.

> theme_property buttons_vertical_separation : int ; data=constant ; default=0

Vertical separation between the up and down buttons.

> theme_property buttons_width : int ; data=constant ; default=16

Width of the up and down buttons. If smaller than any icon set on the buttons, the respective icon may overlap neighboring elements. If smaller than `0`, the width is automatically adjusted from the icon size.

> theme_property field_and_buttons_separation : int ; data=constant ; default=2

Width of the horizontal separation between the text input field (`LineEdit`) and the buttons.

> theme_property set_min_buttons_width_from_icons : int ; data=constant ; default=1

If not `0`, the minimum button width corresponds to the widest of all icons set on those buttons, even if `buttons_width` is smaller.

> theme_property down : Texture2D ; data=icon

Down button icon, displayed in the middle of the down (value-decreasing) button.

> theme_property down_disabled : Texture2D ; data=icon

Down button icon when the button is disabled.

> theme_property down_hover : Texture2D ; data=icon

Down button icon when the button is hovered.

> theme_property down_pressed : Texture2D ; data=icon

Down button icon when the button is being pressed.

> theme_property up : Texture2D ; data=icon

Up button icon, displayed in the middle of the up (value-increasing) button.

> theme_property up_disabled : Texture2D ; data=icon

Up button icon when the button is disabled.

> theme_property up_hover : Texture2D ; data=icon

Up button icon when the button is hovered.

> theme_property up_pressed : Texture2D ; data=icon

Up button icon when the button is being pressed.

> theme_property updown : Texture2D ; data=icon

Single texture representing both the up and down buttons icons. It is displayed in the middle of the buttons and does not change upon interaction. If a valid icon is assigned, it will replace `up` and `down`.

> theme_property down_background : StyleBox ; data=style

Background style of the down button.

> theme_property down_background_disabled : StyleBox ; data=style

Background style of the down button when disabled.

> theme_property down_background_hovered : StyleBox ; data=style

Background style of the down button when hovered.

> theme_property down_background_pressed : StyleBox ; data=style

Background style of the down button when being pressed.

> theme_property field_and_buttons_separator : StyleBox ; data=style

`StyleBox` drawn in the space occupied by the separation between the input field and the buttons.

> theme_property up_background : StyleBox ; data=style

Background style of the up button.

> theme_property up_background_disabled : StyleBox ; data=style

Background style of the up button when disabled.

> theme_property up_background_hovered : StyleBox ; data=style

Background style of the up button when hovered.

> theme_property up_background_pressed : StyleBox ; data=style

Background style of the up button when being pressed.

> theme_property up_down_buttons_separator : StyleBox ; data=style

`StyleBox` drawn in the space occupied by the separation between the up and down buttons.
