# StyleBoxFlat

> class StyleBoxFlat
> inherits StyleBoxFlat StyleBox

## Brief

A customizable `StyleBox` that doesn't use a texture.

## Description

By configuring various properties of this style box, you can achieve many common looks without the need of a texture. This includes optionally rounded borders, antialiasing, shadows, and skew.
Setting corner radius to high values is allowed. As soon as corners overlap, the stylebox will switch to a relative system:

```text
        height = 30
        corner_radius_top_left = 50
        corner_radius_bottom_left = 100

```

The relative system now would take the 1:2 ratio of the two left corners to calculate the actual corner width. Both corners added will **never** be more than the height. Result:

```text
        corner_radius_top_left: 10
        corner_radius_bottom_left: 20

```

## Properties

> property anti_aliasing : bool ; default=true ; setter=set_anti_aliased ; getter=is_anti_aliased

Antialiasing draws a small ring around the edges, which fades to transparency. As a result, edges look much smoother. This is only noticeable when using rounded corners or `skew`.
**Note:** When using beveled corners with 45-degree angles (`corner_detail` = 1), it is recommended to set `anti_aliasing` to `false` to ensure crisp visuals and avoid possible visual glitches.

> property anti_aliasing_size : float ; default=1.0 ; setter=set_aa_size ; getter=get_aa_size

This changes the size of the antialiasing effect. `1.0` is recommended for an optimal result at 100% scale, identical to how rounded rectangles are rendered in web browsers and most vector drawing software.
**Note:** Higher values may produce a blur effect but can also create undesired artifacts on small boxes with large-radius corners.

> property bg_color : Color ; default=Color(0.6, 0.6, 0.6, 1) ; setter=set_bg_color ; getter=get_bg_color

The background color of the stylebox.

> property border_blend : bool ; default=false ; setter=set_border_blend ; getter=get_border_blend

If `true`, the border will fade into the background color.

> property border_color : Color ; default=Color(0.8, 0.8, 0.8, 1) ; setter=set_border_color ; getter=get_border_color

Sets the color of the border.

> property border_width_bottom : int ; default=0 ; setter=set_border_width ; getter=get_border_width

Border width for the bottom border.

> property border_width_left : int ; default=0 ; setter=set_border_width ; getter=get_border_width

Border width for the left border.

> property border_width_right : int ; default=0 ; setter=set_border_width ; getter=get_border_width

Border width for the right border.

> property border_width_top : int ; default=0 ; setter=set_border_width ; getter=get_border_width

Border width for the top border.

> property corner_detail : int ; default=8 ; setter=set_corner_detail ; getter=get_corner_detail

This sets the number of vertices used for each corner. Higher values result in rounder corners but take more processing power to compute. When choosing a value, you should take the corner radius (`set_corner_radius_all`) into account.
For corner radii less than 10, `4` or `5` should be enough. For corner radii less than 30, values between `8` and `12` should be enough.
A corner detail of `1` will result in chamfered corners instead of rounded corners, which is useful for some artistic effects.

> property corner_radius_bottom_left : int ; default=0 ; setter=set_corner_radius ; getter=get_corner_radius

The bottom-left corner's radius. If `0`, the corner is not rounded.

> property corner_radius_bottom_right : int ; default=0 ; setter=set_corner_radius ; getter=get_corner_radius

The bottom-right corner's radius. If `0`, the corner is not rounded.

> property corner_radius_top_left : int ; default=0 ; setter=set_corner_radius ; getter=get_corner_radius

The top-left corner's radius. If `0`, the corner is not rounded.

> property corner_radius_top_right : int ; default=0 ; setter=set_corner_radius ; getter=get_corner_radius

The top-right corner's radius. If `0`, the corner is not rounded.

> property draw_center : bool ; default=true ; setter=set_draw_center ; getter=is_draw_center_enabled

Toggles drawing of the inner part of the stylebox.

> property expand_margin_bottom : float ; default=0.0 ; setter=set_expand_margin ; getter=get_expand_margin

