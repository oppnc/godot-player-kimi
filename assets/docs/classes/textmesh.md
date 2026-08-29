# TextMesh

> class TextMesh
> inherits TextMesh PrimitiveMesh

## Brief

Generate a `PrimitiveMesh` from the text.

## Description

Generate a `PrimitiveMesh` from the text.
TextMesh can be generated only when using dynamic fonts with vector glyph contours. Bitmap fonts (including bitmap data in the TrueType/OpenType containers, like color emoji fonts) are not supported.
The UV layout is arranged in 4 horizontal strips, top to bottom: 40% of the height for the front face, 40% for the back face, 10% for the outer edges and 10% for the inner edges.

## Properties

> property autowrap_mode : TextServer.AutowrapMode ; default=0 ; setter=set_autowrap_mode ; getter=get_autowrap_mode

If set to something other than `TextServer.AUTOWRAP_OFF`, the text gets wrapped inside the node's bounding rectangle. If you resize the node, it will change its height automatically to show all the text.

> property curve_step : float ; default=0.5 ; setter=set_curve_step ; getter=get_curve_step

Step (in pixels) used to approximate Bézier curves. Lower values result in smoother curves, but is slower to generate and render. Consider adjusting this according to the font size and the typical viewing distance.
**Note:** Changing this property will regenerate the mesh, which is a slow operation, especially with large font sizes and long texts.

> property depth : float ; default=0.05 ; setter=set_depth ; getter=get_depth

Depths of the mesh, if set to `0.0` only front surface, is generated, and UV layout is changed to use full texture for the front face only.

> property font : Font ; setter=set_font ; getter=get_font

Font configuration used to display text.

> property font_size : int ; default=16 ; setter=set_font_size ; getter=get_font_size

Font size of the `TextMesh`'s text. This property works in tandem with `pixel_size`. Higher values will result in a more detailed font, regardless of `curve_step` and `pixel_size`. Consider keeping this value below 63 (inclusive) for good performance, and adjust `pixel_size` as needed to enlarge text.
**Note:** Changing this property will regenerate the mesh, which is a slow operation, especially with large font sizes and long texts. To change the text's size in real-time efficiently, change the node's `Node3D.scale` instead.

> property horizontal_alignment : HorizontalAlignment ; default=1 ; setter=set_horizontal_alignment ; getter=get_horizontal_alignment

Controls the text's horizontal alignment. Supports left, center, right, and fill (also known as justify).

> property justification_flags : BitField[TextServer.JustificationFlag] ; default=163 ; setter=set_justification_flags ; getter=get_justification_flags

Line fill alignment rules.

> property language : String ; default="" ; setter=set_language ; getter=get_language

Language code used for line-breaking and text shaping algorithms. If left empty, the current locale is used instead.

> property line_spacing : float ; default=0.0 ; setter=set_line_spacing ; getter=get_line_spacing

Additional vertical spacing between lines (in pixels), spacing is added to line descent. This value can be negative.

> property offset : Vector2 ; default=Vector2(0, 0) ; setter=set_offset ; getter=get_offset

The text drawing offset (in pixels).
**Note:** Changing this property will regenerate the mesh, which is a slow operation. To change the text's position in real-time efficiently, change the node's `Node3D.position` instead.

> property pixel_size : float ; default=0.01 ; setter=set_pixel_size ; getter=get_pixel_size

The size of one pixel's width on the text to scale it in 3D. This property works in tandem with `font_size`.
**Note:** Changing this property will regenerate the mesh, which is a slow operation, especially with large font sizes and long texts. To change the text's size in real-time efficiently, change the node's `Node3D.scale` instead.

> property structured_text_bidi_override : TextServer.StructuredTextParser ; default=0 ; setter=set_structured_text_bidi_override ; getter=get_structured_text_bidi_override

Set BiDi algorithm override for the structured text.

> property structured_text_bidi_override_options : Array ; default=[] ; setter=set_structured_text_bidi_override_options ; getter=get_structured_text_bidi_override_options

Set additional options for BiDi override.

> property text : String ; default="" ; setter=set_text ; getter=get_text

The text to generate mesh from.
**Note:** Due to being a `Resource`, it doesn't follow the rules of `Node.auto_translate_mode`. If disabling translation is desired, it should be done manually with `Object.set_message_translation`.

> property text_direction : TextServer.Direction ; default=0 ; setter=set_text_direction ; getter=get_text_direction

Base text writing direction.

> property uppercase : bool ; default=false ; setter=set_uppercase ; getter=is_uppercase

If `true`, all the text displays as UPPERCASE.

> property vertical_alignment : VerticalAlignment ; default=1 ; setter=set_vertical_alignment ; getter=get_vertical_alignment

Controls the text's vertical alignment. Supports top, center, and bottom.

> property width : float ; default=500.0 ; setter=set_width ; getter=get_width

Text width (in pixels), used for fill alignment.

## Tutorials
- [3D text]($DOCS_URL/tutorials/3d/3d_text.html)
