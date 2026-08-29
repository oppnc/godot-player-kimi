# TextServerExtension

> class TextServerExtension
> inherits TextServerExtension TextServer

## Brief

Base class for custom `TextServer` implementations (plugins).

## Description

External `TextServer` implementations should inherit from this class.

## Methods

> method _cleanup() -> void ; qualifiers=virtual

This method is called before text server is unregistered.

> method _create_font() -> RID ; qualifiers=virtual required

Creates a new, empty font cache entry resource.

> method _create_font_linked_variation(font_rid: RID) -> RID ; qualifiers=virtual

Optional, implement if font supports extra spacing or baseline offset.
Creates a new variation existing font which is reusing the same glyph cache and font data.

> method _create_shaped_text(direction: TextServer.Direction, orientation: TextServer.Orientation) -> RID ; qualifiers=virtual required

Creates a new buffer for complex text layout, with the given `direction` and `orientation`.

> method _draw_hex_code_box(canvas: RID, size: int, pos: Vector2, index: int, color: Color) -> void ; qualifiers=virtual const

Draws box displaying character hexadecimal code.

> method _font_clear_glyphs(font_rid: RID, size: Vector2i) -> void ; qualifiers=virtual required

Removes all rendered glyph information from the cache entry.

> method _font_clear_kerning_map(font_rid: RID, size: int) -> void ; qualifiers=virtual

Removes all kerning overrides.

> method _font_clear_size_cache(font_rid: RID) -> void ; qualifiers=virtual required

Removes all font sizes from the cache entry.

> method _font_clear_system_fallback_cache() -> void ; qualifiers=virtual

Frees all automatically loaded system fonts.

> method _font_clear_textures(font_rid: RID, size: Vector2i) -> void ; qualifiers=virtual required

Removes all textures from font cache entry.

> method _font_draw_glyph(font_rid: RID, canvas: RID, size: int, pos: Vector2, index: int, color: Color, oversampling: float) -> void ; qualifiers=virtual required const

Draws single glyph into a canvas item at the position, using `font_rid` at the size `size`. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method _font_draw_glyph_outline(font_rid: RID, canvas: RID, size: int, outline_size: int, pos: Vector2, index: int, color: Color, oversampling: float) -> void ; qualifiers=virtual required const

Draws single glyph outline of size `outline_size` into a canvas item at the position, using `font_rid` at the size `size`. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method _font_get_antialiasing(font_rid: RID) -> TextServer.FontAntialiasing ; qualifiers=virtual const

Returns font anti-aliasing mode.

> method _font_get_ascent(font_rid: RID, size: int) -> float ; qualifiers=virtual required const

Returns the font ascent (number of pixels above the baseline).

> method _font_get_baseline_offset(font_rid: RID) -> float ; qualifiers=virtual const

Returns extra baseline offset (as a fraction of font height).

> method _font_get_char_from_glyph_index(font_rid: RID, size: int, glyph_index: int) -> int ; qualifiers=virtual required const

Returns character code associated with `glyph_index`, or `0` if `glyph_index` is invalid.

> method _font_get_descent(font_rid: RID, size: int) -> float ; qualifiers=virtual required const

Returns the font descent (number of pixels below the baseline).

> method _font_get_disable_embedded_bitmaps(font_rid: RID) -> bool ; qualifiers=virtual const

Returns whether the font's embedded bitmap loading is disabled.

> method _font_get_embolden(font_rid: RID) -> float ; qualifiers=virtual const

Returns font embolden strength.

> method _font_get_face_count(font_rid: RID) -> int ; qualifiers=virtual const

Returns number of faces in the TrueType / OpenType collection.

> method _font_get_face_index(font_rid: RID) -> int ; qualifiers=virtual const

Returns an active face index in the TrueType / OpenType collection.

> method _font_get_fixed_size(font_rid: RID) -> int ; qualifiers=virtual required const

Returns bitmap font fixed size.

> method _font_get_fixed_size_scale_mode(font_rid: RID) -> TextServer.FixedSizeScaleMode ; qualifiers=virtual required const

Returns bitmap font scaling mode.

> method _font_get_generate_mipmaps(font_rid: RID) -> bool ; qualifiers=virtual const

Returns `true` if font texture mipmap generation is enabled.

> method _font_get_global_oversampling() -> float ; qualifiers=virtual const

Returns the font oversampling factor, shared by all fonts in the TextServer.

> method _font_get_glyph_advance(font_rid: RID, size: int, glyph: int) -> Vector2 ; qualifiers=virtual required const

Returns glyph advance (offset of the next glyph).

> method _font_get_glyph_contours(font_rid: RID, size: int, index: int) -> Dictionary ; qualifiers=virtual const

Returns outline contours of the glyph.

> method _font_get_glyph_index(font_rid: RID, size: int, char: int, variation_selector: int) -> int ; qualifiers=virtual required const

Returns the glyph index of a `char`, optionally modified by the `variation_selector`.

> method _font_get_glyph_list(font_rid: RID, size: Vector2i) -> PackedInt32Array ; qualifiers=virtual required const

Returns list of rendered glyphs in the cache entry.

> method _font_get_glyph_offset(font_rid: RID, size: Vector2i, glyph: int) -> Vector2 ; qualifiers=virtual required const

Returns glyph offset from the baseline.

> method _font_get_glyph_size(font_rid: RID, size: Vector2i, glyph: int) -> Vector2 ; qualifiers=virtual required const

Returns size of the glyph.

> method _font_get_glyph_texture_idx(font_rid: RID, size: Vector2i, glyph: int) -> int ; qualifiers=virtual required const

