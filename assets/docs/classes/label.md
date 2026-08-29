# Label

> class Label ; keywords=text
> inherits Label Control

## Brief

A control for displaying plain text.

## Description

A control for displaying plain text. It gives you control over the horizontal and vertical alignment and can wrap the text inside the node's bounding rectangle. It doesn't support bold, italics, or other rich text formatting. For that, use `RichTextLabel` instead.
**Note:** A single Label node is not designed to display huge amounts of text. To display large amounts of text in a single node, consider using `RichTextLabel` instead as it supports features like an integrated scroll bar and threading. `RichTextLabel` generally performs better when displaying large amounts of text (several pages or more).

## Properties

> property autowrap_mode : TextServer.AutowrapMode ; default=0 ; setter=set_autowrap_mode ; getter=get_autowrap_mode

If set to something other than `TextServer.AUTOWRAP_OFF`, the text gets wrapped inside the node's bounding rectangle. If you resize the node, it will change its height automatically to show all the text.
**Note:** Labels with autowrapping enabled must have a custom maximum width configured to work correctly, either through the Label's own `Control.custom_maximum_size` or as a result of a propagated maximum size from a parent Control with `Control.propagate_maximum_size` enabled.

> property autowrap_trim_flags : BitField[TextServer.LineBreakFlag] ; default=192 ; setter=set_autowrap_trim_flags ; getter=get_autowrap_trim_flags

Autowrap space trimming flags. See `TextServer.BREAK_TRIM_START_EDGE_SPACES` and `TextServer.BREAK_TRIM_END_EDGE_SPACES` for more info.

> property clip_text : bool ; default=false ; setter=set_clip_text ; getter=is_clipping_text

If `true`, the Label only shows the text that fits inside its bounding rectangle and will clip text horizontally.

> property ellipsis_char : String ; default="…" ; setter=set_ellipsis_char ; getter=get_ellipsis_char

Ellipsis character used for text clipping.

> property horizontal_alignment : HorizontalAlignment ; default=0 ; setter=set_horizontal_alignment ; getter=get_horizontal_alignment

Controls the text's horizontal alignment. Supports left, center, right, and fill (also known as justify).

> property justification_flags : BitField[TextServer.JustificationFlag] ; default=163 ; setter=set_justification_flags ; getter=get_justification_flags

Line fill alignment rules.

> property label_settings : LabelSettings ; setter=set_label_settings ; getter=get_label_settings

A `LabelSettings` resource that can be shared between multiple `Label` nodes. Takes priority over theme properties.

> property language : String ; default="" ; setter=set_language ; getter=get_language

Language code used for line-breaking and text shaping algorithms. If left empty, the current locale is used instead.

> property lines_skipped : int ; default=0 ; setter=set_lines_skipped ; getter=get_lines_skipped

The number of the lines ignored and not displayed from the start of the `text` value.

> property max_lines_visible : int ; default=-1 ; setter=set_max_lines_visible ; getter=get_max_lines_visible

Limits the lines of text the node shows on screen.

> property mouse_filter : Control.MouseFilter ; default=2 ; setter=set_mouse_filter ; getter=get_mouse_filter ; overrides=Control

> property paragraph_separator : String ; default="\\n" ; setter=set_paragraph_separator ; getter=get_paragraph_separator

String used as a paragraph separator. Each paragraph is processed independently, in its own BiDi context.

> property size_flags_vertical : BitField[Control.SizeFlags] ; default=4 ; setter=set_v_size_flags ; getter=get_v_size_flags ; overrides=Control

> property structured_text_bidi_override : TextServer.StructuredTextParser ; default=0 ; setter=set_structured_text_bidi_override ; getter=get_structured_text_bidi_override

Set BiDi algorithm override for the structured text.

> property structured_text_bidi_override_options : Array ; default=[] ; setter=set_structured_text_bidi_override_options ; getter=get_structured_text_bidi_override_options

Set additional options for BiDi override.

> property tab_stops : PackedFloat32Array ; default=PackedFloat32Array() ; setter=set_tab_stops ; getter=get_tab_stops

Aligns text to the given tab-stops.

> property text : String ; default="" ; setter=set_text ; getter=get_text

The text to display on screen.

> property text_direction : Control.TextDirection ; default=0 ; setter=set_text_direction ; getter=get_text_direction

Base text writing direction.

