# BoxContainer

> class BoxContainer
> inherits BoxContainer Container

## Brief

A container that arranges its child controls horizontally or vertically.

## Description

A container that arranges its child controls horizontally or vertically, rearranging them automatically when their minimum size changes.

## Properties

> property alignment : AlignmentMode ; default=0 ; setter=set_alignment ; getter=get_alignment

The alignment of the container's children (must be one of `ALIGNMENT_BEGIN`, `ALIGNMENT_CENTER`, or `ALIGNMENT_END`).

> property vertical : bool ; default=false ; setter=set_vertical ; getter=is_vertical

If `true`, the `BoxContainer` will arrange its children vertically, rather than horizontally.
Can't be changed when using `HBoxContainer` and `VBoxContainer`.

## Methods

> method add_spacer(begin: bool) -> Control

Adds a `Control` node to the box as a spacer. If `begin` is `true`, it will insert the `Control` node in front of all other children.

## Enumerations

> enum AlignmentMode

> enum_value AlignmentMode.ALIGNMENT_BEGIN = 0

The child controls will be arranged at the beginning of the container, i.e. top if orientation is vertical, left if orientation is horizontal (right for RTL layout).

> enum_value AlignmentMode.ALIGNMENT_CENTER = 1

The child controls will be centered in the container.

> enum_value AlignmentMode.ALIGNMENT_END = 2

The child controls will be arranged at the end of the container, i.e. bottom if orientation is vertical, right if orientation is horizontal (left for RTL layout).

## Theme Properties

> theme_property separation : int ; data=constant ; default=4

The space between the `BoxContainer`'s elements, in pixels.

## Tutorials
- [Using Containers]($DOCS_URL/tutorials/ui/gui_containers.html)
