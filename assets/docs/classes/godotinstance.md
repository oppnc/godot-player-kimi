# GodotInstance

> class GodotInstance
> inherits GodotInstance Object

## Brief

Provides access to an embedded Godot instance.

## Description

GodotInstance represents a running Godot instance that is controlled from an outside codebase, without a perpetual main loop. It is created by the C API `libgodot_create_godot_instance`. Only one may be created per process.

## Methods

> method focus_in() -> void

Notifies the instance that it is now in focus.

> method focus_out() -> void

Notifies the instance that it is now not in focus.

> method is_started() -> bool

Returns `true` if this instance has been fully started.

> method iteration() -> bool

Runs a single iteration of the main loop. Returns `true` if the engine is attempting to quit.

> method pause() -> void

Notifies the instance that it is going to be paused.

> method resume() -> void

Notifies the instance that it is being resumed.

> method start() -> bool

Finishes this instance's startup sequence. Returns `true` on success.
