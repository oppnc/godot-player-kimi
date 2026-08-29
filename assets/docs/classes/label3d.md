# Label3D

> class Label3D ; keywords=text
> inherits Label3D GeometryInstance3D

## Brief

A node for displaying plain text in 3D space.

## Description

A node for displaying plain text in 3D space. By adjusting various properties of this node, you can configure things such as the text's appearance and whether it always faces the camera.

## Properties

> property alpha_antialiasing_edge : float ; default=0.0 ; setter=set_alpha_antialiasing_edge ; getter=get_alpha_antialiasing_edge

Threshold at which antialiasing will be applied on the alpha channel.

> property alpha_antialiasing_mode : BaseMaterial3D.AlphaAntiAliasing ; default=0 ; setter=set_alpha_antialiasing ; getter=get_alpha_antialiasing

The type of alpha antialiasing to apply.

> property alpha_cut : AlphaCutMode ; default=0 ; setter=set_alpha_cut_mode ; getter=get_alpha_cut_mode

The alpha cutting mode to use for the sprite.

> property alpha_hash_scale : float ; default=1.0 ; setter=set_alpha_hash_scale ; getter=get_alpha_hash_scale

The hashing scale for Alpha Hash. Recommended values between `0` and `2`.

> property alpha_scissor_threshold : float ; default=0.5 ; setter=set_alpha_scissor_threshold ; getter=get_alpha_scissor_threshold

Threshold at which the alpha scissor will discard values.

> property autowrap_mode : TextServer.AutowrapMode ; default=0 ; setter=set_autowrap_mode ; getter=get_autowrap_mode

If set to something other than `TextServer.AUTOWRAP_OFF`, the text gets wrapped inside the node's bounding rectangle. If you resize the node, it will change its height automatically to show all the text.

> property autowrap_trim_flags : BitField[TextServer.LineBreakFlag] ; default=192 ; setter=set_autowrap_trim_flags ; getter=get_autowrap_trim_flags

Autowrap space trimming flags. See `TextServer.BREAK_TRIM_START_EDGE_SPACES` and `TextServer.BREAK_TRIM_END_EDGE_SPACES` for more info.

> property billboard : BaseMaterial3D.BillboardMode ; default=0 ; setter=set_billboard_mode ; getter=get_billboard_mode

The billboard mode to use for the label.

> property cast_shadow : GeometryInstance3D.ShadowCastingSetting ; default=0 ; setter=set_cast_shadows_setting ; getter=get_cast_shadows_setting ; overrides=GeometryInstance3D

> property double_sided : bool ; default=true ; setter=set_draw_flag ; getter=get_draw_flag

If `true`, text can be seen from the back as well, if `false`, it is invisible when looking at it from behind.

> property fixed_size : bool ; default=false ; setter=set_draw_flag ; getter=get_draw_flag

If `true`, the label is rendered at the same size regardless of distance. The label's size on screen is the same as if the camera was `1.0` units away from the label's origin, regardless of the actual distance from the camera. The `Camera3D`'s field of view (or `Camera3D.size` when in orthogonal/frustum mode) still affects the size the label is drawn at.

> property font : Font ; setter=set_font ; getter=get_font

Font configuration used to display text.

> property font_size : int ; default=32 ; setter=set_font_size ; getter=get_font_size

Font size of the `Label3D`'s text. To make the font look more detailed when up close, increase `font_size` while decreasing `pixel_size` at the same time.
Higher font sizes require more time to render new characters, which can cause stuttering during gameplay.

> property gi_mode : GeometryInstance3D.GIMode ; default=0 ; setter=set_gi_mode ; getter=get_gi_mode ; overrides=GeometryInstance3D

> property horizontal_alignment : HorizontalAlignment ; default=1 ; setter=set_horizontal_alignment ; getter=get_horizontal_alignment

Controls the text's horizontal alignment. Supports left, center, right, and fill (also known as justify).

> property justification_flags : BitField[TextServer.JustificationFlag] ; default=163 ; setter=set_justification_flags ; getter=get_justification_flags

Line fill alignment rules.

> property language : String ; default="" ; setter=set_language ; getter=get_language

Language code used for line-breaking and text shaping algorithms. If left empty, the current locale is used instead.

> property line_spacing : float ; default=0.0 ; setter=set_line_spacing ; getter=get_line_spacing

Additional vertical spacing between lines (in pixels), spacing is added to line descent. This value can be negative.

> property modulate : Color ; default=Color(1, 1, 1, 1) ; setter=set_modulate ; getter=get_modulate

Text `Color` of the `Label3D`.

> property no_depth_test : bool ; default=false ; setter=set_draw_flag ; getter=get_draw_flag

If `true`, depth testing is disabled and the object will be drawn in render order.

> property offset : Vector2 ; default=Vector2(0, 0) ; setter=set_offset ; getter=get_offset

The text drawing offset (in pixels).

> property outline_modulate : Color ; default=Color(0, 0, 0, 1) ; setter=set_outline_modulate ; getter=get_outline_modulate

The tint of text outline.

> property outline_render_priority : int ; default=-1 ; setter=set_outline_render_priority ; getter=get_outline_render_priority

