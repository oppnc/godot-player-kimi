# Animation

> class Animation
> inherits Animation Resource

## Brief

Holds data that can be used to animate anything in the engine.

## Description

This resource holds data that can be used to animate anything in the engine. Animations are divided into tracks and each track must be linked to a node. The state of that node can be changed through time, by adding timed keys (events) to the track.

```gdscript
        # This creates an animation that makes the node "Enemy" move to the right by
        # 100 pixels in 2.0 seconds.
        var animation = Animation.new()
        var track_index = animation.add_track(Animation.TYPE_VALUE)
        animation.track_set_path(track_index, "Enemy:position:x")
        animation.track_insert_key(track_index, 0.0, 0)
        animation.track_insert_key(track_index, 2.0, 100)
        animation.length = 2.0

```

```csharp
        // This creates an animation that makes the node "Enemy" move to the right by
        // 100 pixels in 2.0 seconds.
        var animation = new Animation();
        int trackIndex = animation.AddTrack(Animation.TrackType.Value);
        animation.TrackSetPath(trackIndex, "Enemy:position:x");
        animation.TrackInsertKey(trackIndex, 0.0f, 0);
        animation.TrackInsertKey(trackIndex, 2.0f, 100);
        animation.Length = 2.0f;

```

Animations are just data containers, and must be added to nodes such as an `AnimationPlayer` to be played back. Animation tracks have different types, each with its own set of dedicated methods. Check `TrackType` to see available types.
**Note:** For 3D position/rotation/scale, using the dedicated `TYPE_POSITION_3D`, `TYPE_ROTATION_3D` and `TYPE_SCALE_3D` track types instead of `TYPE_VALUE` is recommended for performance reasons.

## Properties

> property capture_included : bool ; default=false ; getter=is_capture_included

Returns `true` if the capture track is included. This is a cached readonly value for performance.

> property length : float ; default=1.0 ; setter=set_length ; getter=get_length

The total length of the animation (in seconds).
**Note:** Length is not delimited by the last key, as this one may be before or after the end to ensure correct interpolation and looping.

> property loop_mode : LoopMode ; default=0 ; setter=set_loop_mode ; getter=get_loop_mode

Determines the behavior of both ends of the animation timeline during animation playback. This indicates whether and how the animation should be restarted, and is also used to correctly interpolate animation cycles.

> property step : float ; default=0.033333335 ; setter=set_step ; getter=get_step

The animation step value.

## Methods

> method add_marker(name: StringName, time: float) -> void

Adds a marker to this Animation.

> method add_track(type: TrackType, at_position: int = -1) -> int

Adds a track to the Animation.

> method animation_track_get_key_animation(track_idx: int, key_idx: int) -> StringName ; qualifiers=const

Returns the animation name at the key identified by `key_idx`. The `track_idx` must be the index of an Animation Track.

> method animation_track_insert_key(track_idx: int, time: float, animation: StringName) -> int

Inserts a key with value `animation` at the given `time` (in seconds). The `track_idx` must be the index of an Animation Track.

> method animation_track_set_key_animation(track_idx: int, key_idx: int, animation: StringName) -> void

Sets the key identified by `key_idx` to value `animation`. The `track_idx` must be the index of an Animation Track.

> method audio_track_get_key_end_offset(track_idx: int, key_idx: int) -> float ; qualifiers=const

Returns the end offset of the key identified by `key_idx`. The `track_idx` must be the index of an Audio Track.
End offset is the number of seconds cut off at the ending of the audio stream.

> method audio_track_get_key_start_offset(track_idx: int, key_idx: int) -> float ; qualifiers=const

Returns the start offset of the key identified by `key_idx`. The `track_idx` must be the index of an Audio Track.
Start offset is the number of seconds cut off at the beginning of the audio stream.

> method audio_track_get_key_stream(track_idx: int, key_idx: int) -> Resource ; qualifiers=const

Returns the audio stream of the key identified by `key_idx`. The `track_idx` must be the index of an Audio Track.

> method audio_track_insert_key(track_idx: int, time: float, stream: Resource, start_offset: float = 0, end_offset: float = 0) -> int

