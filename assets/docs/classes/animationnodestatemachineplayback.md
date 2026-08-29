# AnimationNodeStateMachinePlayback

> class AnimationNodeStateMachinePlayback
> inherits AnimationNodeStateMachinePlayback Resource

## Brief

Provides playback control for an `AnimationNodeStateMachine`.

## Description

Allows control of `AnimationTree` state machines created with `AnimationNodeStateMachine`. Retrieve with `$AnimationTree.get("parameters/playback")`.

```gdscript
        var state_machine = $AnimationTree.get("parameters/playback")
        state_machine.travel("some_state")

```

```csharp
        var stateMachine = GetNode<AnimationTree>("AnimationTree").Get("parameters/playback").As<AnimationNodeStateMachinePlayback>();
        stateMachine.Travel("some_state");

```

## Properties

> property resource_local_to_scene : bool ; default=true ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

## Methods

> method get_current_length() -> float ; qualifiers=const

Returns the current state length.
**Note:** It is possible that any `AnimationRootNode` can be nodes as well as animations. This means that there can be multiple animations within a single state. Which animation length has priority depends on the nodes connected inside it. Also, if a transition does not reset, the remaining length at that point will be returned.

> method get_current_node() -> StringName ; qualifiers=const

Returns the currently playing animation state.
**Note:** When using a cross-fade, the current state changes to the next state immediately after the cross-fade begins.

> method get_current_play_position() -> float ; qualifiers=const

Returns the playback position within the current animation state.

> method get_fading_from_length() -> float ; qualifiers=const

Returns the playback state length of the node from `get_fading_from_node`. Returns `0` if no animation fade is occurring.

> method get_fading_from_node() -> StringName ; qualifiers=const

Returns the starting state of currently fading animation.

> method get_fading_from_play_position() -> float ; qualifiers=const

Returns the playback position of the node from `get_fading_from_node`. Returns `0` if no animation fade is occurring.

> method get_fading_length() -> float ; qualifiers=const

Returns the length of the current fade animation. Returns `0` if no animation fade is occurring.

> method get_fading_position() -> float ; qualifiers=const

Returns the playback position of the current fade animation. Returns `0` if no animation fade is occurring.

> method get_travel_path() -> Array[StringName] ; qualifiers=const

Returns the current travel path as computed internally by the A* algorithm.

> method is_playing() -> bool ; qualifiers=const

Returns `true` if an animation is playing.

> method next() -> void

If there is a next path by travel or auto advance, immediately transitions from the current state to the next state.

> method start(node: StringName, reset: bool = true) -> void

Starts playing the given animation.
If `reset` is `true`, the animation is played from the beginning.

> method stop() -> void

Stops the currently playing animation.

> method travel(to_node: StringName, reset_on_teleport: bool = true) -> void

Transitions from the current state to another one, following the shortest path.
If the path does not connect from the current state, the animation will play after the state teleports.
If `reset_on_teleport` is `true`, the animation is played from the beginning when the travel cause a teleportation.

## Signals

> signal state_finished(state: StringName)

Emitted when the `state` finishes playback. If `state` is a state machine set to grouped mode, its signals are passed through with its name prefixed.
If there is a crossfade, this will be fired when the influence of the `get_fading_from_node` animation is no longer present.

> signal state_started(state: StringName)

Emitted when the `state` starts playback. If `state` is a state machine set to grouped mode, its signals are passed through with its name prefixed.

## Tutorials
- [Using AnimationTree]($DOCS_URL/tutorials/animation/animation_tree.html)
