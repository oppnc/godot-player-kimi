# ColorPicker

> class ColorPicker
> inherits ColorPicker VBoxContainer

## Brief

A widget that provides an interface for selecting or modifying a color.

## Description

A widget that provides an interface for selecting or modifying a color. It can optionally provide functionalities like a color sampler (eyedropper), color modes, and presets.
**Note:** This control is the color picker widget itself. You can use a `ColorPickerButton` instead if you need a button that brings up a `ColorPicker` in a popup.

## Properties

> property can_add_swatches : bool ; default=true ; setter=set_can_add_swatches ; getter=are_swatches_enabled

If `true`, it's possible to add presets under Swatches. If `false`, the button to add presets is disabled.

> property color : Color ; default=Color(1, 1, 1, 1) ; setter=set_pick_color ; getter=get_pick_color

The currently selected color.

> property color_mode : ColorModeType ; default=0 ; setter=set_color_mode ; getter=get_color_mode

The currently selected color mode.

> property color_modes_visible : bool ; default=true ; setter=set_modes_visible ; getter=are_modes_visible

If `true`, the color mode buttons are visible.

> property deferred_mode : bool ; default=false ; setter=set_deferred_mode ; getter=is_deferred_mode

If `true`, the color will apply only after the user releases the mouse button, otherwise it will apply immediately even in mouse motion event (which can cause performance issues).

> property edit_alpha : bool ; default=true ; setter=set_edit_alpha ; getter=is_editing_alpha

If `true`, shows an alpha channel slider (opacity).

> property edit_intensity : bool ; default=true ; setter=set_edit_intensity ; getter=is_editing_intensity

If `true`, shows an intensity slider. The intensity is applied as follows: convert the color to linear encoding, multiply it by `2 ** intensity`, and then convert it back to nonlinear sRGB encoding.

> property hex_visible : bool ; default=true ; setter=set_hex_visible ; getter=is_hex_visible

If `true`, the hex color code input field is visible.

> property picker_shape : PickerShapeType ; default=0 ; setter=set_picker_shape ; getter=get_picker_shape

The shape of the color space view.

> property presets_visible : bool ; default=true ; setter=set_presets_visible ; getter=are_presets_visible

If `true`, the Swatches and Recent Colors presets are visible.

> property sampler_visible : bool ; default=true ; setter=set_sampler_visible ; getter=is_sampler_visible

If `true`, the color sampler and color preview are visible.

> property sliders_visible : bool ; default=true ; setter=set_sliders_visible ; getter=are_sliders_visible

If `true`, the color sliders are visible.

## Methods

> method add_preset(color: Color) -> void

Adds the given color to a list of color presets. The presets are displayed in the color picker and the user will be able to select them.
**Note:** The presets list is only for *this* color picker.

> method add_recent_preset(color: Color) -> void

Adds the given color to a list of color recent presets so that it can be picked later. Recent presets are the colors that were picked recently, a new preset is automatically created and added to recent presets when you pick a new color.
**Note:** The recent presets list is only for *this* color picker.

> method erase_preset(color: Color) -> void

Removes the given color from the list of color presets of this color picker.

> method erase_recent_preset(color: Color) -> void

Removes the given color from the list of color recent presets of this color picker.

> method get_presets() -> PackedColorArray ; qualifiers=const

Returns the list of colors in the presets of the color picker.

> method get_recent_presets() -> PackedColorArray ; qualifiers=const

Returns the list of colors in the recent presets of the color picker.

## Signals

> signal color_changed(color: Color)

Emitted when the color is changed.

> signal preset_added(color: Color)

Emitted when a preset is added.

> signal preset_removed(color: Color)

Emitted when a preset is removed.

## Enumerations

> enum ColorModeType

> enum_value ColorModeType.MODE_RGB = 0

Allows editing the color with Red/Green/Blue sliders in sRGB color space.

> enum_value ColorModeType.MODE_HSV = 1

Allows editing the color with Hue/Saturation/Value sliders.

> enum_value ColorModeType.MODE_RAW = 2 ; deprecated=This is replaced by `MODE_LINEAR`.

> enum_value ColorModeType.MODE_LINEAR = 2

Allows editing the color with Red/Green/Blue sliders in linear color space.

> enum_value ColorModeType.MODE_OKHSL = 3

