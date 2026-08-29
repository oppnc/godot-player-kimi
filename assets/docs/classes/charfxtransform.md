# CharFXTransform

> class CharFXTransform
> inherits CharFXTransform RefCounted

## Brief

Controls how an individual character will be displayed in a `RichTextEffect`.

## Description

By setting various properties on this object, you can control how individual characters will be displayed in a `RichTextEffect`.

## Properties

> property color : Color ; default=Color(0, 0, 0, 1) ; setter=set_color ; getter=get_color

The color the character will be drawn with.

> property elapsed_time : float ; default=0.0 ; setter=set_elapsed_time ; getter=get_elapsed_time

The time elapsed since the `RichTextLabel` was added to the scene tree (in seconds). Time stops when the `RichTextLabel` is paused (see `Node.process_mode`). Resets when the text in the `RichTextLabel` is changed.
**Note:** Time still passes while the `RichTextLabel` is hidden.

> property env : Dictionary ; default={} ; setter=set_environment ; getter=get_environment

Contains the arguments passed in the opening BBCode tag. By default, arguments are strings; if their contents match a type such as `bool`, `int` or `float`, they will be converted automatically. Color codes in the form `#rrggbb` or `#rgb` will be converted to an opaque `Color`. String arguments may not contain spaces, even if they're quoted. If present, quotes will also be present in the final string.
For example, the opening BBCode tag `[example foo=hello bar=true baz=42 color=#ffffff]` will map to the following `Dictionary`:

```text
            {"foo": "hello", "bar": true, "baz": 42, "color": Color(1, 1, 1, 1)}

```

> property font : RID ; default=RID() ; setter=set_font ; getter=get_font

`TextServer` RID of the font used to render glyph, this value can be used with `TextServer.font_*` methods to retrieve font information.
**Note:** Read-only. Setting this property won't affect drawing.

> property glyph_count : int ; default=0 ; setter=set_glyph_count ; getter=get_glyph_count

Number of glyphs in the grapheme cluster. This value is set in the first glyph of a cluster.
**Note:** Read-only. Setting this property won't affect drawing.

> property glyph_flags : int ; default=0 ; setter=set_glyph_flags ; getter=get_glyph_flags

Glyph flags. See `TextServer.GraphemeFlag` for more info.
**Note:** Read-only. Setting this property won't affect drawing.

> property glyph_index : int ; default=0 ; setter=set_glyph_index ; getter=get_glyph_index

Glyph index specific to the `font`. If you want to replace this glyph, use `TextServer.font_get_glyph_index` with `font` to get a new glyph index for a single character.

> property offset : Vector2 ; default=Vector2(0, 0) ; setter=set_offset ; getter=get_offset

The position offset the character will be drawn with (in pixels).

> property outline : bool ; default=false ; setter=set_outline ; getter=is_outline

If `true`, FX transform is called for outline drawing.
**Note:** Read-only. Setting this property won't affect drawing.

> property range : Vector2i ; default=Vector2i(0, 0) ; setter=set_range ; getter=get_range

Absolute character range in the string, corresponding to the glyph.
**Note:** Read-only. Setting this property won't affect drawing.

> property relative_index : int ; default=0 ; setter=set_relative_index ; getter=get_relative_index

The character offset of the glyph, relative to the current `RichTextEffect` custom block.
**Note:** Read-only. Setting this property won't affect drawing.

> property transform : Transform2D ; default=Transform2D(1, 0, 0, 1, 0, 0) ; setter=set_transform ; getter=get_transform

The current transform of the current glyph. It can be overridden (for example, by driving the position and rotation from a curve). You can also alter the existing value to apply transforms on top of other effects.

> property visible : bool ; default=true ; setter=set_visibility ; getter=is_visible

If `true`, the character will be drawn. If `false`, the character will be hidden. Characters around hidden characters will reflow to take the space of hidden characters. If this is not desired, set their `color` to `Color(1, 1, 1, 0)` instead.

## Tutorials
- [BBCode in RichTextLabel]($DOCS_URL/tutorials/ui/bbcode_in_richtextlabel.html)
