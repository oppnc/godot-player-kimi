# TextServerManager

> class TextServerManager
> inherits TextServerManager Object

## Brief

A singleton for managing `TextServer` implementations.

## Description

`TextServerManager` is the API backend for loading, enumerating, and switching `TextServer`s.
**Note:** Switching text server at runtime is possible, but will invalidate all fonts and text buffers. Make sure to unload all controls, fonts, and themes before doing so.

## Methods

> method add_interface(interface: TextServer) -> void

Registers a `TextServer` interface.

> method find_interface(name: String) -> TextServer ; qualifiers=const

Finds an interface by its `name`.

> method get_interface(idx: int) -> TextServer ; qualifiers=const

Returns the interface registered at a given index.

> method get_interface_count() -> int ; qualifiers=const

Returns the number of interfaces currently registered.

> method get_interfaces() -> Array[Dictionary] ; qualifiers=const

Returns a list of available interfaces, with the index and name of each interface.

> method get_primary_interface() -> TextServer ; qualifiers=const

Returns the primary `TextServer` interface currently in use.

> method remove_interface(interface: TextServer) -> void

Removes an interface. All fonts and shaped text caches should be freed before removing an interface.

> method set_primary_interface(index: TextServer) -> void

Sets the primary `TextServer` interface.

## Signals

> signal interface_added(interface_name: StringName)

Emitted when a new interface has been added.

> signal interface_removed(interface_name: StringName)

Emitted when an interface is removed.