Inserts an Audio Track key at the given `time` in seconds. The `track_idx` must be the index of an Audio Track.
`stream` is the `AudioStream` resource to play. `start_offset` is the number of seconds cut off at the beginning of the audio stream, while `end_offset` is at the ending.

> method audio_track_is_use_blend(track_idx: int) -> bool ; qualifiers=const

Returns `true` if the track at `track_idx` will be blended with other animations.

> method audio_track_set_key_end_offset(track_idx: int, key_idx: int, offset: float) -> void

Sets the end offset of the key identified by `key_idx` to value `offset`. The `track_idx` must be the index of an Audio Track.

> method audio_track_set_key_start_offset(track_idx: int, key_idx: int, offset: float) -> void

Sets the start offset of the key identified by `key_idx` to value `offset`. The `track_idx` must be the index of an Audio Track.

> method audio_track_set_key_stream(track_idx: int, key_idx: int, stream: Resource) -> void

Sets the stream of the key identified by `key_idx` to value `stream`. The `track_idx` must be the index of an Audio Track.

> method audio_track_set_use_blend(track_idx: int, enable: bool) -> void

Sets whether the track will be blended with other animations. If `true`, the audio playback volume changes depending on the blend value.

> method bezier_track_get_key_in_handle(track_idx: int, key_idx: int) -> Vector2 ; qualifiers=const

Returns the in handle of the key identified by `key_idx`. The `track_idx` must be the index of a Bezier Track.

> method bezier_track_get_key_out_handle(track_idx: int, key_idx: int) -> Vector2 ; qualifiers=const

Returns the out handle of the key identified by `key_idx`. The `track_idx` must be the index of a Bezier Track.

> method bezier_track_get_key_value(track_idx: int, key_idx: int) -> float ; qualifiers=const

Returns the value of the key identified by `key_idx`. The `track_idx` must be the index of a Bezier Track.

> method bezier_track_insert_key(track_idx: int, time: float, value: float, in_handle: Vector2 = Vector2(0, 0), out_handle: Vector2 = Vector2(0, 0)) -> int

Inserts a Bezier Track key at the given `time` in seconds. The `track_idx` must be the index of a Bezier Track.
`in_handle` is the left-side weight of the added Bezier curve point, `out_handle` is the right-side one, while `value` is the actual value at this point.

> method bezier_track_interpolate(track_idx: int, time: float) -> float ; qualifiers=const

Returns the interpolated value at the given `time` (in seconds). The `track_idx` must be the index of a Bezier Track.

> method bezier_track_set_key_in_handle(track_idx: int, key_idx: int, in_handle: Vector2, balanced_value_time_ratio: float = 1.0) -> void

Sets the in handle of the key identified by `key_idx` to value `in_handle`. The `track_idx` must be the index of a Bezier Track.

> method bezier_track_set_key_out_handle(track_idx: int, key_idx: int, out_handle: Vector2, balanced_value_time_ratio: float = 1.0) -> void

Sets the out handle of the key identified by `key_idx` to value `out_handle`. The `track_idx` must be the index of a Bezier Track.

> method bezier_track_set_key_value(track_idx: int, key_idx: int, value: float) -> void

Sets the value of the key identified by `key_idx` to the given value. The `track_idx` must be the index of a Bezier Track.

> method blend_shape_track_insert_key(track_idx: int, time: float, amount: float) -> int

Inserts a key in a given blend shape track. Returns the key index.

> method blend_shape_track_interpolate(track_idx: int, time_sec: float, backward: bool = false) -> float ; qualifiers=const

Returns the interpolated blend shape value at the given time (in seconds). The `track_idx` must be the index of a blend shape track.

> method clear() -> void

Clear the animation (clear all tracks and reset all).

> method compress(page_size: int = 8192, fps: int = 120, split_tolerance: float = 4.0) -> void

Compress the animation and all its tracks in-place. This will make `track_is_compressed` return `true` once called on this `Animation`. Compressed tracks require less memory to be played, and are designed to be used for complex 3D animations (such as cutscenes) imported from external 3D software. Compression is lossy, but the difference is usually not noticeable in real world conditions.
**Note:** Compressed tracks have various limitations (such as not being editable from the editor), so only use compressed animations if you actually need them.

