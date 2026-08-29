# EditorFileDialog

> class EditorFileDialog
> inherits EditorFileDialog FileDialog

## Brief

A modified version of `FileDialog` used by the editor.

## Description

`EditorFileDialog` is a `FileDialog` tweaked to work in the editor. It automatically handles favorite and recent directory lists, and synchronizes some properties with their corresponding editor settings.
`EditorFileDialog` will automatically show a native dialog based on the `EditorSettings.interface/editor/appearance/use_native_file_dialogs` editor setting and ignores `FileDialog.use_native_dialog`.
**Note:** `EditorFileDialog` is invisible by default. To make it visible, call one of the `popup_*` methods from `Window` on the node, such as `Window.popup_centered_clamped`.
**Note:** On Linux and macOS, sandboxed apps always use native dialogs to access the host file system.

## Properties

> property disable_overwrite_warning : bool ; default=false ; setter=set_disable_overwrite_warning ; getter=is_overwrite_warning_disabled ; deprecated=Use `FileDialog.overwrite_warning_enabled` instead.

If `true`, the `EditorFileDialog` will not warn the user before overwriting files.

## Methods

> method add_side_menu(menu: Control, title: String = "") -> void ; deprecated=This feature is no longer supported.

This method is kept for compatibility and does nothing. As an alternative, you can display another dialog after showing the file dialog.
