# StyleBoxLine

> class StyleBoxLine
> inherits StyleBoxLine StyleBox

## Brief

A `StyleBox` that displays a single line of a given color and thickness.

## Description

A `StyleBox` that displays a single line of a given color and thickness. The line can be either horizontal or vertical. Useful for separators.

## Properties

> property color : Color ; default=Color(0, 0, 0, 1) ; setter=set_color ; getter=get_color

The line's color.

> property grow_begin : float ; default=1.0 ; setter=set_grow_begin ; getter=get_grow_begin

The number of pixels the line will extend before the `StyleBoxLine`'s bounds. If set to a negative value, the line will begin inside the `StyleBoxLine`'s bounds.

> property grow_end : float ; default=1.0 ; setter=set_grow_end ; getter=get_grow_end

The number of pixels the line will extend past the `StyleBoxLine`'s bounds. If set to a negative value, the line will end inside the `StyleBoxLine`'s bounds.

> property thickness : int ; default=1 ; setter=set_thickness ; getter=get_thickness

The line's thickness in pixels.

> property vertical : bool ; default=false ; setter=set_vertical ; getter=is_vertical

If `true`, the line will be vertical. If `false`, the line will be horizontal.