> method copy_track(track_idx: int, to_animation: Animation) -> void

Adds a new track to `to_animation` that is a copy of the given track from this animation.

> method find_track(path: NodePath, type: TrackType) -> int ; qualifiers=const

Returns the index of the specified track. If the track is not found, return -1.

> method get_marker_at_time(time: float) -> StringName ; qualifiers=const

Returns the name of the marker located at the given time.

> method get_marker_color(name: StringName) -> Color ; qualifiers=const

Returns the given marker's color.

> method get_marker_names() -> PackedStringArray ; qualifiers=const

Returns every marker in this Animation, sorted ascending by time.

> method get_marker_time(name: StringName) -> float ; qualifiers=const

Returns the given marker's time.

> method get_next_marker(time: float) -> StringName ; qualifiers=const

Returns the closest marker that comes after the given time. If no such marker exists, an empty string is returned.

> method get_prev_marker(time: float) -> StringName ; qualifiers=const

Returns the closest marker that comes before the given time. If no such marker exists, an empty string is returned.

> method get_track_count() -> int ; qualifiers=const

Returns the amount of tracks in the animation.

> method has_marker(name: StringName) -> bool ; qualifiers=const

Returns `true` if this Animation contains a marker with the given name.

> method method_track_get_name(track_idx: int, key_idx: int) -> StringName ; qualifiers=const

Returns the method name of a method track.

> method method_track_get_params(track_idx: int, key_idx: int) -> Array ; qualifiers=const

Returns the arguments values to be called on a method track for a given key in a given track.

> method optimize(allowed_velocity_err: float = 0.01, allowed_angular_err: float = 0.01, precision: int = 3) -> void

Optimize the animation and all its tracks in-place. This will preserve only as many keys as are necessary to keep the animation within the specified bounds.

> method position_track_insert_key(track_idx: int, time: float, position: Vector3) -> int

Inserts a key in a given 3D position track. Returns the key index.

> method position_track_interpolate(track_idx: int, time_sec: float, backward: bool = false) -> Vector3 ; qualifiers=const

Returns the interpolated position value at the given time (in seconds). The `track_idx` must be the index of a 3D position track.

> method remove_marker(name: StringName) -> void

Removes the marker with the given name from this Animation.

> method remove_track(track_idx: int) -> void

Removes a track by specifying the track index.

> method rotation_track_insert_key(track_idx: int, time: float, rotation: Quaternion) -> int

Inserts a key in a given 3D rotation track. Returns the key index.

> method rotation_track_interpolate(track_idx: int, time_sec: float, backward: bool = false) -> Quaternion ; qualifiers=const

Returns the interpolated rotation value at the given time (in seconds). The `track_idx` must be the index of a 3D rotation track.

> method scale_track_insert_key(track_idx: int, time: float, scale: Vector3) -> int

Inserts a key in a given 3D scale track. Returns the key index.

> method scale_track_interpolate(track_idx: int, time_sec: float, backward: bool = false) -> Vector3 ; qualifiers=const

Returns the interpolated scale value at the given time (in seconds). The `track_idx` must be the index of a 3D scale track.

> method set_marker_color(name: StringName, color: Color) -> void

Sets the given marker's color.

> method track_find_key(track_idx: int, time: float, find_mode: FindMode = 0, limit: bool = false, backward: bool = false) -> int ; qualifiers=const

Finds the key index by time in a given track. Optionally, only find it if the approx/exact time is given.
If `limit` is `true`, it does not return keys outside the animation range.
If `backward` is `true`, the direction is reversed in methods that rely on one directional processing.
For example, in case `find_mode` is `FIND_MODE_NEAREST`, if there is no key in the current position just after seeked, the first key found is retrieved by searching before the position, but if `backward` is `true`, the first key found is retrieved after the position.

> method track_get_interpolation_loop_wrap(track_idx: int) -> bool ; qualifiers=const

Returns `true` if the track at `track_idx` wraps the interpolation loop. New tracks wrap the interpolation loop by default.

