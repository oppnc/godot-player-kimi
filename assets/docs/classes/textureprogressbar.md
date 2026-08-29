# TextureProgressBar

> class TextureProgressBar
> inherits TextureProgressBar Range

## Brief

Texture-based progress bar. Useful for loading screens and life or stamina bars.

## Description

TextureProgressBar works like `ProgressBar`, but uses up to 3 textures instead of Godot's `Theme` resource. It can be used to create horizontal, vertical and radial progress bars.

## Properties

> property fill_mode : int ; default=0 ; setter=set_fill_mode ; getter=get_fill_mode

The fill direction. See `FillMode` for possible values.

> property mouse_filter : Control.MouseFilter ; default=1 ; setter=set_mouse_filter ; getter=get_mouse_filter ; overrides=Control

> property nine_patch_stretch : bool ; default=false ; setter=set_nine_patch_stretch ; getter=get_nine_patch_stretch

If `true`, Godot treats the bar's textures like in `NinePatchRect`. Use the `stretch_margin_*` properties like `stretch_margin_bottom` to set up the nine patch's 3×3 grid. When using a radial `fill_mode`, this setting will only enable stretching for `texture_progress`, while `texture_under` and `texture_over` will be treated like in `NinePatchRect`.

> property radial_center_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_radial_center_offset ; getter=get_radial_center_offset

Offsets `texture_progress` if `fill_mode` is `FILL_CLOCKWISE`, `FILL_COUNTER_CLOCKWISE`, or `FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE`.
**Note:** The effective radial center always stays within the `texture_progress` bounds. If you need to move it outside the texture's bounds, modify the `texture_progress` to contain additional empty space where needed.

> property radial_fill_degrees : float ; default=360.0 ; setter=set_fill_degrees ; getter=get_fill_degrees

Upper limit for the fill of `texture_progress` if `fill_mode` is `FILL_CLOCKWISE`, `FILL_COUNTER_CLOCKWISE`, or `FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE`. When the node's `value` is equal to its `max_value`, the texture fills up to this angle.
See `Range.value`, `Range.max_value`.

> property radial_initial_angle : float ; default=0.0 ; setter=set_radial_initial_angle ; getter=get_radial_initial_angle

Starting angle for the fill of `texture_progress` if `fill_mode` is `FILL_CLOCKWISE`, `FILL_COUNTER_CLOCKWISE`, or `FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE`. When the node's `value` is equal to its `min_value`, the texture doesn't show up at all. When the `value` increases, the texture fills and tends towards `radial_fill_degrees`.
**Note:** `radial_initial_angle` is wrapped between `0` and `360` degrees (inclusive).

> property size_flags_vertical : BitField[Control.SizeFlags] ; default=1 ; setter=set_v_size_flags ; getter=get_v_size_flags ; overrides=Control

> property step : float ; default=1.0 ; setter=set_step ; getter=get_step ; overrides=Range

> property stretch_margin_bottom : int ; default=0 ; setter=set_stretch_margin ; getter=get_stretch_margin

The height of the 9-patch's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders. Only effective if `nine_patch_stretch` is `true`.

> property stretch_margin_left : int ; default=0 ; setter=set_stretch_margin ; getter=get_stretch_margin

The width of the 9-patch's left column. Only effective if `nine_patch_stretch` is `true`.

> property stretch_margin_right : int ; default=0 ; setter=set_stretch_margin ; getter=get_stretch_margin

The width of the 9-patch's right column. Only effective if `nine_patch_stretch` is `true`.

> property stretch_margin_top : int ; default=0 ; setter=set_stretch_margin ; getter=get_stretch_margin

The height of the 9-patch's top row. Only effective if `nine_patch_stretch` is `true`.

> property texture_over : Texture2D ; setter=set_over_texture ; getter=get_over_texture

`Texture2D` that draws over the progress bar. Use it to add highlights or an upper-frame that hides part of `texture_progress`.

> property texture_progress : Texture2D ; setter=set_progress_texture ; getter=get_progress_texture

`Texture2D` that clips based on the node's `value` and `fill_mode`. As `value` increased, the texture fills up. It shows entirely when `value` reaches `max_value`. It doesn't show at all if `value` is equal to `min_value`.
The `value` property comes from `Range`. See `Range.value`, `Range.min_value`, `Range.max_value`.

> property texture_progress_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_texture_progress_offset ; getter=get_texture_progress_offset

The offset of `texture_progress`. Useful for `texture_over` and `texture_under` with fancy borders, to avoid transparent margins in your progress texture.

> property texture_under : Texture2D ; setter=set_under_texture ; getter=get_under_texture

`Texture2D` that draws under the progress bar. The bar's background.

> property tint_over : Color ; default=Color(1, 1, 1, 1) ; setter=set_tint_over ; getter=get_tint_over

Multiplies the color of the bar's `texture_over` texture. The effect is similar to `CanvasItem.modulate`, except it only affects this specific texture instead of the entire node.

> property tint_progress : Color ; default=Color(1, 1, 1, 1) ; setter=set_tint_progress ; getter=get_tint_progress

Multiplies the color of the bar's `texture_progress` texture.

> property tint_under : Color ; default=Color(1, 1, 1, 1) ; setter=set_tint_under ; getter=get_tint_under

Multiplies the color of the bar's `texture_under` texture.

## Methods

> method get_stretch_margin(margin: Side) -> int ; qualifiers=const

Returns the stretch margin with the specified index. See `stretch_margin_bottom` and related properties.

> method set_stretch_margin(margin: Side, value: int) -> void

Sets the stretch margin with the specified index. See `stretch_margin_bottom` and related properties.

## Enumerations

> enum FillMode

> enum_value FillMode.FILL_LEFT_TO_RIGHT = 0

The `texture_progress` fills from left to right.

> enum_value FillMode.FILL_RIGHT_TO_LEFT = 1

The `texture_progress` fills from right to left.

> enum_value FillMode.FILL_TOP_TO_BOTTOM = 2

The `texture_progress` fills from top to bottom.

> enum_value FillMode.FILL_BOTTOM_TO_TOP = 3

The `texture_progress` fills from bottom to top.

> enum_value FillMode.FILL_CLOCKWISE = 4

Turns the node into a radial bar. The `texture_progress` fills clockwise. See `radial_center_offset`, `radial_initial_angle` and `radial_fill_degrees` to control the way the bar fills up.

> enum_value FillMode.FILL_COUNTER_CLOCKWISE = 5

Turns the node into a radial bar. The `texture_progress` fills counterclockwise. See `radial_center_offset`, `radial_initial_angle` and `radial_fill_degrees` to control the way the bar fills up.

> enum_value FillMode.FILL_BILINEAR_LEFT_AND_RIGHT = 6

The `texture_progress` fills from the center, expanding both towards the left and the right.

> enum_value FillMode.FILL_BILINEAR_TOP_AND_BOTTOM = 7

The `texture_progress` fills from the center, expanding both towards the top and the bottom.

> enum_value FillMode.FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE = 8

Turns the node into a radial bar. The `texture_progress` fills radially from the center, expanding both clockwise and counterclockwise. See `radial_center_offset`, `radial_initial_angle` and `radial_fill_degrees` to control the way the bar fills up.