Allows editing the color with Hue/Saturation/Lightness sliders.
OKHSL is a new color space similar to HSL but that better match perception by leveraging the Oklab color space which is designed to be simple to use, while doing a good job at predicting perceived lightness, chroma and hue.
[Okhsv and Okhsl color spaces](https://bottosson.github.io/posts/colorpicker/)

> enum PickerShapeType

> enum_value PickerShapeType.SHAPE_HSV_RECTANGLE = 0

HSV Color Model rectangle color space.

> enum_value PickerShapeType.SHAPE_HSV_WHEEL = 1

HSV Color Model rectangle color space with a wheel.

> enum_value PickerShapeType.SHAPE_VHS_CIRCLE = 2

HSV Color Model circle color space. Use Saturation as a radius.

> enum_value PickerShapeType.SHAPE_OKHSL_CIRCLE = 3

HSL OK Color Model circle color space.

> enum_value PickerShapeType.SHAPE_NONE = 4

The color space shape and the shape select button are hidden. Can't be selected from the shapes popup.

> enum_value PickerShapeType.SHAPE_OK_HS_RECTANGLE = 5

OKHSL Color Model rectangle with constant lightness.

> enum_value PickerShapeType.SHAPE_OK_HL_RECTANGLE = 6

OKHSL Color Model rectangle with constant saturation.

## Theme Properties

> theme_property focused_not_editing_cursor_color : Color ; data=color ; default=Color(1, 1, 1, 0.275)

Color of rectangle or circle drawn when a picker shape part is focused but not editable via keyboard or joypad. Displayed *over* the picker shape, so a partially transparent color should be used to ensure the picker shape remains visible.

> theme_property center_slider_grabbers : int ; data=constant ; default=1

Overrides the `Slider.center_grabber` theme property of the sliders.

> theme_property h_width : int ; data=constant ; default=30

The width of the hue selection slider.

> theme_property label_width : int ; data=constant ; default=10

The minimum width of the color labels next to sliders.

> theme_property margin : int ; data=constant ; default=4

The margin around the `ColorPicker`.

> theme_property sv_height : int ; data=constant ; default=256

The height of the saturation-value selection box.

> theme_property sv_width : int ; data=constant ; default=256

The width of the saturation-value selection box.

> theme_property add_preset : Texture2D ; data=icon

The icon for the "Add Preset" button.

> theme_property bar_arrow : Texture2D ; data=icon

The texture for the arrow grabber.

> theme_property color_copy : Texture2D ; data=icon

The icon for the button that copies the color in text format to the clipboard.

> theme_property color_hue : Texture2D ; data=icon

Custom texture for the hue selection slider on the right.

> theme_property color_script : Texture2D ; data=icon

The icon for the button that switches color text to hexadecimal.

> theme_property expanded_arrow : Texture2D ; data=icon

The icon for color preset drop down menu when expanded.

> theme_property folded_arrow : Texture2D ; data=icon

The icon for color preset drop down menu when folded.

> theme_property menu_option : Texture2D ; data=icon

The icon for color preset option menu.

> theme_property overbright_indicator : Texture2D ; data=icon

The indicator used to signalize that the color value is outside the 0-1 range.

> theme_property picker_cursor : Texture2D ; data=icon

The image displayed over the color box/circle (depending on the `picker_shape`), marking the currently selected color.

> theme_property picker_cursor_bg : Texture2D ; data=icon

The fill image displayed behind the picker cursor.

> theme_property sample_bg : Texture2D ; data=icon

Background panel for the color preview box (visible when the color is translucent).

> theme_property sample_revert : Texture2D ; data=icon

The icon for the revert button (visible on the middle of the "old" color when it differs from the currently selected color). This icon is modulated with a dark color if the "old" color is bright enough, so the icon should be bright to ensure visibility in both scenarios.

> theme_property screen_picker : Texture2D ; data=icon

The icon for the screen color picker button.

> theme_property shape_circle : Texture2D ; data=icon

The icon for circular picker shapes.

> theme_property shape_rect : Texture2D ; data=icon

The icon for rectangular picker shapes.

> theme_property shape_rect_wheel : Texture2D ; data=icon

The icon for rectangular wheel picker shapes.

> theme_property picker_focus_circle : StyleBox ; data=style

The `StyleBox` used when the circle-shaped part of the picker is focused. Displayed *over* the picker shape, so a partially transparent `StyleBox` should be used to ensure the picker shape remains visible. A `StyleBox` that represents an outline or an underline works well for this purpose. To disable the focus visual effect, assign a `StyleBoxEmpty` resource. Note that disabling the focus visual effect will harm keyboard/controller navigation usability, so this is not recommended for accessibility reasons.

> theme_property picker_focus_rectangle : StyleBox ; data=style

The `StyleBox` used when the rectangle-shaped part of the picker is focused. Displayed *over* the picker shape, so a partially transparent `StyleBox` should be used to ensure the picker shape remains visible. A `StyleBox` that represents an outline or an underline works well for this purpose. To disable the focus visual effect, assign a `StyleBoxEmpty` resource. Note that disabling the focus visual effect will harm keyboard/controller navigation usability, so this is not recommended for accessibility reasons.

> theme_property sample_focus : StyleBox ; data=style

The `StyleBox` used for the old color sample part when it is focused. Displayed *over* the sample, so a partially transparent `StyleBox` should be used to ensure the picker shape remains visible. A `StyleBox` that represents an outline or an underline works well for this purpose. To disable the focus visual effect, assign a `StyleBoxEmpty` resource. Note that disabling the focus visual effect will harm keyboard/controller navigation usability, so this is not recommended for accessibility reasons.

## Tutorials
- [Tween Interpolation Demo](https://godotengine.org/asset-library/asset/2733)
