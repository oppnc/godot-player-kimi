# InputMap

> class InputMap
> inherits InputMap Object

## Brief

A singleton that manages all `InputEventAction`s.

## Description

Manages all `InputEventAction` which can be created/modified from the project settings menu **Project > Project Settings > Input Map** or in code with `add_action` and `action_add_event`. See `Node._input`.

## Methods

> method action_add_event(action: StringName, event: InputEvent) -> void

Adds an `InputEvent` to an action. This `InputEvent` will trigger the action.

> method action_erase_event(action: StringName, event: InputEvent) -> void

Removes an `InputEvent` from an action.

> method action_erase_events(action: StringName) -> void

Removes all events from an action.

> method action_get_deadzone(action: StringName) -> float

Returns a deadzone value for the action.

> method action_get_events(action: StringName) -> Array[InputEvent]

Returns an array of `InputEvent`s associated with a given action.
**Note:** When used in the editor (e.g. a tool script or `EditorPlugin`), this method will return events for the editor action. If you want to access your project's input binds from the editor, read the `input/*` settings from `ProjectSettings`.

> method action_has_event(action: StringName, event: InputEvent) -> bool

Returns `true` if the action has the given `InputEvent` associated with it.

> method action_set_deadzone(action: StringName, deadzone: float) -> void

Sets a deadzone value for the action.

> method add_action(action: StringName, deadzone: float = 0.2) -> void

Adds an empty action to the `InputMap` with a configurable `deadzone`.
An `InputEvent` can then be added to this action with `action_add_event`.

> method erase_action(action: StringName) -> void

Removes an action from the `InputMap`.

> method event_is_action(event: InputEvent, action: StringName, exact_match: bool = false) -> bool ; qualifiers=const

Returns `true` if the given event is part of an existing action. This method ignores keyboard modifiers if the given `InputEvent` is not pressed (for proper release detection). See `action_has_event` if you don't want this behavior.
If `exact_match` is `false`, it ignores additional input modifiers for `InputEventKey` and `InputEventMouseButton` events, and the direction for `InputEventJoypadMotion` events.

> method get_action_description(action: StringName) -> String ; qualifiers=const

Returns the human-readable description of the given action.

> method get_actions() -> Array[StringName]

Returns an array of all actions in the `InputMap`.

> method has_action(action: StringName) -> bool ; qualifiers=const

Returns `true` if the `InputMap` has a registered action with the given name.

> method load_from_project_settings() -> void

Clears all `InputEventAction` in the `InputMap` and load it anew from `ProjectSettings`.

## Signals

> signal project_settings_loaded()

Emitted when the `ProjectSettings` `InputMap` has been loaded.

## Tutorials
- [Using InputEvent: InputMap]($DOCS_URL/tutorials/inputs/inputevent.html#inputmap)
