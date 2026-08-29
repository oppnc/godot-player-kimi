# AnimationNodeStateMachine

> class AnimationNodeStateMachine
> inherits AnimationNodeStateMachine AnimationRootNode

## Brief

A state machine with multiple `AnimationRootNode`s, used by `AnimationTree`.

## Description

Contains multiple `AnimationRootNode`s representing animation states, connected in a graph. State transitions can be configured to happen automatically or via code, using a shortest-path algorithm. Retrieve the `AnimationNodeStateMachinePlayback` object from the `AnimationTree` node to control it programmatically.

```gdscript
        var state_machine = $AnimationTree.get("parameters/playback")
        state_machine.travel("some_state")

```

```csharp
        var stateMachine = GetNode<AnimationTree>("AnimationTree").Get("parameters/playback") as AnimationNodeStateMachinePlayback;
        stateMachine.Travel("some_state");

```

## Properties

> property allow_transition_to_self : bool ; default=false ; setter=set_allow_transition_to_self ; getter=is_allow_transition_to_self

If `true`, allows teleport to the self state with `AnimationNodeStateMachinePlayback.travel`. When the reset option is enabled in `AnimationNodeStateMachinePlayback.travel`, the animation is restarted. If `false`, nothing happens on the teleportation to the self state.

> property reset_ends : bool ; default=false ; setter=set_reset_ends ; getter=are_ends_reset

If `true`, treat the cross-fade to the start and end nodes as a blend with the RESET animation.
In most cases, when additional cross-fades are performed in the parent `AnimationNode` of the state machine, setting this property to `false` and matching the cross-fade time of the parent `AnimationNode` and the state machine's start node and end node gives good results.

> property state_machine_type : StateMachineType ; default=0 ; setter=set_state_machine_type ; getter=get_state_machine_type

This property can define the process of transitions for different use cases. See also `AnimationNodeStateMachine.StateMachineType`.

## Methods

> method add_node(name: StringName, node: AnimationNode, position: Vector2 = Vector2(0, 0)) -> void

Adds a new animation node to the graph. The `position` is used for display in the editor.

> method add_transition(from: StringName, to: StringName, transition: AnimationNodeStateMachineTransition) -> void

Adds a transition between the given animation nodes.

> method get_graph_offset() -> Vector2 ; qualifiers=const

Returns the draw offset of the graph. Used for display in the editor.

> method get_node(name: StringName) -> AnimationNode ; qualifiers=const

Returns the animation node with the given name.

> method get_node_list() -> Array[StringName] ; qualifiers=const

Returns a list containing the names of all animation nodes in this state machine.

> method get_node_name(node: AnimationNode) -> StringName ; qualifiers=const

Returns the given animation node's name.

> method get_node_position(name: StringName) -> Vector2 ; qualifiers=const

Returns the given animation node's coordinates. Used for display in the editor.

> method get_transition(idx: int) -> AnimationNodeStateMachineTransition ; qualifiers=const

Returns the given transition.

> method get_transition_count() -> int ; qualifiers=const

Returns the number of connections in the graph.

> method get_transition_from(idx: int) -> StringName ; qualifiers=const

Returns the given transition's start node.

> method get_transition_to(idx: int) -> StringName ; qualifiers=const

Returns the given transition's end node.

> method has_node(name: StringName) -> bool ; qualifiers=const

Returns `true` if the graph contains the given animation node.

> method has_transition(from: StringName, to: StringName) -> bool ; qualifiers=const

Returns `true` if there is a transition between the given animation nodes.

> method remove_node(name: StringName) -> void

Deletes the given animation node from the graph.

> method remove_transition(from: StringName, to: StringName) -> void

Deletes the transition between the two specified animation nodes.

> method remove_transition_by_index(idx: int) -> void

Deletes the given transition by index.

> method rename_node(name: StringName, new_name: StringName) -> void

Renames the given animation node.

> method replace_node(name: StringName, node: AnimationNode) -> void

Replaces the given animation node with a new animation node.

> method set_graph_offset(offset: Vector2) -> void

Sets the draw offset of the graph. Used for display in the editor.

> method set_node_position(name: StringName, position: Vector2) -> void

Sets the animation node's coordinates. Used for display in the editor.

## Enumerations

> enum StateMachineType

> enum_value StateMachineType.STATE_MACHINE_TYPE_ROOT = 0

Seeking to the beginning is treated as playing from the start state. Transition to the end state is treated as exiting the state machine.

> enum_value StateMachineType.STATE_MACHINE_TYPE_NESTED = 1

Seeking to the beginning is treated as seeking to the beginning of the animation in the current state. Transition to the end state, or the absence of transitions in each state, is treated as exiting the state machine.

> enum_value StateMachineType.STATE_MACHINE_TYPE_GROUPED = 2

This is a grouped state machine that can be controlled from a parent state machine. It does not work independently. There must be a state machine with `state_machine_type` of `STATE_MACHINE_TYPE_ROOT` or `STATE_MACHINE_TYPE_NESTED` in the parent or ancestor.

## Tutorials
- [Using AnimationTree]($DOCS_URL/tutorials/animation/animation_tree.html)
