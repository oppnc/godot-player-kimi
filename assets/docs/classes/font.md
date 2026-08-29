# Font

> class Font
> inherits Font Resource

## Brief

Abstract base class for fonts and font variations.

## Description

Abstract base class for different font types. It has methods for drawing text and font character introspection.

## Properties

> property fallbacks : Array[Font] ; default=[] ; setter=set_fallbacks ; getter=get_fallbacks

Array of fallback `Font`s to use as a substitute if a glyph is not found in this current `Font`.
If this array is empty in a `FontVariation`, the `FontVariation.base_font`'s fallbacks are used instead.

## Methods

> method draw_char(canvas_item: RID, pos: Vector2, char: int, font_size: int, modulate: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> float ; qualifiers=const

Draw a single Unicode character `char` into a canvas item using the font, at a given position, with `modulate` color. `pos` specifies the baseline, not the top. To draw from the top, *ascent* must be added to the Y axis. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.
**Note:** Do not use this function to draw strings character by character, use `draw_string` or `TextLine` instead.

> method draw_char_outline(canvas_item: RID, pos: Vector2, char: int, font_size: int, size: int = -1, modulate: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> float ; qualifiers=const

Draw a single Unicode character `char` outline into a canvas item using the font, at a given position, with `modulate` color and `size` outline size. `pos` specifies the baseline, not the top. To draw from the top, *ascent* must be added to the Y axis. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.
**Note:** Do not use this function to draw strings character by character, use `draw_string` or `TextLine` instead.

> method draw_multiline_string(canvas_item: RID, pos: Vector2, text: String, alignment: HorizontalAlignment = 0, width: float = -1, font_size: int = 16, max_lines: int = -1, modulate: Color = Color(1, 1, 1, 1), brk_flags: BitField[TextServer.LineBreakFlag] = 3, justification_flags: BitField[TextServer.JustificationFlag] = 3, direction: TextServer.Direction = 0, orientation: TextServer.Orientation = 0, oversampling: float = 0.0) -> void ; qualifiers=const

Breaks `text` into lines using rules specified by `brk_flags` and draws it into a canvas item using the font, at a given position, with `modulate` color, optionally clipping the width and aligning horizontally. `pos` specifies the baseline of the first line, not the top. To draw from the top, *ascent* must be added to the Y axis. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.
See also `CanvasItem.draw_multiline_string`.

> method draw_multiline_string_outline(canvas_item: RID, pos: Vector2, text: String, alignment: HorizontalAlignment = 0, width: float = -1, font_size: int = 16, max_lines: int = -1, size: int = 1, modulate: Color = Color(1, 1, 1, 1), brk_flags: BitField[TextServer.LineBreakFlag] = 3, justification_flags: BitField[TextServer.JustificationFlag] = 3, direction: TextServer.Direction = 0, orientation: TextServer.Orientation = 0, oversampling: float = 0.0) -> void ; qualifiers=const

Breaks `text` to the lines using rules specified by `brk_flags` and draws text outline into a canvas item using the font, at a given position, with `modulate` color and `size` outline size, optionally clipping the width and aligning horizontally. `pos` specifies the baseline of the first line, not the top. To draw from the top, *ascent* must be added to the Y axis. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.
See also `CanvasItem.draw_multiline_string_outline`.

> method draw_string(canvas_item: RID, pos: Vector2, text: String, alignment: HorizontalAlignment = 0, width: float = -1, font_size: int = 16, modulate: Color = Color(1, 1, 1, 1), justification_flags: BitField[TextServer.JustificationFlag] = 3, direction: TextServer.Direction = 0, orientation: TextServer.Orientation = 0, oversampling: float = 0.0) -> void ; qualifiers=const

Draw `text` into a canvas item using the font, at a given position, with `modulate` color, optionally clipping the width and aligning horizontally. `pos` specifies the baseline, not the top. To draw from the top, *ascent* must be added to the Y axis. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.
See also `CanvasItem.draw_string`.

> method draw_string_outline(canvas_item: RID, pos: Vector2, text: String, alignment: HorizontalAlignment = 0, width: float = -1, font_size: int = 16, size: int = 1, modulate: Color = Color(1, 1, 1, 1), justification_flags: BitField[TextServer.JustificationFlag] = 3, direction: TextServer.Direction = 0, orientation: TextServer.Orientation = 0, oversampling: float = 0.0) -> void ; qualifiers=const

Draw `text` outline into a canvas item using the font, at a given position, with `modulate` color and `size` outline size, optionally clipping the width and aligning horizontally. `pos` specifies the baseline, not the top. To draw from the top, *ascent* must be added to the Y axis. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.
See also `CanvasItem.draw_string_outline`.

> method find_variation(variation_coordinates: Dictionary, face_index: int = 0, strength: float = 0.0, transform: Transform2D = Transform2D(1, 0, 0, 1, 0, 0), spacing_top: int = 0, spacing_bottom: int = 0, spacing_space: int = 0, spacing_glyph: int = 0, baseline_offset: float = 0.0, palette_index: int = 0, custom_colors: PackedColorArray = PackedColorArray()) -> RID ; qualifiers=const

Returns `TextServer` RID of the font cache for specific variation.

> method get_ascent(font_size: int = 16) -> float ; qualifiers=const

Returns the maximum font ascent (number of pixels above the baseline) of this font and all fallback fonts.
**Note:** Real ascent of the string is context-dependent and can be significantly different from the value returned by this function. Use it only as rough estimate (e.g. as the ascent of empty line).

> method get_char_size(char: int, font_size: int) -> Vector2 ; qualifiers=const

Returns the size of a character. Does not take kerning into account.
**Note:** Do not use this function to calculate width of the string character by character, use `get_string_size` or `TextLine` instead. The height returned is the font height (see also `get_height`) and has no relation to the glyph height.

> method get_descent(font_size: int = 16) -> float ; qualifiers=const

Returns the maximum font descent (number of pixels below the baseline) of this font and all fallback fonts.
**Note:** Real descent of the string is context-dependent and can be significantly different from the value returned by this function. Use it only as rough estimate (e.g. as the descent of empty line).

> method get_face_count() -> int ; qualifiers=const

Returns number of faces in the TrueType / OpenType collection.

> method get_font_name() -> String ; qualifiers=const

Returns font family name.

> method get_font_stretch() -> int ; qualifiers=const

Returns font stretch amount, compared to a normal width. A percentage value between `50%` and `200%`.

> method get_font_style() -> BitField[TextServer.FontStyle] ; qualifiers=const

Returns font style flags.

> method get_font_style_name() -> String ; qualifiers=const

Returns font style name.

> method get_font_weight() -> int ; qualifiers=const

Returns weight (boldness) of the font. A value in the `100...999` range, normal font weight is `400`, bold font weight is `700`.

> method get_height(font_size: int = 16) -> float ; qualifiers=const

Returns the total average font height (ascent plus descent) in pixels.
**Note:** Real height of the string is context-dependent and can be significantly different from the value returned by this function. Use it only as rough estimate (e.g. as the height of empty line).

> method get_multiline_string_size(text: String, alignment: HorizontalAlignment = 0, width: float = -1, font_size: int = 16, max_lines: int = -1, brk_flags: BitField[TextServer.LineBreakFlag] = 3, justification_flags: BitField[TextServer.JustificationFlag] = 3, direction: TextServer.Direction = 0, orientation: TextServer.Orientation = 0) -> Vector2 ; qualifiers=const

Returns the size of a bounding box of a string broken into the lines, taking kerning and advance into account.
See also `draw_multiline_string`.

> method get_opentype_features() -> Dictionary ; qualifiers=const

Returns a set of OpenType feature tags. More info: [OpenType feature tags](https://docs.microsoft.com/en-us/typography/opentype/spec/featuretags).

> method get_ot_name_strings() -> Dictionary ; qualifiers=const

Returns `Dictionary` with OpenType font name strings (localized font names, version, description, license information, sample text, etc.).

> method get_palette_colors(index: int) -> PackedColorArray ; qualifiers=const

Returns the array in the predefined color palette at `index`. Palette contains all colors used to render font glyphs. Each palette has the same number of colors. Colors can be overridden using `FontVariation`.

> method get_palette_count() -> int ; qualifiers=const

Returns the number of predefined color palettes. Palette contains all colors used to render font glyphs. Each palette has the same number of colors.

> method get_palette_name(index: int) -> String ; qualifiers=const

Returns the name of the predefined color palette at `index`. Palette contains all colors used to render font glyphs. Each palette has the same number of colors.

> method get_rids() -> Array[RID] ; qualifiers=const

Returns `Array` of valid `Font` `RID`s, which can be passed to the `TextServer` methods.

> method get_spacing(spacing: TextServer.SpacingType) -> int ; qualifiers=const

Returns the amount of spacing for the given `spacing` type.

> method get_string_size(text: String, alignment: HorizontalAlignment = 0, width: float = -1, font_size: int = 16, justification_flags: BitField[TextServer.JustificationFlag] = 3, direction: TextServer.Direction = 0, orientation: TextServer.Orientation = 0) -> Vector2 ; qualifiers=const

Returns the size of a bounding box of a single-line string, taking kerning, advance and subpixel positioning into account. See also `get_multiline_string_size` and `draw_string`.
For example, to get the string size as displayed by a single-line Label, use:

```gdscript
                var string_size = $Label.get_theme_font("font").get_string_size($Label.text, HORIZONTAL_ALIGNMENT_LEFT, -1, $Label.get_theme_font_size("font_size"))

```

```csharp
                Label label = GetNode<Label>("Label");
                Vector2 stringSize = label.GetThemeFont("font").GetStringSize(label.Text, HorizontalAlignment.Left, -1, label.GetThemeFontSize("font_size"));

```

**Note:** Since kerning, advance and subpixel positioning are taken into account by `get_string_size`, using separate `get_string_size` calls on substrings of a string then adding the results together will return a different result compared to using a single `get_string_size` call on the full string.
**Note:** Real height of the string is context-dependent and can be significantly different from the value returned by `get_height`.

> method get_supported_chars() -> String ; qualifiers=const

Returns a string containing all the characters available in the font.
If a given character is included in more than one font data source, it appears only once in the returned string.

> method get_supported_feature_list() -> Dictionary ; qualifiers=const

Returns list of OpenType features supported by font.

> method get_supported_variation_list() -> Dictionary ; qualifiers=const

Returns list of supported [variation coordinates](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg), each coordinate is returned as `tag: Vector3i(min_value,max_value,default_value)`.
Font variations allow for continuous change of glyph characteristics along some given design axis, such as weight, width or slant.
To print available variation axes of a variable font:

```text
                var fv = FontVariation.new()
                fv.base_font = load("res://RobotoFlex.ttf")
                var variation_list = fv.get_supported_variation_list()
                for tag in variation_list:
                    var name = TextServerManager.get_primary_interface().tag_to_name(tag)
                    var values = variation_list[tag]
                    print("variation axis: %s (%d)\n\tmin, max, default: %s" % [name, tag, values])

```

**Note:** To set and get variation coordinates of a `FontVariation`, use `FontVariation.variation_opentype`.

> method get_underline_position(font_size: int = 16) -> float ; qualifiers=const

Returns average pixel offset of the underline below the baseline.
**Note:** Real underline position of the string is context-dependent and can be significantly different from the value returned by this function. Use it only as rough estimate.

> method get_underline_thickness(font_size: int = 16) -> float ; qualifiers=const

Returns average thickness of the underline.
**Note:** Real underline thickness of the string is context-dependent and can be significantly different from the value returned by this function. Use it only as rough estimate.

> method has_char(char: int) -> bool ; qualifiers=const

Returns `true` if a Unicode `char` is available in the font.

> method is_language_supported(language: String) -> bool ; qualifiers=const

Returns `true` if the font supports the given language (as a [ISO 639](https://en.wikipedia.org/wiki/ISO_639-1) code).

> method is_script_supported(script: String) -> bool ; qualifiers=const

Returns `true` if the font supports the given script (as a [ISO 15924](https://en.wikipedia.org/wiki/ISO_15924) code).

> method set_cache_capacity(single_line: int, multi_line: int) -> void

Sets LRU cache capacity for `draw_*` methods.