> property text_overrun_behavior : TextServer.OverrunBehavior ; default=0 ; setter=set_text_overrun_behavior ; getter=get_text_overrun_behavior

The clipping behavior when the text exceeds the node's bounding rectangle.

> property uppercase : bool ; default=false ; setter=set_uppercase ; getter=is_uppercase

If `true`, all the text displays as UPPERCASE.

> property vertical_alignment : VerticalAlignment ; default=0 ; setter=set_vertical_alignment ; getter=get_vertical_alignment

Controls the text's vertical alignment. Supports top, center, bottom, and fill.

> property visible_characters : int ; default=-1 ; setter=set_visible_characters ; getter=get_visible_characters

The number of characters to display. If set to `-1`, all characters are displayed. This can be useful when animating the text appearing in a dialog box.
**Note:** Setting this property updates `visible_ratio` accordingly.
**Note:** Characters are counted as Unicode codepoints. A single visible grapheme may contain multiple codepoints (e.g. certain emoji use three codepoints). A single codepoint may contain two UTF-16 characters, which are used in C# strings.

> property visible_characters_behavior : TextServer.VisibleCharactersBehavior ; default=0 ; setter=set_visible_characters_behavior ; getter=get_visible_characters_behavior

The clipping behavior when `visible_characters` or `visible_ratio` is set.

> property visible_ratio : float ; default=1.0 ; setter=set_visible_ratio ; getter=get_visible_ratio

The fraction of characters to display, relative to the total number of characters (see `get_total_character_count`). If set to `1.0`, all characters are displayed. If set to `0.5`, only half of the characters will be displayed. This can be useful when animating the text appearing in a dialog box.
**Note:** Setting this property updates `visible_characters` accordingly.

## Methods

> method get_character_bounds(pos: int) -> Rect2 ; qualifiers=const

Returns the bounding rectangle of the character at position `pos` in the label's local coordinate system. If the character is a non-visual character or `pos` is outside the valid range, an empty `Rect2` is returned. If the character is a part of a composite grapheme, the bounding rectangle of the whole grapheme is returned.

> method get_line_count() -> int ; qualifiers=const

Returns the number of lines of text the Label has.

> method get_line_height(line: int = -1) -> int ; qualifiers=const

Returns the height of the line `line`.
If `line` is set to `-1`, returns the biggest line height.
If there are no lines, returns font size in pixels.

> method get_total_character_count() -> int ; qualifiers=const

Returns the total number of printable characters in the text (excluding spaces and newlines).

> method get_visible_line_count() -> int ; qualifiers=const

Returns the number of lines shown. Useful if the `Label`'s height cannot currently display all lines.

## Theme Properties

> theme_property font_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Default text `Color` of the `Label`.

> theme_property font_outline_color : Color ; data=color ; default=Color(0, 0, 0, 1)

The color of text outline.

> theme_property font_shadow_color : Color ; data=color ; default=Color(0, 0, 0, 0)

`Color` of the text's shadow effect.

> theme_property line_spacing : int ; data=constant ; default=3

Additional vertical spacing between lines (in pixels), spacing is added to line descent. This value can be negative.

> theme_property outline_size : int ; data=constant ; default=0

Text outline size.
**Note:** If using a font with `FontFile.multichannel_signed_distance_field` enabled, its `FontFile.msdf_pixel_range` must be set to at least *twice* the value of `outline_size` for outline rendering to look correct. Otherwise, the outline may appear to be cut off earlier than intended.
**Note:** Using a value that is larger than half the font size is not recommended, as the font outline may fail to be fully closed in this case.

> theme_property paragraph_spacing : int ; data=constant ; default=0

Vertical space between paragraphs. Added on top of `line_spacing`.

> theme_property shadow_offset_x : int ; data=constant ; default=1

The horizontal offset of the text's shadow.

> theme_property shadow_offset_y : int ; data=constant ; default=1

The vertical offset of the text's shadow.

> theme_property shadow_outline_size : int ; data=constant ; default=1

The size of the shadow outline.

> theme_property font : Font ; data=font

`Font` used for the `Label`'s text.

> theme_property font_size : int ; data=font_size

Font size of the `Label`'s text.

> theme_property focus : StyleBox ; data=style

`StyleBox` used when the `Label` is focused (when used with assistive apps).

> theme_property normal : StyleBox ; data=style

Background `StyleBox` for the `Label`.

## Tutorials
- [2D Dodge The Creeps Demo](https://godotengine.org/asset-library/asset/2712)
