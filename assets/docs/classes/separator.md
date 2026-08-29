# Separator

> class Separator
> inherits Separator Control

## Brief

Abstract base class for separators.

## Description

Abstract base class for separators, used for separating other controls. `Separator`s are purely visual and normally drawn as a `StyleBoxLine`.

## Theme Properties

> theme_property separation : int ; data=constant ; default=0

The size of the area covered by the separator. Effectively works like a minimum width/height.

> theme_property separator : StyleBox ; data=style

The style for the separator line. Works best with `StyleBoxLine` (remember to enable `StyleBoxLine.vertical` for `VSeparator`).
