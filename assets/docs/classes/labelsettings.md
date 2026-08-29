# LabelSettings

> class LabelSettings
> inherits LabelSettings Resource

## Brief

Provides common settings to customize the text in a `Label`.

## Description

`LabelSettings` is a resource that provides common settings to customize the text in a `Label`. It will take priority over the properties defined in `Control.theme`. The resource can be shared between multiple labels and changed on the fly, so it's convenient and flexible way to setup text style.

## Properties

> property font : Font ; setter=set_font ; getter=get_font

`Font` used for the text.

> property font_color : Color ; default=Color(1, 1, 1, 1) ; setter=set_font_color ; getter=get_font_color

Color of the text.

> property font_size : int ; default=16 ; setter=set_font_size ; getter=get_font_size

Size of the text.

> property line_spacing : float ; default=3.0 ; setter=set_line_spacing ; getter=get_line_spacing

Additional vertical spacing between lines (in pixels), spacing is added to line descent. This value can be negative.

> property outline_color : Color ; default=Color(1, 1, 1, 1) ; setter=set_outline_color ; getter=get_outline_color

The color of the outline.

> property outline_size : int ; default=0 ; setter=set_outline_size ; getter=get_outline_size

Text outline size.

> property paragraph_spacing : float ; default=0.0 ; setter=set_paragraph_spacing ; getter=get_paragraph_spacing

Vertical space between paragraphs. Added on top of `line_spacing`.

> property shadow_color : Color ; default=Color(0, 0, 0, 0) ; setter=set_shadow_color ; getter=get_shadow_color

Color of the shadow effect. If alpha is `0`, no shadow will be drawn.

> property shadow_offset : Vector2 ; default=Vector2(1, 1) ; setter=set_shadow_offset ; getter=get_shadow_offset

Offset of the shadow effect, in pixels.

> property shadow_size : int ; default=1 ; setter=set_shadow_size ; getter=get_shadow_size

Size of the shadow effect.

> property stacked_outline_count : int ; default=0 ; setter=set_stacked_outline_count ; getter=get_stacked_outline_count

The number of stacked outlines.

> property stacked_outline_{index}/color : Color ; default=Color(0, 0, 0, 1)

The color of the outline at `index`.
**Note:** `index` is a value in the `0 .. stacked_outline_count - 1` range.

> property stacked_outline_{index}/size : int ; default=0

The size of the outline at `index`.
**Note:** `index` is a value in the `0 .. stacked_outline_count - 1` range.

> property stacked_shadow_count : int ; default=0 ; setter=set_stacked_shadow_count ; getter=get_stacked_shadow_count

The number of stacked shadows.

> property stacked_shadow_{index}/color : Color ; default=Color(0, 0, 0, 1)

The color of the shadow at `index`.
**Note:** `index` is a value in the `0 .. stacked_shadow_count - 1` range.

> property stacked_shadow_{index}/offset : Vector2 ; default=Vector2(1, 1)

The offset of the shadow at `index`.
**Note:** `index` is a value in the `0 .. stacked_shadow_count - 1` range.

> property stacked_shadow_{index}/outline_size : int ; default=0

The size of the shadow outline at `index`.
**Note:** `index` is a value in the `0 .. stacked_shadow_count - 1` range.

## Methods

> method add_stacked_outline(index: int = -1) -> void

Adds a new stacked outline to the label at the given `index`. If `index` is `-1`, the new stacked outline will be added at the end of the list.

> method add_stacked_shadow(index: int = -1) -> void

Adds a new stacked shadow to the label at the given `index`. If `index` is `-1`, the new stacked shadow will be added at the end of the list.

> method get_stacked_outline_color(index: int) -> Color ; qualifiers=const

Returns the color of the stacked outline at `index`.

> method get_stacked_outline_size(index: int) -> int ; qualifiers=const

Returns the size of the stacked outline at `index`.

> method get_stacked_shadow_color(index: int) -> Color ; qualifiers=const

Returns the color of the stacked shadow at `index`.

> method get_stacked_shadow_offset(index: int) -> Vector2 ; qualifiers=const

Returns the offset of the stacked shadow at `index`.

> method get_stacked_shadow_outline_size(index: int) -> int ; qualifiers=const

Returns the outline size of the stacked shadow at `index`.

> method move_stacked_outline(from_index: int, to_position: int) -> void

Moves the stacked outline at index `from_index` to the given position `to_position` in the array.

> method move_stacked_shadow(from_index: int, to_position: int) -> void

Moves the stacked shadow at index `from_index` to the given position `to_position` in the array.

> method remove_stacked_outline(index: int) -> void

Removes the stacked outline at index `index`.

> method remove_stacked_shadow(index: int) -> void

Removes the stacked shadow at index `index`.

> method set_stacked_outline_color(index: int, color: Color) -> void

Sets the color of the stacked outline identified by the given `index` to `color`.

> method set_stacked_outline_size(index: int, size: int) -> void

Sets the size of the stacked outline identified by the given `index` to `size`.

> method set_stacked_shadow_color(index: int, color: Color) -> void

Sets the color of the stacked shadow identified by the given `index` to `color`.

> method set_stacked_shadow_offset(index: int, offset: Vector2) -> void

Sets the offset of the stacked shadow identified by the given `index` to `offset`.

> method set_stacked_shadow_outline_size(index: int, size: int) -> void

Sets the outline size of the stacked shadow identified by the given `index` to `size`.
