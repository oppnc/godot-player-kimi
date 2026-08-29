# EditorExportPlatformExtension

> class EditorExportPlatformExtension
> inherits EditorExportPlatformExtension EditorExportPlatform

## Brief

Base class for custom `EditorExportPlatform` implementations (plugins).

## Description

External `EditorExportPlatform` implementations should inherit from this class.
To use `EditorExportPlatform`, register it using the `EditorPlugin.add_export_platform` method first.

## Methods

> method _can_export(preset: EditorExportPreset, debug: bool) -> bool ; qualifiers=virtual const

Returns `true` if the specified `preset` is valid and can be exported. Use `set_config_error` and `set_config_missing_templates` to set error details.
Usual implementations call `_has_valid_export_configuration` and `_has_valid_project_configuration` to determine if exporting is possible.

> method _cleanup() -> void ; qualifiers=virtual

Called by the editor before platform is unregistered.

> method _export_pack(preset: EditorExportPreset, debug: bool, path: String, flags: BitField[EditorExportPlatform.DebugFlags]) -> Error ; qualifiers=virtual

Creates a PCK archive at `path` for the specified `preset`.
This method is called when "Export PCK/ZIP" button is pressed in the export dialog, with "Export as Patch" disabled, and PCK is selected as a file type.

> method _export_pack_patch(preset: EditorExportPreset, debug: bool, path: String, patches: PackedStringArray, flags: BitField[EditorExportPlatform.DebugFlags]) -> Error ; qualifiers=virtual

Creates a patch PCK archive at `path` for the specified `preset`, containing only the files that have changed since the last patch.
This method is called when "Export PCK/ZIP" button is pressed in the export dialog, with "Export as Patch" enabled, and PCK is selected as a file type.
**Note:** The patches provided in `patches` have already been loaded when this method is called and are merely provided as context. When empty the patches defined in the export preset have been loaded instead.

> method _export_project(preset: EditorExportPreset, debug: bool, path: String, flags: BitField[EditorExportPlatform.DebugFlags]) -> Error ; qualifiers=virtual required

Creates a full project at `path` for the specified `preset`.
This method is called when "Export" button is pressed in the export dialog.
This method implementation can call `EditorExportPlatform.save_pack` or `EditorExportPlatform.save_zip` to use default PCK/ZIP export process, or calls `EditorExportPlatform.export_project_files` and implement custom callback for processing each exported file.

> method _export_zip(preset: EditorExportPreset, debug: bool, path: String, flags: BitField[EditorExportPlatform.DebugFlags]) -> Error ; qualifiers=virtual

Create a ZIP archive at `path` for the specified `preset`.
This method is called when "Export PCK/ZIP" button is pressed in the export dialog, with "Export as Patch" disabled, and ZIP is selected as a file type.

> method _export_zip_patch(preset: EditorExportPreset, debug: bool, path: String, patches: PackedStringArray, flags: BitField[EditorExportPlatform.DebugFlags]) -> Error ; qualifiers=virtual

Create a ZIP archive at `path` for the specified `preset`, containing only the files that have changed since the last patch.
This method is called when "Export PCK/ZIP" button is pressed in the export dialog, with "Export as Patch" enabled, and ZIP is selected as a file type.
**Note:** The patches provided in `patches` have already been loaded when this method is called and are merely provided as context. When empty the patches defined in the export preset have been loaded instead.

> method _get_binary_extensions(preset: EditorExportPreset) -> PackedStringArray ; qualifiers=virtual required const

Returns array of supported binary extensions for the full project export.

> method _get_debug_protocol() -> String ; qualifiers=virtual const

Returns protocol used for remote debugging. Default implementation return `tcp://`.

> method _get_device_architecture(device: int) -> String ; qualifiers=virtual const

Returns device architecture for one-click deploy.

> method _get_export_option_visibility(preset: EditorExportPreset, option: String) -> bool ; qualifiers=virtual const

Validates `option` and returns visibility for the specified `preset`. Default implementation return `true` for all options.

> method _get_export_option_warning(preset: EditorExportPreset, option: StringName) -> String ; qualifiers=virtual const

Validates `option` and returns warning message for the specified `preset`. Default implementation return empty string for all options.

> method _get_export_options() -> Array[Dictionary] ; qualifiers=virtual const

