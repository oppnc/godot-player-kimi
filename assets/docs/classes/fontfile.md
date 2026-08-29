# FontFile

> class FontFile
> inherits FontFile Font

## Brief

Holds font source data and prerendered glyph cache, imported from a dynamic or a bitmap font.

## Description

`FontFile` contains a set of glyphs to represent Unicode characters imported from a font file, as well as a cache of rasterized glyphs, and a set of fallback `Font`s to use.
Use `FontVariation` to access specific OpenType variation of the font, create simulated bold / slanted version, and draw lines of text.
For more complex text processing, use `FontVariation` in conjunction with `TextLine` or `TextParagraph`.
Supported font formats:
- Dynamic font importer: TrueType (.ttf), TrueType collection (.ttc), OpenType (.otf), OpenType collection (.otc), WOFF (.woff), WOFF2 (.woff2), Type 1 (.pfb, .pfm).
- Bitmap font importer: AngelCode BMFont (.fnt, .font), text and binary (version 3) format variants.
- Monospace image font importer: All supported image formats.
**Note:** A character is a symbol that represents an item (letter, digit etc.) in an abstract way.
**Note:** A glyph is a bitmap or a shape used to draw one or more characters in a context-dependent manner. Glyph indices are bound to the specific font data source.
**Note:** If none of the font data sources contain glyphs for a character used in a string, the character in question will be replaced with a box displaying its hexadecimal code.

```gdscript
        var f = load("res://BarlowCondensed-Bold.ttf")
        $Label.add_theme_font_override("font", f)
        $Label.add_theme_font_size_override("font_size", 64)

```

```csharp
        var f = ResourceLoader.Load<FontFile>("res://BarlowCondensed-Bold.ttf");
        GetNode("Label").AddThemeFontOverride("font", f);
        GetNode("Label").AddThemeFontSizeOverride("font_size", 64);

```

## Properties

> property allow_system_fallback : bool ; default=true ; setter=set_allow_system_fallback ; getter=is_allow_system_fallback

If set to `true`, system fonts can be automatically used as fallbacks.

> property antialiasing : TextServer.FontAntialiasing ; default=1 ; setter=set_antialiasing ; getter=get_antialiasing

Font anti-aliasing mode.

> property data : PackedByteArray ; default=PackedByteArray() ; setter=set_data ; getter=get_data

Contents of the dynamic font source file.

> property disable_embedded_bitmaps : bool ; default=true ; setter=set_disable_embedded_bitmaps ; getter=get_disable_embedded_bitmaps

If set to `true`, embedded font bitmap loading is disabled (bitmap-only and color fonts ignore this property).

> property fixed_size : int ; default=0 ; setter=set_fixed_size ; getter=get_fixed_size

Font size, used only for the bitmap fonts.

> property fixed_size_scale_mode : TextServer.FixedSizeScaleMode ; default=0 ; setter=set_fixed_size_scale_mode ; getter=get_fixed_size_scale_mode

Scaling mode, used only for the bitmap fonts with `fixed_size` greater than zero.

> property font_name : String ; default="" ; setter=set_font_name ; getter=get_font_name

Font family name.

> property font_stretch : int ; default=100 ; setter=set_font_stretch ; getter=get_font_stretch

Font stretch amount, compared to a normal width. A percentage value between `50%` and `200%`.

> property font_style : BitField[TextServer.FontStyle] ; default=0 ; setter=set_font_style ; getter=get_font_style

Font style flags.

> property font_weight : int ; default=400 ; setter=set_font_weight ; getter=get_font_weight

Weight (boldness) of the font. A value in the `100...999` range, normal font weight is `400`, bold font weight is `700`.

> property force_autohinter : bool ; default=false ; setter=set_force_autohinter ; getter=is_force_autohinter

