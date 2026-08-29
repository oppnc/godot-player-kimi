# EditorResourcePicker

> class EditorResourcePicker
> inherits EditorResourcePicker HBoxContainer

## Brief

Godot editor's control for selecting `Resource` type properties.

## Description

This `Control` node is used in the editor's Inspector dock to allow editing of `Resource` type properties. It provides options for creating, loading, saving and converting resources. Can be used with `EditorInspectorPlugin` to recreate the same behavior.
**Note:** This `Control` does not include any editor for the resource, as editing is controlled by the Inspector dock itself or sub-Inspectors.

## Properties

> property base_type : String ; default="" ; setter=set_base_type ; getter=get_base_type

The base type of allowed resource types. Can be a comma-separated list of several options.

> property editable : bool ; default=true ; setter=set_editable ; getter=is_editable

If `true`, the value can be selected and edited.

> property edited_resource : Resource ; setter=set_edited_resource ; getter=get_edited_resource

The edited resource value.

> property toggle_mode : bool ; default=false ; setter=set_toggle_mode ; getter=is_toggle_mode

If `true`, the main button with the resource preview works in the toggle mode. Use `set_toggle_pressed` to manually set the state.

## Methods

> method _handle_menu_selected(id: int) -> bool ; qualifiers=virtual

This virtual method can be implemented to handle context menu items not handled by default. See `_set_create_options`.

> method _set_create_options(menu_node: Object) -> void ; qualifiers=virtual

This virtual method is called when updating the context menu of an `editable` `EditorResourcePicker`. Implement this method to override the "New" items section with your own options. `menu_node` is a reference to the `PopupMenu` node.
**Note:** Implement `_handle_menu_selected` to handle these custom items.
**Note:** Relevant built-in options ("Load", "Copy", "Paste", etc.) are automatically added to the `menu_node` afterwards, using their hard-coded IDs starting from `0`. Custom options need to use non-colliding IDs to be handled properly. Using `id = 100 + custom_option_index` is safe (this is what the default items in the "New" section use).

> method get_allowed_types() -> PackedStringArray ; qualifiers=const

Returns a list of all allowed types and subtypes corresponding to the `base_type`. If the `base_type` is empty, an empty list is returned.

> method set_toggle_pressed(pressed: bool) -> void

Sets the toggle mode state for the main button. Works only if `toggle_mode` is set to `true`.

## Signals

> signal resource_changed(resource: Resource)

Emitted when the value of the edited resource was changed.

> signal resource_selected(resource: Resource, inspect: bool)

Emitted when the resource value was set and user clicked to edit it. When `inspect` is `true`, the signal was caused by the context menu "Edit" or "Inspect" option.
