# TextLine

> class TextLine
> inherits TextLine RefCounted

## Brief

Holds a line of text.

## Description

Abstraction over `TextServer` for handling a single line of text.

## Properties

> property alignment : HorizontalAlignment ; default=0 ; setter=set_horizontal_alignment ; getter=get_horizontal_alignment

Sets text alignment within the line as if the line was horizontal.

> property direction : TextServer.Direction ; default=0 ; setter=set_direction ; getter=get_direction

Text writing direction.

> property ellipsis_char : String ; default="…" ; setter=set_ellipsis_char ; getter=get_ellipsis_char

Ellipsis character used for text clipping.

> property flags : BitField[TextServer.JustificationFlag] ; default=3 ; setter=set_flags ; getter=get_flags

Line alignment rules. For more info see `TextServer`.

> property orientation : TextServer.Orientation ; default=0 ; setter=set_orientation ; getter=get_orientation

Text orientation.

> property preserve_control : bool ; default=false ; setter=set_preserve_control ; getter=get_preserve_control

If set to `true` text will display control characters.

> property preserve_invalid : bool ; default=true ; setter=set_preserve_invalid ; getter=get_preserve_invalid

If set to `true` text will display invalid characters.

> property text_overrun_behavior : TextServer.OverrunBehavior ; default=3 ; setter=set_text_overrun_behavior ; getter=get_text_overrun_behavior

The clipping behavior when the text exceeds the text line's set width.

> property width : float ; default=-1.0 ; setter=set_width ; getter=get_width

Text line width.

## Methods

> method add_object(key: Variant, size: Vector2, inline_align: InlineAlignment = 5, length: int = 1, baseline: float = 0.0) -> bool

Adds inline object to the text buffer, `key` must be unique. In the text, object is represented as `length` object replacement characters.

> method add_string(text: String, font: Font, font_size: int, language: String = "", meta: Variant = null) -> bool

Adds text span and font to draw it.

> method clear() -> void

Clears text line (removes text and inline objects).

> method draw(canvas: RID, pos: Vector2, color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draw text into a canvas item at a given position, with `color`. `pos` specifies the top left corner of the bounding box. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method draw_outline(canvas: RID, pos: Vector2, outline_size: int = 1, color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draw text into a canvas item at a given position, with `color`. `pos` specifies the top left corner of the bounding box. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method duplicate() -> TextLine ; qualifiers=const

Duplicates this `TextLine`.

> method get_inferred_direction() -> TextServer.Direction ; qualifiers=const

Returns the text writing direction inferred by the BiDi algorithm.

> method get_line_ascent() -> float ; qualifiers=const

Returns the text ascent (number of pixels above the baseline for horizontal layout or to the left of baseline for vertical).

> method get_line_descent() -> float ; qualifiers=const

Returns the text descent (number of pixels below the baseline for horizontal layout or to the right of baseline for vertical).

> method get_line_underline_position() -> float ; qualifiers=const

Returns pixel offset of the underline below the baseline.

> method get_line_underline_thickness() -> float ; qualifiers=const

Returns thickness of the underline.

> method get_line_width() -> float ; qualifiers=const

Returns width (for horizontal layout) or height (for vertical) of the text.

> method get_object_rect(key: Variant) -> Rect2 ; qualifiers=const

Returns bounding rectangle of the inline object.

> method get_objects() -> Array ; qualifiers=const

Returns array of inline objects.

> method get_rid() -> RID ; qualifiers=const

Returns TextServer buffer RID.

> method get_size() -> Vector2 ; qualifiers=const

Returns size of the bounding box of the text.

> method has_object(key: Variant) -> bool ; qualifiers=const

Returns `true` if an object with `key` is embedded in this line.

> method hit_test(coords: float) -> int ; qualifiers=const

Returns caret character offset at the specified pixel offset at the baseline. This function always returns a valid position.

> method resize_object(key: Variant, size: Vector2, inline_align: InlineAlignment = 5, baseline: float = 0.0) -> bool

Sets new size and alignment of embedded object.

> method set_bidi_override(override: Array) -> void

Overrides BiDi for the structured text.
Override ranges should cover full source text without overlaps. BiDi algorithm will be used on each range separately.

> method tab_align(tab_stops: PackedFloat32Array) -> void

Aligns text to the given tab-stops.
