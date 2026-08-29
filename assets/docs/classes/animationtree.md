# AnimationTree

> class AnimationTree
> inherits AnimationTree AnimationMixer

## Brief

A node used for advanced animation transitions in an `AnimationPlayer`.

## Description

A node used for advanced animation transitions in an `AnimationPlayer`.
**Note:** When linked with an `AnimationPlayer`, several properties and methods of the corresponding `AnimationPlayer` will not function as expected. Playback and transitions should be handled using only the `AnimationTree` and its constituent `AnimationNode`(s). The `AnimationPlayer` node should be used solely for adding, deleting, and editing animations.

## Properties

> property advance_expression_base_node : NodePath ; default=NodePath(".") ; setter=set_advance_expression_base_node ; getter=get_advance_expression_base_node

The path to the `Node` used to evaluate the `AnimationNode` `Expression` if one is not explicitly specified internally.

> property anim_player : NodePath ; default=NodePath("") ; setter=set_animation_player ; getter=get_animation_player

The path to the `AnimationPlayer` used for animating.

> property callback_mode_discrete : AnimationMixer.AnimationCallbackModeDiscrete ; default=2 ; setter=set_callback_mode_discrete ; getter=get_callback_mode_discrete ; overrides=AnimationMixer

> property deterministic : bool ; default=true ; setter=set_deterministic ; getter=is_deterministic ; overrides=AnimationMixer

> property tree_root : AnimationRootNode ; setter=set_tree_root ; getter=get_tree_root

The root animation node of this `AnimationTree`. See `AnimationRootNode`.

## Methods

> method get_process_callback() -> AnimationProcessCallback ; qualifiers=const ; deprecated=Use `AnimationMixer.callback_mode_process` instead.

Returns the process notification in which to update animations.

> method set_process_callback(mode: AnimationProcessCallback) -> void ; deprecated=Use `AnimationMixer.callback_mode_process` instead.

Sets the process notification in which to update animations.

## Signals

> signal animation_player_changed()

Emitted when the `anim_player` is changed.

## Enumerations

> enum AnimationProcessCallback

> enum_value AnimationProcessCallback.ANIMATION_PROCESS_PHYSICS = 0 ; deprecated=See `AnimationMixer.ANIMATION_CALLBACK_MODE_PROCESS_PHYSICS`.

> enum_value AnimationProcessCallback.ANIMATION_PROCESS_IDLE = 1 ; deprecated=See `AnimationMixer.ANIMATION_CALLBACK_MODE_PROCESS_IDLE`.

> enum_value AnimationProcessCallback.ANIMATION_PROCESS_MANUAL = 2 ; deprecated=See `AnimationMixer.ANIMATION_CALLBACK_MODE_PROCESS_MANUAL`.

## Tutorials
- [Using AnimationTree]($DOCS_URL/tutorials/animation/animation_tree.html)
- [Third Person Shooter (TPS) Demo](https://godotengine.org/asset-library/asset/2710)
