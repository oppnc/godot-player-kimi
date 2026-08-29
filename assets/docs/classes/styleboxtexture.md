# StyleBoxTexture

> class StyleBoxTexture
> inherits StyleBoxTexture StyleBox

## Brief

A texture-based nine-patch `StyleBox`.

## Description

A texture-based nine-patch `StyleBox`, in a way similar to `NinePatchRect`. This stylebox performs a 3×3 scaling of a texture, where only the center cell is fully stretched. This makes it possible to design bordered styles regardless of the stylebox's size.

## Properties

> property axis_stretch_horizontal : AxisStretchMode ; default=0 ; setter=set_h_axis_stretch_mode ; getter=get_h_axis_stretch_mode

Controls how the stylebox's texture will be stretched or tiled horizontally.

> property axis_stretch_vertical : AxisStretchMode ; default=0 ; setter=set_v_axis_stretch_mode ; getter=get_v_axis_stretch_mode

Controls how the stylebox's texture will be stretched or tiled vertically.

> property draw_center : bool ; default=true ; setter=set_draw_center ; getter=is_draw_center_enabled

If `true`, the nine-patch texture's center tile will be drawn.

> property expand_margin_bottom : float ; default=0.0 ; setter=set_expand_margin ; getter=get_expand_margin

Expands the bottom margin of this style box when drawing, causing it to be drawn larger than requested.

> property expand_margin_left : float ; default=0.0 ; setter=set_expand_margin ; getter=get_expand_margin

Expands the left margin of this style box when drawing, causing it to be drawn larger than requested.

> property expand_margin_right : float ; default=0.0 ; setter=set_expand_margin ; getter=get_expand_margin

Expands the right margin of this style box when drawing, causing it to be drawn larger than requested.

> property expand_margin_top : float ; default=0.0 ; setter=set_expand_margin ; getter=get_expand_margin

Expands the top margin of this style box when drawing, causing it to be drawn larger than requested.

> property modulate_color : Color ; default=Color(1, 1, 1, 1) ; setter=set_modulate ; getter=get_modulate

Modulates the color of the texture when this style box is drawn.

> property region_rect : Rect2 ; default=Rect2(0, 0, 0, 0) ; setter=set_region_rect ; getter=get_region_rect

The region to use from the `texture`.
This is equivalent to first wrapping the `texture` in an `AtlasTexture` with the same region.
If empty (`Rect2(0, 0, 0, 0)`), the whole `texture` is used.

> property texture : Texture2D ; setter=set_texture ; getter=get_texture

The texture to use when drawing this style box.

> property texture_margin_bottom : float ; default=0.0 ; setter=set_texture_margin ; getter=get_texture_margin

Increases the bottom margin of the 3×3 texture box.
A higher value means more of the source texture is considered to be part of the bottom border of the 3×3 box.
This is also the value used as fallback for `StyleBox.content_margin_bottom` if it is negative.

> property texture_margin_left : float ; default=0.0 ; setter=set_texture_margin ; getter=get_texture_margin

Increases the left margin of the 3×3 texture box.
A higher value means more of the source texture is considered to be part of the left border of the 3×3 box.
This is also the value used as fallback for `StyleBox.content_margin_left` if it is negative.

> property texture_margin_right : float ; default=0.0 ; setter=set_texture_margin ; getter=get_texture_margin

Increases the right margin of the 3×3 texture box.
A higher value means more of the source texture is considered to be part of the right border of the 3×3 box.
This is also the value used as fallback for `StyleBox.content_margin_right` if it is negative.

> property texture_margin_top : float ; default=0.0 ; setter=set_texture_margin ; getter=get_texture_margin

Increases the top margin of the 3×3 texture box.
A higher value means more of the source texture is considered to be part of the top border of the 3×3 box.
This is also the value used as fallback for `StyleBox.content_margin_top` if it is negative.

## Methods

> method get_expand_margin(margin: Side) -> float ; qualifiers=const

Returns the expand margin size of the specified `Side`.

> method get_texture_margin(margin: Side) -> float ; qualifiers=const

Returns the margin size of the specified `Side`.

> method set_expand_margin(margin: Side, size: float) -> void

Sets the expand margin to `size` pixels for the specified `Side`.

> method set_expand_margin_all(size: float) -> void

Sets the expand margin to `size` pixels for all sides.

> method set_texture_margin(margin: Side, size: float) -> void

Sets the margin to `size` pixels for the specified `Side`.

> method set_texture_margin_all(size: float) -> void

Sets the margin to `size` pixels for all sides.

## Enumerations

> enum AxisStretchMode

> enum_value AxisStretchMode.AXIS_STRETCH_MODE_STRETCH = 0

Stretch the stylebox's texture. This results in visible distortion unless the texture size matches the stylebox's size perfectly.

> enum_value AxisStretchMode.AXIS_STRETCH_MODE_TILE = 1

Repeats the stylebox's texture to match the stylebox's size according to the nine-patch system.

> enum_value AxisStretchMode.AXIS_STRETCH_MODE_TILE_FIT = 2

Repeats the stylebox's texture to match the stylebox's size according to the nine-patch system. Unlike `AXIS_STRETCH_MODE_TILE`, the texture may be slightly stretched to make the nine-patch texture tile seamlessly.
