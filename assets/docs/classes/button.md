# Button

> class Button
> inherits Button BaseButton

## Brief

A themed button that can contain text and an icon.

## Description

`Button` is the standard themed button. It can contain text and an icon, and it will display them according to the current `Theme`.
**Example:** Create a button and connect a method that will be called when the button is pressed:

```gdscript
        func _ready():
            var button = Button.new()
            button.text = "Click me"
            button.pressed.connect(_button_pressed)
            add_child(button)

        func _button_pressed():
            print("Hello world!")

```

```csharp
        public override void _Ready()
        {
            var button = new Button();
            button.Text = "Click me";
            button.Pressed += ButtonPressed;
            AddChild(button);
        }

        private void ButtonPressed()
        {
            GD.Print("Hello world!");
        }

```

See also `BaseButton` which contains common properties and methods associated with this node.
**Note:** Buttons support multitouch via touch input, allowing multiple buttons to be pressed at the same time. Otherwise, mouse input is used, limiting interaction to one button press at a time.

## Properties

> property alignment : HorizontalAlignment ; default=1 ; setter=set_text_alignment ; getter=get_text_alignment

Text alignment policy for the button's text.

> property autowrap_mode : TextServer.AutowrapMode ; default=0 ; setter=set_autowrap_mode ; getter=get_autowrap_mode

If set to something other than `TextServer.AUTOWRAP_OFF`, the text gets wrapped inside the node's bounding rectangle.

> property autowrap_trim_flags : BitField[TextServer.LineBreakFlag] ; default=128 ; setter=set_autowrap_trim_flags ; getter=get_autowrap_trim_flags

Autowrap space trimming flags. See `TextServer.BREAK_TRIM_START_EDGE_SPACES` and `TextServer.BREAK_TRIM_END_EDGE_SPACES` for more info.

> property clip_text : bool ; default=false ; setter=set_clip_text ; getter=get_clip_text

If `true`, text that is too large to fit the button is clipped horizontally. If `false`, the button will always be wide enough to hold the text. The text is not vertically clipped, and the button's height is not affected by this property.

> property expand_icon : bool ; default=false ; setter=set_expand_icon ; getter=is_expand_icon

When enabled, the button's icon will expand/shrink to fit the button's size while keeping its aspect. See also `icon_max_width`.

> property flat : bool ; default=false ; setter=set_flat ; getter=is_flat

Flat buttons don't display decoration.

> property icon : Texture2D ; setter=set_button_icon ; getter=get_button_icon

Button's icon, if text is present the icon will be placed before the text.
To edit margin and spacing of the icon, use `h_separation` theme property and `content_margin_*` properties of the used `StyleBox`es.

> property icon_alignment : HorizontalAlignment ; default=0 ; setter=set_icon_alignment ; getter=get_icon_alignment

Specifies if the icon should be aligned horizontally to the left, right, or center of a button. Uses the same `HorizontalAlignment` constants as the text alignment. If centered horizontally and vertically, text will draw on top of the icon.

> property language : String ; default="" ; setter=set_language ; getter=get_language

Language code used for line-breaking and text shaping algorithms. If left empty, the current locale is used instead.

> property text : String ; default="" ; setter=set_text ; getter=get_text

The button's text that will be displayed inside the button's area.

> property text_direction : Control.TextDirection ; default=0 ; setter=set_text_direction ; getter=get_text_direction

Base text writing direction.

> property text_overrun_behavior : TextServer.OverrunBehavior ; default=0 ; setter=set_text_overrun_behavior ; getter=get_text_overrun_behavior

Sets the clipping behavior when the text exceeds the node's bounding rectangle.

> property vertical_icon_alignment : VerticalAlignment ; default=1 ; setter=set_vertical_icon_alignment ; getter=get_vertical_icon_alignment

Specifies if the icon should be aligned vertically to the top, bottom, or center of a button. Uses the same `VerticalAlignment` constants as the text alignment. If centered horizontally and vertically, text will draw on top of the icon.

## Theme Properties

> theme_property font_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

Default text `Color` of the `Button`.

> theme_property font_disabled_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 0.5)

Text `Color` used when the `Button` is disabled.

> theme_property font_focus_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Text `Color` used when the `Button` is focused. Only replaces the normal text color of the button. Disabled, hovered, and pressed states take precedence over this color.

> theme_property font_hover_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Text `Color` used when the `Button` is being hovered.