Sets the render priority for the text outline. Higher priority objects will be sorted in front of lower priority objects.
**Note:** This only applies if `alpha_cut` is set to `ALPHA_CUT_DISABLED` (default value).
**Note:** This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).

> property outline_size : int ; default=12 ; setter=set_outline_size ; getter=get_outline_size

Text outline size.

> property pixel_size : float ; default=0.005 ; setter=set_pixel_size ; getter=get_pixel_size

The size of one pixel's width on the label to scale it in 3D. To make the font look more detailed when up close, increase `font_size` while decreasing `pixel_size` at the same time.

> property render_priority : int ; default=0 ; setter=set_render_priority ; getter=get_render_priority

Sets the render priority for the text. Higher priority objects will be sorted in front of lower priority objects.
**Note:** This only applies if `alpha_cut` is set to `ALPHA_CUT_DISABLED` (default value).
**Note:** This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).

> property shaded : bool ; default=false ; setter=set_draw_flag ; getter=get_draw_flag

If `true`, the `Light3D` in the `Environment` has effects on the label.

> property structured_text_bidi_override : TextServer.StructuredTextParser ; default=0 ; setter=set_structured_text_bidi_override ; getter=get_structured_text_bidi_override

Set BiDi algorithm override for the structured text.

> property structured_text_bidi_override_options : Array ; default=[] ; setter=set_structured_text_bidi_override_options ; getter=get_structured_text_bidi_override_options

Set additional options for BiDi override.

> property text : String ; default="" ; setter=set_text ; getter=get_text

The text to display on screen.

> property text_direction : TextServer.Direction ; default=0 ; setter=set_text_direction ; getter=get_text_direction

Base text writing direction.

> property texture_filter : BaseMaterial3D.TextureFilter ; default=3 ; setter=set_texture_filter ; getter=get_texture_filter

Filter flags for the texture.

> property uppercase : bool ; default=false ; setter=set_uppercase ; getter=is_uppercase

If `true`, all the text displays as UPPERCASE.

> property vertical_alignment : VerticalAlignment ; default=1 ; setter=set_vertical_alignment ; getter=get_vertical_alignment

Controls the text's vertical alignment. Supports top, center, and bottom.

> property width : float ; default=500.0 ; setter=set_width ; getter=get_width

Text width (in pixels), used for autowrap and fill alignment.

## Methods

> method generate_triangle_mesh() -> TriangleMesh ; qualifiers=const

Returns a `TriangleMesh` with the label's vertices following its current configuration (such as its `pixel_size`).

> method get_draw_flag(flag: DrawFlags) -> bool ; qualifiers=const

Returns the value of the specified flag.

> method set_draw_flag(flag: DrawFlags, enabled: bool) -> void

If `true`, the specified `flag` will be enabled.

## Enumerations

> enum AlphaCutMode

> enum_value AlphaCutMode.ALPHA_CUT_DISABLED = 0

This mode performs standard alpha blending. It can display translucent areas, but transparency sorting issues may be visible when multiple transparent materials are overlapping. `GeometryInstance3D.cast_shadow` has no effect when this transparency mode is used; the `Label3D` will never cast shadows.

> enum_value AlphaCutMode.ALPHA_CUT_DISCARD = 1

This mode only allows fully transparent or fully opaque pixels. Harsh edges will be visible unless some form of screen-space antialiasing is enabled (see `ProjectSettings.rendering/anti_aliasing/quality/screen_space_aa`). This mode is also known as *alpha testing* or *1-bit transparency*.
**Note:** This mode might have issues with anti-aliased fonts and outlines, try adjusting `alpha_scissor_threshold` or using MSDF font.
**Note:** When using text with overlapping glyphs (e.g., cursive scripts), this mode might have transparency sorting issues between the main text and the outline.

> enum_value AlphaCutMode.ALPHA_CUT_OPAQUE_PREPASS = 2

This mode draws fully opaque pixels in the depth prepass. This is slower than `ALPHA_CUT_DISABLED` or `ALPHA_CUT_DISCARD`, but it allows displaying translucent areas and smooth edges while using proper sorting.
**Note:** When using text with overlapping glyphs (e.g., cursive scripts), this mode might have transparency sorting issues between the main text and the outline.

> enum_value AlphaCutMode.ALPHA_CUT_HASH = 3

This mode draws cuts off all values below a spatially-deterministic threshold, the rest will remain opaque.

> enum DrawFlags

> enum_value DrawFlags.FLAG_SHADED = 0

If set, lights in the environment affect the label.

> enum_value DrawFlags.FLAG_DOUBLE_SIDED = 1

If set, text can be seen from the back as well. If not, the text is invisible when looking at it from behind.

> enum_value DrawFlags.FLAG_DISABLE_DEPTH_TEST = 2

Disables the depth test, so this object is drawn on top of all others. However, objects drawn after it in the draw order may cover it.

> enum_value DrawFlags.FLAG_FIXED_SIZE = 3

Label is scaled by depth so that it always appears the same size on screen.

> enum_value DrawFlags.FLAG_MAX = 4

Represents the size of the `DrawFlags` enum.

## Tutorials
- [3D text]($DOCS_URL/tutorials/3d/3d_text.html)
