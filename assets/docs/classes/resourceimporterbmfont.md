# ResourceImporterBMFont

> class ResourceImporterBMFont
> inherits ResourceImporterBMFont ResourceImporter

## Brief

Imports a bitmap font in the BMFont (`.fnt`) format.

## Description

The BMFont format is a format created by the [BMFont](https://www.angelcode.com/products/bmfont/) program. Many BMFont-compatible programs also exist, like [BMGlyph](https://www.bmglyph.com/).
Compared to `ResourceImporterImageFont`, `ResourceImporterBMFont` supports bitmap fonts with varying glyph widths/heights.
See also `ResourceImporterDynamicFont`.

## Properties

> property compress : bool ; default=true

If `true`, uses lossless compression for the resulting font.

> property fallbacks : Array ; default=[]

List of font fallbacks to use if a glyph isn't found in this bitmap font. Fonts at the beginning of the array are attempted first.

> property scaling_mode : int ; default=2

Font scaling mode.

## Tutorials
- [Bitmap fonts - Using fonts]($DOCS_URL/tutorials/ui/gui_using_fonts.html#bitmap-fonts)
