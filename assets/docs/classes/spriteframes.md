# SpriteFrames

> class SpriteFrames
> inherits SpriteFrames Resource

## Brief

Sprite frame library for AnimatedSprite2D and AnimatedSprite3D.

## Description

Sprite frame library for an `AnimatedSprite2D` or `AnimatedSprite3D` node. Contains frames and animation data for playback.

## Methods

> method add_animation(anim: StringName) -> void

Adds a new `anim` animation to the library.

> method add_frame(anim: StringName, texture: Texture2D, duration: float = 1.0, at_position: int = -1) -> void

Adds a frame to the `anim` animation. If `at_position` is `-1`, the frame will be added to the end of the animation. `duration` specifies the relative duration, see `get_frame_duration` for details.

> method clear(anim: StringName) -> void

Removes all frames from the `anim` animation.

> method clear_all() -> void

Removes all animations. An empty `default` animation will be created.

> method duplicate_animation(anim_from: StringName, anim_to: StringName) -> void

Duplicates the animation `anim_from` to a new animation named `anim_to`. Fails if `anim_to` already exists, or if `anim_from` does not exist.

> method get_animation_loop(anim: StringName) -> bool ; qualifiers=const ; deprecated=Use `get_animation_loop_mode` instead.

Returns `true` if `get_animation_loop_mode(anim) == LOOP_LINEAR`. Otherwise, returns `false`.

> method get_animation_loop_mode(anim: StringName) -> LoopMode ; qualifiers=const

Returns the loop mode for the `anim` animation.

> method get_animation_names() -> PackedStringArray ; qualifiers=const

Returns an array containing the names associated to each animation. Values are placed in alphabetical order.

> method get_animation_speed(anim: StringName) -> float ; qualifiers=const

Returns the speed in frames per second for the `anim` animation.

> method get_frame_count(anim: StringName) -> int ; qualifiers=const

Returns the number of frames for the `anim` animation.

> method get_frame_duration(anim: StringName, idx: int) -> float ; qualifiers=const

Returns a relative duration of the frame `idx` in the `anim` animation (defaults to `1.0`). For example, a frame with a duration of `2.0` is displayed twice as long as a frame with a duration of `1.0`. You can calculate the absolute duration (in seconds) of a frame using the following formula:

```text
                absolute_duration = relative_duration / (animation_fps * abs(playing_speed))

```

In this example, `playing_speed` refers to either `AnimatedSprite2D.get_playing_speed` or `AnimatedSprite3D.get_playing_speed`.

> method get_frame_texture(anim: StringName, idx: int) -> Texture2D ; qualifiers=const

Returns the texture of the frame `idx` in the `anim` animation.

> method has_animation(anim: StringName) -> bool ; qualifiers=const

Returns `true` if the `anim` animation exists.

> method remove_animation(anim: StringName) -> void

Removes the `anim` animation.

> method remove_frame(anim: StringName, idx: int) -> void

Removes the `anim` animation's frame `idx`.

> method rename_animation(anim: StringName, newname: StringName) -> void

Changes the `anim` animation's name to `newname`.

> method set_animation_loop(anim: StringName, loop: bool) -> void ; deprecated=Use `set_animation_loop_mode` instead.

If `loop` is `false` equivalent to `set_animation_loop_mode(LOOP_NONE)`.
If `loop` is `true` equivalent to `set_animation_loop_mode(LOOP_LINEAR)`.

> method set_animation_loop_mode(anim: StringName, loop_mode: LoopMode) -> void

Sets the `loop_mode` for the `anim` animation.

> method set_animation_speed(anim: StringName, fps: float) -> void

Sets the speed for the `anim` animation in frames per second.

> method set_frame(anim: StringName, idx: int, texture: Texture2D, duration: float = 1.0) -> void

Sets the `texture` and the `duration` of the frame `idx` in the `anim` animation. `duration` specifies the relative duration, see `get_frame_duration` for details.

## Enumerations

> enum LoopMode

> enum_value LoopMode.LOOP_NONE = 0

The animation plays once and stops when it reaches the end, or the start if played in reverse.

> enum_value LoopMode.LOOP_LINEAR = 1

The animation restarts from the beginning when it reaches the end, or from the end if played in reverse, repeating continuously.

> enum_value LoopMode.LOOP_PINGPONG = 2

The animation alternates direction each time it reaches the end or start, playing forward and then in reverse repeatedly.
**Note:** Both `AnimatedSprite2D` and `AnimatedSprite3D` play the first/last frame for its duration only once at each end of the animation loop (instead of twice, once per forward/backward animation direction).
