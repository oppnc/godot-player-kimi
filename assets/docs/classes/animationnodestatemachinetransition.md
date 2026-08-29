# AnimationNodeStateMachineTransition

> class AnimationNodeStateMachineTransition
> inherits AnimationNodeStateMachineTransition Resource

## Brief

A transition within an `AnimationNodeStateMachine` connecting two `AnimationRootNode`s.

## Description

The path generated when using `AnimationNodeStateMachinePlayback.travel` is limited to the nodes connected by `AnimationNodeStateMachineTransition`.
You can set the timing and conditions of the transition in detail.

## Properties

> property advance_condition : StringName ; default=&"" ; setter=set_advance_condition ; getter=get_advance_condition

Turn on auto advance when this condition is set. The provided name will become a boolean parameter on the `AnimationTree` that can be controlled from code (see [Using AnimationTree]($DOCS_URL/tutorials/animation/animation_tree.html#controlling-from-code)). For example, if `AnimationTree.tree_root` is an `AnimationNodeStateMachine` and `advance_condition` is set to `"idle"`:

```gdscript
            $animation_tree.set("parameters/conditions/idle", is_on_floor and (linear_velocity.x == 0))

```

```csharp
            GetNode<AnimationTree>("animation_tree").Set("parameters/conditions/idle", IsOnFloor && (LinearVelocity.X == 0));

```

> property advance_expression : String ; default="" ; setter=set_advance_expression ; getter=get_advance_expression

Use an expression as a condition for state machine transitions. It is possible to create complex animation advance conditions for switching between states and gives much greater flexibility for creating complex state machines by directly interfacing with the script code.

> property advance_mode : AdvanceMode ; default=1 ; setter=set_advance_mode ; getter=get_advance_mode

Determines whether the transition should be disabled, enabled when using `AnimationNodeStateMachinePlayback.travel`, or traversed automatically if the `advance_condition` and `advance_expression` checks are `true` (if assigned).

> property break_loop_at_end : bool ; default=false ; setter=set_break_loop_at_end ; getter=is_loop_broken_at_end

If `true`, breaks the loop at the end of the loop cycle for transition, even if the animation is looping.

> property priority : int ; default=1 ; setter=set_priority ; getter=get_priority

Lower priority transitions are preferred when travelling through the tree via `AnimationNodeStateMachinePlayback.travel` or `advance_mode` is set to `ADVANCE_MODE_AUTO`.

> property reset : bool ; default=true ; setter=set_reset ; getter=is_reset

If `true`, the destination animation is played back from the beginning when switched.

> property switch_mode : SwitchMode ; default=0 ; setter=set_switch_mode ; getter=get_switch_mode

The transition type.

> property xfade_curve : Curve ; setter=set_xfade_curve ; getter=get_xfade_curve

Ease curve for better control over cross-fade between this state and the next. Should be a unit `Curve`.

> property xfade_time : float ; default=0.0 ; setter=set_xfade_time ; getter=get_xfade_time

The time to cross-fade between this state and the next.
**Note:** `AnimationNodeStateMachine` transitions the current state immediately after the start of the fading. The precise remaining time can only be inferred from the main animation. When `AnimationNodeOutput` is considered as the most upstream, so the `xfade_time` is not scaled depending on the downstream delta. See also `AnimationNodeOneShot.fadeout_time`.

## Signals

> signal advance_condition_changed()

Emitted when `advance_condition` is changed.

## Enumerations

> enum AdvanceMode

> enum_value AdvanceMode.ADVANCE_MODE_DISABLED = 0

Don't use this transition.

> enum_value AdvanceMode.ADVANCE_MODE_ENABLED = 1

Only use this transition during `AnimationNodeStateMachinePlayback.travel`.

> enum_value AdvanceMode.ADVANCE_MODE_AUTO = 2

Automatically use this transition if the `advance_condition` and `advance_expression` checks are `true` (if assigned).

> enum SwitchMode

> enum_value SwitchMode.SWITCH_MODE_IMMEDIATE = 0

Switch to the next state immediately. The current state will end and blend into the beginning of the new one.

> enum_value SwitchMode.SWITCH_MODE_SYNC = 1

Switch to the next state immediately, but will seek the new state to the playback position of the old state.

> enum_value SwitchMode.SWITCH_MODE_AT_END = 2

Wait for the current state playback to end, then switch to the beginning of the next state animation.

## Tutorials
- [Using AnimationTree]($DOCS_URL/tutorials/animation/animation_tree.html)