Returns index of the cache texture containing the glyph.

> method _font_get_glyph_texture_rid(font_rid: RID, size: Vector2i, glyph: int) -> RID ; qualifiers=virtual required const

Returns resource ID of the cache texture containing the glyph.

> method _font_get_glyph_texture_size(font_rid: RID, size: Vector2i, glyph: int) -> Vector2 ; qualifiers=virtual required const

Returns size of the cache texture containing the glyph.

> method _font_get_glyph_uv_rect(font_rid: RID, size: Vector2i, glyph: int) -> Rect2 ; qualifiers=virtual required const

Returns rectangle in the cache texture containing the glyph.

> method _font_get_hinting(font_rid: RID) -> TextServer.Hinting ; qualifiers=virtual const

Returns the font hinting mode. Used by dynamic fonts only.

> method _font_get_keep_rounding_remainders(font_rid: RID) -> bool ; qualifiers=virtual const

Returns glyph position rounding behavior. If set to `true`, when aligning glyphs to the pixel boundaries rounding remainders are accumulated to ensure more uniform glyph distribution. This setting has no effect if subpixel positioning is enabled.

> method _font_get_kerning(font_rid: RID, size: int, glyph_pair: Vector2i) -> Vector2 ; qualifiers=virtual const

Returns kerning for the pair of glyphs.

> method _font_get_kerning_list(font_rid: RID, size: int) -> Array[Vector2i] ; qualifiers=virtual const

Returns list of the kerning overrides.

> method _font_get_language_support_override(font_rid: RID, language: String) -> bool ; qualifiers=virtual

Returns `true` if support override is enabled for the `language`.

> method _font_get_language_support_overrides(font_rid: RID) -> PackedStringArray ; qualifiers=virtual

Returns list of language support overrides.

> method _font_get_msdf_pixel_range(font_rid: RID) -> int ; qualifiers=virtual const

Returns the width of the range around the shape between the minimum and maximum representable signed distance.

> method _font_get_msdf_size(font_rid: RID) -> int ; qualifiers=virtual const

Returns source font size used to generate MSDF textures.

> method _font_get_name(font_rid: RID) -> String ; qualifiers=virtual const

Returns font family name.

> method _font_get_opentype_feature_overrides(font_rid: RID) -> Dictionary ; qualifiers=virtual const

Returns font OpenType feature set override.

> method _font_get_ot_name_strings(font_rid: RID) -> Dictionary ; qualifiers=virtual const

Returns `Dictionary` with OpenType font name strings (localized font names, version, description, license information, sample text, etc.).

> method _font_get_oversampling(font_rid: RID) -> float ; qualifiers=virtual const

Returns oversampling factor override. If set to a positive value, overrides the oversampling factor of the viewport this font is used in. See `Viewport.oversampling`. This value doesn't override the `oversampling` parameter of `draw_*` methods. Used by dynamic fonts only.

> method _font_get_palette_colors(font_rid: RID, index: int) -> PackedColorArray ; qualifiers=virtual const

Returns the array in the predefined color palette at `index`. Palette contains all colors used to render font glyphs. Each palette has the same number of colors. Colors can be overridden using `_font_set_palette_custom_colors`.

> method _font_get_palette_count(font_rid: RID) -> int ; qualifiers=virtual const

Returns the number of predefined color palettes. Palette contains all colors used to render font glyphs. Each palette has the same number of colors.

> method _font_get_palette_custom_colors(font_rid: RID) -> PackedColorArray ; qualifiers=virtual const

Returns array of custom colors to override predefined palette.

> method _font_get_palette_name(font_rid: RID, index: int) -> String ; qualifiers=virtual const

Returns the name of the predefined color palette at `index`. Palette contains all colors used to render font glyphs. Each palette has the same number of colors.

> method _font_get_scale(font_rid: RID, size: int) -> float ; qualifiers=virtual required const

Returns scaling factor of the color bitmap font.

> method _font_get_script_support_override(font_rid: RID, script: String) -> bool ; qualifiers=virtual

Returns `true` if support override is enabled for the `script`.

> method _font_get_script_support_overrides(font_rid: RID) -> PackedStringArray ; qualifiers=virtual

Returns list of script support overrides.

> method _font_get_size_cache_info(font_rid: RID) -> Array[Dictionary] ; qualifiers=virtual const

Returns font cache information, each entry contains the following fields: `Vector2i size_px` - font size in pixels, `float viewport_oversampling` - viewport oversampling factor, `int glyphs` - number of rendered glyphs, `int textures` - number of used textures, `int textures_size` - size of texture data in bytes.

> method _font_get_size_cache_list(font_rid: RID) -> Array[Vector2i] ; qualifiers=virtual required const

Returns list of the font sizes in the cache. Each size is `Vector2i` with font size and outline size.

> method _font_get_spacing(font_rid: RID, spacing: TextServer.SpacingType) -> int ; qualifiers=virtual const

Returns the spacing for `spacing` in pixels (not relative to the font size).

> method _font_get_stretch(font_rid: RID) -> int ; qualifiers=virtual const

Returns font stretch amount, compared to a normal width. A percentage value between `50%` and `200%`.

> method _font_get_style(font_rid: RID) -> BitField[TextServer.FontStyle] ; qualifiers=virtual const

Returns font style flags.

> method _font_get_style_name(font_rid: RID) -> String ; qualifiers=virtual const

Returns font style name.

> method _font_get_subpixel_positioning(font_rid: RID) -> TextServer.SubpixelPositioning ; qualifiers=virtual const

Returns font subpixel glyph positioning mode.

