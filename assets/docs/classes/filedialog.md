# FileDialog

> class FileDialog
> inherits FileDialog ConfirmationDialog

## Brief

A dialog for selecting files or directories in the filesystem.

## Description

`FileDialog` is a preset dialog used to choose files and directories in the filesystem. It supports filter masks. `FileDialog` automatically sets its window title according to the `file_mode`. If you want to use a custom title, disable this by setting `mode_overrides_title` to `false`.
**Note:** `FileDialog` is invisible by default. To make it visible, call one of the `popup_*` methods from `Window` on the node, such as `Window.popup_centered_clamped`.

## Properties

> property access : Access ; default=0 ; setter=set_access ; getter=get_access

The file system access scope.
**Warning:** In Web builds, FileDialog cannot access the host file system. In sandboxed Linux and macOS environments, `use_native_dialog` is automatically used to allow limited access to host file system.

> property current_dir : String ; setter=set_current_dir ; getter=get_current_dir

The current working directory of the file dialog.
**Note:** For native file dialogs, this property is only treated as a hint and may not be respected by specific OS implementations.

> property current_file : String ; setter=set_current_file ; getter=get_current_file

The currently selected file of the file dialog.

> property current_path : String ; setter=set_current_path ; getter=get_current_path

The currently selected file path of the file dialog.

> property deleting_enabled : bool ; default=true ; setter=set_customization_flag_enabled ; getter=is_customization_flag_enabled

If `true`, the context menu will show the "Delete" option, which allows moving files and folders to trash.

> property dialog_hide_on_ok : bool ; default=false ; setter=set_hide_on_ok ; getter=get_hide_on_ok ; overrides=AcceptDialog

> property display_mode : DisplayMode ; default=0 ; setter=set_display_mode ; getter=get_display_mode

Display mode of the dialog's file list.

> property favorites_enabled : bool ; default=true ; setter=set_customization_flag_enabled ; getter=is_customization_flag_enabled

If `true`, shows the toggle favorite button and favorite list on the left side of the dialog.

> property file_filter_toggle_enabled : bool ; default=true ; setter=set_customization_flag_enabled ; getter=is_customization_flag_enabled

If `true`, shows the toggle file filter button.

> property file_mode : FileMode ; default=4 ; setter=set_file_mode ; getter=get_file_mode

The dialog's open or save mode, which affects the selection behavior.

> property file_sort_options_enabled : bool ; default=true ; setter=set_customization_flag_enabled ; getter=is_customization_flag_enabled

If `true`, shows the file sorting options button.

> property filename_filter : String ; default="" ; setter=set_filename_filter ; getter=get_filename_filter

The filter for file names (case-insensitive). When set to a non-empty string, only files that contains the substring will be shown. `filename_filter` can be edited by the user with the filter button at the top of the file dialog.
See also `filters`, which should be used to restrict the file types that can be selected instead of `filename_filter` which is meant to be set by the user.

> property filters : PackedStringArray ; default=PackedStringArray() ; setter=set_filters ; getter=get_filters

The available file type filters. Each filter string in the array should be formatted like this: `*.png,*.jpg,*.jpeg;Image Files;image/png,image/jpeg`. The description text of the filter is optional and can be omitted. Both file extensions and MIME type should be always set.
**Note:** Embedded file dialogs and Windows file dialogs support only file extensions, while Android, Linux, and macOS file dialogs also support MIME types.

> property folder_creation_enabled : bool ; default=true ; setter=set_customization_flag_enabled ; getter=is_customization_flag_enabled

If `true`, shows the button for creating new directories (when using `FILE_MODE_OPEN_DIR`, `FILE_MODE_OPEN_ANY`, or `FILE_MODE_SAVE_FILE`), and the context menu will have the "New Folder..." option.

> property hidden_files_toggle_enabled : bool ; default=true ; setter=set_customization_flag_enabled ; getter=is_customization_flag_enabled

