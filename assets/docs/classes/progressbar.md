# ProgressBar

> class ProgressBar
> inherits ProgressBar Range

## Brief

A control used for visual representation of a percentage.

## Description

A control used for visual representation of a percentage. Shows the fill percentage in the center. Can also be used to show indeterminate progress. For more fill modes, use `TextureProgressBar` instead.

## Properties

> property editor_preview_indeterminate : bool ; setter=set_editor_preview_indeterminate ; getter=is_editor_preview_indeterminate_enabled

If `false`, the `indeterminate` animation will be paused in the editor.

> property fill_mode : int ; default=0 ; setter=set_fill_mode ; getter=get_fill_mode

The fill direction. See `FillMode` for possible values.

> property indeterminate : bool ; default=false ; setter=set_indeterminate ; getter=is_indeterminate

When set to `true`, the progress bar indicates that something is happening with an animation, but does not show the fill percentage or value.

> property show_percentage : bool ; default=true ; setter=set_show_percentage ; getter=is_percentage_shown

If `true`, the fill percentage is displayed on the bar.

## Enumerations

> enum FillMode

> enum_value FillMode.FILL_BEGIN_TO_END = 0

The progress bar fills from begin to end horizontally, according to the language direction. If `Control.is_layout_rtl` returns `false`, it fills from left to right, and if it returns `true`, it fills from right to left.

> enum_value FillMode.FILL_END_TO_BEGIN = 1

The progress bar fills from end to begin horizontally, according to the language direction. If `Control.is_layout_rtl` returns `false`, it fills from right to left, and if it returns `true`, it fills from left to right.

> enum_value FillMode.FILL_TOP_TO_BOTTOM = 2

The progress fills from top to bottom.

> enum_value FillMode.FILL_BOTTOM_TO_TOP = 3

The progress fills from bottom to top.

## Theme Properties

> theme_property font_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

The color of the text.

> theme_property font_outline_color : Color ; data=color ; default=Color(0, 0, 0, 1)

The tint of text outline of the `ProgressBar`.

> theme_property outline_size : int ; data=constant ; default=0

The size of the text outline.
**Note:** If using a font with `FontFile.multichannel_signed_distance_field` enabled, its `FontFile.msdf_pixel_range` must be set to at least *twice* the value of `outline_size` for outline rendering to look correct. Otherwise, the outline may appear to be cut off earlier than intended.

> theme_property font : Font ; data=font

Font used to draw the fill percentage if `show_percentage` is `true`.

> theme_property font_size : int ; data=font_size

Font size used to draw the fill percentage if `show_percentage` is `true`.

> theme_property background : StyleBox ; data=style

The style of the background.

> theme_property fill : StyleBox ; data=style

The style of the progress (i.e. the part that fills the bar).
