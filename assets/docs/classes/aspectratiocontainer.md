# AspectRatioContainer

> class AspectRatioContainer
> inherits AspectRatioContainer Container

## Brief

A container that preserves the proportions of its child controls.

## Description

A container type that arranges its child controls in a way that preserves their proportions automatically when the container is resized. Useful when a container has a dynamic size and the child nodes must adjust their sizes accordingly without losing their aspect ratios.

## Properties

> property alignment_horizontal : AlignmentMode ; default=1 ; setter=set_alignment_horizontal ; getter=get_alignment_horizontal

Specifies the horizontal relative position of child controls.

> property alignment_vertical : AlignmentMode ; default=1 ; setter=set_alignment_vertical ; getter=get_alignment_vertical

Specifies the vertical relative position of child controls.

> property ratio : float ; default=1.0 ; setter=set_ratio ; getter=get_ratio

The aspect ratio to enforce on child controls. This is the width divided by the height. The ratio depends on the `stretch_mode`.

> property stretch_mode : StretchMode ; default=2 ; setter=set_stretch_mode ; getter=get_stretch_mode

The stretch mode used to align child controls.

## Enumerations

> enum AlignmentMode

> enum_value AlignmentMode.ALIGNMENT_BEGIN = 0

Aligns child controls with the beginning (left or top) of the container.

> enum_value AlignmentMode.ALIGNMENT_CENTER = 1

Aligns child controls with the center of the container.

> enum_value AlignmentMode.ALIGNMENT_END = 2

Aligns child controls with the end (right or bottom) of the container.

> enum StretchMode

> enum_value StretchMode.STRETCH_WIDTH_CONTROLS_HEIGHT = 0

The height of child controls is automatically adjusted based on the width of the container.

> enum_value StretchMode.STRETCH_HEIGHT_CONTROLS_WIDTH = 1

The width of child controls is automatically adjusted based on the height of the container.

> enum_value StretchMode.STRETCH_FIT = 2

The bounding rectangle of child controls is automatically adjusted to fit inside the container while keeping the aspect ratio.

> enum_value StretchMode.STRETCH_COVER = 3

The width and height of child controls is automatically adjusted to make their bounding rectangle cover the entire area of the container while keeping the aspect ratio.
When the bounding rectangle of child controls exceed the container's size and `Control.clip_contents` is enabled, this allows to show only the container's area restricted by its own bounding rectangle.

## Tutorials
- [Using Containers]($DOCS_URL/tutorials/ui/gui_containers.html)