If `true`, shows the toggle hidden files button.

> property layout_toggle_enabled : bool ; default=true ; setter=set_customization_flag_enabled ; getter=is_customization_flag_enabled

If `true`, shows the layout switch buttons (list/thumbnails).

> property mode_overrides_title : bool ; default=true ; setter=set_mode_overrides_title ; getter=is_mode_overriding_title

If `true`, changing the `file_mode` property will set the window title accordingly (e.g. setting `file_mode` to `FILE_MODE_OPEN_FILE` will change the window title to "Open a File").

> property option_count : int ; default=0 ; setter=set_option_count ; getter=get_option_count

The number of additional `OptionButton`s and `CheckBox`es in the dialog.

> property option_{index}/default : int ; default=0

The default value for the option at `index`.
**Note:** `index` is a value in the `0 .. option_count - 1` range.

> property option_{index}/name : String ; default=""

The name of the option at `index`.
**Note:** `index` is a value in the `0 .. option_count - 1` range.

> property option_{index}/values : PackedStringArray ; default=PackedStringArray()

The list of values for the option at `index`.
**Note:** `index` is a value in the `0 .. option_count - 1` range.

> property overwrite_warning_enabled : bool ; default=true ; setter=set_customization_flag_enabled ; getter=is_customization_flag_enabled

If `true`, the `FileDialog` will warn the user before overwriting files in save mode.

> property recent_list_enabled : bool ; default=true ; setter=set_customization_flag_enabled ; getter=is_customization_flag_enabled

If `true`, shows the recent directories list on the left side of the dialog.

> property root_subfolder : String ; default="" ; setter=set_root_subfolder ; getter=get_root_subfolder

If non-empty, the given sub-folder will be "root" of this `FileDialog`, i.e. user won't be able to go to its parent directory.
**Note:** This property is ignored by native file dialogs.

> property show_hidden_files : bool ; default=false ; setter=set_show_hidden_files ; getter=is_showing_hidden_files

If `true`, the dialog will show hidden files.
**Note:** This property is ignored by native file dialogs on Android and Linux.

> property size : Vector2i ; default=Vector2i(640, 360) ; setter=set_size ; getter=get_size ; overrides=Window

> property title : String ; default="Save a File" ; setter=set_title ; getter=get_title ; overrides=Window

> property use_native_dialog : bool ; default=false ; setter=set_use_native_dialog ; getter=get_use_native_dialog

If `true`, and if supported by the current `DisplayServer`, OS native dialog will be used instead of custom one.
**Note:** On Android, it is only supported when using `ACCESS_FILESYSTEM`. For access mode `ACCESS_RESOURCES` and `ACCESS_USERDATA`, the system will fall back to custom FileDialog.
**Note:** On Linux and macOS, sandboxed apps always use native dialogs to access the host file system.
**Note:** On macOS, sandboxed apps will save security-scoped bookmarks to retain access to the opened folders across multiple sessions. Use `OS.get_granted_permissions` to get a list of saved bookmarks.
**Note:** Native dialogs are isolated from the base process, file dialog properties can't be modified once the dialog is shown.
**Note:** This property is ignored in `EditorFileDialog`.

## Methods

> method add_filter(filter: String, description: String = "", mime_type: String = "") -> void

Adds a comma-separated file extension `filter` and comma-separated MIME type `mime_type` option to the `FileDialog` with an optional `description`, which restricts what files can be picked.
A `filter` should be of the form `"filename.extension"`, where filename and extension can be `*` to match any string. Filters starting with `.` (i.e. empty filenames) are not allowed.
For example, a `filter` of `"*.png, *.jpg"`, a `mime_type` of `image/png, image/jpeg`, and a `description` of `"Images"` results in filter text "Images (*.png, *.jpg)".
**Note:** Embedded file dialogs and Windows file dialogs support only file extensions, while Android, Linux, and macOS file dialogs also support MIME types.

