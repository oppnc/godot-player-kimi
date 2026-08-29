# GDExtension

> class GDExtension
> inherits GDExtension Resource

## Brief

A native library for GDExtension.

## Description

The `GDExtension` resource type represents a [shared library](https://en.wikipedia.org/wiki/Shared_library) which can expand the functionality of the engine. The `GDExtensionManager` singleton is responsible for loading, reloading, and unloading `GDExtension` resources.
**Note:** GDExtension itself is not a scripting language and has no relation to `GDScript` resources.

## Methods

> method get_minimum_library_initialization_level() -> InitializationLevel ; qualifiers=const

Returns the lowest level required for this extension to be properly initialized (see the `InitializationLevel` enum).

> method is_library_open() -> bool ; qualifiers=const

Returns `true` if this extension's library has been opened.

## Enumerations

> enum InitializationLevel

> enum_value InitializationLevel.INITIALIZATION_LEVEL_CORE = 0

The library is initialized at the same time as the core features of the engine.

> enum_value InitializationLevel.INITIALIZATION_LEVEL_SERVERS = 1

The library is initialized at the same time as the engine's servers (such as `RenderingServer` or `PhysicsServer3D`).

> enum_value InitializationLevel.INITIALIZATION_LEVEL_SCENE = 2

The library is initialized at the same time as the engine's scene-related classes.

> enum_value InitializationLevel.INITIALIZATION_LEVEL_EDITOR = 3

The library is initialized at the same time as the engine's editor classes. Only happens when loading the GDExtension in the editor.

## Tutorials
- [GDExtension overview]($DOCS_URL/engine_details/engine_api/gdextension/what_is_gdextension.html)
- [GDExtension example in C++]($DOCS_URL/tutorials/scripting/cpp/gdextension_cpp_example.html)
