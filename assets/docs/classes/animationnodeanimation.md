# AnimationNodeAnimation

> class AnimationNodeAnimation
> inherits AnimationNodeAnimation AnimationRootNode

## Brief

An input animation for an `AnimationNodeBlendTree`.

## Description

A resource to add to an `AnimationNodeBlendTree`. Only has one output port using the `animation` property. Used as an input for `AnimationNode`s that blend animations together.

## Properties

> property advance_on_start : bool ; default=false ; setter=set_advance_on_start ; getter=is_advance_on_start

If `true`, on receiving a request to play an animation from the start, the first frame is not drawn, but only processed, and playback starts from the next frame.
See also the notes of `AnimationPlayer.play`.

> property animation : StringName ; default=&"" ; setter=set_animation ; getter=get_animation

Animation to use as an output. It is one of the animations provided by `AnimationTree.anim_player`.

> property loop_mode : Animation.LoopMode ; setter=set_loop_mode ; getter=get_loop_mode

If `use_custom_timeline` is `true`, override the loop settings of the original `Animation` resource with the value.
**Note:** If the `Animation.loop_mode` isn't set to looping, the `Animation.track_set_interpolation_loop_wrap` option will not be respected. If you cannot get the expected behavior, consider duplicating the `Animation` resource and changing the loop settings.

> property play_mode : PlayMode ; default=0 ; setter=set_play_mode ; getter=get_play_mode

Determines the playback direction of the animation.

> property start_offset : float ; setter=set_start_offset ; getter=get_start_offset

If `use_custom_timeline` is `true`, offset the start position of the animation.
This is useful for adjusting which foot steps first in 3D walking animations.

> property stretch_time_scale : bool ; setter=set_stretch_time_scale ; getter=is_stretching_time_scale

If `true`, scales the time so that the length specified in `timeline_length` is one cycle.
This is useful for matching the periods of walking and running animations.
If `false`, the original animation length is respected. If you set the loop to `loop_mode`, the animation will loop in `timeline_length`.

> property timeline_length : float ; setter=set_timeline_length ; getter=get_timeline_length

The length of the custom timeline.
If `stretch_time_scale` is `true`, scales the animation to this length.

> property use_custom_timeline : bool ; default=false ; setter=set_use_custom_timeline ; getter=is_using_custom_timeline

If `true`, `AnimationNode` provides an animation based on the `Animation` resource with some parameters adjusted.

## Enumerations

> enum PlayMode

> enum_value PlayMode.PLAY_MODE_FORWARD = 0

Plays animation in forward direction.

> enum_value PlayMode.PLAY_MODE_BACKWARD = 1

Plays animation in backward direction.

## Tutorials
- [Using AnimationTree]($DOCS_URL/tutorials/animation/animation_tree.html)
- [3D Platformer Demo](https://godotengine.org/asset-library/asset/2748)
- [Third Person Shooter (TPS) Demo](https://godotengine.org/asset-library/asset/2710)
