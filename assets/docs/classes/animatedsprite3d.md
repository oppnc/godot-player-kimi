# AnimatedSprite3D

> class AnimatedSprite3D
> inherits AnimatedSprite3D SpriteBase3D

## Brief

2D sprite node in 3D world, that can use multiple 2D textures for animation.

## Description

`AnimatedSprite3D` is similar to the `Sprite3D` node, except it carries multiple textures as animation `sprite_frames`. Animations are created using a `SpriteFrames` resource, which allows you to import image files (or a folder containing said files) to provide the animation frames for the sprite. The `SpriteFrames` resource can be configured in the editor via the SpriteFrames bottom panel.

## Properties

> property animation : StringName ; default=&"default" ; setter=set_animation ; getter=get_animation

The current animation from the `sprite_frames` resource. If this value is changed, the `frame` counter and the `frame_progress` are reset.

> property autoplay : String ; default="" ; setter=set_autoplay ; getter=get_autoplay

The key of the animation to play when the scene loads.

> property frame : int ; default=0 ; setter=set_frame ; getter=get_frame

The displayed animation frame's index. Setting this property also resets `frame_progress`. If this is not desired, use `set_frame_and_progress`.

> property frame_progress : float ; default=0.0 ; setter=set_frame_progress ; getter=get_frame_progress

The progress value between `0.0` and `1.0` until the current frame transitions to the next frame. If the animation is playing backwards, the value transitions from `1.0` to `0.0`.

> property speed_scale : float ; default=1.0 ; setter=set_speed_scale ; getter=get_speed_scale

The speed scaling ratio. For example, if this value is `1`, then the animation plays at normal speed. If it's `0.5`, then it plays at half speed. If it's `2`, then it plays at double speed.
If set to a negative value, the animation is played in reverse. If set to `0`, the animation will not advance.

> property sprite_frames : SpriteFrames ; setter=set_sprite_frames ; getter=get_sprite_frames

The `SpriteFrames` resource containing the animation(s). Allows you the option to load, edit, clear, make unique and save the states of the `SpriteFrames` resource.

## Methods

> method get_playing_speed() -> float ; qualifiers=const

Returns the actual playing speed of current animation or `0` if not playing. This speed is the `speed_scale` property multiplied by `custom_speed` argument specified when calling the `play` method.
Returns a negative value if the current animation is playing backwards.

> method is_playing() -> bool ; qualifiers=const

Returns `true` if an animation is currently playing (even if `speed_scale` and/or `custom_speed` are `0`).

> method pause() -> void

Pauses the currently playing animation. The `frame` and `frame_progress` will be kept and calling `play` or `play_backwards` without arguments will resume the animation from the current playback position.
See also `stop`.

> method play(name: StringName = &"", custom_speed: float = 1.0, from_end: bool = false) -> void

Plays the animation with key `name`. If `custom_speed` is negative and `from_end` is `true`, the animation will play backwards (which is equivalent to calling `play_backwards`).
If this method is called with that same animation `name`, or with no `name` parameter, the assigned animation will resume playing if it was paused.

> method play_backwards(name: StringName = &"") -> void

Plays the animation with key `name` in reverse.
This method is a shorthand for `play` with `custom_speed = -1.0` and `from_end = true`, so see its description for more information.

> method set_frame_and_progress(frame: int, progress: float) -> void

Sets `frame` and `frame_progress` to the given values. Unlike setting `frame`, this method does not reset the `frame_progress` to `0.0` implicitly.
**Example:** Change the animation while keeping the same `frame` and `frame_progress`:

```gdscript
                var current_frame = animated_sprite.get_frame()
                var current_progress = animated_sprite.get_frame_progress()
                animated_sprite.play("walk_another_skin")
                animated_sprite.set_frame_and_progress(current_frame, current_progress)

```

> method stop() -> void

Stops the currently playing animation. The animation position is reset to `0` and the `custom_speed` is reset to `1.0`. See also `pause`.

## Signals

> signal animation_changed()

Emitted when `animation` changes.

> signal animation_finished()

Emitted when the animation reaches the end, or the start if it is played in reverse. When the animation finishes, it pauses the playback.
**Note:** This signal is not emitted if an animation is looping.

> signal animation_looped()

Emitted when the animation loops.

> signal frame_changed()

Emitted when `frame` changes.

> signal sprite_frames_changed()

Emitted when `sprite_frames` changes.

## Tutorials
- [2D Sprite animation (also applies to 3D)]($DOCS_URL/tutorials/2d/2d_sprite_animation.html)
