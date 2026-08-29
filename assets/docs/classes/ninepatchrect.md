# NinePatchRect

> class NinePatchRect
> inherits NinePatchRect Control

## Brief

A control that displays a texture by keeping its corners intact, but tiling its edges and center.

## Description

Also known as 9-slice panels, `NinePatchRect` produces clean panels of any size based on a small texture. To do so, it splits the texture in a 3×3 grid. When you scale the node, it tiles the texture's edges horizontally or vertically, tiles the center on both axes, and leaves the corners unchanged.

## Properties

> property axis_stretch_horizontal : AxisStretchMode ; default=0 ; setter=set_h_axis_stretch_mode ; getter=get_h_axis_stretch_mode

The stretch mode to use for horizontal stretching/tiling.

> property axis_stretch_vertical : AxisStretchMode ; default=0 ; setter=set_v_axis_stretch_mode ; getter=get_v_axis_stretch_mode

The stretch mode to use for vertical stretching/tiling.

> property draw_center : bool ; default=true ; setter=set_draw_center ; getter=is_draw_center_enabled

If `true`, draw the panel's center. Else, only draw the 9-slice's borders.

> property mouse_filter : Control.MouseFilter ; default=2 ; setter=set_mouse_filter ; getter=get_mouse_filter ; overrides=Control

> property patch_margin_bottom : int ; default=0 ; setter=set_patch_margin ; getter=get_patch_margin

The height of the 9-slice's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.

> property patch_margin_left : int ; default=0 ; setter=set_patch_margin ; getter=get_patch_margin

The width of the 9-slice's left column. A margin of 16 means the 9-slice's left corners and side will have a width of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.

> property patch_margin_right : int ; default=0 ; setter=set_patch_margin ; getter=get_patch_margin

The width of the 9-slice's right column. A margin of 16 means the 9-slice's right corners and side will have a width of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.

> property patch_margin_top : int ; default=0 ; setter=set_patch_margin ; getter=get_patch_margin

The height of the 9-slice's top row. A margin of 16 means the 9-slice's top corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.

> property region_rect : Rect2 ; default=Rect2(0, 0, 0, 0) ; setter=set_region_rect ; getter=get_region_rect

Rectangular region of the texture to sample from. If you're working with an atlas, use this property to define the area the 9-slice should use. All other properties are relative to this one. If the rect is empty, NinePatchRect will use the whole texture.

> property texture : Texture2D ; setter=set_texture ; getter=get_texture

The node's texture resource.

## Methods

> method get_patch_margin(margin: Side) -> int ; qualifiers=const

Returns the size of the margin on the specified `Side`.

> method set_patch_margin(margin: Side, value: int) -> void

Sets the size of the margin on the specified `Side` to `value` pixels.

## Signals

> signal texture_changed()

Emitted when the node's texture changes.

## Enumerations

> enum AxisStretchMode

> enum_value AxisStretchMode.AXIS_STRETCH_MODE_STRETCH = 0

Stretches the center texture across the NinePatchRect. This may cause the texture to be distorted.

> enum_value AxisStretchMode.AXIS_STRETCH_MODE_TILE = 1

Repeats the center texture across the NinePatchRect. This won't cause any visible distortion. The texture must be seamless for this to work without displaying artifacts between edges.

> enum_value AxisStretchMode.AXIS_STRETCH_MODE_TILE_FIT = 2

Repeats the center texture across the NinePatchRect, but will also stretch the texture to make sure each tile is visible in full. This may cause the texture to be distorted, but less than `AXIS_STRETCH_MODE_STRETCH`. The texture must be seamless for this to work without displaying artifacts between edges.
