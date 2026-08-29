# FontVariation

> class FontVariation
> inherits FontVariation Font

## Brief

A variation of a font with additional settings.

## Description

Provides OpenType variations, simulated bold / slant, and additional font settings like OpenType features and extra spacing.
To use simulated bold font variant:

```gdscript
        var fv = FontVariation.new()
        fv.base_font = load("res://BarlowCondensed-Regular.ttf")
        fv.variation_embolden = 1.2
        $Label.add_theme_font_override("font", fv)
        $Label.add_theme_font_size_override("font_size", 64)

```

```csharp
        var fv = new FontVariation();
        fv.SetBaseFont(ResourceLoader.Load<FontFile>("res://BarlowCondensed-Regular.ttf"));
        fv.SetVariationEmbolden(1.2);
        GetNode("Label").AddThemeFontOverride("font", fv);
        GetNode("Label").AddThemeFontSizeOverride("font_size", 64);

```

To set the coordinate of multiple variation axes:

```text
        var fv = FontVariation.new();
        var ts = TextServerManager.get_primary_interface()
        fv.base_font = load("res://BarlowCondensed-Regular.ttf")
        fv.variation_opentype = { ts.name_to_tag("wght"): 900, ts.name_to_tag("custom_hght"): 900 }

```

## Properties

> property base_font : Font ; setter=set_base_font ; getter=get_base_font

Base font used to create a variation. If not set, default `Theme` font is used.

> property baseline_offset : float ; default=0.0 ; setter=set_baseline_offset ; getter=get_baseline_offset

Extra baseline offset (as a fraction of font height).

> property opentype_features : Dictionary ; default={} ; setter=set_opentype_features ; getter=get_opentype_features

A set of OpenType feature tags. More info: [OpenType feature tags](https://docs.microsoft.com/en-us/typography/opentype/spec/featuretags).

> property palette_custom_colors : PackedColorArray ; default=PackedColorArray() ; setter=set_palette_custom_colors ; getter=get_palette_custom_colors

An array of colors to override predefined palette. Use `Color(0, 0, 0, 0)`, to keep predefined palette color at specific position.

> property palette_index : int ; default=0 ; setter=set_palette_index ; getter=get_palette_index

A palette index.

> property spacing_bottom : int ; default=0 ; setter=set_spacing ; getter=get_spacing

Extra spacing at the bottom of the line in pixels.

> property spacing_glyph : int ; default=0 ; setter=set_spacing ; getter=get_spacing

Extra spacing between graphical glyphs.

> property spacing_space : int ; default=0 ; setter=set_spacing ; getter=get_spacing

Extra width of the space glyphs.

> property spacing_top : int ; default=0 ; setter=set_spacing ; getter=get_spacing

Extra spacing at the top of the line in pixels.

> property variation_embolden : float ; default=0.0 ; setter=set_variation_embolden ; getter=get_variation_embolden

If is not equal to zero, emboldens the font outlines. Negative values reduce the outline thickness.
**Note:** Emboldened fonts might have self-intersecting outlines, which will prevent MSDF fonts and `TextMesh` from working correctly.

> property variation_face_index : int ; default=0 ; setter=set_variation_face_index ; getter=get_variation_face_index

Active face index in the TrueType / OpenType collection file.

> property variation_opentype : Dictionary ; default={} ; setter=set_variation_opentype ; getter=get_variation_opentype

Font OpenType variation coordinates. More info: [OpenType variation tags](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
**Note:** This `Dictionary` uses OpenType tags as keys. Variation axes can be identified both by tags (`int`, e.g. `0x77678674`) and names (`String`, e.g. `wght`). Some axes might be accessible by multiple names. For example, `wght` refers to the same axis as `weight`. Tags on the other hand are unique. To convert between names and tags, use `TextServer.name_to_tag` and `TextServer.tag_to_name`.
**Note:** To get available variation axes of a font, use `Font.get_supported_variation_list`.

> property variation_transform : Transform2D ; default=Transform2D(1, 0, 0, 1, 0, 0) ; setter=set_variation_transform ; getter=get_variation_transform

2D transform, applied to the font outlines, can be used for slanting, flipping and rotating glyphs.
For example, to simulate italic typeface by slanting, apply the following transform `Transform2D(1.0, slant, 0.0, 1.0, 0.0, 0.0)`.

## Methods

> method set_spacing(spacing: TextServer.SpacingType, value: int) -> void

Sets the spacing for `spacing` to `value` in pixels (not relative to the font size).