> method track_get_interpolation_type(track_idx: int) -> InterpolationType ; qualifiers=const

Returns the interpolation type of a given track.

> method track_get_key_count(track_idx: int) -> int ; qualifiers=const

Returns the number of keys in a given track.

> method track_get_key_time(track_idx: int, key_idx: int) -> float ; qualifiers=const

Returns the time at which the key is located.

> method track_get_key_transition(track_idx: int, key_idx: int) -> float ; qualifiers=const

Returns the transition curve (easing) for a specific key (see the built-in math function `@GlobalScope.ease`).

> method track_get_key_value(track_idx: int, key_idx: int) -> Variant ; qualifiers=const

Returns the value of a given key in a given track.

> method track_get_path(track_idx: int) -> NodePath ; qualifiers=const

Gets the path of a track. For more information on the path format, see `track_set_path`.

> method track_get_type(track_idx: int) -> TrackType ; qualifiers=const

Gets the type of a track.

> method track_insert_key(track_idx: int, time: float, key: Variant, transition: float = 1) -> int

Inserts a generic key in a given track. Returns the key index.

> method track_is_compressed(track_idx: int) -> bool ; qualifiers=const

Returns `true` if the track is compressed, `false` otherwise. See also `compress`.

> method track_is_enabled(track_idx: int) -> bool ; qualifiers=const

Returns `true` if the track at index `track_idx` is enabled.

> method track_is_imported(track_idx: int) -> bool ; qualifiers=const

Returns `true` if the given track is imported. Else, return `false`.

> method track_move_down(track_idx: int) -> void

Moves a track down.

> method track_move_to(track_idx: int, to_idx: int) -> void

Changes the index position of track `track_idx` to the one defined in `to_idx`.

> method track_move_up(track_idx: int) -> void

Moves a track up.

> method track_remove_key(track_idx: int, key_idx: int) -> void

Removes a key by index in a given track.

> method track_remove_key_at_time(track_idx: int, time: float) -> void

Removes a key at `time` in a given track.

> method track_set_enabled(track_idx: int, enabled: bool) -> void

Enables/disables the given track. Tracks are enabled by default.

> method track_set_imported(track_idx: int, imported: bool) -> void

Sets the given track as imported or not.

> method track_set_interpolation_loop_wrap(track_idx: int, interpolation: bool) -> void

If `true`, the track at `track_idx` wraps the interpolation loop.

> method track_set_interpolation_type(track_idx: int, interpolation: InterpolationType) -> void

Sets the interpolation type of a given track.

> method track_set_key_time(track_idx: int, key_idx: int, time: float) -> void

Sets the time of an existing key.

> method track_set_key_transition(track_idx: int, key_idx: int, transition: float) -> void

Sets the transition curve (easing) for a specific key (see the built-in math function `@GlobalScope.ease`).

> method track_set_key_value(track_idx: int, key: int, value: Variant) -> void

Sets the value of an existing key.

> method track_set_path(track_idx: int, path: NodePath) -> void

Sets the path of a track. Paths must be valid scene-tree paths to a node and must be specified starting from the `AnimationMixer.root_node` that will reproduce the animation. Tracks that control properties or bones must append their name after the path, separated by `":"`.
For example, `"character/skeleton:ankle"` or `"character/mesh:transform/local"`.

> method track_swap(track_idx: int, with_idx: int) -> void

Swaps the track `track_idx`'s index position with the track `with_idx`.

> method value_track_get_update_mode(track_idx: int) -> UpdateMode ; qualifiers=const

Returns the update mode of a value track.

> method value_track_interpolate(track_idx: int, time_sec: float, backward: bool = false) -> Variant ; qualifiers=const

Returns the interpolated value at the given time (in seconds). The `track_idx` must be the index of a value track.
A `backward` mainly affects the direction of key retrieval of the track with `UPDATE_DISCRETE` converted by `AnimationMixer.ANIMATION_CALLBACK_MODE_DISCRETE_FORCE_CONTINUOUS` to match the result with `track_find_key`.

> method value_track_set_update_mode(track_idx: int, mode: UpdateMode) -> void

Sets the update mode of a value track.

## Enumerations

> enum FindMode

