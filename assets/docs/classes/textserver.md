# TextServer

> class TextServer
> inherits TextServer RefCounted

## Brief

A server interface for font management and text rendering.

## Description

`TextServer` is the API backend for managing fonts and rendering text.
**Note:** This is a low-level API, consider using `TextLine`, `TextParagraph`, and `Font` classes instead.
This is an abstract class, so to get the currently active `TextServer` instance, use the following code:

```gdscript
        var ts = TextServerManager.get_primary_interface()

```

```csharp
        var ts = TextServerManager.GetPrimaryInterface();

```

## Methods

> method create_font() -> RID

Creates a new, empty font cache entry resource. To free the resulting resource, use the `free_rid` method.

> method create_font_linked_variation(font_rid: RID) -> RID

Creates a new variation existing font which is reusing the same glyph cache and font data. To free the resulting resource, use the `free_rid` method.

> method create_shaped_text(direction: Direction = 0, orientation: Orientation = 0) -> RID

Creates a new buffer for complex text layout, with the given `direction` and `orientation`. To free the resulting buffer, use `free_rid` method.
**Note:** Direction is ignored if server does not support `FEATURE_BIDI_LAYOUT` feature (supported by `TextServerAdvanced`).
**Note:** Orientation is ignored if server does not support `FEATURE_VERTICAL_LAYOUT` feature (supported by `TextServerAdvanced`).

> method draw_hex_code_box(canvas: RID, size: int, pos: Vector2, index: int, color: Color) -> void ; qualifiers=const

Draws box displaying character hexadecimal code. Used for replacing missing characters.

> method font_clear_glyphs(font_rid: RID, size: Vector2i) -> void

Removes all rendered glyph information from the cache entry.
**Note:** This function will not remove textures associated with the glyphs, use `font_remove_texture` to remove them manually.

> method font_clear_kerning_map(font_rid: RID, size: int) -> void

Removes all kerning overrides.

> method font_clear_size_cache(font_rid: RID) -> void

Removes all font sizes from the cache entry.

> method font_clear_system_fallback_cache() -> void

Frees all automatically loaded system fonts.

> method font_clear_textures(font_rid: RID, size: Vector2i) -> void

Removes all textures from font cache entry.
**Note:** This function will not remove glyphs associated with the texture, use `font_remove_glyph` to remove them manually.

