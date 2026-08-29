# TextParagraph

> class TextParagraph
> inherits TextParagraph RefCounted

## Brief

Holds a paragraph of text.

## Description

Abstraction over `TextServer` for handling a single paragraph of text.

## Properties

> property alignment : HorizontalAlignment ; default=0 ; setter=set_alignment ; getter=get_alignment

Paragraph horizontal alignment.

> property break_flags : BitField[TextServer.LineBreakFlag] ; default=3 ; setter=set_break_flags ; getter=get_break_flags

Line breaking rules. For more info see `TextServer`.

> property custom_punctuation : String ; default="" ; setter=set_custom_punctuation ; getter=get_custom_punctuation

Custom punctuation character list, used for word breaking. If set to empty string, server defaults are used.

> property direction : TextServer.Direction ; default=0 ; setter=set_direction ; getter=get_direction

Text writing direction.

> property ellipsis_char : String ; default="…" ; setter=set_ellipsis_char ; getter=get_ellipsis_char

Ellipsis character used for text clipping.

> property justification_flags : BitField[TextServer.JustificationFlag] ; default=163 ; setter=set_justification_flags ; getter=get_justification_flags

Line fill alignment rules.

> property line_spacing : float ; default=0.0 ; setter=set_line_spacing ; getter=get_line_spacing

Additional vertical spacing between lines (in pixels), spacing is added to line descent. This value can be negative.

> property max_lines_visible : int ; default=-1 ; setter=set_max_lines_visible ; getter=get_max_lines_visible

Limits the lines of text shown.

> property orientation : TextServer.Orientation ; default=0 ; setter=set_orientation ; getter=get_orientation

Text orientation.

> property preserve_control : bool ; default=false ; setter=set_preserve_control ; getter=get_preserve_control

If set to `true` text will display control characters.

> property preserve_invalid : bool ; default=true ; setter=set_preserve_invalid ; getter=get_preserve_invalid

If set to `true` text will display invalid characters.

> property text_overrun_behavior : TextServer.OverrunBehavior ; default=0 ; setter=set_text_overrun_behavior ; getter=get_text_overrun_behavior

The clipping behavior when the text exceeds the paragraph's set width.

> property width : float ; default=-1.0 ; setter=set_width ; getter=get_width

Paragraph width.

## Methods

> method add_object(key: Variant, size: Vector2, inline_align: InlineAlignment = 5, length: int = 1, baseline: float = 0.0) -> bool

Adds inline object to the text buffer, `key` must be unique. In the text, object is represented as `length` object replacement characters.

> method add_string(text: String, font: Font, font_size: int, language: String = "", meta: Variant = null) -> bool

Adds text span and font to draw it.

> method clear() -> void

Clears text paragraph (removes text and inline objects).

> method clear_dropcap() -> void

Removes dropcap.

> method draw(canvas: RID, pos: Vector2, color: Color = Color(1, 1, 1, 1), dc_color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draw all lines of the text and drop cap into a canvas item at a given position, with `color`. `pos` specifies the top left corner of the bounding box. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method draw_dropcap(canvas: RID, pos: Vector2, color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draw drop cap into a canvas item at a given position, with `color`. `pos` specifies the top left corner of the bounding box. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method draw_dropcap_outline(canvas: RID, pos: Vector2, outline_size: int = 1, color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draw drop cap outline into a canvas item at a given position, with `color`. `pos` specifies the top left corner of the bounding box. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method draw_line(canvas: RID, pos: Vector2, line: int, color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draw single line of text into a canvas item at a given position, with `color`. `pos` specifies the top left corner of the bounding box. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method draw_line_outline(canvas: RID, pos: Vector2, line: int, outline_size: int = 1, color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draw outline of the single line of text into a canvas item at a given position, with `color`. `pos` specifies the top left corner of the bounding box. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method draw_outline(canvas: RID, pos: Vector2, outline_size: int = 1, color: Color = Color(1, 1, 1, 1), dc_color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draw outlines of all lines of the text and drop cap into a canvas item at a given position, with `color`. `pos` specifies the top left corner of the bounding box. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method duplicate() -> TextParagraph ; qualifiers=const

Duplicates this `TextParagraph`.

> method get_dropcap_lines() -> int ; qualifiers=const

Returns number of lines used by dropcap.

> method get_dropcap_rid() -> RID ; qualifiers=const

Returns drop cap text buffer RID.

> method get_dropcap_size() -> Vector2 ; qualifiers=const

Returns drop cap bounding box size.

> method get_inferred_direction() -> TextServer.Direction ; qualifiers=const

Returns the text writing direction inferred by the BiDi algorithm.

> method get_line_ascent(line: int) -> float ; qualifiers=const

Returns the text line ascent (number of pixels above the baseline for horizontal layout or to the left of baseline for vertical).

> method get_line_count() -> int ; qualifiers=const

Returns number of lines in the paragraph.

> method get_line_descent(line: int) -> float ; qualifiers=const

Returns the text line descent (number of pixels below the baseline for horizontal layout or to the right of baseline for vertical).

> method get_line_object_rect(line: int, key: Variant) -> Rect2 ; qualifiers=const

Returns bounding rectangle of the inline object.

> method get_line_objects(line: int) -> Array ; qualifiers=const

Returns array of inline objects in the line.

> method get_line_range(line: int) -> Vector2i ; qualifiers=const

Returns character range of the line.

> method get_line_rid(line: int) -> RID ; qualifiers=const

Returns TextServer line buffer RID.

> method get_line_size(line: int) -> Vector2 ; qualifiers=const

Returns size of the bounding box of the line of text. Returned size is rounded up.

> method get_line_underline_position(line: int) -> float ; qualifiers=const

Returns pixel offset of the underline below the baseline.

> method get_line_underline_thickness(line: int) -> float ; qualifiers=const

Returns thickness of the underline.

> method get_line_width(line: int) -> float ; qualifiers=const

Returns width (for horizontal layout) or height (for vertical) of the line of text.

> method get_non_wrapped_size() -> Vector2 ; qualifiers=const

Returns the size of the bounding box of the paragraph, without line breaks.

> method get_range() -> Vector2i ; qualifiers=const

Returns the character range of the paragraph.

> method get_rid() -> RID ; qualifiers=const

Returns TextServer full string buffer RID.

> method get_size() -> Vector2 ; qualifiers=const

Returns the size of the bounding box of the paragraph.

> method has_object(key: Variant) -> bool ; qualifiers=const

Returns `true` if an object with `key` is embedded in this shaped text buffer.

> method hit_test(coords: Vector2) -> int ; qualifiers=const

Returns caret character offset at the specified coordinates. This function always returns a valid position.

> method resize_object(key: Variant, size: Vector2, inline_align: InlineAlignment = 5, baseline: float = 0.0) -> bool

Sets new size and alignment of embedded object.

> method set_bidi_override(override: Array) -> void

Overrides BiDi for the structured text.
Override ranges should cover full source text without overlaps. BiDi algorithm will be used on each range separately.

> method set_dropcap(text: String, font: Font, font_size: int, dropcap_margins: Rect2 = Rect2(0, 0, 0, 0), language: String = "") -> bool

Sets drop cap, overrides previously set drop cap. Drop cap (dropped capital) is a decorative element at the beginning of a paragraph that is larger than the rest of the text.

> method tab_align(tab_stops: PackedFloat32Array) -> void

Aligns paragraph to the given tab-stops.
