# Theme

> class Theme
> inherits Theme Resource

## Brief

A resource used for styling/skinning `Control`s and `Window`s.

## Description

A resource used for styling/skinning `Control` and `Window` nodes. While individual controls can be styled using their local theme overrides (see `Control.add_theme_color_override`), theme resources allow you to store and apply the same settings across all controls sharing the same type (e.g. style all `Button`s the same). One theme resource can be used for the entire project, but you can also set a separate theme resource to a branch of control nodes. A theme resource assigned to a control applies to the control itself, as well as all of its direct and indirect children (as long as a chain of controls is uninterrupted).
Use `ProjectSettings.gui/theme/custom` to set up a project-scope theme that will be available to every control in your project.
Use `Control.theme` of any control node to set up a theme that will be available to that control and all of its direct and indirect children.

## Properties

> property default_base_scale : float ; default=0.0 ; setter=set_default_base_scale ; getter=get_default_base_scale

The default base scale factor of this theme resource. Used by some controls to scale their visual properties based on the global scale factor. If this value is set to `0.0`, the global scale factor is used (see `ThemeDB.fallback_base_scale`).
Use `has_default_base_scale` to check if this value is valid.

> property default_font : Font ; setter=set_default_font ; getter=get_default_font

The default font of this theme resource. Used as the default value when trying to fetch a font resource that doesn't exist in this theme or is in invalid state. If the default font is also missing or invalid, the engine fallback value is used (see `ThemeDB.fallback_font`).
Use `has_default_font` to check if this value is valid.

> property default_font_size : int ; default=-1 ; setter=set_default_font_size ; getter=get_default_font_size

The default font size of this theme resource. Used as the default value when trying to fetch a font size value that doesn't exist in this theme or is in invalid state. If the default font size is also missing or invalid, the engine fallback value is used (see `ThemeDB.fallback_font_size`).
Values below `1` are invalid and can be used to unset the property. Use `has_default_font_size` to check if this value is valid.

## Methods

> method add_type(theme_type: StringName) -> void

Adds an empty theme type for every valid data type.
**Note:** Empty types are not saved with the theme. This method only exists to perform in-memory changes to the resource. Use available `set_*` methods to add theme items.

> method clear() -> void

Removes all the theme properties defined on the theme resource.

> method clear_color(name: StringName, theme_type: StringName) -> void

Removes the `Color` property defined by `name` and `theme_type`, if it exists.
Fails if it doesn't exist. Use `has_color` to check for existence.

> method clear_constant(name: StringName, theme_type: StringName) -> void

Removes the constant property defined by `name` and `theme_type`, if it exists.
Fails if it doesn't exist. Use `has_constant` to check for existence.

> method clear_font(name: StringName, theme_type: StringName) -> void

Removes the `Font` property defined by `name` and `theme_type`, if it exists.
Fails if it doesn't exist. Use `has_font` to check for existence.

> method clear_font_size(name: StringName, theme_type: StringName) -> void

Removes the font size property defined by `name` and `theme_type`, if it exists.
Fails if it doesn't exist. Use `has_font_size` to check for existence.

> method clear_icon(name: StringName, theme_type: StringName) -> void

Removes the icon property defined by `name` and `theme_type`, if it exists.
Fails if it doesn't exist. Use `has_icon` to check for existence.

> method clear_stylebox(name: StringName, theme_type: StringName) -> void

Removes the `StyleBox` property defined by `name` and `theme_type`, if it exists.
Fails if it doesn't exist. Use `has_stylebox` to check for existence.

> method clear_theme_item(data_type: DataType, name: StringName, theme_type: StringName) -> void

Removes the theme property of `data_type` defined by `name` and `theme_type`, if it exists.
Fails if it doesn't exist. Use `has_theme_item` to check for existence.
**Note:** This method is analogous to calling the corresponding data type specific method, but can be used for more generalized logic.

> method clear_type_variation(theme_type: StringName) -> void

Unmarks `theme_type` as being a variation of another theme type. See `set_type_variation`.

> method get_color(name: StringName, theme_type: StringName) -> Color ; qualifiers=const

Returns the `Color` property defined by `name` and `theme_type`, if it exists.
Returns the default color value if the property doesn't exist. Use `has_color` to check for existence.

> method get_color_list(theme_type: String) -> PackedStringArray ; qualifiers=const

Returns a list of names for `Color` properties defined with `theme_type`. Use `get_color_type_list` to get a list of possible theme type names.

> method get_color_type_list() -> PackedStringArray ; qualifiers=const

Returns a list of all unique theme type names for `Color` properties. Use `get_type_list` to get a list of all unique theme types.

> method get_constant(name: StringName, theme_type: StringName) -> int ; qualifiers=const

