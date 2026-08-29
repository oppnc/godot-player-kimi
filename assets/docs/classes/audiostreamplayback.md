# AudioStreamPlayback

> class AudioStreamPlayback
> inherits AudioStreamPlayback RefCounted

## Brief

Meta class for playing back audio.

## Description

Can play, loop, pause a scroll through audio. See `AudioStream` and `AudioStreamOggVorbis` for usage.

## Methods

> method _get_loop_count() -> int ; qualifiers=virtual const

Overridable method. Should return how many times this audio stream has looped. Most built-in playbacks always return `0`.

> method _get_parameter(name: StringName) -> Variant ; qualifiers=virtual const

Return the current value of a playback parameter by name (see `AudioStream._get_parameter_list`).

> method _get_playback_position() -> float ; qualifiers=virtual required const

Overridable method. Should return the current progress along the audio stream, in seconds.

> method _is_playing() -> bool ; qualifiers=virtual required const

Overridable method. Should return `true` if this playback is active and playing its audio stream.

> method _mix(buffer: AudioFrame*, rate_scale: float, frames: int) -> int ; qualifiers=virtual required

Override this method to customize how the audio stream is mixed. This method is called even if the playback is not active.
**Note:** It is not useful to override this method in GDScript or C#. Only GDExtension can take advantage of it.

> method _seek(position: float) -> void ; qualifiers=virtual

Override this method to customize what happens when seeking this audio stream at the given `position`, such as by calling `AudioStreamPlayer.seek`.

> method _set_parameter(name: StringName, value: Variant) -> void ; qualifiers=virtual

Set the current value of a playback parameter by name (see `AudioStream._get_parameter_list`).

> method _start(from_pos: float) -> void ; qualifiers=virtual required

Override this method to customize what happens when the playback starts at the given position, such as by calling `AudioStreamPlayer.play`.

> method _stop() -> void ; qualifiers=virtual required

Override this method to customize what happens when the playback is stopped, such as by calling `AudioStreamPlayer.stop`.

> method _tag_used_streams() -> void ; qualifiers=virtual

Overridable method. Called whenever the audio stream is mixed if the playback is active and `AudioServer.set_enable_tagging_used_audio_streams` has been set to `true`. Editor plugins may use this method to "tag" the current position along the audio stream and display it in a preview.

> method get_loop_count() -> int ; qualifiers=const

Returns the number of times the stream has looped.

> method get_playback_position() -> float ; qualifiers=const

Returns the current position in the stream, in seconds.

> method get_sample_playback() -> AudioSamplePlayback ; qualifiers=const ; experimental=This method may be changed or removed in future versions.

Returns the `AudioSamplePlayback` associated with this `AudioStreamPlayback` for playing back the audio sample of this stream.

> method is_playing() -> bool ; qualifiers=const

Returns `true` if the stream is playing.

> method mix_audio(rate_scale: float, frames: int) -> PackedVector2Array

Mixes up to `frames` of audio from the stream from the current position, at a rate of `rate_scale`, advancing the stream.
Returns a `PackedVector2Array` where each element holds the left and right channel volume levels of each frame.
**Note:** Can return fewer frames than requested, make sure to use the size of the return value.

> method seek(time: float = 0.0) -> void

Seeks the stream at the given `time`, in seconds.

> method set_sample_playback(playback_sample: AudioSamplePlayback) -> void ; experimental=This method may be changed or removed in future versions.

Associates `AudioSamplePlayback` to this `AudioStreamPlayback` for playing back the audio sample of this stream.

> method start(from_pos: float = 0.0) -> void

Starts the stream from the given `from_pos`, in seconds.

> method stop() -> void

Stops the stream.

## Tutorials
- [Audio Generator Demo](https://godotengine.org/asset-library/asset/2759)