Expands the stylebox outside of the control rect on the bottom edge. Useful in combination with `border_width_bottom` to draw a border outside the control rect.
**Note:** Unlike `StyleBox.content_margin_bottom`, `expand_margin_bottom` does *not* affect the size of the clickable area for `Control`s. This can negatively impact usability if used wrong, as the user may try to click an area of the StyleBox that cannot actually receive clicks.

> property expand_margin_left : float ; default=0.0 ; setter=set_expand_margin ; getter=get_expand_margin

Expands the stylebox outside of the control rect on the left edge. Useful in combination with `border_width_left` to draw a border outside the control rect.
**Note:** Unlike `StyleBox.content_margin_left`, `expand_margin_left` does *not* affect the size of the clickable area for `Control`s. This can negatively impact usability if used wrong, as the user may try to click an area of the StyleBox that cannot actually receive clicks.

> property expand_margin_right : float ; default=0.0 ; setter=set_expand_margin ; getter=get_expand_margin

Expands the stylebox outside of the control rect on the right edge. Useful in combination with `border_width_right` to draw a border outside the control rect.
**Note:** Unlike `StyleBox.content_margin_right`, `expand_margin_right` does *not* affect the size of the clickable area for `Control`s. This can negatively impact usability if used wrong, as the user may try to click an area of the StyleBox that cannot actually receive clicks.

> property expand_margin_top : float ; default=0.0 ; setter=set_expand_margin ; getter=get_expand_margin

Expands the stylebox outside of the control rect on the top edge. Useful in combination with `border_width_top` to draw a border outside the control rect.
**Note:** Unlike `StyleBox.content_margin_top`, `expand_margin_top` does *not* affect the size of the clickable area for `Control`s. This can negatively impact usability if used wrong, as the user may try to click an area of the StyleBox that cannot actually receive clicks.

> property shadow_color : Color ; default=Color(0, 0, 0, 0.6) ; setter=set_shadow_color ; getter=get_shadow_color

The color of the shadow. This has no effect if `shadow_size` is lower than 1.

> property shadow_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_shadow_offset ; getter=get_shadow_offset

The shadow offset in pixels. Adjusts the position of the shadow relatively to the stylebox.

> property shadow_size : int ; default=0 ; setter=set_shadow_size ; getter=get_shadow_size

The shadow size in pixels.

> property skew : Vector2 ; default=Vector2(0, 0) ; setter=set_skew ; getter=get_skew

If set to a non-zero value on either axis, `skew` distorts the StyleBox horizontally and/or vertically. This can be used for "futuristic"-style UIs. Positive values skew the StyleBox towards the right (X axis) and upwards (Y axis), while negative values skew the StyleBox towards the left (X axis) and downwards (Y axis).
**Note:** To ensure text does not touch the StyleBox's edges, consider increasing the `StyleBox`'s content margin (see `StyleBox.content_margin_bottom`). It is preferable to increase the content margin instead of the expand margin (see `expand_margin_bottom`), as increasing the expand margin does not increase the size of the clickable area for `Control`s.

## Methods

> method get_border_width(margin: Side) -> int ; qualifiers=const

Returns the specified `Side`'s border width.

> method get_border_width_min() -> int ; qualifiers=const

Returns the smallest border width out of all four borders.

> method get_corner_radius(corner: Corner) -> int ; qualifiers=const

Returns the given `corner`'s radius.

> method get_expand_margin(margin: Side) -> float ; qualifiers=const

Returns the size of the specified `Side`'s expand margin.

> method set_border_width(margin: Side, width: int) -> void

Sets the specified `Side`'s border width to `width` pixels.

> method set_border_width_all(width: int) -> void

Sets the border width to `width` pixels for all sides.

> method set_corner_radius(corner: Corner, radius: int) -> void

Sets the corner radius to `radius` pixels for the given `corner`.

> method set_corner_radius_all(radius: int) -> void

Sets the corner radius to `radius` pixels for all corners.

> method set_expand_margin(margin: Side, size: float) -> void

Sets the expand margin to `size` pixels for the specified `Side`.

> method set_expand_margin_all(size: float) -> void

Sets the expand margin to `size` pixels for all sides.