> method add_option(name: String, values: PackedStringArray, default_value_index: int) -> void

Adds an additional `OptionButton` to the file dialog. If `values` is empty, a `CheckBox` is added instead.
`default_value_index` should be an index of the value in the `values`. If `values` is empty it should be either `1` (checked), or `0` (unchecked).

> method clear_filename_filter() -> void

Clear the filter for file names.

> method clear_filters() -> void

Clear all the added filters in the dialog.

> method deselect_all() -> void

Clear all currently selected items in the dialog.

> method get_favorite_list() -> PackedStringArray ; qualifiers=static

Returns the list of favorite directories, which is shared by all `FileDialog` nodes. Useful to store the list of favorites between project sessions. This method can be called only from the main thread.

> method get_line_edit() -> LineEdit

Returns the LineEdit for the selected file.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `CanvasItem.visible` property.

> method get_option_default(option: int) -> int ; qualifiers=const

Returns the default value index of the `OptionButton` or `CheckBox` with index `option`.

> method get_option_name(option: int) -> String ; qualifiers=const

Returns the name of the `OptionButton` or `CheckBox` with index `option`.

> method get_option_values(option: int) -> PackedStringArray ; qualifiers=const

Returns an array of values of the `OptionButton` with index `option`.

> method get_recent_list() -> PackedStringArray ; qualifiers=static

Returns the list of recent directories, which is shared by all `FileDialog` nodes. Useful to store the list of recents between project sessions. This method can be called only from the main thread.

> method get_selected_options() -> Dictionary ; qualifiers=const

Returns a `Dictionary` with the selected values of the additional `OptionButton`s and/or `CheckBox`es. `Dictionary` keys are names and values are selected value indices.

> method get_vbox() -> VBoxContainer

Returns the vertical box container of the dialog, custom controls can be added to it.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `CanvasItem.visible` property.
**Note:** Changes to this node are ignored by native file dialogs, use `add_option` to add custom elements to the dialog instead.

> method invalidate() -> void

Invalidates and updates this dialog's content list.
**Note:** This method does nothing on native file dialogs.

> method is_customization_flag_enabled(flag: Customization) -> bool ; qualifiers=const

Returns `true` if the provided `flag` is enabled.

> method popup_file_dialog() -> void

Shows the `FileDialog` using the default size and position for file dialogs, and selects the file name if there is a current file.

> method set_customization_flag_enabled(flag: Customization, enabled: bool) -> void

Sets the specified customization `flag`, allowing to customize the features available in this `FileDialog`.

> method set_favorite_list(favorites: PackedStringArray) -> void ; qualifiers=static

Sets the list of favorite directories, which is shared by all `FileDialog` nodes. Useful to restore the list of favorites saved with `get_favorite_list`. This method can be called only from the main thread.
**Note:** `FileDialog` will update its internal `ItemList` of favorites when its visibility changes. Be sure to call this method earlier if you want your changes to have effect.

> method set_get_icon_callback(callback: Callable) -> void ; qualifiers=static

Sets the callback used by the `FileDialog` nodes to get a file icon, when `DISPLAY_LIST` mode is used. The callback should take a single `String` argument (file path), and return a `Texture2D`. If an invalid texture is returned, the `file` icon will be used instead.

> method set_get_thumbnail_callback(callback: Callable) -> void ; qualifiers=static

Sets the callback used by the `FileDialog` nodes to get a file icon, when `DISPLAY_THUMBNAILS` mode is used. The callback should take a single `String` argument (file path), and return a `Texture2D`. If an invalid texture is returned, the `file_thumbnail` icon will be used instead.
Thumbnails are usually more complex and may take a while to load. To avoid stalling the application, you can use `ImageTexture` to asynchronously create the thumbnail.

