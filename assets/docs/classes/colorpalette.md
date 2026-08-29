# ColorPalette

> class ColorPalette
> inherits ColorPalette Resource

## Brief

A resource class for managing a palette of colors, which can be loaded and saved using `ColorPicker`.

## Description

The `ColorPalette` resource is designed to store and manage a collection of colors. This resource is useful in scenarios where a predefined set of colors is required, such as for creating themes, designing user interfaces, or managing game assets. The built-in `ColorPicker` control can also make use of `ColorPalette` without additional code.

## Properties

> property colors : PackedColorArray ; default=PackedColorArray() ; setter=set_colors ; getter=get_colors

A `PackedColorArray` containing the colors in the palette.