> enum_value FindMode.FIND_MODE_NEAREST = 0

Finds the nearest time key.

> enum_value FindMode.FIND_MODE_APPROX = 1

Finds only the key with approximating the time.

> enum_value FindMode.FIND_MODE_EXACT = 2

Finds only the key with matching the time.

> enum InterpolationType

> enum_value InterpolationType.INTERPOLATION_NEAREST = 0

No interpolation (nearest value).

> enum_value InterpolationType.INTERPOLATION_LINEAR = 1

Linear interpolation.

> enum_value InterpolationType.INTERPOLATION_CUBIC = 2

Cubic interpolation. This looks smoother than linear interpolation, but is more expensive to interpolate. Stick to `INTERPOLATION_LINEAR` for complex 3D animations imported from external software, even if it requires using a higher animation framerate in return.

> enum_value InterpolationType.INTERPOLATION_LINEAR_ANGLE = 3

Linear interpolation with shortest path rotation.
**Note:** The result value is always normalized and may not match the key value.

> enum_value InterpolationType.INTERPOLATION_CUBIC_ANGLE = 4

Cubic interpolation with shortest path rotation.
**Note:** The result value is always normalized and may not match the key value.

> enum LoopMode

> enum_value LoopMode.LOOP_NONE = 0

At both ends of the animation, the animation will stop playing.

> enum_value LoopMode.LOOP_LINEAR = 1

At both ends of the animation, the animation will be repeated without changing the playback direction.

> enum_value LoopMode.LOOP_PINGPONG = 2

Repeats playback and reverse playback at both ends of the animation.

> enum LoopedFlag

> enum_value LoopedFlag.LOOPED_FLAG_NONE = 0

This flag indicates that the animation proceeds without any looping.

> enum_value LoopedFlag.LOOPED_FLAG_END = 1

This flag indicates that the animation has reached the end of the animation and just after loop processed.

> enum_value LoopedFlag.LOOPED_FLAG_START = 2

This flag indicates that the animation has reached the start of the animation and just after loop processed.

> enum TrackType

> enum_value TrackType.TYPE_VALUE = 0

Value tracks set values in node properties, but only those which can be interpolated. For 3D position/rotation/scale, using the dedicated `TYPE_POSITION_3D`, `TYPE_ROTATION_3D` and `TYPE_SCALE_3D` track types instead of `TYPE_VALUE` is recommended for performance reasons.

> enum_value TrackType.TYPE_POSITION_3D = 1

3D position track (values are stored in `Vector3`s).

> enum_value TrackType.TYPE_ROTATION_3D = 2

3D rotation track (values are stored in `Quaternion`s).

> enum_value TrackType.TYPE_SCALE_3D = 3

3D scale track (values are stored in `Vector3`s).

> enum_value TrackType.TYPE_BLEND_SHAPE = 4

Blend shape track.

> enum_value TrackType.TYPE_METHOD = 5

Method tracks call functions with given arguments per key.

> enum_value TrackType.TYPE_BEZIER = 6

Bezier tracks are used to interpolate a value using custom curves. They can also be used to animate sub-properties of vectors and colors (e.g. alpha value of a `Color`).

> enum_value TrackType.TYPE_AUDIO = 7

Audio tracks are used to play an audio stream with either type of `AudioStreamPlayer`. The stream can be trimmed and previewed in the animation.

> enum_value TrackType.TYPE_ANIMATION = 8

Animation tracks play animations in other `AnimationPlayer` nodes.

> enum UpdateMode

> enum_value UpdateMode.UPDATE_CONTINUOUS = 0

Update between keyframes and hold the value.

> enum_value UpdateMode.UPDATE_DISCRETE = 1

Update at the keyframes.

> enum_value UpdateMode.UPDATE_CAPTURE = 2

Same as `UPDATE_CONTINUOUS` but works as a flag to capture the value of the current object and perform interpolation in some methods. See also `AnimationMixer.capture`, `AnimationPlayer.playback_auto_capture`, and `AnimationPlayer.play_with_capture`.

## Tutorials
- [Animation documentation index]($DOCS_URL/tutorials/animation/index.html)