```text
                func _ready():
                    FileDialog.set_get_thumbnail_callback(thumbnail_method)

                func thumbnail_method(path):
                    var image_texture = ImageTexture.new()
                    make_thumbnail_async(path, image_texture)
                    return image_texture

                func make_thumbnail_async(path, image_texture):
                    var thumbnail_texture = await generate_thumbnail(path) # Some method that generates a thumbnail.
                    image_texture.set_image(thumbnail_texture.get_image())

```

> method set_option_default(option: int, default_value_index: int) -> void

Sets the default value index of the `OptionButton` or `CheckBox` with index `option`.

> method set_option_name(option: int, name: String) -> void

Sets the name of the `OptionButton` or `CheckBox` with index `option`.

> method set_option_values(option: int, values: PackedStringArray) -> void

Sets the option values of the `OptionButton` with index `option`.

> method set_recent_list(recents: PackedStringArray) -> void ; qualifiers=static

Sets the list of recent directories, which is shared by all `FileDialog` nodes. Useful to restore the list of recents saved with `set_recent_list`. This method can be called only from the main thread.
**Note:** `FileDialog` will update its internal `ItemList` of recent directories when its visibility changes. Be sure to call this method earlier if you want your changes to have effect.

## Signals

> signal dir_selected(dir: String)

Emitted when the user selects a directory.

> signal file_selected(path: String)

Emitted when the user selects a file by double-clicking it or pressing the **OK** button.

> signal filename_filter_changed(filter: String)

Emitted when the filter for file names changes.

> signal files_selected(paths: PackedStringArray)

Emitted when the user selects multiple files.

## Enumerations

> enum Access

> enum_value Access.ACCESS_RESOURCES = 0

The dialog only allows accessing files under the `Resource` path (`res://`).

> enum_value Access.ACCESS_USERDATA = 1

The dialog only allows accessing files under user data path (`user://`).

> enum_value Access.ACCESS_FILESYSTEM = 2

The dialog allows accessing files on the whole file system.

> enum Customization

> enum_value Customization.CUSTOMIZATION_HIDDEN_FILES = 0

Toggles visibility of the favorite button, and the favorite list on the left side of the dialog.
Equivalent to `hidden_files_toggle_enabled`.

> enum_value Customization.CUSTOMIZATION_CREATE_FOLDER = 1

If enabled, shows the button for creating new directories (when using `FILE_MODE_OPEN_DIR`, `FILE_MODE_OPEN_ANY`, or `FILE_MODE_SAVE_FILE`).
Equivalent to `folder_creation_enabled`.

> enum_value Customization.CUSTOMIZATION_FILE_FILTER = 2

If enabled, shows the toggle file filter button.
Equivalent to `file_filter_toggle_enabled`.

> enum_value Customization.CUSTOMIZATION_FILE_SORT = 3

If enabled, shows the file sorting options button.
Equivalent to `file_sort_options_enabled`.

> enum_value Customization.CUSTOMIZATION_FAVORITES = 4

If enabled, shows the toggle favorite button and favorite list on the left side of the dialog.
Equivalent to `favorites_enabled`.

> enum_value Customization.CUSTOMIZATION_RECENT = 5

If enabled, shows the recent directories list on the left side of the dialog.
Equivalent to `recent_list_enabled`.

> enum_value Customization.CUSTOMIZATION_LAYOUT = 6

If enabled, shows the layout switch buttons (list/thumbnails).
Equivalent to `layout_toggle_enabled`.

> enum_value Customization.CUSTOMIZATION_OVERWRITE_WARNING = 7

If enabled, the `FileDialog` will warn the user before overwriting files in save mode.
Equivalent to `overwrite_warning_enabled`.

> enum_value Customization.CUSTOMIZATION_DELETE = 8

If enabled, the context menu will show the "Delete" option, which allows moving files and folders to trash.
Equivalent to `deleting_enabled`.

> enum DisplayMode

> enum_value DisplayMode.DISPLAY_THUMBNAILS = 0

