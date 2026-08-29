# AnimationNodeTransition

> class AnimationNodeTransition
> inherits AnimationNodeTransition AnimationNodeSync

## Brief

A transition within an `AnimationTree` connecting two `AnimationNode`s.

## Description

Simple state machine for cases which don't require a more advanced `AnimationNodeStateMachine`. Animations can be connected to the inputs and transition times can be specified.
After setting the request and changing the animation playback, the transition node automatically clears the request on the next process frame by setting its `transition_request` value to empty.
**Note:** When using a cross-fade, `current_state` and `current_index` change to the next state immediately after the cross-fade begins.

```gdscript
        # Play child animation connected to "state_2" port.
        animation_tree.set("parameters/Transition/transition_request", "state_2")
        # Alternative syntax (same result as above).
        animation_tree["parameters/Transition/transition_request"] = "state_2"

        # Get current state name (read-only).
        animation_tree.get("parameters/Transition/current_state")
        # Alternative syntax (same result as above).
        animation_tree["parameters/Transition/current_state"]

        # Get current state index (read-only).
        animation_tree.get("parameters/Transition/current_index")
        # Alternative syntax (same result as above).
        animation_tree["parameters/Transition/current_index"]

```

```csharp
        // Play child animation connected to "state_2" port.
        animationTree.Set("parameters/Transition/transition_request", "state_2");

        // Get current state name (read-only).
        animationTree.Get("parameters/Transition/current_state");

        // Get current state index (read-only).
        animationTree.Get("parameters/Transition/current_index");

```

## Properties

> property allow_transition_to_self : bool ; default=false ; setter=set_allow_transition_to_self ; getter=is_allow_transition_to_self

If `true`, allows transition to the self state. When the reset option is enabled in input, the animation is restarted. If `false`, nothing happens on the transition to the self state.

> property input_count : int ; default=0 ; setter=set_input_count ; getter=get_input_count

The number of enabled input ports for this animation node.

> property xfade_curve : Curve ; setter=set_xfade_curve ; getter=get_xfade_curve

Determines how cross-fading between animations is eased. If empty, the transition will be linear. Should be a unit `Curve`.

> property xfade_time : float ; default=0.0 ; setter=set_xfade_time ; getter=get_xfade_time

Cross-fading time (in seconds) between each animation connected to the inputs.
**Note:** `AnimationNodeTransition` transitions the current state immediately after the start of the fading. The precise remaining time can only be inferred from the main animation. When `AnimationNodeOutput` is considered as the most upstream, so the `xfade_time` is not scaled depending on the downstream delta. See also `AnimationNodeOneShot.fadeout_time`.

## Methods

> method is_input_loop_broken_at_end(input: int) -> bool ; qualifiers=const

Returns whether the animation breaks the loop at the end of the loop cycle for transition.

> method is_input_reset(input: int) -> bool ; qualifiers=const

Returns whether the animation restarts when the animation transitions from the other animation.

> method is_input_set_as_auto_advance(input: int) -> bool ; qualifiers=const

Returns `true` if auto-advance is enabled for the given `input` index.

> method set_input_as_auto_advance(input: int, enable: bool) -> void

Enables or disables auto-advance for the given `input` index. If enabled, state changes to the next input after playing the animation once. If enabled for the last input state, it loops to the first.

> method set_input_break_loop_at_end(input: int, enable: bool) -> void

If `true`, breaks the loop at the end of the loop cycle for transition, even if the animation is looping.

> method set_input_reset(input: int, enable: bool) -> void

If `true`, the destination animation is restarted when the animation transitions.

## Tutorials
- [Using AnimationTree]($DOCS_URL/tutorials/animation/animation_tree.html)
- [3D Platformer Demo](https://godotengine.org/asset-library/asset/2748)
- [Third Person Shooter (TPS) Demo](https://godotengine.org/asset-library/asset/2710)
