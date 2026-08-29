# PhysicsServer3DManager

> class PhysicsServer3DManager
> inherits PhysicsServer3DManager Object

## Brief

A singleton for managing `PhysicsServer3D` implementations.

## Description

`PhysicsServer3DManager` is the API for registering `PhysicsServer3D` implementations and for setting the default implementation.
**Note:** It is not possible to switch physics servers at runtime. This class is only used on startup at the server initialization level, by Godot itself and possibly by GDExtensions.

## Methods

> method register_server(name: String, create_callback: Callable) -> void

Register a `PhysicsServer3D` implementation by passing a `name` and a `Callable` that returns a `PhysicsServer3D` object.

> method set_default_server(name: String, priority: int) -> void

Set the default `PhysicsServer3D` implementation to the one identified by `name`, if `priority` is greater than the priority of the current default implementation.