Returns the constant property defined by `name` and `theme_type`, if it exists.
Returns `0` if the property doesn't exist. Use `has_constant` to check for existence.

> method get_constant_list(theme_type: String) -> PackedStringArray ; qualifiers=const

Returns a list of names for constant properties defined with `theme_type`. Use `get_constant_type_list` to get a list of possible theme type names.

> method get_constant_type_list() -> PackedStringArray ; qualifiers=const

Returns a list of all unique theme type names for constant properties. Use `get_type_list` to get a list of all unique theme types.

> method get_font(name: StringName, theme_type: StringName) -> Font ; qualifiers=const

Returns the `Font` property defined by `name` and `theme_type`, if it exists.
Returns the default theme font if the property doesn't exist and the default theme font is set up (see `default_font`). Use `has_font` to check for existence of the property and `has_default_font` to check for existence of the default theme font.
Returns the engine fallback font value, if neither exist (see `ThemeDB.fallback_font`).

> method get_font_list(theme_type: String) -> PackedStringArray ; qualifiers=const

Returns a list of names for `Font` properties defined with `theme_type`. Use `get_font_type_list` to get a list of possible theme type names.

> method get_font_size(name: StringName, theme_type: StringName) -> int ; qualifiers=const

Returns the font size property defined by `name` and `theme_type`, if it exists.
Returns the default theme font size if the property doesn't exist and the default theme font size is set up (see `default_font_size`). Use `has_font_size` to check for existence of the property and `has_default_font_size` to check for existence of the default theme font.
Returns the engine fallback font size value, if neither exist (see `ThemeDB.fallback_font_size`).

> method get_font_size_list(theme_type: String) -> PackedStringArray ; qualifiers=const

Returns a list of names for font size properties defined with `theme_type`. Use `get_font_size_type_list` to get a list of possible theme type names.

> method get_font_size_type_list() -> PackedStringArray ; qualifiers=const

Returns a list of all unique theme type names for font size properties. Use `get_type_list` to get a list of all unique theme types.

> method get_font_type_list() -> PackedStringArray ; qualifiers=const

Returns a list of all unique theme type names for `Font` properties. Use `get_type_list` to get a list of all unique theme types.

> method get_icon(name: StringName, theme_type: StringName) -> Texture2D ; qualifiers=const

Returns the icon property defined by `name` and `theme_type`, if it exists.
Returns the engine fallback icon value if the property doesn't exist (see `ThemeDB.fallback_icon`). Use `has_icon` to check for existence.

> method get_icon_list(theme_type: String) -> PackedStringArray ; qualifiers=const

Returns a list of names for icon properties defined with `theme_type`. Use `get_icon_type_list` to get a list of possible theme type names.

> method get_icon_type_list() -> PackedStringArray ; qualifiers=const

Returns a list of all unique theme type names for icon properties. Use `get_type_list` to get a list of all unique theme types.

> method get_stylebox(name: StringName, theme_type: StringName) -> StyleBox ; qualifiers=const

Returns the `StyleBox` property defined by `name` and `theme_type`, if it exists.
Returns the engine fallback stylebox value if the property doesn't exist (see `ThemeDB.fallback_stylebox`). Use `has_stylebox` to check for existence.

> method get_stylebox_list(theme_type: String) -> PackedStringArray ; qualifiers=const

Returns a list of names for `StyleBox` properties defined with `theme_type`. Use `get_stylebox_type_list` to get a list of possible theme type names.

> method get_stylebox_type_list() -> PackedStringArray ; qualifiers=const

Returns a list of all unique theme type names for `StyleBox` properties. Use `get_type_list` to get a list of all unique theme types.

> method get_theme_item(data_type: DataType, name: StringName, theme_type: StringName) -> Variant ; qualifiers=const

Returns the theme property of `data_type` defined by `name` and `theme_type`, if it exists.
Returns the engine fallback value if the property doesn't exist (see `ThemeDB`). Use `has_theme_item` to check for existence.
**Note:** This method is analogous to calling the corresponding data type specific method, but can be used for more generalized logic.

> method get_theme_item_list(data_type: DataType, theme_type: String) -> PackedStringArray ; qualifiers=const

Returns a list of names for properties of `data_type` defined with `theme_type`. Use `get_theme_item_type_list` to get a list of possible theme type names.
**Note:** This method is analogous to calling the corresponding data type specific method, but can be used for more generalized logic.

> method get_theme_item_type_list(data_type: DataType) -> PackedStringArray ; qualifiers=const

Returns a list of all unique theme type names for `data_type` properties. Use `get_type_list` to get a list of all unique theme types.
**Note:** This method is analogous to calling the corresponding data type specific method, but can be used for more generalized logic.

