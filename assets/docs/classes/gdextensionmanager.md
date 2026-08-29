# GDExtensionManager

> class GDExtensionManager
> inherits GDExtensionManager Object

## Brief

Provides access to GDExtension functionality.

## Description

The GDExtensionManager loads, initializes, and keeps track of all available `GDExtension` libraries in the project.
**Note:** Do not worry about GDExtension unless you know what you are doing.

## Methods

> method get_extension(path: String) -> GDExtension

Returns the `GDExtension` at the given file `path`, or `null` if it has not been loaded or does not exist.

> method get_loaded_extensions() -> PackedStringArray ; qualifiers=const

Returns the file paths of all currently loaded extensions.

> method is_extension_loaded(path: String) -> bool ; qualifiers=const

Returns `true` if the extension at the given file `path` has already been loaded successfully. See also `get_loaded_extensions`.

> method load_extension(path: String) -> LoadStatus

Loads an extension by absolute file path. The `path` needs to point to a valid `GDExtension`. Returns `LOAD_STATUS_OK` if successful.

> method load_extension_from_function(path: String, init_func: const GDExtensionInitializationFunction*) -> LoadStatus

Loads the extension already in address space via the given path and initialization function. The `path` needs to be unique and start with `"libgodot://"`. Returns `LOAD_STATUS_OK` if successful.

> method reload_extension(path: String) -> LoadStatus

Reloads the extension at the given file path. The `path` needs to point to a valid `GDExtension`, otherwise this method may return either `LOAD_STATUS_NOT_LOADED` or `LOAD_STATUS_FAILED`.
**Note:** You can only reload extensions in the editor. In release builds, this method always fails and returns `LOAD_STATUS_FAILED`.

> method unload_extension(path: String) -> LoadStatus

Unloads an extension by file path. The `path` needs to point to an already loaded `GDExtension`, otherwise this method returns `LOAD_STATUS_NOT_LOADED`.

## Signals

> signal extension_loaded(extension: GDExtension)

Emitted after the editor has finished loading a new extension.
**Note:** This signal is only emitted in editor builds.

> signal extension_unloading(extension: GDExtension)

Emitted before the editor starts unloading an extension.
**Note:** This signal is only emitted in editor builds.

> signal extensions_reloaded()

Emitted after the editor has finished reloading one or more extensions.

## Enumerations

> enum LoadStatus

> enum_value LoadStatus.LOAD_STATUS_OK = 0

The extension has loaded successfully.

> enum_value LoadStatus.LOAD_STATUS_FAILED = 1

The extension has failed to load, possibly because it does not exist or has missing dependencies.

> enum_value LoadStatus.LOAD_STATUS_ALREADY_LOADED = 2

The extension has already been loaded.

> enum_value LoadStatus.LOAD_STATUS_NOT_LOADED = 3

The extension has not been loaded.

> enum_value LoadStatus.LOAD_STATUS_NEEDS_RESTART = 4

The extension requires the application to restart to fully load.

## Tutorials
- [GDExtension overview]($DOCS_URL/engine_details/engine_api/gdextension/what_is_gdextension.html)
- [GDExtension example in C++]($DOCS_URL/tutorials/scripting/cpp/gdextension_cpp_example.html)