> method _font_get_supported_chars(font_rid: RID) -> String ; qualifiers=virtual required const

Returns a string containing all the characters available in the font.

> method _font_get_supported_glyphs(font_rid: RID) -> PackedInt32Array ; qualifiers=virtual required const

Returns an array containing all glyph indices in the font.

> method _font_get_texture_count(font_rid: RID, size: Vector2i) -> int ; qualifiers=virtual required const

Returns number of textures used by font cache entry.

> method _font_get_texture_image(font_rid: RID, size: Vector2i, texture_index: int) -> Image ; qualifiers=virtual required const

Returns font cache texture image data.

> method _font_get_texture_offsets(font_rid: RID, size: Vector2i, texture_index: int) -> PackedInt32Array ; qualifiers=virtual const

Returns array containing glyph packing data.

> method _font_get_transform(font_rid: RID) -> Transform2D ; qualifiers=virtual const

Returns 2D transform applied to the font outlines.

> method _font_get_underline_position(font_rid: RID, size: int) -> float ; qualifiers=virtual required const

Returns pixel offset of the underline below the baseline.

> method _font_get_underline_thickness(font_rid: RID, size: int) -> float ; qualifiers=virtual required const

Returns thickness of the underline in pixels.

> method _font_get_used_palette(font_rid: RID) -> int ; qualifiers=virtual const

Returns used palette index.

> method _font_get_variation_coordinates(font_rid: RID) -> Dictionary ; qualifiers=virtual const

Returns variation coordinates for the specified font cache entry.

> method _font_get_weight(font_rid: RID) -> int ; qualifiers=virtual const

Returns weight (boldness) of the font. A value in the `100...999` range, normal font weight is `400`, bold font weight is `700`.

> method _font_has_char(font_rid: RID, char: int) -> bool ; qualifiers=virtual required const

Returns `true` if a Unicode `char` is available in the font.

> method _font_is_allow_system_fallback(font_rid: RID) -> bool ; qualifiers=virtual const

Returns `true` if system fonts can be automatically used as fallbacks.

> method _font_is_force_autohinter(font_rid: RID) -> bool ; qualifiers=virtual const

Returns `true` if auto-hinting is supported and preferred over font built-in hinting.

> method _font_is_language_supported(font_rid: RID, language: String) -> bool ; qualifiers=virtual const

