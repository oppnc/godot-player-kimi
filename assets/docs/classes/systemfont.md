# SystemFont

> class SystemFont
> inherits SystemFont Font

## Brief

A font loaded from a system font. Falls back to a default theme font if not implemented on the host OS.

## Description

`SystemFont` loads a font from a system font with the first matching name from `font_names`.
It will attempt to match font style, but it's not guaranteed.
The returned font might be part of a font collection or be a variable font with OpenType "weight", "width" and/or "italic" features set.
You can create `FontVariation` of the system font for precise control over its features.
**Note:** This class is implemented on iOS, Linux, macOS and Windows, on other platforms it will fallback to default theme font.

## Properties

> property allow_system_fallback : bool ; default=true ; setter=set_allow_system_fallback ; getter=is_allow_system_fallback

If set to `true`, system fonts can be automatically used as fallbacks.

> property antialiasing : TextServer.FontAntialiasing ; default=1 ; setter=set_antialiasing ; getter=get_antialiasing

Font anti-aliasing mode.

> property disable_embedded_bitmaps : bool ; default=true ; setter=set_disable_embedded_bitmaps ; getter=get_disable_embedded_bitmaps

If set to `true`, embedded font bitmap loading is disabled (bitmap-only and color fonts ignore this property).

> property font_italic : bool ; default=false ; setter=set_font_italic ; getter=get_font_italic

If set to `true`, italic or oblique font is preferred.

> property font_names : PackedStringArray ; default=PackedStringArray() ; setter=set_font_names ; getter=get_font_names

Array of font family names to search, first matching font found is used.

> property font_stretch : int ; default=100 ; setter=set_font_stretch ; getter=get_font_stretch

Preferred font stretch amount, compared to a normal width. A percentage value between `50%` and `200%`.

> property font_weight : int ; default=400 ; setter=set_font_weight ; getter=get_font_weight

Preferred weight (boldness) of the font. A value in the `100...999` range, normal font weight is `400`, bold font weight is `700`.

> property force_autohinter : bool ; default=false ; setter=set_force_autohinter ; getter=is_force_autohinter

If set to `true`, auto-hinting is supported and preferred over font built-in hinting.

> property generate_mipmaps : bool ; default=false ; setter=set_generate_mipmaps ; getter=get_generate_mipmaps

If set to `true`, generate mipmaps for the font textures.

> property hinting : TextServer.Hinting ; default=1 ; setter=set_hinting ; getter=get_hinting

Font hinting mode.

> property keep_rounding_remainders : bool ; default=true ; setter=set_keep_rounding_remainders ; getter=get_keep_rounding_remainders

If set to `true`, when aligning glyphs to the pixel boundaries rounding remainders are accumulated to ensure more uniform glyph distribution. This setting has no effect if subpixel positioning is enabled.

> property modulate_color_glyphs : bool ; default=false ; setter=set_modulate_color_glyphs ; getter=is_modulate_color_glyphs

If set to `true`, color modulation is applied when drawing colored glyphs, otherwise it's applied to the monochrome glyphs only.

> property msdf_pixel_range : int ; default=16 ; setter=set_msdf_pixel_range ; getter=get_msdf_pixel_range

The width of the range around the shape between the minimum and maximum representable signed distance. If using font outlines, `msdf_pixel_range` must be set to at least *twice* the size of the largest font outline. The default `msdf_pixel_range` value of `16` allows outline sizes up to `8` to look correct.

> property msdf_size : int ; default=48 ; setter=set_msdf_size ; getter=get_msdf_size

Source font size used to generate MSDF textures. Higher values allow for more precision, but are slower to render and require more memory. Only increase this value if you notice a visible lack of precision in glyph rendering.

> property multichannel_signed_distance_field : bool ; default=false ; setter=set_multichannel_signed_distance_field ; getter=is_multichannel_signed_distance_field

If set to `true`, glyphs of all sizes are rendered using single multichannel signed distance field generated from the dynamic font vector data.

> property oversampling : float ; default=0.0 ; setter=set_oversampling ; getter=get_oversampling

If set to a positive value, overrides the oversampling factor of the viewport this font is used in. See `Viewport.oversampling`. This value doesn't override the `oversampling` parameter of `draw_*` methods.

> property subpixel_positioning : TextServer.SubpixelPositioning ; default=1 ; setter=set_subpixel_positioning ; getter=get_subpixel_positioning

Font glyph subpixel positioning mode. Subpixel positioning provides shaper text and better kerning for smaller font sizes, at the cost of memory usage and font rasterization speed. Use `TextServer.SUBPIXEL_POSITIONING_AUTO` to automatically enable it based on the font size.
