# LinkButton

> class LinkButton
> inherits LinkButton BaseButton

## Brief

A button that represents a link.

## Description

A button that represents a link. This type of button is primarily used for interactions that cause a context change (like linking to a web page).
See also `BaseButton` which contains common properties and methods associated with this node.

## Properties

> property ellipsis_char : String ; default="…" ; setter=set_ellipsis_char ; getter=get_ellipsis_char

Ellipsis character used for text clipping.

> property focus_mode : Control.FocusMode ; default=3 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property language : String ; default="" ; setter=set_language ; getter=get_language

Language code used for line-breaking and text shaping algorithms. If left empty, the current locale is used instead.

> property mouse_default_cursor_shape : Control.CursorShape ; default=2 ; setter=set_default_cursor_shape ; getter=get_default_cursor_shape ; overrides=Control

> property structured_text_bidi_override : TextServer.StructuredTextParser ; default=0 ; setter=set_structured_text_bidi_override ; getter=get_structured_text_bidi_override

Set BiDi algorithm override for the structured text.

> property structured_text_bidi_override_options : Array ; default=[] ; setter=set_structured_text_bidi_override_options ; getter=get_structured_text_bidi_override_options

Set additional options for BiDi override.

> property text : String ; default="" ; setter=set_text ; getter=get_text

The button's text that will be displayed inside the button's area.

> property text_direction : Control.TextDirection ; default=0 ; setter=set_text_direction ; getter=get_text_direction

Base text writing direction.

> property text_overrun_behavior : TextServer.OverrunBehavior ; default=0 ; setter=set_text_overrun_behavior ; getter=get_text_overrun_behavior

Sets the clipping behavior when the text exceeds the node's bounding rectangle.

> property underline : UnderlineMode ; default=0 ; setter=set_underline_mode ; getter=get_underline_mode

The underline mode to use for the text.

> property uri : String ; default="" ; setter=set_uri ; getter=get_uri

The [URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier) for this `LinkButton`. If set to a valid URI, pressing the button opens the URI using the operating system's default program for the protocol (via `OS.shell_open`). HTTP and HTTPS URLs open the default web browser.

```gdscript
            uri = "https://godotengine.org"  # Opens the URL in the default web browser.
            uri = "C:\SomeFolder"  # Opens the file explorer at the given path.
            uri = "C:\SomeImage.png"  # Opens the given image in the default viewing app.

```

```csharp
            Uri = "https://godotengine.org"; // Opens the URL in the default web browser.
            Uri = "C:\SomeFolder"; // Opens the file explorer at the given path.
            Uri = "C:\SomeImage.png"; // Opens the given image in the default viewing app.

```

## Enumerations

> enum UnderlineMode

> enum_value UnderlineMode.UNDERLINE_MODE_ALWAYS = 0

The LinkButton will always show an underline at the bottom of its text.

> enum_value UnderlineMode.UNDERLINE_MODE_ON_HOVER = 1

The LinkButton will show an underline at the bottom of its text when the mouse cursor is over it.

> enum_value UnderlineMode.UNDERLINE_MODE_NEVER = 2

The LinkButton will never show an underline at the bottom of its text.

## Theme Properties

> theme_property font_color : Color ; data=color ; default=Color(0.875, 0.875, 0.875, 1)

Default text `Color` of the `LinkButton`.

> theme_property font_disabled_color : Color ; data=color ; default=Color(0, 0, 0, 1)

Text `Color` used when the `LinkButton` is disabled.

> theme_property font_focus_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Text `Color` used when the `LinkButton` is focused. Only replaces the normal text color of the button. Disabled, hovered, and pressed states take precedence over this color.

> theme_property font_hover_color : Color ; data=color ; default=Color(0.95, 0.95, 0.95, 1)

Text `Color` used when the `LinkButton` is being hovered.

> theme_property font_hover_pressed_color : Color ; data=color ; default=Color(0, 0, 0, 1)

Text `Color` used when the `LinkButton` is being hovered and pressed.

> theme_property font_outline_color : Color ; data=color ; default=Color(0, 0, 0, 1)

The tint of text outline of the `LinkButton`.

> theme_property font_pressed_color : Color ; data=color ; default=Color(1, 1, 1, 1)

Text `Color` used when the `LinkButton` is being pressed.

> theme_property outline_size : int ; data=constant ; default=0

The size of the text outline.
**Note:** If using a font with `FontFile.multichannel_signed_distance_field` enabled, its `FontFile.msdf_pixel_range` must be set to at least *twice* the value of `outline_size` for outline rendering to look correct. Otherwise, the outline may appear to be cut off earlier than intended.

> theme_property underline_spacing : int ; data=constant ; default=2

The vertical space between the baseline of text and the underline.

> theme_property font : Font ; data=font

`Font` of the `LinkButton`'s text.

> theme_property font_size : int ; data=font_size

Font size of the `LinkButton`'s text.

> theme_property focus : StyleBox ; data=style

`StyleBox` used when the `LinkButton` is focused. The `focus` `StyleBox` is displayed *over* the base `StyleBox`, so a partially transparent `StyleBox` should be used to ensure the base `StyleBox` remains visible. A `StyleBox` that represents an outline or an underline works well for this purpose. To disable the focus visual effect, assign a `StyleBoxEmpty` resource. Note that disabling the focus visual effect will harm keyboard/controller navigation usability, so this is not recommended for accessibility reasons.