> method get_type_list() -> PackedStringArray ; qualifiers=const

Returns a list of all unique theme type names. Use the appropriate `get_*_type_list` method to get a list of unique theme types for a single data type.

> method get_type_variation_base(theme_type: StringName) -> StringName ; qualifiers=const

Returns the name of the base theme type if `theme_type` is a valid variation type. Returns an empty string otherwise.

> method get_type_variation_list(base_type: StringName) -> PackedStringArray ; qualifiers=const

Returns a list of all type variations for the given `base_type`.

> method has_color(name: StringName, theme_type: StringName) -> bool ; qualifiers=const

Returns `true` if the `Color` property defined by `name` and `theme_type` exists.
Returns `false` if it doesn't exist. Use `set_color` to define it.

> method has_constant(name: StringName, theme_type: StringName) -> bool ; qualifiers=const

Returns `true` if the constant property defined by `name` and `theme_type` exists.
Returns `false` if it doesn't exist. Use `set_constant` to define it.

> method has_default_base_scale() -> bool ; qualifiers=const

Returns `true` if `default_base_scale` has a valid value.
Returns `false` if it doesn't. The value must be greater than `0.0` to be considered valid.

> method has_default_font() -> bool ; qualifiers=const

Returns `true` if `default_font` has a valid value.
Returns `false` if it doesn't.

> method has_default_font_size() -> bool ; qualifiers=const

Returns `true` if `default_font_size` has a valid value.
Returns `false` if it doesn't. The value must be greater than `0` to be considered valid.

> method has_font(name: StringName, theme_type: StringName) -> bool ; qualifiers=const

Returns `true` if the `Font` property defined by `name` and `theme_type` exists, or if the default theme font is set up (see `has_default_font`).
Returns `false` if neither exist. Use `set_font` to define the property.

> method has_font_size(name: StringName, theme_type: StringName) -> bool ; qualifiers=const

Returns `true` if the font size property defined by `name` and `theme_type` exists, or if the default theme font size is set up (see `has_default_font_size`).
Returns `false` if neither exist. Use `set_font_size` to define the property.

> method has_icon(name: StringName, theme_type: StringName) -> bool ; qualifiers=const

Returns `true` if the icon property defined by `name` and `theme_type` exists.
Returns `false` if it doesn't exist. Use `set_icon` to define it.

> method has_stylebox(name: StringName, theme_type: StringName) -> bool ; qualifiers=const

Returns `true` if the `StyleBox` property defined by `name` and `theme_type` exists.
Returns `false` if it doesn't exist. Use `set_stylebox` to define it.

> method has_theme_item(data_type: DataType, name: StringName, theme_type: StringName) -> bool ; qualifiers=const

Returns `true` if the theme property of `data_type` defined by `name` and `theme_type` exists.
Returns `false` if it doesn't exist. Use `set_theme_item` to define it.
**Note:** This method is analogous to calling the corresponding data type specific method, but can be used for more generalized logic.

> method is_type_variation(theme_type: StringName, base_type: StringName) -> bool ; qualifiers=const

Returns `true` if `theme_type` is marked as a variation of `base_type`.

> method merge_with(other: Theme) -> void

Adds missing and overrides existing definitions with values from the `other` theme resource.
**Note:** This modifies the current theme. If you want to merge two themes together without modifying either one, create a new empty theme and merge the other two into it one after another.

> method remove_type(theme_type: StringName) -> void

Removes the theme type, gracefully discarding defined theme items. If the type is a variation, this information is also erased. If the type is a base for type variations, those variations lose their base.

> method rename_color(old_name: StringName, name: StringName, theme_type: StringName) -> void

Renames the `Color` property defined by `old_name` and `theme_type` to `name`, if it exists.
Fails if it doesn't exist, or if a similar property with the new name already exists. Use `has_color` to check for existence, and `clear_color` to remove the existing property.

> method rename_constant(old_name: StringName, name: StringName, theme_type: StringName) -> void

Renames the constant property defined by `old_name` and `theme_type` to `name`, if it exists.
Fails if it doesn't exist, or if a similar property with the new name already exists. Use `has_constant` to check for existence, and `clear_constant` to remove the existing property.

> method rename_font(old_name: StringName, name: StringName, theme_type: StringName) -> void

Renames the `Font` property defined by `old_name` and `theme_type` to `name`, if it exists.
Fails if it doesn't exist, or if a similar property with the new name already exists. Use `has_font` to check for existence, and `clear_font` to remove the existing property.

> method rename_font_size(old_name: StringName, name: StringName, theme_type: StringName) -> void

