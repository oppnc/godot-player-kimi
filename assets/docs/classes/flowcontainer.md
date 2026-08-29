# FlowContainer

> class FlowContainer
> inherits FlowContainer Container

## Brief

A container that arranges its child controls horizontally or vertically and wraps them around at the borders.

## Description

A container that arranges its child controls horizontally or vertically and wraps them around at the borders. This is similar to how text in a book wraps around when no more words can fit on a line.

## Properties

> property alignment : AlignmentMode ; default=0 ; setter=set_alignment ; getter=get_alignment

The alignment of the container's children (must be one of `ALIGNMENT_BEGIN`, `ALIGNMENT_CENTER`, or `ALIGNMENT_END`).

> property last_wrap_alignment : LastWrapAlignmentMode ; default=0 ; setter=set_last_wrap_alignment ; getter=get_last_wrap_alignment

The wrap behavior of the last, partially filled row or column (must be one of `LAST_WRAP_ALIGNMENT_INHERIT`, `LAST_WRAP_ALIGNMENT_BEGIN`, `LAST_WRAP_ALIGNMENT_CENTER`, or `LAST_WRAP_ALIGNMENT_END`).

> property reverse_fill : bool ; default=false ; setter=set_reverse_fill ; getter=is_reverse_fill

If `true`, reverses fill direction. Horizontal `FlowContainer`s will fill rows bottom to top, vertical `FlowContainer`s will fill columns right to left.
When using a vertical `FlowContainer` with a right to left `Control.layout_direction`, columns will fill left to right instead.

> property vertical : bool ; default=false ; setter=set_vertical ; getter=is_vertical

If `true`, the `FlowContainer` will arrange its children vertically, rather than horizontally.
Can't be changed when using `HFlowContainer` and `VFlowContainer`.

## Methods

> method get_line_count() -> int ; qualifiers=const

Returns the current line count.

## Enumerations

> enum AlignmentMode

> enum_value AlignmentMode.ALIGNMENT_BEGIN = 0

The child controls will be arranged at the beginning of the container, i.e. top if orientation is vertical, left if orientation is horizontal (right for RTL layout).

> enum_value AlignmentMode.ALIGNMENT_CENTER = 1

The child controls will be centered in the container.

> enum_value AlignmentMode.ALIGNMENT_END = 2

The child controls will be arranged at the end of the container, i.e. bottom if orientation is vertical, right if orientation is horizontal (left for RTL layout).

> enum LastWrapAlignmentMode

> enum_value LastWrapAlignmentMode.LAST_WRAP_ALIGNMENT_INHERIT = 0

The last partially filled row or column will wrap aligned to the previous row or column in accordance with `alignment`.

> enum_value LastWrapAlignmentMode.LAST_WRAP_ALIGNMENT_BEGIN = 1

The last partially filled row or column will wrap aligned to the beginning of the previous row or column.

> enum_value LastWrapAlignmentMode.LAST_WRAP_ALIGNMENT_CENTER = 2

The last partially filled row or column will wrap aligned to the center of the previous row or column.

> enum_value LastWrapAlignmentMode.LAST_WRAP_ALIGNMENT_END = 3

The last partially filled row or column will wrap aligned to the end of the previous row or column.

## Theme Properties

> theme_property h_separation : int ; data=constant ; default=4

The horizontal separation of child nodes.

> theme_property v_separation : int ; data=constant ; default=4

The vertical separation of child nodes.

## Tutorials
- [Using Containers]($DOCS_URL/tutorials/ui/gui_containers.html)
