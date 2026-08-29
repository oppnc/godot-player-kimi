# ThemeDB

> class ThemeDB
> inherits ThemeDB Object

## Brief

A singleton that provides access to static information about `Theme` resources used by the engine and by your project.

## Description

This singleton provides access to static information about `Theme` resources used by the engine and by your projects. You can fetch the default engine theme, as well as your project configured theme.
`ThemeDB` also contains fallback values for theme properties.

## Properties

> property fallback_base_scale : float ; default=1.0 ; setter=set_fallback_base_scale ; getter=get_fallback_base_scale

The fallback base scale factor of every `Control` node and `Theme` resource. Used when no other value is available to the control.
See also `Theme.default_base_scale`.

> property fallback_font : Font ; setter=set_fallback_font ; getter=get_fallback_font

The fallback font of every `Control` node and `Theme` resource. Used when no other value is available to the control.
See also `Theme.default_font`.

> property fallback_font_size : int ; default=16 ; setter=set_fallback_font_size ; getter=get_fallback_font_size

The fallback font size of every `Control` node and `Theme` resource. Used when no other value is available to the control.
See also `Theme.default_font_size`.

> property fallback_icon : Texture2D ; setter=set_fallback_icon ; getter=get_fallback_icon

The fallback icon of every `Control` node and `Theme` resource. Used when no other value is available to the control.

> property fallback_stylebox : StyleBox ; setter=set_fallback_stylebox ; getter=get_fallback_stylebox

The fallback stylebox of every `Control` node and `Theme` resource. Used when no other value is available to the control.

## Methods

> method get_default_theme() -> Theme

Returns a reference to the default engine `Theme`. This theme resource is responsible for the out-of-the-box look of `Control` nodes and cannot be overridden.

> method get_project_theme() -> Theme

Returns a reference to the custom project `Theme`. This theme resources allows to override the default engine theme for every control node in the project.
To set the project theme, see `ProjectSettings.gui/theme/custom`.

## Signals

> signal fallback_changed()

Emitted when one of the fallback values had been changed. Use it to refresh the look of controls that may rely on the fallback theme items.
