# EditorScenePostImportPlugin

> class EditorScenePostImportPlugin
> inherits EditorScenePostImportPlugin RefCounted

## Brief

Plugin to control and modifying the process of importing a scene.

## Description

This plugin type exists to modify the process of importing scenes, allowing to change the content as well as add importer options at every stage of the process.

## Methods

> method _get_import_options(path: String) -> void ; qualifiers=virtual

Override to add general import options. These will appear in the main import dock on the editor. Add options via `add_import_option` and `add_import_option_advanced`.

> method _get_internal_import_options(category: int) -> void ; qualifiers=virtual

Override to add internal import options. These will appear in the 3D scene import dialog. Add options via `add_import_option` and `add_import_option_advanced`.

> method _get_internal_option_update_view_required(category: int, option: String) -> Variant ; qualifiers=virtual const

Should return `true` if the 3D view of the import dialog needs to update when changing the given option.

> method _get_internal_option_visibility(category: int, for_animation: bool, option: String) -> Variant ; qualifiers=virtual const

Should return `true` to show the given option, `false` to hide the given option, or `null` to ignore.

> method _get_option_visibility(path: String, for_animation: bool, option: String) -> Variant ; qualifiers=virtual const

Should return `true` to show the given option, `false` to hide the given option, or `null` to ignore.

> method _internal_process(category: int, base_node: Node, node: Node, resource: Resource) -> void ; qualifiers=virtual

Process a specific node or resource for a given category.

> method _post_process(scene: Node) -> void ; qualifiers=virtual

Post-process the scene. This function is called after the final scene has been configured.

> method _pre_process(scene: Node) -> void ; qualifiers=virtual

Pre-process the scene. This function is called right after the scene format loader loaded the scene and no changes have been made.
Pre-process may be used to adjust internal import options in the `"nodes"`, `"meshes"`, `"animations"` or `"materials"` keys inside `get_option_value("_subresources")`.

> method add_import_option(name: String, value: Variant) -> void

Add a specific import option (name and default value only). This function can only be called from `_get_import_options` and `_get_internal_import_options`.

> method add_import_option_advanced(type: Variant.Type, name: String, default_value: Variant, hint: PropertyHint = 0, hint_string: String = "", usage_flags: int = 6) -> void

Add a specific import option. This function can only be called from `_get_import_options` and `_get_internal_import_options`.

> method get_option_value(name: StringName) -> Variant ; qualifiers=const

Query the value of an option. This function can only be called from those querying visibility, or processing.

## Enumerations

> enum InternalImportCategory

> enum_value InternalImportCategory.INTERNAL_IMPORT_CATEGORY_NODE = 0

> enum_value InternalImportCategory.INTERNAL_IMPORT_CATEGORY_MESH_3D_NODE = 1

> enum_value InternalImportCategory.INTERNAL_IMPORT_CATEGORY_MESH = 2

> enum_value InternalImportCategory.INTERNAL_IMPORT_CATEGORY_MATERIAL = 3

> enum_value InternalImportCategory.INTERNAL_IMPORT_CATEGORY_ANIMATION = 4

> enum_value InternalImportCategory.INTERNAL_IMPORT_CATEGORY_ANIMATION_NODE = 5

> enum_value InternalImportCategory.INTERNAL_IMPORT_CATEGORY_SKELETON_3D_NODE = 6

> enum_value InternalImportCategory.INTERNAL_IMPORT_CATEGORY_MAX = 7