If set to `true`, auto-hinting is supported and preferred over font built-in hinting. Used by dynamic fonts only (MSDF fonts don't support hinting).

> property generate_mipmaps : bool ; default=false ; setter=set_generate_mipmaps ; getter=get_generate_mipmaps

If set to `true`, generate mipmaps for the font textures.

> property hinting : TextServer.Hinting ; default=1 ; setter=set_hinting ; getter=get_hinting

Font hinting mode. Used by dynamic fonts only.

> property keep_rounding_remainders : bool ; default=true ; setter=set_keep_rounding_remainders ; getter=get_keep_rounding_remainders

If set to `true`, when aligning glyphs to the pixel boundaries rounding remainders are accumulated to ensure more uniform glyph distribution. This setting has no effect if subpixel positioning is enabled.

> property modulate_color_glyphs : bool ; default=false ; setter=set_modulate_color_glyphs ; getter=is_modulate_color_glyphs

If set to `true`, color modulation is applied when drawing colored glyphs, otherwise it's applied to the monochrome glyphs only.

> property msdf_pixel_range : int ; default=16 ; setter=set_msdf_pixel_range ; getter=get_msdf_pixel_range

The width of the range around the shape between the minimum and maximum representable signed distance. If using font outlines, `msdf_pixel_range` must be set to at least *twice* the size of the largest font outline. The default `msdf_pixel_range` value of `16` allows outline sizes up to `8` to look correct.

> property msdf_size : int ; default=48 ; setter=set_msdf_size ; getter=get_msdf_size

Source font size used to generate MSDF textures. Higher values allow for more precision, but are slower to render and require more memory. Only increase this value if you notice a visible lack of precision in glyph rendering.

> property multichannel_signed_distance_field : bool ; default=false ; setter=set_multichannel_signed_distance_field ; getter=is_multichannel_signed_distance_field

If set to `true`, glyphs of all sizes are rendered using single multichannel signed distance field (MSDF) generated from the dynamic font vector data. Since this approach does not rely on rasterizing the font every time its size changes, this allows for resizing the font in real-time without any performance penalty. Text will also not look grainy for `Control`s that are scaled down (or for `Label3D`s viewed from a long distance). As a downside, font hinting is not available with MSDF. The lack of font hinting may result in less crisp and less readable fonts at small sizes.
**Note:** If using font outlines, `msdf_pixel_range` must be set to at least *twice* the size of the largest font outline.
**Note:** MSDF font rendering does not render glyphs with overlapping shapes correctly. Overlapping shapes are not valid per the OpenType standard, but are still commonly found in many font files, especially those converted by Google Fonts. To avoid issues with overlapping glyphs, consider downloading the font file directly from the type foundry instead of relying on Google Fonts.

> property opentype_feature_overrides : Dictionary ; default={} ; setter=set_opentype_feature_overrides ; getter=get_opentype_feature_overrides

Font OpenType feature set override.

> property oversampling : float ; default=0.0 ; setter=set_oversampling ; getter=get_oversampling

If set to a positive value, overrides the oversampling factor of the viewport this font is used in. See `Viewport.oversampling`. This value doesn't override the `oversampling` parameter of `draw_*` methods.

> property style_name : String ; default="" ; setter=set_font_style_name ; getter=get_font_style_name

Font style name.

> property subpixel_positioning : TextServer.SubpixelPositioning ; default=1 ; setter=set_subpixel_positioning ; getter=get_subpixel_positioning

Font glyph subpixel positioning mode. Subpixel positioning provides shaper text and better kerning for smaller font sizes, at the cost of higher memory usage and lower font rasterization speed. Use `TextServer.SUBPIXEL_POSITIONING_AUTO` to automatically enable it based on the font size.

## Methods

> method clear_cache() -> void

Removes all font cache entries.

> method clear_glyphs(cache_index: int, size: Vector2i) -> void

Removes all rendered glyph information from the cache entry.
**Note:** This function will not remove textures associated with the glyphs, use `remove_texture` to remove them manually.

> method clear_kerning_map(cache_index: int, size: int) -> void

Removes all kerning overrides.

> method clear_size_cache(cache_index: int) -> void

Removes all font sizes from the cache entry.

> method clear_textures(cache_index: int, size: Vector2i) -> void

Removes all textures from font cache entry.
**Note:** This function will not remove glyphs associated with the texture, use `remove_glyph` to remove them manually.

> method get_cache_ascent(cache_index: int, size: int) -> float ; qualifiers=const

Returns the font ascent (number of pixels above the baseline).

> method get_cache_count() -> int ; qualifiers=const

Returns number of the font cache entries.

> method get_cache_descent(cache_index: int, size: int) -> float ; qualifiers=const

Returns the font descent (number of pixels below the baseline).

> method get_cache_scale(cache_index: int, size: int) -> float ; qualifiers=const

Returns scaling factor of the color bitmap font.

> method get_cache_underline_position(cache_index: int, size: int) -> float ; qualifiers=const

Returns pixel offset of the underline below the baseline.

> method get_cache_underline_thickness(cache_index: int, size: int) -> float ; qualifiers=const

Returns thickness of the underline in pixels.

> method get_char_from_glyph_index(size: int, glyph_index: int) -> int ; qualifiers=const

Returns character code associated with `glyph_index`, or `0` if `glyph_index` is invalid. See `get_glyph_index`.

> method get_embolden(cache_index: int) -> float ; qualifiers=const

Returns embolden strength, if is not equal to zero, emboldens the font outlines. Negative values reduce the outline thickness.

> method get_extra_baseline_offset(cache_index: int) -> float ; qualifiers=const

Returns extra baseline offset (as a fraction of font height).

> method get_extra_spacing(cache_index: int, spacing: TextServer.SpacingType) -> int ; qualifiers=const

Returns spacing for `spacing` in pixels (not relative to the font size).

> method get_face_index(cache_index: int) -> int ; qualifiers=const

Returns an active face index in the TrueType / OpenType collection.

> method get_glyph_advance(cache_index: int, size: int, glyph: int) -> Vector2 ; qualifiers=const

Returns glyph advance (offset of the next glyph).
**Note:** Advance for glyphs outlines is the same as the base glyph advance and is not saved.

> method get_glyph_index(size: int, char: int, variation_selector: int) -> int ; qualifiers=const

Returns the glyph index of a `char`, optionally modified by the `variation_selector`.

> method get_glyph_list(cache_index: int, size: Vector2i) -> PackedInt32Array ; qualifiers=const

Returns list of rendered glyphs in the cache entry.

> method get_glyph_offset(cache_index: int, size: Vector2i, glyph: int) -> Vector2 ; qualifiers=const

Returns glyph offset from the baseline.

> method get_glyph_size(cache_index: int, size: Vector2i, glyph: int) -> Vector2 ; qualifiers=const

Returns glyph size.

> method get_glyph_texture_idx(cache_index: int, size: Vector2i, glyph: int) -> int ; qualifiers=const

Returns index of the cache texture containing the glyph.

> method get_glyph_uv_rect(cache_index: int, size: Vector2i, glyph: int) -> Rect2 ; qualifiers=const

Returns rectangle in the cache texture containing the glyph.

> method get_kerning(cache_index: int, size: int, glyph_pair: Vector2i) -> Vector2 ; qualifiers=const

Returns kerning for the pair of glyphs.

> method get_kerning_list(cache_index: int, size: int) -> Array[Vector2i] ; qualifiers=const

Returns list of the kerning overrides.

> method get_language_support_override(language: String) -> bool ; qualifiers=const

Returns `true` if support override is enabled for the `language`.

> method get_language_support_overrides() -> PackedStringArray ; qualifiers=const

Returns list of language support overrides.

> method get_script_support_override(script: String) -> bool ; qualifiers=const

Returns `true` if support override is enabled for the `script`.

> method get_script_support_overrides() -> PackedStringArray ; qualifiers=const

Returns list of script support overrides.

> method get_size_cache_list(cache_index: int) -> Array[Vector2i] ; qualifiers=const

Returns list of the font sizes in the cache. Each size is `Vector2i` with font size and outline size.

> method get_texture_count(cache_index: int, size: Vector2i) -> int ; qualifiers=const

Returns number of textures used by font cache entry.

> method get_texture_image(cache_index: int, size: Vector2i, texture_index: int) -> Image ; qualifiers=const

Returns a copy of the font cache texture image.

> method get_texture_offsets(cache_index: int, size: Vector2i, texture_index: int) -> PackedInt32Array ; qualifiers=const

Returns a copy of the array containing glyph packing data.

> method get_transform(cache_index: int) -> Transform2D ; qualifiers=const

Returns 2D transform, applied to the font outlines, can be used for slanting, flipping and rotating glyphs.

> method get_variation_coordinates(cache_index: int) -> Dictionary ; qualifiers=const

Returns variation coordinates for the specified font cache entry. See `Font.get_supported_variation_list` for more info.

> method load_bitmap_font(path: String) -> Error

Loads an AngelCode BMFont (.fnt, .font) bitmap font from file `path`.
**Warning:** This method should only be used in the editor or in cases when you need to load external fonts at run-time, such as fonts located at the `user://` directory.

> method load_dynamic_font(path: String) -> Error

Loads a TrueType (.ttf), OpenType (.otf), WOFF (.woff), WOFF2 (.woff2) or Type 1 (.pfb, .pfm) dynamic font from file `path`.
**Warning:** This method should only be used in the editor or in cases when you need to load external fonts at run-time, such as fonts located at the `user://` directory.

> method remove_cache(cache_index: int) -> void

Removes specified font cache entry.

> method remove_glyph(cache_index: int, size: Vector2i, glyph: int) -> void

Removes specified rendered glyph information from the cache entry.
**Note:** This function will not remove textures associated with the glyphs, use `remove_texture` to remove them manually.

> method remove_kerning(cache_index: int, size: int, glyph_pair: Vector2i) -> void

Removes kerning override for the pair of glyphs.

> method remove_language_support_override(language: String) -> void

Remove language support override.

> method remove_script_support_override(script: String) -> void

Removes script support override.

> method remove_size_cache(cache_index: int, size: Vector2i) -> void

Removes specified font size from the cache entry.

> method remove_texture(cache_index: int, size: Vector2i, texture_index: int) -> void

Removes specified texture from the cache entry.
**Note:** This function will not remove glyphs associated with the texture. Remove them manually using `remove_glyph`.

> method render_glyph(cache_index: int, size: Vector2i, index: int) -> void

Renders specified glyph to the font cache texture.

> method render_range(cache_index: int, size: Vector2i, start: int, end: int) -> void

Renders the range of characters to the font cache texture.

> method set_cache_ascent(cache_index: int, size: int, ascent: float) -> void

Sets the font ascent (number of pixels above the baseline).

> method set_cache_descent(cache_index: int, size: int, descent: float) -> void

Sets the font descent (number of pixels below the baseline).

> method set_cache_scale(cache_index: int, size: int, scale: float) -> void

Sets scaling factor of the color bitmap font.

> method set_cache_underline_position(cache_index: int, size: int, underline_position: float) -> void

Sets pixel offset of the underline below the baseline.

> method set_cache_underline_thickness(cache_index: int, size: int, underline_thickness: float) -> void

Sets thickness of the underline in pixels.

> method set_embolden(cache_index: int, strength: float) -> void

Sets embolden strength, if is not equal to zero, emboldens the font outlines. Negative values reduce the outline thickness.

> method set_extra_baseline_offset(cache_index: int, baseline_offset: float) -> void

Sets extra baseline offset (as a fraction of font height).

> method set_extra_spacing(cache_index: int, spacing: TextServer.SpacingType, value: int) -> void

Sets the spacing for `spacing` to `value` in pixels (not relative to the font size).

> method set_face_index(cache_index: int, face_index: int) -> void

Sets an active face index in the TrueType / OpenType collection.

> method set_glyph_advance(cache_index: int, size: int, glyph: int, advance: Vector2) -> void

Sets glyph advance (offset of the next glyph).
**Note:** Advance for glyphs outlines is the same as the base glyph advance and is not saved.

> method set_glyph_offset(cache_index: int, size: Vector2i, glyph: int, offset: Vector2) -> void

Sets glyph offset from the baseline.

> method set_glyph_size(cache_index: int, size: Vector2i, glyph: int, gl_size: Vector2) -> void

Sets glyph size.

> method set_glyph_texture_idx(cache_index: int, size: Vector2i, glyph: int, texture_idx: int) -> void

Sets index of the cache texture containing the glyph.

> method set_glyph_uv_rect(cache_index: int, size: Vector2i, glyph: int, uv_rect: Rect2) -> void

Sets rectangle in the cache texture containing the glyph.

> method set_kerning(cache_index: int, size: int, glyph_pair: Vector2i, kerning: Vector2) -> void

Sets kerning for the pair of glyphs.

> method set_language_support_override(language: String, supported: bool) -> void

Adds override for `Font.is_language_supported`.

> method set_script_support_override(script: String, supported: bool) -> void

Adds override for `Font.is_script_supported`.

> method set_texture_image(cache_index: int, size: Vector2i, texture_index: int, image: Image) -> void

Sets font cache texture image.

> method set_texture_offsets(cache_index: int, size: Vector2i, texture_index: int, offset: PackedInt32Array) -> void

Sets array containing glyph packing data.

> method set_transform(cache_index: int, transform: Transform2D) -> void

Sets 2D transform, applied to the font outlines, can be used for slanting, flipping, and rotating glyphs.

> method set_variation_coordinates(cache_index: int, variation_coordinates: Dictionary) -> void

Sets variation coordinates for the specified font cache entry. See `Font.get_supported_variation_list` for more info.

## Tutorials
- [Runtime file loading and saving]($DOCS_URL/tutorials/io/runtime_file_loading_and_saving.html)