Returns a property list, as an `Array` of dictionaries. Each `Dictionary` must at least contain the `name: StringName` and `type: Variant.Type` entries.
Additionally, the following keys are supported:
- `hint: PropertyHint`
- `hint_string: String`
- `usage: PropertyUsageFlags`
- `class_name: StringName`
- `default_value: Variant`, default value of the property.
- `update_visibility: bool`, if set to `true`, `_get_export_option_visibility` is called for each property when this property is changed.
- `required: bool`, if set to `true`, this property warnings are critical, and should be resolved to make export possible. This value is a hint for the `_has_valid_export_configuration` implementation, and not used by the engine directly.
See also `Object._get_property_list`.

> method _get_logo() -> Texture2D ; qualifiers=virtual required const

Returns the platform logo displayed in the export dialog. The logo should be 32×32 pixels, adjusted for the current editor scale (see `EditorInterface.get_editor_scale`).

> method _get_name() -> String ; qualifiers=virtual required const

Returns export platform name.

> method _get_option_icon(device: int) -> Texture2D ; qualifiers=virtual const

Returns the item icon for the specified `device` in the one-click deploy menu. The icon should be 16×16 pixels, adjusted for the current editor scale (see `EditorInterface.get_editor_scale`).

> method _get_option_label(device: int) -> String ; qualifiers=virtual const

Returns one-click deploy menu item label for the specified `device`.

> method _get_option_tooltip(device: int) -> String ; qualifiers=virtual const

Returns one-click deploy menu item tooltip for the specified `device`.

> method _get_options_count() -> int ; qualifiers=virtual const

Returns the number of devices (or other options) available in the one-click deploy menu.

> method _get_options_tooltip() -> String ; qualifiers=virtual const

Returns tooltip of the one-click deploy menu button.

> method _get_os_name() -> String ; qualifiers=virtual required const

Returns target OS name.

> method _get_platform_features() -> PackedStringArray ; qualifiers=virtual required const

Returns array of platform specific features.

> method _get_preset_features(preset: EditorExportPreset) -> PackedStringArray ; qualifiers=virtual required const

Returns array of platform specific features for the specified `preset`.

> method _get_run_icon() -> Texture2D ; qualifiers=virtual const

Returns the icon of the one-click deploy menu button. The icon should be 16×16 pixels, adjusted for the current editor scale (see `EditorInterface.get_editor_scale`).

> method _has_valid_export_configuration(preset: EditorExportPreset, debug: bool) -> bool ; qualifiers=virtual required const

Returns `true` if export configuration is valid.

> method _has_valid_project_configuration(preset: EditorExportPreset) -> bool ; qualifiers=virtual required const

Returns `true` if project configuration is valid.

> method _initialize() -> void ; qualifiers=virtual

Initializes the plugin. Called by the editor when platform is registered.

> method _is_executable(path: String) -> bool ; qualifiers=virtual const

Returns `true` if specified file is a valid executable (native executable or script) for the target platform.

> method _poll_export() -> bool ; qualifiers=virtual

Returns `true` if one-click deploy options are changed and editor interface should be updated.

> method _run(preset: EditorExportPreset, device: int, debug_flags: BitField[EditorExportPlatform.DebugFlags]) -> Error ; qualifiers=virtual

This method is called when `device` one-click deploy menu option is selected.
Implementation should export project to a temporary location, upload and run it on the specific `device`, or perform another action associated with the menu item.

> method _should_update_export_options() -> bool ; qualifiers=virtual

Returns `true` if export options list is changed and presets should be updated.

> method get_config_error() -> String ; qualifiers=const

Returns current configuration error message text. This method should be called only from the `_can_export`, `_has_valid_export_configuration`, or `_has_valid_project_configuration` implementations.

> method get_config_missing_templates() -> bool ; qualifiers=const

Returns `true` is export templates are missing from the current configuration. This method should be called only from the `_can_export`, `_has_valid_export_configuration`, or `_has_valid_project_configuration` implementations.

> method set_config_error(error_text: String) -> void ; qualifiers=const

Sets current configuration error message text. This method should be called only from the `_can_export`, `_has_valid_export_configuration`, or `_has_valid_project_configuration` implementations.

> method set_config_missing_templates(missing_templates: bool) -> void ; qualifiers=const

Set to `true` is export templates are missing from the current configuration. This method should be called only from the `_can_export`, `_has_valid_export_configuration`, or `_has_valid_project_configuration` implementations.
