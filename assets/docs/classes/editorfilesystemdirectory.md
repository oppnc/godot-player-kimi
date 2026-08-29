# EditorFileSystemDirectory

> class EditorFileSystemDirectory
> inherits EditorFileSystemDirectory Object

## Brief

A directory for the resource filesystem.

## Description

A more generalized, low-level variation of the directory concept.

## Methods

> method find_dir_index(name: String) -> int ; qualifiers=const

Returns the index of the directory with name `name` or `-1` if not found.

> method find_file_index(name: String) -> int ; qualifiers=const

Returns the index of the file with name `name` or `-1` if not found.

> method get_file(idx: int) -> String ; qualifiers=const

Returns the name of the file at index `idx`.

> method get_file_count() -> int ; qualifiers=const

Returns the number of files in this directory.

> method get_file_import_is_valid(idx: int) -> bool ; qualifiers=const

Returns `true` if the file at index `idx` imported properly.

> method get_file_path(idx: int) -> String ; qualifiers=const

Returns the path to the file at index `idx`.

> method get_file_script_class_extends(idx: int) -> String ; qualifiers=const

Returns the base class of the script class defined in the file at index `idx`. If the file doesn't define a script class using the `class_name` syntax, this will return an empty string.

> method get_file_script_class_name(idx: int) -> String ; qualifiers=const

Returns the name of the script class defined in the file at index `idx`. If the file doesn't define a script class using the `class_name` syntax, this will return an empty string.

> method get_file_type(idx: int) -> StringName ; qualifiers=const

Returns the resource type of the file at index `idx`. This returns a string such as `"Resource"` or `"GDScript"`, *not* a file extension such as `".gd"`.

> method get_name() -> String

Returns the name of this directory.

> method get_parent() -> EditorFileSystemDirectory

Returns the parent directory for this directory or `null` if called on a directory at `res://` or `user://`.

> method get_path() -> String ; qualifiers=const

Returns the path to this directory.

> method get_subdir(idx: int) -> EditorFileSystemDirectory

Returns the subdirectory at index `idx`.

> method get_subdir_count() -> int ; qualifiers=const

Returns the number of subdirectories in this directory.
