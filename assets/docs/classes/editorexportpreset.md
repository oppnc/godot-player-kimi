# EditorExportPreset

> class EditorExportPreset
> inherits EditorExportPreset RefCounted

## Brief

Export preset configuration.

## Description

Represents the configuration of an export preset, as created by the editor's export dialog. An `EditorExportPreset` instance is intended to be used a read-only configuration passed to the `EditorExportPlatform` methods when exporting the project.

## Methods

> method are_advanced_options_enabled() -> bool ; qualifiers=const

Returns `true` if the "Advanced" toggle is enabled in the export dialog.

> method get_custom_features() -> String ; qualifiers=const

Returns a comma-separated list of custom features added to this preset, as a string. See [Feature tags]($DOCS_URL/tutorials/export/feature_tags.html) in the documentation for more information.

> method get_customized_files() -> Dictionary ; qualifiers=const

Returns a dictionary of files selected in the "Resources" tab of the export dialog. The dictionary's keys are file paths, and its values are the corresponding export modes: `"strip"`, `"keep"`, or `"remove"`. See also `get_file_export_mode`.

> method get_customized_files_count() -> int ; qualifiers=const

Returns the number of files selected in the "Resources" tab of the export dialog.

> method get_encrypt_directory() -> bool ; qualifiers=const

Returns `true` if PCK directory encryption is enabled in the export dialog.

> method get_encrypt_pck() -> bool ; qualifiers=const

Returns `true` if PCK encryption is enabled in the export dialog.

> method get_encryption_ex_filter() -> String ; qualifiers=const

Returns file filters to exclude during PCK encryption.

> method get_encryption_in_filter() -> String ; qualifiers=const

Returns file filters to include during PCK encryption.

> method get_encryption_key() -> String ; qualifiers=const

Returns PCK encryption key.

> method get_exclude_filter() -> String ; qualifiers=const

Returns file filters to exclude during export.

> method get_export_filter() -> ExportFilter ; qualifiers=const

Returns export file filter mode selected in the "Resources" tab of the export dialog.

> method get_export_path() -> String ; qualifiers=const

Returns export target path.

> method get_file_export_mode(path: String, default: FileExportMode = 0) -> FileExportMode ; qualifiers=const

Returns file export mode for the specified file.

> method get_files_to_export() -> PackedStringArray ; qualifiers=const

Returns array of files to export.

> method get_include_filter() -> String ; qualifiers=const

Returns file filters to include during export.

> method get_or_env(name: StringName, env_var: String) -> Variant ; qualifiers=const

Returns export option value or value of environment variable if it is set.

> method get_patches() -> PackedStringArray ; qualifiers=const

Returns the list of packs on which to base a patch export on.

> method get_preset_name() -> String ; qualifiers=const

Returns this export preset's name.

> method get_project_setting(name: StringName) -> Variant

Returns the value of the setting identified by `name` using export preset feature tag overrides instead of current OS features.

> method get_script_export_mode() -> ScriptExportMode ; qualifiers=const

Returns the export mode used by GDScript files. `0` for "Text", `1` for "Binary tokens", and `2` for "Compressed binary tokens (smaller files)".

> method get_version(name: StringName, windows_version: bool) -> String ; qualifiers=const

Returns the preset's version number, or fall back to the `ProjectSettings.application/config/version` project setting if set to an empty string.
If `windows_version` is `true`, formats the returned version number to be compatible with Windows executable metadata.

> method has(property: StringName) -> bool ; qualifiers=const

Returns `true` if the preset has the property named `property`.

> method has_export_file(path: String) -> bool

Returns `true` if the file at the specified `path` will be exported.

> method is_dedicated_server() -> bool ; qualifiers=const

Returns `true` if the dedicated server export mode is selected in the export dialog.

> method is_runnable() -> bool ; qualifiers=const

Returns `true` if the "Runnable" toggle is enabled in the export dialog.

## Enumerations

> enum ExportFilter

> enum_value ExportFilter.EXPORT_ALL_RESOURCES = 0

> enum_value ExportFilter.EXPORT_SELECTED_SCENES = 1

> enum_value ExportFilter.EXPORT_SELECTED_RESOURCES = 2

> enum_value ExportFilter.EXCLUDE_SELECTED_RESOURCES = 3

> enum_value ExportFilter.EXPORT_CUSTOMIZED = 4

> enum FileExportMode

> enum_value FileExportMode.MODE_FILE_NOT_CUSTOMIZED = 0

> enum_value FileExportMode.MODE_FILE_STRIP = 1

> enum_value FileExportMode.MODE_FILE_KEEP = 2

> enum_value FileExportMode.MODE_FILE_REMOVE = 3

> enum ScriptExportMode

> enum_value ScriptExportMode.MODE_SCRIPT_TEXT = 0

> enum_value ScriptExportMode.MODE_SCRIPT_BINARY_TOKENS = 1

> enum_value ScriptExportMode.MODE_SCRIPT_BINARY_TOKENS_COMPRESSED = 2
