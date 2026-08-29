# InputEventAction

> class InputEventAction
> inherits InputEventAction InputEvent

## Brief

An input event type for actions.

## Description

Contains a generic action which can be targeted from several types of inputs. Actions and their events can be set in the **Input Map** tab in **Project > Project Settings**, or with the `InputMap` class.
**Note:** Unlike the other `InputEvent` subclasses which map to unique physical events, this virtual one is not emitted by the engine. This class is useful to emit actions manually with `Input.parse_input_event`, which are then received in `Node._input`. To check if a physical event matches an action from the Input Map, use `InputEvent.is_action` and `InputEvent.is_action_pressed`.

## Properties

> property action : StringName ; default=&"" ; setter=set_action ; getter=get_action

The action's name. This is usually the name of an existing action in the `InputMap` which you want this custom event to match.

> property event_index : int ; default=-1 ; setter=set_event_index ; getter=get_event_index

The real event index in action this event corresponds to (from events defined for this action in the `InputMap`). If `-1`, a unique ID will be used and actions pressed with this ID will need to be released with another `InputEventAction`.

> property pressed : bool ; default=false ; setter=set_pressed ; getter=is_pressed

If `true`, the action's state is pressed. If `false`, the action's state is released.

> property strength : float ; default=1.0 ; setter=set_strength ; getter=get_strength

The action's strength between 0 and 1. This value is considered as equal to 0 if pressed is `false`. The event strength allows faking analog joypad motion events, by specifying how strongly the joypad axis is bent or pressed.

## Tutorials
- [Using InputEvent: Actions]($DOCS_URL/tutorials/inputs/inputevent.html#actions)
- [2D Dodge The Creeps Demo](https://godotengine.org/asset-library/asset/2712)
- [3D Voxel Demo](https://godotengine.org/asset-library/asset/2755)
