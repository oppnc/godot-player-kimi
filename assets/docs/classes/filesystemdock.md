# FileSystemDock

> class FileSystemDock
> inherits FileSystemDock EditorDock

## Brief

Godot editor's dock for managing files in the project.

## Description

This class is available only in `EditorPlugin`s and can't be instantiated. You can access it using `EditorInterface.get_file_system_dock`.
While `FileSystemDock` doesn't expose any methods for file manipulation, it can listen for various file-related signals.

## Methods

> method add_resource_tooltip_plugin(plugin: EditorResourceTooltipPlugin) -> void

Registers a new `EditorResourceTooltipPlugin`.

> method navigate_to_path(path: String) -> void

Sets the given `path` as currently selected, ensuring that the selected file/directory is visible.

> method remove_resource_tooltip_plugin(plugin: EditorResourceTooltipPlugin) -> void

Removes an `EditorResourceTooltipPlugin`. Fails if the plugin wasn't previously added.

## Signals

> signal display_mode_changed()

Emitted when the user switches file display mode or split mode.

> signal file_removed(file: String)

Emitted when the given `file` was removed.

> signal files_moved(old_file: String, new_file: String)

Emitted when a file is moved from `old_file` path to `new_file` path.

> signal folder_color_changed()

Emitted when folders change color.

> signal folder_moved(old_folder: String, new_folder: String)

Emitted when a folder is moved from `old_folder` path to `new_folder` path.

> signal folder_removed(folder: String)

Emitted when the given `folder` was removed.

> signal inherit(file: String)

Emitted when a new scene is created that inherits the scene at `file` path.

> signal instantiate(files: PackedStringArray)

Emitted when the given scenes are being instantiated in the editor.

> signal resource_removed(resource: Resource)

Emitted when an external `resource` had its file removed.

> signal selection_changed()

Emitted when the selection changes. Use `EditorInterface.get_selected_paths` in the connected method to get the selected paths.