> theme_property font_hover_pressed_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Text `Color` used when the `Button` is being hovered and pressed.

> theme_property font_outline_color : Color ; data=color ; default=Color(0, 0, 0, 1)

The tint of text outline of the `Button`.

> theme_property font_pressed_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Text `Color` used when the `Button` is being pressed.

> theme_property icon_disabled_color : Color ; data=color ; default=Color(1, 1, 1, 0.4)

Icon modulate `Color` used when the `Button` is disabled.

> theme_property icon_focus_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Icon modulate `Color` used when the `Button` is focused. Only replaces the normal modulate color of the button. Disabled, hovered, and pressed states take precedence over this color.

> theme_property icon_hover_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Icon modulate `Color` used when the `Button` is being hovered.

> theme_property icon_hover_pressed_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Icon modulate `Color` used when the `Button` is being hovered and pressed.

> theme_property icon_normal_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Default icon modulate `Color` of the `Button`.

> theme_property icon_pressed_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Icon modulate `Color` used when the `Button` is being pressed.

> theme_property align_to_largest_stylebox : int ; data=constant ; default=0

This constant acts as a boolean. If `true`, the minimum size of the button and text/icon alignment is always based on the largest stylebox margins, otherwise it's based on the current button state stylebox margins.

> theme_property h_separation : int ; data=constant ; default=4

The horizontal space between `Button`'s icon and text. Negative values will be treated as `0` when used.

> theme_property icon_max_width : int ; data=constant ; default=0

The maximum allowed width of the `Button`'s icon. This limit is applied on top of the default size of the icon, or its expanded size if `expand_icon` is `true`. The height is adjusted according to the icon's ratio. If the button has additional icons (e.g. `CheckBox`), they will also be limited.

> theme_property line_spacing : int ; data=constant ; default=0

Additional vertical spacing between lines (in pixels), spacing is added to line descent. This value can be negative.

> theme_property outline_size : int ; data=constant ; default=0

The size of the text outline.
**Note:** If using a font with `FontFile.multichannel_signed_distance_field` enabled, its `FontFile.msdf_pixel_range` must be set to at least *twice* the value of `outline_size` for outline rendering to look correct. Otherwise, the outline may appear to be cut off earlier than intended.

> theme_property font : Font ; data=font

`Font` of the `Button`'s text.

> theme_property font_size : int ; data=font_size

Font size of the `Button`'s text.

> theme_property icon : Texture2D ; data=icon

Default icon for the `Button`. Appears only if `icon` is not assigned.

> theme_property disabled : StyleBox ; data=style

`StyleBox` used when the `Button` is disabled.

> theme_property disabled_mirrored : StyleBox ; data=style

`StyleBox` used when the `Button` is disabled (for right-to-left layouts).

> theme_property focus : StyleBox ; data=style

`StyleBox` used when the `Button` is focused. The `focus` `StyleBox` is displayed *over* the base `StyleBox`, so a partially transparent `StyleBox` should be used to ensure the base `StyleBox` remains visible. A `StyleBox` that represents an outline or an underline works well for this purpose. To disable the focus visual effect, assign a `StyleBoxEmpty` resource. Note that disabling the focus visual effect will harm keyboard/controller navigation usability, so this is not recommended for accessibility reasons.

> theme_property hover : StyleBox ; data=style

`StyleBox` used when the `Button` is being hovered.

> theme_property hover_mirrored : StyleBox ; data=style

`StyleBox` used when the `Button` is being hovered (for right-to-left layouts).

> theme_property hover_pressed : StyleBox ; data=style

`StyleBox` used when the `Button` is being pressed and hovered at the same time.

> theme_property hover_pressed_mirrored : StyleBox ; data=style

`StyleBox` used when the `Button` is being pressed and hovered at the same time (for right-to-left layouts).

> theme_property normal : StyleBox ; data=style

Default `StyleBox` for the `Button`.

> theme_property normal_mirrored : StyleBox ; data=style

Default `StyleBox` for the `Button` (for right-to-left layouts).

> theme_property pressed : StyleBox ; data=style

`StyleBox` used when the `Button` is being pressed.

> theme_property pressed_mirrored : StyleBox ; data=style

`StyleBox` used when the `Button` is being pressed (for right-to-left layouts).

## Tutorials
- [2D Dodge The Creeps Demo](https://godotengine.org/asset-library/asset/2712)
- [Operating System Testing Demo](https://godotengine.org/asset-library/asset/2789)