The dialog displays files as a grid of thumbnails. Use `thumbnail_size` to adjust their size.

> enum_value DisplayMode.DISPLAY_LIST = 1

The dialog displays files as a list of filenames.

> enum FileMode

> enum_value FileMode.FILE_MODE_OPEN_FILE = 0

The dialog allows selecting one, and only one file.

> enum_value FileMode.FILE_MODE_OPEN_FILES = 1

The dialog allows selecting multiple files.

> enum_value FileMode.FILE_MODE_OPEN_DIR = 2

The dialog only allows selecting a directory, disallowing the selection of any file.

> enum_value FileMode.FILE_MODE_OPEN_ANY = 3

The dialog allows selecting one file or directory.

> enum_value FileMode.FILE_MODE_SAVE_FILE = 4

The dialog will warn when a file exists.

## Theme Properties

> theme_property file_disabled_color : Color ; data=color ; default=Color(1, 1, 1, 0.25)

The color tint for disabled files (when the `FileDialog` is used in open folder mode).

> theme_property file_icon_color : Color ; data=color ; default=Color(1, 1, 1, 1)

The color modulation applied to the file icon.

> theme_property folder_icon_color : Color ; data=color ; default=Color(1, 1, 1, 1)

The color modulation applied to the folder icon.

> theme_property thumbnail_size : int ; data=constant ; default=64

The size of thumbnail icons when `DISPLAY_THUMBNAILS` is enabled.

> theme_property back_folder : Texture2D ; data=icon

Custom icon for the back arrow.

> theme_property create_folder : Texture2D ; data=icon

Custom icon for the create folder button.

> theme_property favorite : Texture2D ; data=icon

Custom icon for favorite folder button.

> theme_property favorite_down : Texture2D ; data=icon

Custom icon for button to move down a favorite entry.

> theme_property favorite_up : Texture2D ; data=icon

Custom icon for button to move up a favorite entry.

> theme_property file : Texture2D ; data=icon

Custom icon for files.

> theme_property file_thumbnail : Texture2D ; data=icon

Icon for files when in thumbnail mode.

> theme_property folder : Texture2D ; data=icon

Custom icon for folders.

> theme_property folder_thumbnail : Texture2D ; data=icon

Icon for folders when in thumbnail mode.

> theme_property forward_folder : Texture2D ; data=icon

Custom icon for the forward arrow.

> theme_property list_mode : Texture2D ; data=icon

Icon for the button that enables list mode.

> theme_property menu_copy_path : Texture2D ; data=icon

Icon for the "Copy Path" context menu option.

> theme_property menu_delete : Texture2D ; data=icon

Icon for the "Delete" context menu option.

> theme_property menu_new_folder : Texture2D ; data=icon

Icon for the "New Folder..." context menu option. Usually it should be the same as `create_folder`; leave it empty if you want the context menu to show no icons.

> theme_property menu_open_bundle : Texture2D ; data=icon

Icon for the "Show Package Contents" context menu option. The option only appears for macOS bundles.

> theme_property menu_refresh : Texture2D ; data=icon

Icon for the "Refresh" context menu option. Usually it should be the same as `reload`; leave it empty if you want the context menu to show no icons.

> theme_property menu_show_in_file_manager : Texture2D ; data=icon

Icon for the "Show in File Manager" context menu option.

> theme_property parent_folder : Texture2D ; data=icon

Custom icon for the parent folder arrow.

> theme_property reload : Texture2D ; data=icon

Custom icon for the reload button.

> theme_property sort : Texture2D ; data=icon

Custom icon for the sorting options menu.

> theme_property thumbnail_mode : Texture2D ; data=icon

Icon for the button that enables thumbnail mode.

> theme_property toggle_filename_filter : Texture2D ; data=icon

Custom icon for the toggle button for the filter for file names.

> theme_property toggle_hidden : Texture2D ; data=icon

Custom icon for the toggle hidden button.