Returns `true` if the font supports the given language (as a [ISO 639](https://en.wikipedia.org/wiki/ISO_639-1) code).

> method _font_is_modulate_color_glyphs(font_rid: RID) -> bool ; qualifiers=virtual const

Returns `true` if color modulation is applied when drawing the font's colored glyphs.

> method _font_is_multichannel_signed_distance_field(font_rid: RID) -> bool ; qualifiers=virtual const

Returns `true` if glyphs of all sizes are rendered using single multichannel signed distance field generated from the dynamic font vector data.

> method _font_is_script_supported(font_rid: RID, script: String) -> bool ; qualifiers=virtual const

Returns `true` if the font supports the given script (as a [ISO 15924](https://en.wikipedia.org/wiki/ISO_15924) code).

> method _font_remove_glyph(font_rid: RID, size: Vector2i, glyph: int) -> void ; qualifiers=virtual required

Removes specified rendered glyph information from the cache entry.

> method _font_remove_kerning(font_rid: RID, size: int, glyph_pair: Vector2i) -> void ; qualifiers=virtual

Removes kerning override for the pair of glyphs.

> method _font_remove_language_support_override(font_rid: RID, language: String) -> void ; qualifiers=virtual

Remove language support override.

> method _font_remove_script_support_override(font_rid: RID, script: String) -> void ; qualifiers=virtual

Removes script support override.

> method _font_remove_size_cache(font_rid: RID, size: Vector2i) -> void ; qualifiers=virtual required

Removes specified font size from the cache entry.

> method _font_remove_texture(font_rid: RID, size: Vector2i, texture_index: int) -> void ; qualifiers=virtual required

Removes specified texture from the cache entry.

> method _font_render_glyph(font_rid: RID, size: Vector2i, index: int) -> void ; qualifiers=virtual

Renders specified glyph to the font cache texture.

> method _font_render_range(font_rid: RID, size: Vector2i, start: int, end: int) -> void ; qualifiers=virtual

Renders the range of characters to the font cache texture.

> method _font_set_allow_system_fallback(font_rid: RID, allow_system_fallback: bool) -> void ; qualifiers=virtual

If set to `true`, system fonts can be automatically used as fallbacks.

> method _font_set_antialiasing(font_rid: RID, antialiasing: TextServer.FontAntialiasing) -> void ; qualifiers=virtual

Sets font anti-aliasing mode.

> method _font_set_ascent(font_rid: RID, size: int, ascent: float) -> void ; qualifiers=virtual required

Sets the font ascent (number of pixels above the baseline).

> method _font_set_baseline_offset(font_rid: RID, baseline_offset: float) -> void ; qualifiers=virtual

Sets extra baseline offset (as a fraction of font height).

> method _font_set_data(font_rid: RID, data: PackedByteArray) -> void ; qualifiers=virtual

Sets font source data, e.g contents of the dynamic font source file.

> method _font_set_data_ptr(font_rid: RID, data_ptr: const uint8_t*, data_size: int) -> void ; qualifiers=virtual

Sets pointer to the font source data, e.g contents of the dynamic font source file.

> method _font_set_descent(font_rid: RID, size: int, descent: float) -> void ; qualifiers=virtual required

Sets the font descent (number of pixels below the baseline).

> method _font_set_disable_embedded_bitmaps(font_rid: RID, disable_embedded_bitmaps: bool) -> void ; qualifiers=virtual

If set to `true`, embedded font bitmap loading is disabled.

> method _font_set_embolden(font_rid: RID, strength: float) -> void ; qualifiers=virtual

Sets font embolden strength. If `strength` is not equal to zero, emboldens the font outlines. Negative values reduce the outline thickness.

> method _font_set_face_index(font_rid: RID, face_index: int) -> void ; qualifiers=virtual

Sets an active face index in the TrueType / OpenType collection.

> method _font_set_fixed_size(font_rid: RID, fixed_size: int) -> void ; qualifiers=virtual required

Sets bitmap font fixed size. If set to value greater than zero, same cache entry will be used for all font sizes.

> method _font_set_fixed_size_scale_mode(font_rid: RID, fixed_size_scale_mode: TextServer.FixedSizeScaleMode) -> void ; qualifiers=virtual required

Sets bitmap font scaling mode. This property is used only if `fixed_size` is greater than zero.

> method _font_set_force_autohinter(font_rid: RID, force_autohinter: bool) -> void ; qualifiers=virtual

If set to `true` auto-hinting is preferred over font built-in hinting.

> method _font_set_generate_mipmaps(font_rid: RID, generate_mipmaps: bool) -> void ; qualifiers=virtual

If set to `true` font texture mipmap generation is enabled.

> method _font_set_global_oversampling(oversampling: float) -> void ; qualifiers=virtual

Sets oversampling factor, shared by all font in the TextServer.

> method _font_set_glyph_advance(font_rid: RID, size: int, glyph: int, advance: Vector2) -> void ; qualifiers=virtual required

Sets glyph advance (offset of the next glyph).

> method _font_set_glyph_offset(font_rid: RID, size: Vector2i, glyph: int, offset: Vector2) -> void ; qualifiers=virtual required

Sets glyph offset from the baseline.

> method _font_set_glyph_size(font_rid: RID, size: Vector2i, glyph: int, gl_size: Vector2) -> void ; qualifiers=virtual required

Sets size of the glyph.

> method _font_set_glyph_texture_idx(font_rid: RID, size: Vector2i, glyph: int, texture_idx: int) -> void ; qualifiers=virtual required

Sets index of the cache texture containing the glyph.

> method _font_set_glyph_uv_rect(font_rid: RID, size: Vector2i, glyph: int, uv_rect: Rect2) -> void ; qualifiers=virtual required

Sets rectangle in the cache texture containing the glyph.

> method _font_set_hinting(font_rid: RID, hinting: TextServer.Hinting) -> void ; qualifiers=virtual

Sets font hinting mode. Used by dynamic fonts only.

> method _font_set_keep_rounding_remainders(font_rid: RID, keep_rounding_remainders: bool) -> void ; qualifiers=virtual

Sets glyph position rounding behavior. If set to `true`, when aligning glyphs to the pixel boundaries rounding remainders are accumulated to ensure more uniform glyph distribution. This setting has no effect if subpixel positioning is enabled.

> method _font_set_kerning(font_rid: RID, size: int, glyph_pair: Vector2i, kerning: Vector2) -> void ; qualifiers=virtual

Sets kerning for the pair of glyphs.

> method _font_set_language_support_override(font_rid: RID, language: String, supported: bool) -> void ; qualifiers=virtual

Adds override for `_font_is_language_supported`.

> method _font_set_modulate_color_glyphs(font_rid: RID, modulate: bool) -> void ; qualifiers=virtual

If set to `true`, color modulation is applied when drawing colored glyphs, otherwise it's applied to the monochrome glyphs only.

> method _font_set_msdf_pixel_range(font_rid: RID, msdf_pixel_range: int) -> void ; qualifiers=virtual

Sets the width of the range around the shape between the minimum and maximum representable signed distance.

> method _font_set_msdf_size(font_rid: RID, msdf_size: int) -> void ; qualifiers=virtual

Sets source font size used to generate MSDF textures.

> method _font_set_multichannel_signed_distance_field(font_rid: RID, msdf: bool) -> void ; qualifiers=virtual

If set to `true`, glyphs of all sizes are rendered using single multichannel signed distance field generated from the dynamic font vector data. MSDF rendering allows displaying the font at any scaling factor without blurriness, and without incurring a CPU cost when the font size changes (since the font no longer needs to be rasterized on the CPU). As a downside, font hinting is not available with MSDF. The lack of font hinting may result in less crisp and less readable fonts at small sizes.

> method _font_set_name(font_rid: RID, name: String) -> void ; qualifiers=virtual

Sets the font family name.

> method _font_set_opentype_feature_overrides(font_rid: RID, overrides: Dictionary) -> void ; qualifiers=virtual

Sets font OpenType feature set override.

> method _font_set_oversampling(font_rid: RID, oversampling: float) -> void ; qualifiers=virtual

If set to a positive value, overrides the oversampling factor of the viewport this font is used in. See `Viewport.oversampling`. This value doesn't override the `oversampling` parameter of `draw_*` methods. Used by dynamic fonts only.

> method _font_set_palette_custom_colors(font_rid: RID, colors: PackedColorArray) -> void ; qualifiers=virtual

Sets array of custom colors to override predefined palette. Set to empty array to reset overrides. Use `Color(0, 0, 0, 0)`, to keep predefined palette color at specific position.

> method _font_set_scale(font_rid: RID, size: int, scale: float) -> void ; qualifiers=virtual required

Sets scaling factor of the color bitmap font.

> method _font_set_script_support_override(font_rid: RID, script: String, supported: bool) -> void ; qualifiers=virtual

Adds override for `_font_is_script_supported`.

> method _font_set_spacing(font_rid: RID, spacing: TextServer.SpacingType, value: int) -> void ; qualifiers=virtual

Sets the spacing for `spacing` to `value` in pixels (not relative to the font size).

> method _font_set_stretch(font_rid: RID, stretch: int) -> void ; qualifiers=virtual

Sets font stretch amount, compared to a normal width. A percentage value between `50%` and `200%`.

> method _font_set_style(font_rid: RID, style: BitField[TextServer.FontStyle]) -> void ; qualifiers=virtual

Sets the font style flags.

> method _font_set_style_name(font_rid: RID, name_style: String) -> void ; qualifiers=virtual

Sets the font style name.

> method _font_set_subpixel_positioning(font_rid: RID, subpixel_positioning: TextServer.SubpixelPositioning) -> void ; qualifiers=virtual

Sets font subpixel glyph positioning mode.

> method _font_set_texture_image(font_rid: RID, size: Vector2i, texture_index: int, image: Image) -> void ; qualifiers=virtual required

Sets font cache texture image data.

> method _font_set_texture_offsets(font_rid: RID, size: Vector2i, texture_index: int, offset: PackedInt32Array) -> void ; qualifiers=virtual

Sets array containing glyph packing data.

> method _font_set_transform(font_rid: RID, transform: Transform2D) -> void ; qualifiers=virtual

Sets 2D transform, applied to the font outlines, can be used for slanting, flipping, and rotating glyphs.

> method _font_set_underline_position(font_rid: RID, size: int, underline_position: float) -> void ; qualifiers=virtual required

Sets pixel offset of the underline below the baseline.

> method _font_set_underline_thickness(font_rid: RID, size: int, underline_thickness: float) -> void ; qualifiers=virtual required

Sets thickness of the underline in pixels.

> method _font_set_used_palette(font_rid: RID, index: int) -> void ; qualifiers=virtual

Sets used palette index.

> method _font_set_variation_coordinates(font_rid: RID, variation_coordinates: Dictionary) -> void ; qualifiers=virtual

Sets variation coordinates for the specified font cache entry.

> method _font_set_weight(font_rid: RID, weight: int) -> void ; qualifiers=virtual

Sets weight (boldness) of the font. A value in the `100...999` range, normal font weight is `400`, bold font weight is `700`.

> method _font_supported_feature_list(font_rid: RID) -> Dictionary ; qualifiers=virtual const

Returns the dictionary of the supported OpenType features.

> method _font_supported_variation_list(font_rid: RID) -> Dictionary ; qualifiers=virtual const

Returns the dictionary of the supported OpenType variation coordinates.

> method _format_number(number: String, language: String) -> String ; qualifiers=virtual const ; deprecated=Use `TranslationServer.format_number` instead.

Converts a number from Western Arabic (0..9) to the numeral system used in the given `language`.
If `language` is an empty string, the active locale will be used.

> method _free_rid(rid: RID) -> void ; qualifiers=virtual required

Frees an object created by this `TextServer`.

> method _get_features() -> int ; qualifiers=virtual required const

Returns text server features, see `TextServer.Feature`.

> method _get_hex_code_box_size(size: int, index: int) -> Vector2 ; qualifiers=virtual const

Returns size of the replacement character (box with character hexadecimal code that is drawn in place of invalid characters).

> method _get_name() -> String ; qualifiers=virtual required const

Returns the name of the server interface.

> method _get_support_data() -> PackedByteArray ; qualifiers=virtual const

Returns default TextServer database (e.g. ICU break iterators and dictionaries).

> method _get_support_data_filename() -> String ; qualifiers=virtual const

Returns default TextServer database (e.g. ICU break iterators and dictionaries) filename.

> method _get_support_data_info() -> String ; qualifiers=virtual const

Returns TextServer database (e.g. ICU break iterators and dictionaries) description.

> method _has(rid: RID) -> bool ; qualifiers=virtual required

Returns `true` if `rid` is valid resource owned by this text server.

> method _has_feature(feature: TextServer.Feature) -> bool ; qualifiers=virtual required const

Returns `true` if the server supports a feature.

> method _is_confusable(string: String, dict: PackedStringArray) -> int ; qualifiers=virtual const

Returns index of the first string in `dict` which is visually confusable with the `string`, or `-1` if none is found.

> method _is_locale_right_to_left(locale: String) -> bool ; qualifiers=virtual const

Returns `true` if locale is right-to-left.

> method _is_locale_using_support_data(locale: String) -> bool ; qualifiers=virtual const

Returns `true` if the locale requires text server support data for line/word breaking.

> method _is_valid_identifier(string: String) -> bool ; qualifiers=virtual const

Returns `true` if `string` is a valid identifier.

> method _is_valid_letter(unicode: int) -> bool ; qualifiers=virtual const

> method _load_support_data(filename: String) -> bool ; qualifiers=virtual

Loads optional TextServer database (e.g. ICU break iterators and dictionaries).

> method _name_to_tag(name: String) -> int ; qualifiers=virtual const

Converts the given readable name of a feature, variation, script, or language to an OpenType tag.

> method _parse_number(number: String, language: String) -> String ; qualifiers=virtual const ; deprecated=Use `TranslationServer.parse_number` instead.

Converts `number` from the numeral system used in the given `language` to Western Arabic (0..9).
If `language` is an empty string, the active locale will be used.

> method _parse_structured_text(parser_type: TextServer.StructuredTextParser, args: Array, text: String) -> Array[Vector3i] ; qualifiers=virtual const

Default implementation of the BiDi algorithm override function.

> method _percent_sign(language: String) -> String ; qualifiers=virtual const ; deprecated=Use `TranslationServer.get_percent_sign` instead.

Returns percent sign used in the given `language`.

> method _reference_oversampling_level(oversampling: float) -> void ; qualifiers=virtual

Increases the reference count of the specified oversampling level. This method is called by `Viewport`, and should not be used directly.

> method _save_support_data(filename: String) -> bool ; qualifiers=virtual const

Saves optional TextServer database (e.g. ICU break iterators and dictionaries) to the file.

> method _shaped_get_run_count(shaped: RID) -> int ; qualifiers=virtual const

Returns the number of uniform text runs in the buffer.

> method _shaped_get_run_direction(shaped: RID, index: int) -> TextServer.Direction ; qualifiers=virtual const

Returns the direction of the `index` text run (in visual order).

> method _shaped_get_run_font_rid(shaped: RID, index: int) -> RID ; qualifiers=virtual const

Returns the font RID of the `index` text run (in visual order).

> method _shaped_get_run_font_size(shaped: RID, index: int) -> int ; qualifiers=virtual const

Returns the font size of the `index` text run (in visual order).

> method _shaped_get_run_glyph_range(shaped: RID, index: int) -> Vector2i ; qualifiers=virtual const

Returns the glyph range of the `index` text run (in visual order).

> method _shaped_get_run_language(shaped: RID, index: int) -> String ; qualifiers=virtual const

Returns the language of the `index` text run (in visual order).

> method _shaped_get_run_object(shaped: RID, index: int) -> Variant ; qualifiers=virtual const

Returns the embedded object of the `index` text run (in visual order).

> method _shaped_get_run_range(shaped: RID, index: int) -> Vector2i ; qualifiers=virtual const

Returns the source text range of the `index` text run (in visual order).

> method _shaped_get_run_text(shaped: RID, index: int) -> String ; qualifiers=virtual const

Returns the source text of the `index` text run (in visual order).

> method _shaped_get_span_count(shaped: RID) -> int ; qualifiers=virtual required const

Returns number of text spans added using `_shaped_text_add_string` or `_shaped_text_add_object`.

> method _shaped_get_span_embedded_object(shaped: RID, index: int) -> Variant ; qualifiers=virtual required const

Returns text embedded object key.

> method _shaped_get_span_meta(shaped: RID, index: int) -> Variant ; qualifiers=virtual required const

Returns text span metadata.

> method _shaped_get_span_object(shaped: RID, index: int) -> Variant ; qualifiers=virtual required const

Returns the text span embedded object key.

> method _shaped_get_span_text(shaped: RID, index: int) -> String ; qualifiers=virtual required const

Returns the text span source text.

> method _shaped_get_text(shaped: RID) -> String ; qualifiers=virtual required const

Returns the text buffer source text, including object replacement characters.

> method _shaped_set_span_update_font(shaped: RID, index: int, fonts: Array[RID], size: int, opentype_features: Dictionary) -> void ; qualifiers=virtual required

Changes text span font, font size, and OpenType features, without changing the text.

> method _shaped_text_add_object(shaped: RID, key: Variant, size: Vector2, inline_align: InlineAlignment, length: int, baseline: float) -> bool ; qualifiers=virtual required

Adds inline object to the text buffer, `key` must be unique. In the text, object is represented as `length` object replacement characters.

> method _shaped_text_add_string(shaped: RID, text: String, fonts: Array[RID], size: int, opentype_features: Dictionary, language: String, meta: Variant) -> bool ; qualifiers=virtual required

Adds text span and font to draw it to the text buffer.

> method _shaped_text_clear(shaped: RID) -> void ; qualifiers=virtual required

Clears text buffer (removes text and inline objects).

> method _shaped_text_closest_character_pos(shaped: RID, pos: int) -> int ; qualifiers=virtual const

Returns composite character position closest to the `pos`.

> method _shaped_text_draw(shaped: RID, canvas: RID, pos: Vector2, clip_l: float, clip_r: float, color: Color, oversampling: float) -> void ; qualifiers=virtual const

Draw shaped text into a canvas item at a given position, with `color`. `pos` specifies the leftmost point of the baseline (for horizontal layout) or topmost point of the baseline (for vertical layout). If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method _shaped_text_draw_outline(shaped: RID, canvas: RID, pos: Vector2, clip_l: float, clip_r: float, outline_size: int, color: Color, oversampling: float) -> void ; qualifiers=virtual const

Draw the outline of the shaped text into a canvas item at a given position, with `color`. `pos` specifies the leftmost point of the baseline (for horizontal layout) or topmost point of the baseline (for vertical layout). If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.

> method _shaped_text_duplicate(shaped: RID) -> RID ; qualifiers=virtual required

Duplicates shaped text buffer.

> method _shaped_text_fit_to_width(shaped: RID, width: float, justification_flags: BitField[TextServer.JustificationFlag]) -> float ; qualifiers=virtual

Adjusts text width to fit to specified width, returns new text width.

> method _shaped_text_get_ascent(shaped: RID) -> float ; qualifiers=virtual required const

Returns the text ascent (number of pixels above the baseline for horizontal layout or to the left of baseline for vertical).

> method _shaped_text_get_carets(shaped: RID, position: int, r_caret: CaretInfo*) -> void ; qualifiers=virtual const

Returns shapes of the carets corresponding to the character offset `position` in the text. Returned caret shape is 1 pixel wide rectangle.

> method _shaped_text_get_character_breaks(shaped: RID) -> PackedInt32Array ; qualifiers=virtual const

Returns array of the composite character boundaries.

> method _shaped_text_get_custom_ellipsis(shaped: RID) -> int ; qualifiers=virtual const

Returns ellipsis character used for text clipping.

> method _shaped_text_get_custom_punctuation(shaped: RID) -> String ; qualifiers=virtual const

Returns custom punctuation character list, used for word breaking. If set to empty string, server defaults are used.

> method _shaped_text_get_descent(shaped: RID) -> float ; qualifiers=virtual required const

Returns the text descent (number of pixels below the baseline for horizontal layout or to the right of baseline for vertical).

> method _shaped_text_get_direction(shaped: RID) -> TextServer.Direction ; qualifiers=virtual const

Returns direction of the text.

> method _shaped_text_get_dominant_direction_in_range(shaped: RID, start: int, end: int) -> int ; qualifiers=virtual const

Returns dominant direction of in the range of text.

> method _shaped_text_get_ellipsis_glyph_count(shaped: RID) -> int ; qualifiers=virtual required const

Returns number of glyphs in the ellipsis.

> method _shaped_text_get_ellipsis_glyphs(shaped: RID) -> const Glyph* ; qualifiers=virtual required const

Returns array of the glyphs in the ellipsis.

> method _shaped_text_get_ellipsis_pos(shaped: RID) -> int ; qualifiers=virtual required const

Returns position of the ellipsis.

> method _shaped_text_get_glyph_count(shaped: RID) -> int ; qualifiers=virtual required const

Returns number of glyphs in the buffer.

> method _shaped_text_get_glyphs(shaped: RID) -> const Glyph* ; qualifiers=virtual required const

Returns an array of glyphs in the visual order.

> method _shaped_text_get_grapheme_bounds(shaped: RID, pos: int) -> Vector2 ; qualifiers=virtual const

Returns composite character's bounds as offsets from the start of the line.

> method _shaped_text_get_inferred_direction(shaped: RID) -> TextServer.Direction ; qualifiers=virtual const

Returns direction of the text, inferred by the BiDi algorithm.

> method _shaped_text_get_line_breaks(shaped: RID, width: float, start: int, break_flags: BitField[TextServer.LineBreakFlag]) -> PackedInt32Array ; qualifiers=virtual const

Breaks text to the lines and returns character ranges for each line.

> method _shaped_text_get_line_breaks_adv(shaped: RID, width: PackedFloat32Array, start: int, once: bool, break_flags: BitField[TextServer.LineBreakFlag]) -> PackedInt32Array ; qualifiers=virtual const

Breaks text to the lines and columns. Returns character ranges for each segment.

> method _shaped_text_get_object_glyph(shaped: RID, key: Variant) -> int ; qualifiers=virtual required const

Returns the glyph index of the inline object.

> method _shaped_text_get_object_range(shaped: RID, key: Variant) -> Vector2i ; qualifiers=virtual required const

Returns the character range of the inline object.

> method _shaped_text_get_object_rect(shaped: RID, key: Variant) -> Rect2 ; qualifiers=virtual required const

Returns bounding rectangle of the inline object.

> method _shaped_text_get_objects(shaped: RID) -> Array ; qualifiers=virtual required const

Returns array of inline objects.

> method _shaped_text_get_orientation(shaped: RID) -> TextServer.Orientation ; qualifiers=virtual const

Returns text orientation.

> method _shaped_text_get_parent(shaped: RID) -> RID ; qualifiers=virtual required const

Returns the parent buffer from which the substring originates.

> method _shaped_text_get_preserve_control(shaped: RID) -> bool ; qualifiers=virtual const

Returns `true` if text buffer is configured to display control characters.

> method _shaped_text_get_preserve_invalid(shaped: RID) -> bool ; qualifiers=virtual const

Returns `true` if text buffer is configured to display hexadecimal codes in place of invalid characters.

> method _shaped_text_get_range(shaped: RID) -> Vector2i ; qualifiers=virtual required const

Returns substring buffer character range in the parent buffer.

> method _shaped_text_get_selection(shaped: RID, start: int, end: int) -> PackedVector2Array ; qualifiers=virtual const

Returns selection rectangles for the specified character range.

> method _shaped_text_get_size(shaped: RID) -> Vector2 ; qualifiers=virtual required const

Returns size of the text.

> method _shaped_text_get_spacing(shaped: RID, spacing: TextServer.SpacingType) -> int ; qualifiers=virtual const

Returns extra spacing added between glyphs or lines in pixels.

> method _shaped_text_get_trim_pos(shaped: RID) -> int ; qualifiers=virtual required const

Returns the position of the overrun trim.

> method _shaped_text_get_underline_position(shaped: RID) -> float ; qualifiers=virtual required const

Returns pixel offset of the underline below the baseline.

> method _shaped_text_get_underline_thickness(shaped: RID) -> float ; qualifiers=virtual required const

Returns thickness of the underline.

> method _shaped_text_get_width(shaped: RID) -> float ; qualifiers=virtual required const

Returns width (for horizontal layout) or height (for vertical) of the text.

> method _shaped_text_get_word_breaks(shaped: RID, grapheme_flags: BitField[TextServer.GraphemeFlag], skip_grapheme_flags: BitField[TextServer.GraphemeFlag]) -> PackedInt32Array ; qualifiers=virtual const

Breaks text into words and returns array of character ranges. Use `grapheme_flags` to set what characters are used for breaking.

> method _shaped_text_has_object(shaped: RID, key: Variant) -> bool ; qualifiers=virtual required const

Returns `true` if an object with `key` is embedded in this shaped text buffer.

> method _shaped_text_hit_test_grapheme(shaped: RID, coord: float) -> int ; qualifiers=virtual const

Returns grapheme index at the specified pixel offset at the baseline, or `-1` if none is found.

> method _shaped_text_hit_test_position(shaped: RID, coord: float) -> int ; qualifiers=virtual const

Returns caret character offset at the specified pixel offset at the baseline. This function always returns a valid position.

> method _shaped_text_is_ready(shaped: RID) -> bool ; qualifiers=virtual required const

Returns `true` if buffer is successfully shaped.

> method _shaped_text_next_character_pos(shaped: RID, pos: int) -> int ; qualifiers=virtual const

Returns composite character end position closest to the `pos`.

> method _shaped_text_next_grapheme_pos(shaped: RID, pos: int) -> int ; qualifiers=virtual const

Returns grapheme end position closest to the `pos`.

> method _shaped_text_overrun_trim_to_width(shaped: RID, width: float, trim_flags: BitField[TextServer.TextOverrunFlag]) -> void ; qualifiers=virtual

Trims text if it exceeds the given width.

> method _shaped_text_prev_character_pos(shaped: RID, pos: int) -> int ; qualifiers=virtual const

Returns composite character start position closest to the `pos`.

> method _shaped_text_prev_grapheme_pos(shaped: RID, pos: int) -> int ; qualifiers=virtual const

Returns grapheme start position closest to the `pos`.

> method _shaped_text_resize_object(shaped: RID, key: Variant, size: Vector2, inline_align: InlineAlignment, baseline: float) -> bool ; qualifiers=virtual required

Sets new size and alignment of embedded object.

> method _shaped_text_set_bidi_override(shaped: RID, override: Array) -> void ; qualifiers=virtual

Overrides BiDi for the structured text.

> method _shaped_text_set_custom_ellipsis(shaped: RID, char: int) -> void ; qualifiers=virtual

Sets ellipsis character used for text clipping.

> method _shaped_text_set_custom_punctuation(shaped: RID, punct: String) -> void ; qualifiers=virtual

Sets custom punctuation character list, used for word breaking. If set to empty string, server defaults are used.

> method _shaped_text_set_direction(shaped: RID, direction: TextServer.Direction) -> void ; qualifiers=virtual

Sets desired text direction. If set to `TextServer.DIRECTION_AUTO`, direction will be detected based on the buffer contents and current locale.

> method _shaped_text_set_orientation(shaped: RID, orientation: TextServer.Orientation) -> void ; qualifiers=virtual

Sets desired text orientation.

> method _shaped_text_set_preserve_control(shaped: RID, enabled: bool) -> void ; qualifiers=virtual

If set to `true` text buffer will display control characters.

> method _shaped_text_set_preserve_invalid(shaped: RID, enabled: bool) -> void ; qualifiers=virtual

If set to `true` text buffer will display invalid characters as hexadecimal codes, otherwise nothing is displayed.

> method _shaped_text_set_spacing(shaped: RID, spacing: TextServer.SpacingType, value: int) -> void ; qualifiers=virtual

Sets extra spacing added between glyphs or lines in pixels.

> method _shaped_text_shape(shaped: RID) -> bool ; qualifiers=virtual required

Shapes buffer if it's not shaped. Returns `true` if the string is shaped successfully.

> method _shaped_text_sort_logical(shaped: RID) -> const Glyph* ; qualifiers=virtual required

Returns text glyphs in the logical order.

> method _shaped_text_substr(shaped: RID, start: int, length: int) -> RID ; qualifiers=virtual required const

Returns text buffer for the substring of the text in the `shaped` text buffer (including inline objects).

> method _shaped_text_tab_align(shaped: RID, tab_stops: PackedFloat32Array) -> float ; qualifiers=virtual

Aligns shaped text to the given tab-stops.

> method _shaped_text_update_breaks(shaped: RID) -> bool ; qualifiers=virtual

Updates break points in the shaped text. This method is called by default implementation of text breaking functions.

> method _shaped_text_update_justification_ops(shaped: RID) -> bool ; qualifiers=virtual

Updates justification points in the shaped text. This method is called by default implementation of text justification functions.

> method _spoof_check(string: String) -> bool ; qualifiers=virtual const

Returns `true` if `string` is likely to be an attempt at confusing the reader.

> method _string_get_character_breaks(string: String, language: String) -> PackedInt32Array ; qualifiers=virtual const

Returns array of the composite character boundaries.

> method _string_get_word_breaks(string: String, language: String, chars_per_line: int) -> PackedInt32Array ; qualifiers=virtual const

Returns an array of the word break boundaries. Elements in the returned array are the offsets of the start and end of words. Therefore the length of the array is always even.

> method _string_to_lower(string: String, language: String) -> String ; qualifiers=virtual const

Returns the string converted to `lowercase`.

> method _string_to_title(string: String, language: String) -> String ; qualifiers=virtual const

Returns the string converted to `Title Case`.

> method _string_to_upper(string: String, language: String) -> String ; qualifiers=virtual const

Returns the string converted to `UPPERCASE`.

> method _strip_diacritics(string: String) -> String ; qualifiers=virtual const

Strips diacritics from the string.

> method _tag_to_name(tag: int) -> String ; qualifiers=virtual const

Converts the given OpenType tag to the readable name of a feature, variation, script, or language.

> method _unreference_oversampling_level(oversampling: float) -> void ; qualifiers=virtual

Decreases the reference count of the specified oversampling level, and frees the font cache for oversampling level when the reference count reaches zero. This method is called by `Viewport`, and should not be used directly.