Renames the font size property defined by `old_name` and `theme_type` to `name`, if it exists.
Fails if it doesn't exist, or if a similar property with the new name already exists. Use `has_font_size` to check for existence, and `clear_font_size` to remove the existing property.

> method rename_icon(old_name: StringName, name: StringName, theme_type: StringName) -> void

Renames the icon property defined by `old_name` and `theme_type` to `name`, if it exists.
Fails if it doesn't exist, or if a similar property with the new name already exists. Use `has_icon` to check for existence, and `clear_icon` to remove the existing property.

> method rename_stylebox(old_name: StringName, name: StringName, theme_type: StringName) -> void

Renames the `StyleBox` property defined by `old_name` and `theme_type` to `name`, if it exists.
Fails if it doesn't exist, or if a similar property with the new name already exists. Use `has_stylebox` to check for existence, and `clear_stylebox` to remove the existing property.

> method rename_theme_item(data_type: DataType, old_name: StringName, name: StringName, theme_type: StringName) -> void

Renames the theme property of `data_type` defined by `old_name` and `theme_type` to `name`, if it exists.
Fails if it doesn't exist, or if a similar property with the new name already exists. Use `has_theme_item` to check for existence, and `clear_theme_item` to remove the existing property.
**Note:** This method is analogous to calling the corresponding data type specific method, but can be used for more generalized logic.

> method rename_type(old_theme_type: StringName, theme_type: StringName) -> void

Renames the theme type `old_theme_type` to `theme_type`, if the old type exists and the new one doesn't exist.
**Note:** Renaming a theme type to an empty name or a variation to a type associated with a built-in class removes type variation connections in a way that cannot be undone by reversing the rename alone.

> method set_color(name: StringName, theme_type: StringName, color: Color) -> void

Creates or changes the value of the `Color` property defined by `name` and `theme_type`. Use `clear_color` to remove the property.

> method set_constant(name: StringName, theme_type: StringName, constant: int) -> void

Creates or changes the value of the constant property defined by `name` and `theme_type`. Use `clear_constant` to remove the property.

> method set_font(name: StringName, theme_type: StringName, font: Font) -> void

Creates or changes the value of the `Font` property defined by `name` and `theme_type`. Use `clear_font` to remove the property.

> method set_font_size(name: StringName, theme_type: StringName, font_size: int) -> void

Creates or changes the value of the font size property defined by `name` and `theme_type`. Use `clear_font_size` to remove the property.

> method set_icon(name: StringName, theme_type: StringName, texture: Texture2D) -> void

Creates or changes the value of the icon property defined by `name` and `theme_type`. Use `clear_icon` to remove the property.

> method set_stylebox(name: StringName, theme_type: StringName, texture: StyleBox) -> void

Creates or changes the value of the `StyleBox` property defined by `name` and `theme_type`. Use `clear_stylebox` to remove the property.

> method set_theme_item(data_type: DataType, name: StringName, theme_type: StringName, value: Variant) -> void

Creates or changes the value of the theme property of `data_type` defined by `name` and `theme_type`. Use `clear_theme_item` to remove the property.
Fails if the `value` type is not accepted by `data_type`.
**Note:** This method is analogous to calling the corresponding data type specific method, but can be used for more generalized logic.

> method set_type_variation(theme_type: StringName, base_type: StringName) -> void

Marks `theme_type` as a variation of `base_type`.
This adds `theme_type` as a suggested option for `Control.theme_type_variation` on a `Control` that is of the `base_type` class.
Variations can also be nested, i.e. `base_type` can be another variation. If a chain of variations ends with a `base_type` matching the class of the `Control`, the whole chain is going to be suggested as options.
**Note:** Suggestions only show up if this theme resource is set as the project default theme. See `ProjectSettings.gui/theme/custom`.

## Enumerations

> enum DataType

> enum_value DataType.DATA_TYPE_COLOR = 0

Theme's `Color` item type.

> enum_value DataType.DATA_TYPE_CONSTANT = 1

Theme's constant item type.

> enum_value DataType.DATA_TYPE_FONT = 2

Theme's `Font` item type.

> enum_value DataType.DATA_TYPE_FONT_SIZE = 3

Theme's font size item type.

> enum_value DataType.DATA_TYPE_ICON = 4

Theme's icon `Texture2D` item type.

> enum_value DataType.DATA_TYPE_STYLEBOX = 5

Theme's `StyleBox` item type.

> enum_value DataType.DATA_TYPE_MAX = 6

Maximum value for the DataType enum.

## Tutorials
- [GUI skinning]($DOCS_URL/tutorials/ui/gui_skinning.html)
- [Using the theme editor]($DOCS_URL/tutorials/ui/gui_using_theme_editor.html)