> method font_draw_glyph(font_rid: RID, canvas: RID, size: int, pos: Vector2, index: int, color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draws single glyph into a canvas item at the position, using `font_rid` at the size `size`. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.
**Note:** Glyph index is specific to the font, use glyphs indices returned by `shaped_text_get_glyphs` or `font_get_glyph_index`.
**Note:** If there are pending glyphs to render, calling this function might trigger the texture cache update.

> method font_draw_glyph_outline(font_rid: RID, canvas: RID, size: int, outline_size: int, pos: Vector2, index: int, color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draws single glyph outline of size `outline_size` into a canvas item at the position, using `font_rid` at the size `size`. If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.
**Note:** Glyph index is specific to the font, use glyphs indices returned by `shaped_text_get_glyphs` or `font_get_glyph_index`.
**Note:** If there are pending glyphs to render, calling this function might trigger the texture cache update.

> method font_get_antialiasing(font_rid: RID) -> FontAntialiasing ; qualifiers=const

Returns font anti-aliasing mode.

> method font_get_ascent(font_rid: RID, size: int) -> float ; qualifiers=const

Returns the font ascent (number of pixels above the baseline).

> method font_get_baseline_offset(font_rid: RID) -> float ; qualifiers=const

Returns extra baseline offset (as a fraction of font height).

> method font_get_char_from_glyph_index(font_rid: RID, size: int, glyph_index: int) -> int ; qualifiers=const

Returns character code associated with `glyph_index`, or `0` if `glyph_index` is invalid. See `font_get_glyph_index`.

> method font_get_descent(font_rid: RID, size: int) -> float ; qualifiers=const

Returns the font descent (number of pixels below the baseline).

> method font_get_disable_embedded_bitmaps(font_rid: RID) -> bool ; qualifiers=const

Returns whether the font's embedded bitmap loading is disabled.

> method font_get_embolden(font_rid: RID) -> float ; qualifiers=const

Returns font embolden strength.

> method font_get_face_count(font_rid: RID) -> int ; qualifiers=const

Returns number of faces in the TrueType / OpenType collection.

> method font_get_face_index(font_rid: RID) -> int ; qualifiers=const

Returns an active face index in the TrueType / OpenType collection.

> method font_get_fixed_size(font_rid: RID) -> int ; qualifiers=const

Returns bitmap font fixed size.

> method font_get_fixed_size_scale_mode(font_rid: RID) -> FixedSizeScaleMode ; qualifiers=const

Returns bitmap font scaling mode.

> method font_get_generate_mipmaps(font_rid: RID) -> bool ; qualifiers=const

Returns `true` if font texture mipmap generation is enabled.

> method font_get_global_oversampling() -> float ; qualifiers=const ; deprecated=Use `Viewport` oversampling, or the `oversampling` argument of the `draw_*` methods instead.

This method does nothing and always returns `1.0`.

> method font_get_glyph_advance(font_rid: RID, size: int, glyph: int) -> Vector2 ; qualifiers=const

Returns glyph advance (offset of the next glyph).
**Note:** Advance for glyphs outlines is the same as the base glyph advance and is not saved.

> method font_get_glyph_contours(font: RID, size: int, index: int) -> Dictionary ; qualifiers=const

Returns outline contours of the glyph as a `Dictionary` with the following contents:
`points`         - `PackedVector3Array`, containing outline points. `x` and `y` are point coordinates. `z` is the type of the point, using the `ContourPointTag` values.
`contours`       - `PackedInt32Array`, containing indices the end points of each contour.
`orientation`    - `bool`, contour orientation. If `true`, clockwise contours must be filled.
- Two successive `CONTOUR_CURVE_TAG_ON` points indicate a line segment.
- One `CONTOUR_CURVE_TAG_OFF_CONIC` point between two `CONTOUR_CURVE_TAG_ON` points indicates a single conic (quadratic) Bézier arc.
- Two `CONTOUR_CURVE_TAG_OFF_CUBIC` points between two `CONTOUR_CURVE_TAG_ON` points indicate a single cubic Bézier arc.
- Two successive `CONTOUR_CURVE_TAG_OFF_CONIC` points indicate two successive conic (quadratic) Bézier arcs with a virtual `CONTOUR_CURVE_TAG_ON` point at their middle.
- Each contour is closed. The last point of a contour uses the first point of a contour as its next point, and vice versa. The first point can be `CONTOUR_CURVE_TAG_OFF_CONIC` point.

> method font_get_glyph_index(font_rid: RID, size: int, char: int, variation_selector: int) -> int ; qualifiers=const

Returns the glyph index of a `char`, optionally modified by the `variation_selector`. See `font_get_char_from_glyph_index`.

> method font_get_glyph_list(font_rid: RID, size: Vector2i) -> PackedInt32Array ; qualifiers=const

Returns list of rendered glyphs in the cache entry.

> method font_get_glyph_offset(font_rid: RID, size: Vector2i, glyph: int) -> Vector2 ; qualifiers=const

Returns glyph offset from the baseline.

> method font_get_glyph_size(font_rid: RID, size: Vector2i, glyph: int) -> Vector2 ; qualifiers=const

Returns size of the glyph.

> method font_get_glyph_texture_idx(font_rid: RID, size: Vector2i, glyph: int) -> int ; qualifiers=const

Returns index of the cache texture containing the glyph.

> method font_get_glyph_texture_rid(font_rid: RID, size: Vector2i, glyph: int) -> RID ; qualifiers=const

Returns resource ID of the cache texture containing the glyph.
**Note:** If there are pending glyphs to render, calling this function might trigger the texture cache update.

> method font_get_glyph_texture_size(font_rid: RID, size: Vector2i, glyph: int) -> Vector2 ; qualifiers=const

Returns size of the cache texture containing the glyph.
**Note:** If there are pending glyphs to render, calling this function might trigger the texture cache update.

> method font_get_glyph_uv_rect(font_rid: RID, size: Vector2i, glyph: int) -> Rect2 ; qualifiers=const

Returns rectangle in the cache texture containing the glyph.

> method font_get_hinting(font_rid: RID) -> Hinting ; qualifiers=const

Returns the font hinting mode. Used by dynamic fonts only.

> method font_get_keep_rounding_remainders(font_rid: RID) -> bool ; qualifiers=const

Returns glyph position rounding behavior. If set to `true`, when aligning glyphs to the pixel boundaries rounding remainders are accumulated to ensure more uniform glyph distribution. This setting has no effect if subpixel positioning is enabled.

> method font_get_kerning(font_rid: RID, size: int, glyph_pair: Vector2i) -> Vector2 ; qualifiers=const

Returns kerning for the pair of glyphs.

> method font_get_kerning_list(font_rid: RID, size: int) -> Array[Vector2i] ; qualifiers=const

Returns list of the kerning overrides.

> method font_get_language_support_override(font_rid: RID, language: String) -> bool

Returns `true` if support override is enabled for the `language`.

> method font_get_language_support_overrides(font_rid: RID) -> PackedStringArray

Returns list of language support overrides.

> method font_get_msdf_pixel_range(font_rid: RID) -> int ; qualifiers=const

Returns the width of the range around the shape between the minimum and maximum representable signed distance.

> method font_get_msdf_size(font_rid: RID) -> int ; qualifiers=const

Returns source font size used to generate MSDF textures.

> method font_get_name(font_rid: RID) -> String ; qualifiers=const

Returns font family name.

> method font_get_opentype_feature_overrides(font_rid: RID) -> Dictionary ; qualifiers=const

Returns font OpenType feature set override.

> method font_get_ot_name_strings(font_rid: RID) -> Dictionary ; qualifiers=const

Returns `Dictionary` with OpenType font name strings (localized font names, version, description, license information, sample text, etc.).

> method font_get_oversampling(font_rid: RID) -> float ; qualifiers=const

Returns oversampling factor override. If set to a positive value, overrides the oversampling factor of the viewport this font is used in. See `Viewport.oversampling`. This value doesn't override the `oversampling` parameter of `draw_*` methods. Used by dynamic fonts only.

> method font_get_palette_colors(font_rid: RID, index: int) -> PackedColorArray ; qualifiers=const

Returns the array in the predefined color palette at `index`. Palette contains all colors used to render font glyphs. Each palette has the same number of colors. Colors can be overridden using `font_set_palette_custom_colors`.

> method font_get_palette_count(font_rid: RID) -> int ; qualifiers=const

Returns the number of predefined color palettes. Palette contains all colors used to render font glyphs. Each palette has the same number of colors.

> method font_get_palette_custom_colors(font_rid: RID) -> PackedColorArray ; qualifiers=const

Returns array of custom colors to override predefined palette.

> method font_get_palette_name(font_rid: RID, index: int) -> String ; qualifiers=const

Returns the name of the predefined color palette at `index`. Palette contains all colors used to render font glyphs. Each palette has the same number of colors.

> method font_get_scale(font_rid: RID, size: int) -> float ; qualifiers=const

Returns scaling factor of the color bitmap font.

> method font_get_script_support_override(font_rid: RID, script: String) -> bool

Returns `true` if support override is enabled for the `script`.

> method font_get_script_support_overrides(font_rid: RID) -> PackedStringArray

Returns list of script support overrides.

> method font_get_size_cache_info(font_rid: RID) -> Array[Dictionary] ; qualifiers=const

Returns font cache information, each entry contains the following fields: `Vector2i size_px` - font size in pixels, `float viewport_oversampling` - viewport oversampling factor, `int glyphs` - number of rendered glyphs, `int textures` - number of used textures, `int textures_size` - size of texture data in bytes.

> method font_get_size_cache_list(font_rid: RID) -> Array[Vector2i] ; qualifiers=const

Returns list of the font sizes in the cache. Each size is `Vector2i` with font size and outline size.

> method font_get_spacing(font_rid: RID, spacing: SpacingType) -> int ; qualifiers=const

Returns the spacing for `spacing` in pixels (not relative to the font size).

> method font_get_stretch(font_rid: RID) -> int ; qualifiers=const

Returns font stretch amount, compared to a normal width. A percentage value between `50%` and `200%`.

> method font_get_style(font_rid: RID) -> BitField[FontStyle] ; qualifiers=const

Returns font style flags.

> method font_get_style_name(font_rid: RID) -> String ; qualifiers=const

Returns font style name.

> method font_get_subpixel_positioning(font_rid: RID) -> SubpixelPositioning ; qualifiers=const

Returns font subpixel glyph positioning mode.

> method font_get_supported_chars(font_rid: RID) -> String ; qualifiers=const

Returns a string containing all the characters available in the font.

> method font_get_supported_glyphs(font_rid: RID) -> PackedInt32Array ; qualifiers=const

Returns an array containing all glyph indices in the font.

> method font_get_texture_count(font_rid: RID, size: Vector2i) -> int ; qualifiers=const

Returns number of textures used by font cache entry.

> method font_get_texture_image(font_rid: RID, size: Vector2i, texture_index: int) -> Image ; qualifiers=const

Returns font cache texture image data.

> method font_get_texture_offsets(font_rid: RID, size: Vector2i, texture_index: int) -> PackedInt32Array ; qualifiers=const

Returns array containing glyph packing data.

> method font_get_transform(font_rid: RID) -> Transform2D ; qualifiers=const

Returns 2D transform applied to the font outlines.

> method font_get_underline_position(font_rid: RID, size: int) -> float ; qualifiers=const

Returns pixel offset of the underline below the baseline.

> method font_get_underline_thickness(font_rid: RID, size: int) -> float ; qualifiers=const

Returns thickness of the underline in pixels.

> method font_get_used_palette(font_rid: RID) -> int ; qualifiers=const

Returns used palette index.

> method font_get_variation_coordinates(font_rid: RID) -> Dictionary ; qualifiers=const

Returns variation coordinates for the specified font cache entry. See `font_supported_variation_list` for more info.

> method font_get_weight(font_rid: RID) -> int ; qualifiers=const

Returns weight (boldness) of the font. A value in the `100...999` range, normal font weight is `400`, bold font weight is `700`.

> method font_has_char(font_rid: RID, char: int) -> bool ; qualifiers=const

Returns `true` if a Unicode `char` is available in the font.

> method font_is_allow_system_fallback(font_rid: RID) -> bool ; qualifiers=const

Returns `true` if system fonts can be automatically used as fallbacks.

> method font_is_force_autohinter(font_rid: RID) -> bool ; qualifiers=const

Returns `true` if auto-hinting is supported and preferred over font built-in hinting. Used by dynamic fonts only.

> method font_is_language_supported(font_rid: RID, language: String) -> bool ; qualifiers=const

Returns `true` if the font supports the given language (as a [ISO 639](https://en.wikipedia.org/wiki/ISO_639-1) code).

> method font_is_modulate_color_glyphs(font_rid: RID) -> bool ; qualifiers=const

Returns `true` if color modulation is applied when drawing the font's colored glyphs.

> method font_is_multichannel_signed_distance_field(font_rid: RID) -> bool ; qualifiers=const

Returns `true` if glyphs of all sizes are rendered using single multichannel signed distance field generated from the dynamic font vector data.

> method font_is_script_supported(font_rid: RID, script: String) -> bool ; qualifiers=const

Returns `true` if the font supports the given script (as a [ISO 15924](https://en.wikipedia.org/wiki/ISO_15924) code).

> method font_remove_glyph(font_rid: RID, size: Vector2i, glyph: int) -> void

Removes specified rendered glyph information from the cache entry.
**Note:** This function will not remove textures associated with the glyphs, use `font_remove_texture` to remove them manually.

> method font_remove_kerning(font_rid: RID, size: int, glyph_pair: Vector2i) -> void

Removes kerning override for the pair of glyphs.

> method font_remove_language_support_override(font_rid: RID, language: String) -> void

Remove language support override.

> method font_remove_script_support_override(font_rid: RID, script: String) -> void

Removes script support override.

> method font_remove_size_cache(font_rid: RID, size: Vector2i) -> void

Removes specified font size from the cache entry.

> method font_remove_texture(font_rid: RID, size: Vector2i, texture_index: int) -> void

Removes specified texture from the cache entry.
**Note:** This function will not remove glyphs associated with the texture, remove them manually, using `font_remove_glyph`.

> method font_render_glyph(font_rid: RID, size: Vector2i, index: int) -> void

Renders specified glyph to the font cache texture.

> method font_render_range(font_rid: RID, size: Vector2i, start: int, end: int) -> void

Renders the range of characters to the font cache texture.

> method font_set_allow_system_fallback(font_rid: RID, allow_system_fallback: bool) -> void

If set to `true`, system fonts can be automatically used as fallbacks.

> method font_set_antialiasing(font_rid: RID, antialiasing: FontAntialiasing) -> void

Sets font anti-aliasing mode.

> method font_set_ascent(font_rid: RID, size: int, ascent: float) -> void

Sets the font ascent (number of pixels above the baseline).

> method font_set_baseline_offset(font_rid: RID, baseline_offset: float) -> void

Sets extra baseline offset (as a fraction of font height).

> method font_set_data(font_rid: RID, data: PackedByteArray) -> void

Sets font source data, e.g contents of the dynamic font source file.

> method font_set_descent(font_rid: RID, size: int, descent: float) -> void

Sets the font descent (number of pixels below the baseline).

> method font_set_disable_embedded_bitmaps(font_rid: RID, disable_embedded_bitmaps: bool) -> void

If set to `true`, embedded font bitmap loading is disabled (bitmap-only and color fonts ignore this property).

> method font_set_embolden(font_rid: RID, strength: float) -> void

Sets font embolden strength. If `strength` is not equal to zero, emboldens the font outlines. Negative values reduce the outline thickness.

> method font_set_face_index(font_rid: RID, face_index: int) -> void

Sets an active face index in the TrueType / OpenType collection.

> method font_set_fixed_size(font_rid: RID, fixed_size: int) -> void

Sets bitmap font fixed size. If set to value greater than zero, same cache entry will be used for all font sizes.

> method font_set_fixed_size_scale_mode(font_rid: RID, fixed_size_scale_mode: FixedSizeScaleMode) -> void

Sets bitmap font scaling mode. This property is used only if `fixed_size` is greater than zero.

> method font_set_force_autohinter(font_rid: RID, force_autohinter: bool) -> void

If set to `true` auto-hinting is preferred over font built-in hinting.

> method font_set_generate_mipmaps(font_rid: RID, generate_mipmaps: bool) -> void

If set to `true` font texture mipmap generation is enabled.

> method font_set_global_oversampling(oversampling: float) -> void ; deprecated=Use `Viewport` oversampling, or the `oversampling` argument of the `draw_*` methods instead.

This method does nothing.

> method font_set_glyph_advance(font_rid: RID, size: int, glyph: int, advance: Vector2) -> void

Sets glyph advance (offset of the next glyph).
**Note:** Advance for glyphs outlines is the same as the base glyph advance and is not saved.

> method font_set_glyph_offset(font_rid: RID, size: Vector2i, glyph: int, offset: Vector2) -> void

Sets glyph offset from the baseline.

> method font_set_glyph_size(font_rid: RID, size: Vector2i, glyph: int, gl_size: Vector2) -> void

Sets size of the glyph.

> method font_set_glyph_texture_idx(font_rid: RID, size: Vector2i, glyph: int, texture_idx: int) -> void

Sets index of the cache texture containing the glyph.

> method font_set_glyph_uv_rect(font_rid: RID, size: Vector2i, glyph: int, uv_rect: Rect2) -> void

Sets rectangle in the cache texture containing the glyph.

> method font_set_hinting(font_rid: RID, hinting: Hinting) -> void

Sets font hinting mode. Used by dynamic fonts only.

> method font_set_keep_rounding_remainders(font_rid: RID, keep_rounding_remainders: bool) -> void

Sets glyph position rounding behavior. If set to `true`, when aligning glyphs to the pixel boundaries rounding remainders are accumulated to ensure more uniform glyph distribution. This setting has no effect if subpixel positioning is enabled.

> method font_set_kerning(font_rid: RID, size: int, glyph_pair: Vector2i, kerning: Vector2) -> void

Sets kerning for the pair of glyphs.

> method font_set_language_support_override(font_rid: RID, language: String, supported: bool) -> void

Adds override for `font_is_language_supported`.

> method font_set_modulate_color_glyphs(font_rid: RID, modulate: bool) -> void

If set to `true`, color modulation is applied when drawing colored glyphs, otherwise it's applied to the monochrome glyphs only.

> method font_set_msdf_pixel_range(font_rid: RID, msdf_pixel_range: int) -> void

Sets the width of the range around the shape between the minimum and maximum representable signed distance.

> method font_set_msdf_size(font_rid: RID, msdf_size: int) -> void

Sets source font size used to generate MSDF textures.

> method font_set_multichannel_signed_distance_field(font_rid: RID, msdf: bool) -> void

If set to `true`, glyphs of all sizes are rendered using single multichannel signed distance field generated from the dynamic font vector data. MSDF rendering allows displaying the font at any scaling factor without blurriness, and without incurring a CPU cost when the font size changes (since the font no longer needs to be rasterized on the CPU). As a downside, font hinting is not available with MSDF. The lack of font hinting may result in less crisp and less readable fonts at small sizes.
**Note:** MSDF font rendering does not render glyphs with overlapping shapes correctly. Overlapping shapes are not valid per the OpenType standard, but are still commonly found in many font files, especially those converted by Google Fonts. To avoid issues with overlapping glyphs, consider downloading the font file directly from the type foundry instead of relying on Google Fonts.

> method font_set_name(font_rid: RID, name: String) -> void

Sets the font family name.

> method font_set_opentype_feature_overrides(font_rid: RID, overrides: Dictionary) -> void

Sets font OpenType feature set override.

> method font_set_oversampling(font_rid: RID, oversampling: float) -> void

If set to a positive value, overrides the oversampling factor of the viewport this font is used in. See `Viewport.oversampling`. This value doesn't override the `oversampling` parameter of `draw_*` methods. Used by dynamic fonts only.

> method font_set_palette_custom_colors(font_rid: RID, colors: PackedColorArray) -> void

Sets array of custom colors to override predefined palette. Set to empty array to reset overrides. Use `Color(0, 0, 0, 0)`, to keep predefined palette color at specific position.

> method font_set_scale(font_rid: RID, size: int, scale: float) -> void

Sets scaling factor of the color bitmap font.

> method font_set_script_support_override(font_rid: RID, script: String, supported: bool) -> void

Adds override for `font_is_script_supported`.

> method font_set_spacing(font_rid: RID, spacing: SpacingType, value: int) -> void

Sets the spacing for `spacing` to `value` in pixels (not relative to the font size).

> method font_set_stretch(font_rid: RID, weight: int) -> void

Sets font stretch amount, compared to a normal width. A percentage value between `50%` and `200%`.
**Note:** This value is used for font matching only and will not affect font rendering. Use `font_set_face_index`, `font_set_variation_coordinates`, or `font_set_transform` instead.

> method font_set_style(font_rid: RID, style: BitField[FontStyle]) -> void

Sets the font style flags.
**Note:** This value is used for font matching only and will not affect font rendering. Use `font_set_face_index`, `font_set_variation_coordinates`, `font_set_embolden`, or `font_set_transform` instead.

> method font_set_style_name(font_rid: RID, name: String) -> void

Sets the font style name.

> method font_set_subpixel_positioning(font_rid: RID, subpixel_positioning: SubpixelPositioning) -> void

Sets font subpixel glyph positioning mode.

> method font_set_texture_image(font_rid: RID, size: Vector2i, texture_index: int, image: Image) -> void

Sets font cache texture image data.

> method font_set_texture_offsets(font_rid: RID, size: Vector2i, texture_index: int, offset: PackedInt32Array) -> void

Sets array containing glyph packing data.

> method font_set_transform(font_rid: RID, transform: Transform2D) -> void

Sets 2D transform, applied to the font outlines, can be used for slanting, flipping, and rotating glyphs.
For example, to simulate italic typeface by slanting, apply the following transform `Transform2D(1.0, slant, 0.0, 1.0, 0.0, 0.0)`.

> method font_set_underline_position(font_rid: RID, size: int, underline_position: float) -> void

Sets pixel offset of the underline below the baseline.

> method font_set_underline_thickness(font_rid: RID, size: int, underline_thickness: float) -> void

Sets thickness of the underline in pixels.

> method font_set_used_palette(font_rid: RID, index: int) -> void

Sets used palette index.

> method font_set_variation_coordinates(font_rid: RID, variation_coordinates: Dictionary) -> void

Sets variation coordinates for the specified font cache entry. See `font_supported_variation_list` for more info.

> method font_set_weight(font_rid: RID, weight: int) -> void

Sets weight (boldness) of the font. A value in the `100...999` range, normal font weight is `400`, bold font weight is `700`.
**Note:** This value is used for font matching only and will not affect font rendering. Use `font_set_face_index`, `font_set_variation_coordinates`, or `font_set_embolden` instead.

> method font_supported_feature_list(font_rid: RID) -> Dictionary ; qualifiers=const

Returns the dictionary of the supported OpenType features.

> method font_supported_variation_list(font_rid: RID) -> Dictionary ; qualifiers=const

Returns the dictionary of the supported OpenType variation coordinates.

> method format_number(number: String, language: String = "") -> String ; qualifiers=const ; deprecated=Use `TranslationServer.format_number` instead.

Converts a number from Western Arabic (0..9) to the numeral system used in the given `language`.
If `language` is an empty string, the active locale will be used.

> method free_rid(rid: RID) -> void

Frees an object created by this `TextServer`.

> method get_features() -> int ; qualifiers=const

Returns text server features, see `Feature`.

> method get_hex_code_box_size(size: int, index: int) -> Vector2 ; qualifiers=const

Returns size of the replacement character (box with character hexadecimal code that is drawn in place of invalid characters).

> method get_name() -> String ; qualifiers=const

Returns the name of the server interface.

> method get_support_data() -> PackedByteArray ; qualifiers=const

Returns default TextServer database (e.g. ICU break iterators and dictionaries).

> method get_support_data_filename() -> String ; qualifiers=const

Returns default TextServer database (e.g. ICU break iterators and dictionaries) filename.

> method get_support_data_info() -> String ; qualifiers=const

Returns TextServer database (e.g. ICU break iterators and dictionaries) description.

> method has(rid: RID) -> bool

Returns `true` if `rid` is valid resource owned by this text server.

> method has_feature(feature: Feature) -> bool ; qualifiers=const

Returns `true` if the server supports a feature.

> method is_confusable(string: String, dict: PackedStringArray) -> int ; qualifiers=const

Returns index of the first string in `dict` which is visually confusable with the `string`, or `-1` if none is found.
**Note:** This method doesn't detect invisible characters, for spoof detection use it in combination with `spoof_check`.
**Note:** Always returns `-1` if the server does not support the `FEATURE_UNICODE_SECURITY` feature.

> method is_locale_right_to_left(locale: String) -> bool ; qualifiers=const

Returns `true` if locale is right-to-left.

> method is_locale_using_support_data(locale: String) -> bool ; qualifiers=const

Returns `true` if the locale requires text server support data for line/word breaking.

> method is_valid_identifier(string: String) -> bool ; qualifiers=const

Returns `true` if `string` is a valid identifier.
If the text server supports the `FEATURE_UNICODE_IDENTIFIERS` feature, a valid identifier must:
- Conform to normalization form C.
- Begin with a Unicode character of class XID_Start or `"_"`.
- May contain Unicode characters of class XID_Continue in the other positions.
- Use UAX #31 recommended scripts only (mixed scripts are allowed).
If the `FEATURE_UNICODE_IDENTIFIERS` feature is not supported, a valid identifier must:
- Begin with a Unicode character of class XID_Start or `"_"`.
- May contain Unicode characters of class XID_Continue in the other positions.

> method is_valid_letter(unicode: int) -> bool ; qualifiers=const

Returns `true` if the given code point is a valid letter, i.e. it belongs to the Unicode category "L".

> method load_support_data(filename: String) -> bool

Loads optional TextServer database (e.g. ICU break iterators and dictionaries).
**Note:** This function should be called before any other TextServer functions used, otherwise it won't have any effect.

> method name_to_tag(name: String) -> int ; qualifiers=const

Converts the given readable name of a feature, variation, script, or language to an OpenType tag.

> method parse_number(number: String, language: String = "") -> String ; qualifiers=const ; deprecated=Use `TranslationServer.parse_number` instead.

Converts `number` from the numeral system used in the given `language` to Western Arabic (0..9).
If `language` is an empty string, the active locale will be used.

> method parse_structured_text(parser_type: StructuredTextParser, args: Array, text: String) -> Array[Vector3i] ; qualifiers=const

Default implementation of the BiDi algorithm override function.

> method percent_sign(language: String = "") -> String ; qualifiers=const ; deprecated=Use `TranslationServer.get_percent_sign` instead.

Returns the percent sign used in the given `language`.
If `language` is an empty string, the active locale will be used.

> method save_support_data(filename: String) -> bool ; qualifiers=const

Saves optional TextServer database (e.g. ICU break iterators and dictionaries) to the file.
**Note:** This function is used by during project export, to include TextServer database.

> method shaped_get_run_count(shaped: RID) -> int ; qualifiers=const

Returns the number of uniform text runs in the buffer.

> method shaped_get_run_direction(shaped: RID, index: int) -> Direction ; qualifiers=const

Returns the direction of the `index` text run (in visual order).

> method shaped_get_run_font_rid(shaped: RID, index: int) -> RID ; qualifiers=const

Returns the font RID of the `index` text run (in visual order).

> method shaped_get_run_font_size(shaped: RID, index: int) -> int ; qualifiers=const

Returns the font size of the `index` text run (in visual order).

> method shaped_get_run_glyph_range(shaped: RID, index: int) -> Vector2i ; qualifiers=const

Returns the glyph range of the `index` text run (in visual order).

> method shaped_get_run_language(shaped: RID, index: int) -> String ; qualifiers=const

Returns the language of the `index` text run (in visual order).

> method shaped_get_run_object(shaped: RID, index: int) -> Variant ; qualifiers=const

Returns the embedded object of the `index` text run (in visual order).

> method shaped_get_run_range(shaped: RID, index: int) -> Vector2i ; qualifiers=const

Returns the source text range of the `index` text run (in visual order).

> method shaped_get_run_text(shaped: RID, index: int) -> String ; qualifiers=const

Returns the source text of the `index` text run (in visual order).

> method shaped_get_span_count(shaped: RID) -> int ; qualifiers=const

Returns number of text spans added using `shaped_text_add_string` or `shaped_text_add_object`.

> method shaped_get_span_embedded_object(shaped: RID, index: int) -> Variant ; qualifiers=const

Returns text embedded object key.

> method shaped_get_span_meta(shaped: RID, index: int) -> Variant ; qualifiers=const

Returns text span metadata.

> method shaped_get_span_object(shaped: RID, index: int) -> Variant ; qualifiers=const

Returns the text span embedded object key.

> method shaped_get_span_text(shaped: RID, index: int) -> String ; qualifiers=const

Returns the text span source text.

> method shaped_get_text(shaped: RID) -> String ; qualifiers=const

Returns the text buffer source text, including object replacement characters.

> method shaped_set_span_update_font(shaped: RID, index: int, fonts: Array[RID], size: int, opentype_features: Dictionary = {}) -> void

Changes text span font, font size, and OpenType features, without changing the text.

> method shaped_text_add_object(shaped: RID, key: Variant, size: Vector2, inline_align: InlineAlignment = 5, length: int = 1, baseline: float = 0.0) -> bool

Adds inline object to the text buffer, `key` must be unique. In the text, object is represented as `length` object replacement characters.

> method shaped_text_add_string(shaped: RID, text: String, fonts: Array[RID], size: int, opentype_features: Dictionary = {}, language: String = "", meta: Variant = null) -> bool

Adds text span and font to draw it to the text buffer.

> method shaped_text_clear(rid: RID) -> void

Clears text buffer (removes text and inline objects).

> method shaped_text_closest_character_pos(shaped: RID, pos: int) -> int ; qualifiers=const

Returns composite character position closest to the `pos`.

> method shaped_text_draw(shaped: RID, canvas: RID, pos: Vector2, clip_l: float = -1, clip_r: float = -1, color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draw shaped text into a canvas item at a given position, with `color`. `pos` specifies the leftmost point of the baseline (for horizontal layout) or topmost point of the baseline (for vertical layout). If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.
`clip_l` and `clip_r` are offsets relative to `pos`, going to the right in horizontal layout and downward in vertical layout. If `clip_l` is not negative, glyphs starting before the offset are clipped. If `clip_r` is not negative, glyphs ending after the offset are clipped.

> method shaped_text_draw_outline(shaped: RID, canvas: RID, pos: Vector2, clip_l: float = -1, clip_r: float = -1, outline_size: int = 1, color: Color = Color(1, 1, 1, 1), oversampling: float = 0.0) -> void ; qualifiers=const

Draw the outline of the shaped text into a canvas item at a given position, with `color`. `pos` specifies the leftmost point of the baseline (for horizontal layout) or topmost point of the baseline (for vertical layout). If `oversampling` is greater than zero, it is used as font oversampling factor, otherwise viewport oversampling settings are used.
`clip_l` and `clip_r` are offsets relative to `pos`, going to the right in horizontal layout and downward in vertical layout. If `clip_l` is not negative, glyphs starting before the offset are clipped. If `clip_r` is not negative, glyphs ending after the offset are clipped.

> method shaped_text_duplicate(rid: RID) -> RID

Duplicates shaped text buffer.

> method shaped_text_fit_to_width(shaped: RID, width: float, justification_flags: BitField[JustificationFlag] = 3) -> float

Adjusts text width to fit to specified width, returns new text width.

> method shaped_text_get_ascent(shaped: RID) -> float ; qualifiers=const

Returns the text ascent (number of pixels above the baseline for horizontal layout or to the left of baseline for vertical).
**Note:** Overall ascent can be higher than font ascent, if some glyphs are displaced from the baseline.

> method shaped_text_get_carets(shaped: RID, position: int) -> Dictionary ; qualifiers=const

Returns shapes of the carets corresponding to the character offset `position` in the text. Returned caret shape is 1 pixel wide rectangle.

> method shaped_text_get_character_breaks(shaped: RID) -> PackedInt32Array ; qualifiers=const

Returns array of the composite character boundaries.

> method shaped_text_get_custom_ellipsis(shaped: RID) -> int ; qualifiers=const

Returns ellipsis character used for text clipping.

> method shaped_text_get_custom_punctuation(shaped: RID) -> String ; qualifiers=const

Returns custom punctuation character list, used for word breaking. If set to empty string, server defaults are used.

> method shaped_text_get_descent(shaped: RID) -> float ; qualifiers=const

Returns the text descent (number of pixels below the baseline for horizontal layout or to the right of baseline for vertical).
**Note:** Overall descent can be higher than font descent, if some glyphs are displaced from the baseline.

> method shaped_text_get_direction(shaped: RID) -> Direction ; qualifiers=const

Returns direction of the text.

> method shaped_text_get_dominant_direction_in_range(shaped: RID, start: int, end: int) -> Direction ; qualifiers=const

Returns dominant direction of in the range of text.

> method shaped_text_get_ellipsis_glyph_count(shaped: RID) -> int ; qualifiers=const

Returns number of glyphs in the ellipsis.

> method shaped_text_get_ellipsis_glyphs(shaped: RID) -> Array[Dictionary] ; qualifiers=const

Returns array of the glyphs in the ellipsis.

> method shaped_text_get_ellipsis_pos(shaped: RID) -> int ; qualifiers=const

Returns position of the ellipsis.

> method shaped_text_get_glyph_count(shaped: RID) -> int ; qualifiers=const

Returns number of glyphs in the buffer.

> method shaped_text_get_glyphs(shaped: RID) -> Array[Dictionary] ; qualifiers=const

Returns an array of glyphs in the visual order.

> method shaped_text_get_grapheme_bounds(shaped: RID, pos: int) -> Vector2 ; qualifiers=const

Returns composite character's bounds as offsets from the start of the line.

> method shaped_text_get_inferred_direction(shaped: RID) -> Direction ; qualifiers=const

Returns direction of the text, inferred by the BiDi algorithm.

> method shaped_text_get_line_breaks(shaped: RID, width: float, start: int = 0, break_flags: BitField[LineBreakFlag] = 3) -> PackedInt32Array ; qualifiers=const

Breaks text to the lines and returns character ranges for each line.

> method shaped_text_get_line_breaks_adv(shaped: RID, width: PackedFloat32Array, start: int = 0, once: bool = true, break_flags: BitField[LineBreakFlag] = 3) -> PackedInt32Array ; qualifiers=const

Breaks text to the lines and columns. Returns character ranges for each segment.

> method shaped_text_get_object_glyph(shaped: RID, key: Variant) -> int ; qualifiers=const

Returns the glyph index of the inline object.

> method shaped_text_get_object_range(shaped: RID, key: Variant) -> Vector2i ; qualifiers=const

Returns the character range of the inline object.

> method shaped_text_get_object_rect(shaped: RID, key: Variant) -> Rect2 ; qualifiers=const

Returns bounding rectangle of the inline object.

> method shaped_text_get_objects(shaped: RID) -> Array ; qualifiers=const

Returns array of inline objects.

> method shaped_text_get_orientation(shaped: RID) -> Orientation ; qualifiers=const

Returns text orientation.

> method shaped_text_get_parent(shaped: RID) -> RID ; qualifiers=const

Returns the parent buffer from which the substring originates.

> method shaped_text_get_preserve_control(shaped: RID) -> bool ; qualifiers=const

Returns `true` if text buffer is configured to display control characters.

> method shaped_text_get_preserve_invalid(shaped: RID) -> bool ; qualifiers=const

Returns `true` if text buffer is configured to display hexadecimal codes in place of invalid characters.
**Note:** If set to `false`, nothing is displayed in place of invalid characters.

> method shaped_text_get_range(shaped: RID) -> Vector2i ; qualifiers=const

Returns substring buffer character range in the parent buffer.

> method shaped_text_get_selection(shaped: RID, start: int, end: int) -> PackedVector2Array ; qualifiers=const

Returns selection rectangles for the specified character range.

> method shaped_text_get_size(shaped: RID) -> Vector2 ; qualifiers=const

Returns size of the text.

> method shaped_text_get_spacing(shaped: RID, spacing: SpacingType) -> int ; qualifiers=const

Returns extra spacing added between glyphs or lines in pixels.

> method shaped_text_get_trim_pos(shaped: RID) -> int ; qualifiers=const

Returns the position of the overrun trim.

> method shaped_text_get_underline_position(shaped: RID) -> float ; qualifiers=const

Returns pixel offset of the underline below the baseline.

> method shaped_text_get_underline_thickness(shaped: RID) -> float ; qualifiers=const

Returns thickness of the underline.

> method shaped_text_get_width(shaped: RID) -> float ; qualifiers=const

Returns width (for horizontal layout) or height (for vertical) of the text.

> method shaped_text_get_word_breaks(shaped: RID, grapheme_flags: BitField[GraphemeFlag] = 264, skip_grapheme_flags: BitField[GraphemeFlag] = 4) -> PackedInt32Array ; qualifiers=const

Breaks text into words and returns array of character ranges. Use `grapheme_flags` to set what characters are used for breaking.

> method shaped_text_has_object(shaped: RID, key: Variant) -> bool ; qualifiers=const

Returns `true` if an object with `key` is embedded in this shaped text buffer.

> method shaped_text_has_visible_chars(shaped: RID) -> bool ; qualifiers=const

Returns `true` if text buffer contains any visible characters.

> method shaped_text_hit_test_grapheme(shaped: RID, coords: float) -> int ; qualifiers=const

Returns grapheme index at the specified pixel offset at the baseline, or `-1` if none is found.

> method shaped_text_hit_test_position(shaped: RID, coords: float) -> int ; qualifiers=const

Returns caret character offset at the specified pixel offset at the baseline. This function always returns a valid position.

> method shaped_text_is_ready(shaped: RID) -> bool ; qualifiers=const

Returns `true` if buffer is successfully shaped.

> method shaped_text_next_character_pos(shaped: RID, pos: int) -> int ; qualifiers=const

Returns composite character end position closest to the `pos`.

> method shaped_text_next_grapheme_pos(shaped: RID, pos: int) -> int ; qualifiers=const

Returns grapheme end position closest to the `pos`.

> method shaped_text_overrun_trim_to_width(shaped: RID, width: float = 0, overrun_trim_flags: BitField[TextOverrunFlag] = 0) -> void

Trims text if it exceeds the given width.

> method shaped_text_prev_character_pos(shaped: RID, pos: int) -> int ; qualifiers=const

Returns composite character start position closest to the `pos`.

> method shaped_text_prev_grapheme_pos(shaped: RID, pos: int) -> int ; qualifiers=const

Returns grapheme start position closest to the `pos`.

> method shaped_text_resize_object(shaped: RID, key: Variant, size: Vector2, inline_align: InlineAlignment = 5, baseline: float = 0.0) -> bool

Sets new size and alignment of embedded object.

> method shaped_text_set_bidi_override(shaped: RID, override: Array) -> void

Overrides BiDi for the structured text.
Override ranges should cover full source text without overlaps. BiDi algorithm will be used on each range separately.

> method shaped_text_set_custom_ellipsis(shaped: RID, char: int) -> void

Sets ellipsis character used for text clipping.

> method shaped_text_set_custom_punctuation(shaped: RID, punct: String) -> void

Sets custom punctuation character list, used for word breaking. If set to empty string, server defaults are used.

> method shaped_text_set_direction(shaped: RID, direction: Direction = 0) -> void

Sets desired text direction. If set to `DIRECTION_AUTO`, direction will be detected based on the buffer contents and current locale.
**Note:** Direction is ignored if server does not support `FEATURE_BIDI_LAYOUT` feature (supported by `TextServerAdvanced`).

> method shaped_text_set_orientation(shaped: RID, orientation: Orientation = 0) -> void

Sets desired text orientation.
**Note:** Orientation is ignored if server does not support `FEATURE_VERTICAL_LAYOUT` feature (supported by `TextServerAdvanced`).

> method shaped_text_set_preserve_control(shaped: RID, enabled: bool) -> void

If set to `true` text buffer will display control characters.

> method shaped_text_set_preserve_invalid(shaped: RID, enabled: bool) -> void

If set to `true` text buffer will display invalid characters as hexadecimal codes, otherwise nothing is displayed.

> method shaped_text_set_spacing(shaped: RID, spacing: SpacingType, value: int) -> void

Sets extra spacing added between glyphs or lines in pixels.

> method shaped_text_shape(shaped: RID) -> bool

Shapes buffer if it's not shaped. Returns `true` if the string is shaped successfully.
**Note:** It is not necessary to call this function manually, buffer will be shaped automatically as soon as any of its output data is requested.

> method shaped_text_sort_logical(shaped: RID) -> Array[Dictionary]

Returns text glyphs in the logical order.

> method shaped_text_substr(shaped: RID, start: int, length: int) -> RID ; qualifiers=const

Returns text buffer for the substring of the text in the `shaped` text buffer (including inline objects).

> method shaped_text_tab_align(shaped: RID, tab_stops: PackedFloat32Array) -> float

Aligns shaped text to the given tab-stops.

> method spoof_check(string: String) -> bool ; qualifiers=const

Returns `true` if `string` is likely to be an attempt at confusing the reader.
**Note:** Always returns `false` if the server does not support the `FEATURE_UNICODE_SECURITY` feature.

> method string_get_character_breaks(string: String, language: String = "") -> PackedInt32Array ; qualifiers=const

Returns array of the composite character boundaries.

```text
                var ts = TextServerManager.get_primary_interface()
                print(ts.string_get_character_breaks("Test ❤️‍🔥 Test")) # Prints [1, 2, 3, 4, 5, 9, 10, 11, 12, 13, 14]

```

> method string_get_word_breaks(string: String, language: String = "", chars_per_line: int = 0) -> PackedInt32Array ; qualifiers=const

Returns an array of the word break boundaries. Elements in the returned array are the offsets of the start and end of words. Therefore the length of the array is always even.
When `chars_per_line` is greater than zero, line break boundaries are returned instead.

```text
                var ts = TextServerManager.get_primary_interface()
                # Corresponds to the substrings "The", "Godot", "Engine", and "4".
                print(ts.string_get_word_breaks("The Godot Engine, 4")) # Prints [0, 3, 4, 9, 10, 16, 18, 19]
                # Corresponds to the substrings "The", "Godot", "Engin", and "e, 4".
                print(ts.string_get_word_breaks("The Godot Engine, 4", "en", 5)) # Prints [0, 3, 4, 9, 10, 15, 15, 19]
                # Corresponds to the substrings "The Godot" and "Engine, 4".
                print(ts.string_get_word_breaks("The Godot Engine, 4", "en", 10)) # Prints [0, 9, 10, 19]

```

> method string_to_lower(string: String, language: String = "") -> String ; qualifiers=const

Returns the string converted to `lowercase`.
**Note:** Casing is locale dependent and context sensitive if server support `FEATURE_CONTEXT_SENSITIVE_CASE_CONVERSION` feature (supported by `TextServerAdvanced`).
**Note:** The result may be longer or shorter than the original.

> method string_to_title(string: String, language: String = "") -> String ; qualifiers=const

Returns the string converted to `Title Case`.
**Note:** Casing is locale dependent and context sensitive if server support `FEATURE_CONTEXT_SENSITIVE_CASE_CONVERSION` feature (supported by `TextServerAdvanced`).
**Note:** The result may be longer or shorter than the original.

> method string_to_upper(string: String, language: String = "") -> String ; qualifiers=const

Returns the string converted to `UPPERCASE`.
**Note:** Casing is locale dependent and context sensitive if server support `FEATURE_CONTEXT_SENSITIVE_CASE_CONVERSION` feature (supported by `TextServerAdvanced`).
**Note:** The result may be longer or shorter than the original.

> method strip_diacritics(string: String) -> String ; qualifiers=const

Strips diacritics from the string.
**Note:** The result may be longer or shorter than the original.

> method tag_to_name(tag: int) -> String ; qualifiers=const

Converts the given OpenType tag to the readable name of a feature, variation, script, or language.

## Enumerations

> enum AutowrapMode

> enum_value AutowrapMode.AUTOWRAP_OFF = 0

Autowrap is disabled.

> enum_value AutowrapMode.AUTOWRAP_ARBITRARY = 1

Wraps the text inside the node's bounding rectangle by allowing to break lines at arbitrary positions, which is useful when very limited space is available.

> enum_value AutowrapMode.AUTOWRAP_WORD = 2

Wraps the text inside the node's bounding rectangle by soft-breaking between words.

> enum_value AutowrapMode.AUTOWRAP_WORD_SMART = 3

Behaves similarly to `AUTOWRAP_WORD`, but force-breaks a word if that single word does not fit in one line.

> enum ContourPointTag

> enum_value ContourPointTag.CONTOUR_CURVE_TAG_ON = 1

Contour point is on the curve.

> enum_value ContourPointTag.CONTOUR_CURVE_TAG_OFF_CONIC = 0

Contour point isn't on the curve, but serves as a control point for a conic (quadratic) Bézier arc.

> enum_value ContourPointTag.CONTOUR_CURVE_TAG_OFF_CUBIC = 2

Contour point isn't on the curve, but serves as a control point for a cubic Bézier arc.

> enum Direction

> enum_value Direction.DIRECTION_AUTO = 0

Text direction is determined based on contents and current locale.

> enum_value Direction.DIRECTION_LTR = 1

Text is written from left to right.

> enum_value Direction.DIRECTION_RTL = 2

Text is written from right to left.

> enum_value Direction.DIRECTION_INHERITED = 3

Text writing direction is the same as base string writing direction. Used for BiDi override only.

> enum Feature

> enum_value Feature.FEATURE_SIMPLE_LAYOUT = 1

TextServer supports simple text layouts.

> enum_value Feature.FEATURE_BIDI_LAYOUT = 2

TextServer supports bidirectional text layouts.

> enum_value Feature.FEATURE_VERTICAL_LAYOUT = 4

TextServer supports vertical layouts.

> enum_value Feature.FEATURE_SHAPING = 8

TextServer supports complex text shaping.

> enum_value Feature.FEATURE_KASHIDA_JUSTIFICATION = 16

TextServer supports justification using kashidas.

> enum_value Feature.FEATURE_BREAK_ITERATORS = 32

TextServer supports complex line/word breaking rules (e.g. dictionary based).

> enum_value Feature.FEATURE_FONT_BITMAP = 64

TextServer supports loading bitmap fonts.

> enum_value Feature.FEATURE_FONT_DYNAMIC = 128

TextServer supports loading dynamic (TrueType, OpeType, etc.) fonts.

> enum_value Feature.FEATURE_FONT_MSDF = 256

TextServer supports multichannel signed distance field dynamic font rendering.

> enum_value Feature.FEATURE_FONT_SYSTEM = 512

TextServer supports loading system fonts.

> enum_value Feature.FEATURE_FONT_VARIABLE = 1024

TextServer supports variable fonts.

> enum_value Feature.FEATURE_CONTEXT_SENSITIVE_CASE_CONVERSION = 2048

TextServer supports locale dependent and context sensitive case conversion.

> enum_value Feature.FEATURE_USE_SUPPORT_DATA = 4096

TextServer require external data file for some features, see `load_support_data`.

> enum_value Feature.FEATURE_UNICODE_IDENTIFIERS = 8192

TextServer supports UAX #31 identifier validation, see `is_valid_identifier`.

> enum_value Feature.FEATURE_UNICODE_SECURITY = 16384

TextServer supports [Unicode Technical Report #36](https://unicode.org/reports/tr36/) and [Unicode Technical Standard #39](https://unicode.org/reports/tr39/) based spoof detection features.

> enum FixedSizeScaleMode

> enum_value FixedSizeScaleMode.FIXED_SIZE_SCALE_DISABLE = 0

Bitmap font is not scaled.

> enum_value FixedSizeScaleMode.FIXED_SIZE_SCALE_INTEGER_ONLY = 1

Bitmap font is scaled to the closest integer multiple of the font's fixed size. This is the recommended option for pixel art fonts.

> enum_value FixedSizeScaleMode.FIXED_SIZE_SCALE_ENABLED = 2

Bitmap font is scaled to an arbitrary (fractional) size. This is the recommended option for non-pixel art fonts.

> enum FontAntialiasing

> enum_value FontAntialiasing.FONT_ANTIALIASING_NONE = 0

Font glyphs are rasterized as 1-bit bitmaps.

> enum_value FontAntialiasing.FONT_ANTIALIASING_GRAY = 1

Font glyphs are rasterized as 8-bit grayscale anti-aliased bitmaps.

> enum_value FontAntialiasing.FONT_ANTIALIASING_LCD = 2

Font glyphs are rasterized for LCD screens.
LCD subpixel layout is determined by the value of the `ProjectSettings.gui/theme/lcd_subpixel_layout` setting.
LCD subpixel anti-aliasing mode is suitable only for rendering horizontal, unscaled text in 2D.

> enum FontLCDSubpixelLayout

> enum_value FontLCDSubpixelLayout.FONT_LCD_SUBPIXEL_LAYOUT_NONE = 0

Unknown or unsupported subpixel layout, LCD subpixel antialiasing is disabled.

> enum_value FontLCDSubpixelLayout.FONT_LCD_SUBPIXEL_LAYOUT_HRGB = 1

Horizontal RGB subpixel layout.

> enum_value FontLCDSubpixelLayout.FONT_LCD_SUBPIXEL_LAYOUT_HBGR = 2

Horizontal BGR subpixel layout.

> enum_value FontLCDSubpixelLayout.FONT_LCD_SUBPIXEL_LAYOUT_VRGB = 3

Vertical RGB subpixel layout.

> enum_value FontLCDSubpixelLayout.FONT_LCD_SUBPIXEL_LAYOUT_VBGR = 4

Vertical BGR subpixel layout.

> enum_value FontLCDSubpixelLayout.FONT_LCD_SUBPIXEL_LAYOUT_MAX = 5

Represents the size of the `FontLCDSubpixelLayout` enum.

> enum FontStyle ; bitfield=true

> enum_value FontStyle.FONT_BOLD = 1

Font is bold.

> enum_value FontStyle.FONT_ITALIC = 2

Font is italic or oblique.

> enum_value FontStyle.FONT_FIXED_WIDTH = 4

Font has fixed-width characters (also known as monospace).

> enum GraphemeFlag ; bitfield=true

> enum_value GraphemeFlag.GRAPHEME_IS_VALID = 1

Grapheme is supported by the font, and can be drawn.

> enum_value GraphemeFlag.GRAPHEME_IS_RTL = 2

Grapheme is part of right-to-left or bottom-to-top run.

> enum_value GraphemeFlag.GRAPHEME_IS_VIRTUAL = 4

Grapheme is not part of source text, it was added by justification process.

> enum_value GraphemeFlag.GRAPHEME_IS_SPACE = 8

Grapheme is whitespace.

> enum_value GraphemeFlag.GRAPHEME_IS_BREAK_HARD = 16

Grapheme is mandatory break point (e.g. `"\n"`).

> enum_value GraphemeFlag.GRAPHEME_IS_BREAK_SOFT = 32

Grapheme is optional break point (e.g. space).

> enum_value GraphemeFlag.GRAPHEME_IS_TAB = 64

Grapheme is the tabulation character.

> enum_value GraphemeFlag.GRAPHEME_IS_ELONGATION = 128

Grapheme is kashida.

> enum_value GraphemeFlag.GRAPHEME_IS_PUNCTUATION = 256

Grapheme is punctuation character.

> enum_value GraphemeFlag.GRAPHEME_IS_UNDERSCORE = 512

Grapheme is underscore character.

> enum_value GraphemeFlag.GRAPHEME_IS_CONNECTED = 1024

Grapheme is connected to the previous grapheme. Breaking line before this grapheme is not safe.

> enum_value GraphemeFlag.GRAPHEME_IS_SAFE_TO_INSERT_TATWEEL = 2048

It is safe to insert a U+0640 before this grapheme for elongation.

> enum_value GraphemeFlag.GRAPHEME_IS_EMBEDDED_OBJECT = 4096

Grapheme is an object replacement character for the embedded object.

> enum_value GraphemeFlag.GRAPHEME_IS_SOFT_HYPHEN = 8192

Grapheme is a soft hyphen.

> enum Hinting

> enum_value Hinting.HINTING_NONE = 0

Disables font hinting (smoother but less crisp).

> enum_value Hinting.HINTING_LIGHT = 1

Use the light font hinting mode.

> enum_value Hinting.HINTING_NORMAL = 2

Use the default font hinting mode (crisper but less smooth).
**Note:** This hinting mode changes both horizontal and vertical glyph metrics. If applied to monospace font, some glyphs might have different width.

> enum JustificationFlag ; bitfield=true

> enum_value JustificationFlag.JUSTIFICATION_NONE = 0

Do not justify text.

> enum_value JustificationFlag.JUSTIFICATION_KASHIDA = 1

Justify text by adding and removing kashidas.

> enum_value JustificationFlag.JUSTIFICATION_WORD_BOUND = 2

Justify text by changing width of the spaces between the words.

> enum_value JustificationFlag.JUSTIFICATION_TRIM_EDGE_SPACES = 4

Remove trailing and leading spaces from the justified text.

> enum_value JustificationFlag.JUSTIFICATION_AFTER_LAST_TAB = 8

Only apply justification to the part of the text after the last tab.

> enum_value JustificationFlag.JUSTIFICATION_CONSTRAIN_ELLIPSIS = 16

Apply justification to the trimmed line with ellipsis.

> enum_value JustificationFlag.JUSTIFICATION_SKIP_LAST_LINE = 32

Do not apply justification to the last line of the paragraph.

> enum_value JustificationFlag.JUSTIFICATION_SKIP_LAST_LINE_WITH_VISIBLE_CHARS = 64

Do not apply justification to the last line of the paragraph with visible characters (takes precedence over `JUSTIFICATION_SKIP_LAST_LINE`).

> enum_value JustificationFlag.JUSTIFICATION_DO_NOT_SKIP_SINGLE_LINE = 128

Always apply justification to the paragraphs with a single line (`JUSTIFICATION_SKIP_LAST_LINE` and `JUSTIFICATION_SKIP_LAST_LINE_WITH_VISIBLE_CHARS` are ignored).

> enum LineBreakFlag ; bitfield=true

> enum_value LineBreakFlag.BREAK_NONE = 0

Do not break the line.

> enum_value LineBreakFlag.BREAK_MANDATORY = 1

Break the line at the line mandatory break characters (e.g. `"\n"`).

> enum_value LineBreakFlag.BREAK_WORD_BOUND = 2

Break the line between the words.

> enum_value LineBreakFlag.BREAK_GRAPHEME_BOUND = 4

Break the line between any unconnected graphemes.

> enum_value LineBreakFlag.BREAK_ADAPTIVE = 8

Should be used only in conjunction with `BREAK_WORD_BOUND`, break the line between any unconnected graphemes, if it's impossible to break it between the words.

> enum_value LineBreakFlag.BREAK_TRIM_EDGE_SPACES = 16 ; deprecated=Use `BREAK_TRIM_START_EDGE_SPACES | BREAK_TRIM_END_EDGE_SPACES` instead.

Remove edge spaces from the broken line segments.

> enum_value LineBreakFlag.BREAK_TRIM_INDENT = 32

Subtract first line indentation width from all lines after the first one.

> enum_value LineBreakFlag.BREAK_TRIM_START_EDGE_SPACES = 64

Remove spaces and line break characters from the start of broken line segments.
E.g, after line breaking, the second segment of the following text `test  \n  next`, is `next` if the flag is set, and `  next` if it is not.

> enum_value LineBreakFlag.BREAK_TRIM_END_EDGE_SPACES = 128

Remove spaces and line break characters from the end of broken line segments.
E.g, after line breaking, the first segment of the following text `test  \n  next`, is `test` if the flag is set, and `test  \n` if it is not.

> enum Orientation

> enum_value Orientation.ORIENTATION_HORIZONTAL = 0

Text is written horizontally.

> enum_value Orientation.ORIENTATION_VERTICAL = 1

Left to right text is written vertically from top to bottom.
Right to left text is written vertically from bottom to top.

> enum OverrunBehavior

> enum_value OverrunBehavior.OVERRUN_NO_TRIMMING = 0

No text trimming is performed.

> enum_value OverrunBehavior.OVERRUN_TRIM_CHAR = 1

Trims the text per character.

> enum_value OverrunBehavior.OVERRUN_TRIM_WORD = 2

Trims the text per word.

> enum_value OverrunBehavior.OVERRUN_TRIM_ELLIPSIS = 3

Trims the text per character and adds an ellipsis to indicate that parts are hidden if trimmed text is 6 characters or longer.

> enum_value OverrunBehavior.OVERRUN_TRIM_WORD_ELLIPSIS = 4

Trims the text per word and adds an ellipsis to indicate that parts are hidden if trimmed text is 6 characters or longer.

> enum_value OverrunBehavior.OVERRUN_TRIM_ELLIPSIS_FORCE = 5

Trims the text per character and adds an ellipsis to indicate that parts are hidden regardless of trimmed text length.

> enum_value OverrunBehavior.OVERRUN_TRIM_WORD_ELLIPSIS_FORCE = 6

Trims the text per word and adds an ellipsis to indicate that parts are hidden regardless of trimmed text length.

> enum SpacingType

> enum_value SpacingType.SPACING_GLYPH = 0

Spacing for each glyph.

> enum_value SpacingType.SPACING_SPACE = 1

Spacing for the space character.

> enum_value SpacingType.SPACING_TOP = 2

Spacing at the top of the line.

> enum_value SpacingType.SPACING_BOTTOM = 3

Spacing at the bottom of the line.

> enum_value SpacingType.SPACING_MAX = 4

Represents the size of the `SpacingType` enum.

> enum StructuredTextParser

> enum_value StructuredTextParser.STRUCTURED_TEXT_DEFAULT = 0

Use default Unicode BiDi algorithm.

> enum_value StructuredTextParser.STRUCTURED_TEXT_URI = 1

BiDi override for URI.

> enum_value StructuredTextParser.STRUCTURED_TEXT_FILE = 2

BiDi override for file path.

> enum_value StructuredTextParser.STRUCTURED_TEXT_EMAIL = 3

BiDi override for email.

> enum_value StructuredTextParser.STRUCTURED_TEXT_LIST = 4

BiDi override for lists. Structured text options: list separator `String`.

> enum_value StructuredTextParser.STRUCTURED_TEXT_GDSCRIPT = 5

BiDi override for GDScript.

> enum_value StructuredTextParser.STRUCTURED_TEXT_CUSTOM = 6

User defined structured text BiDi override function.

> enum SubpixelPositioning

> enum_value SubpixelPositioning.SUBPIXEL_POSITIONING_DISABLED = 0

Glyph horizontal position is rounded to the whole pixel size, each glyph is rasterized once.

> enum_value SubpixelPositioning.SUBPIXEL_POSITIONING_AUTO = 1

Glyph horizontal position is rounded based on font size.
- To one quarter of the pixel size if font size is smaller or equal to `SUBPIXEL_POSITIONING_ONE_QUARTER_MAX_SIZE`.
- To one half of the pixel size if font size is smaller or equal to `SUBPIXEL_POSITIONING_ONE_HALF_MAX_SIZE`.
- To the whole pixel size for larger fonts.

> enum_value SubpixelPositioning.SUBPIXEL_POSITIONING_ONE_HALF = 2

Glyph horizontal position is rounded to one half of the pixel size, each glyph is rasterized up to two times.

> enum_value SubpixelPositioning.SUBPIXEL_POSITIONING_ONE_QUARTER = 3

Glyph horizontal position is rounded to one quarter of the pixel size, each glyph is rasterized up to four times.

> enum_value SubpixelPositioning.SUBPIXEL_POSITIONING_ONE_HALF_MAX_SIZE = 20

Maximum font size which will use "one half of the pixel" subpixel positioning in `SUBPIXEL_POSITIONING_AUTO` mode.

> enum_value SubpixelPositioning.SUBPIXEL_POSITIONING_ONE_QUARTER_MAX_SIZE = 16

Maximum font size which will use "one quarter of the pixel" subpixel positioning in `SUBPIXEL_POSITIONING_AUTO` mode.

> enum TextOverrunFlag ; bitfield=true

> enum_value TextOverrunFlag.OVERRUN_NO_TRIM = 0

No trimming is performed.

> enum_value TextOverrunFlag.OVERRUN_TRIM = 1

Trims the text when it exceeds the given width.

> enum_value TextOverrunFlag.OVERRUN_TRIM_WORD_ONLY = 2

Trims the text per word instead of per grapheme.

> enum_value TextOverrunFlag.OVERRUN_ADD_ELLIPSIS = 4

Determines whether an ellipsis should be added at the end of the text.

> enum_value TextOverrunFlag.OVERRUN_ENFORCE_ELLIPSIS = 8

Determines whether the ellipsis at the end of the text is enforced and may not be hidden.

> enum_value TextOverrunFlag.OVERRUN_JUSTIFICATION_AWARE = 16

Accounts for the text being justified before attempting to trim it (see `JustificationFlag`).

> enum_value TextOverrunFlag.OVERRUN_SHORT_STRING_ELLIPSIS = 32

Determines whether the ellipsis should be added regardless of the string length, otherwise it is added only if the string is 6 characters or longer.

> enum VisibleCharactersBehavior

> enum_value VisibleCharactersBehavior.VC_CHARS_BEFORE_SHAPING = 0

Trims text before the shaping. e.g, increasing `Label.visible_characters` or `RichTextLabel.visible_characters` value is visually identical to typing the text.
**Note:** In this mode, trimmed text is not processed at all. It is not accounted for in line breaking and size calculations.

> enum_value VisibleCharactersBehavior.VC_CHARS_AFTER_SHAPING = 1

Displays glyphs that are mapped to the first `Label.visible_characters` or `RichTextLabel.visible_characters` characters from the beginning of the text.

> enum_value VisibleCharactersBehavior.VC_GLYPHS_AUTO = 2

Displays `Label.visible_ratio` or `RichTextLabel.visible_ratio` glyphs, starting from the left or from the right, depending on `Control.layout_direction` value.

> enum_value VisibleCharactersBehavior.VC_GLYPHS_LTR = 3

Displays `Label.visible_ratio` or `RichTextLabel.visible_ratio` glyphs, starting from the left.

> enum_value VisibleCharactersBehavior.VC_GLYPHS_RTL = 4

Displays `Label.visible_ratio` or `RichTextLabel.visible_ratio` glyphs, starting from the right.
