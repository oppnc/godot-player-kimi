# AudioStreamPlayer2D

> class AudioStreamPlayer2D ; keywords=sound, sfx
> inherits AudioStreamPlayer2D Node2D

## Brief

Plays positional sound in 2D space.

## Description

Plays audio that is attenuated with distance to the listener.
By default, audio is heard from the screen center. This can be changed by adding an `AudioListener2D` node to the scene and enabling it by calling `AudioListener2D.make_current` on it.
See also `AudioStreamPlayer` to play a sound non-positionally.
**Note:** Hiding an `AudioStreamPlayer2D` node does not disable its audio output. To temporarily disable an `AudioStreamPlayer2D`'s audio output, set `volume_db` to a very low value like `-100` (which isn't audible to human hearing).

## Properties

> property area_mask : int ; default=0 ; setter=set_area_mask ; getter=get_area_mask

Determines which `Area2D` layers affect the sound for reverb and audio bus effects. Areas can be used to redirect `AudioStream`s so that they play in a certain audio bus. An example of how you might use this is making a "water" area so that sounds played in the water are redirected through an audio bus to make them sound like they are being played underwater.

> property attenuation : float ; default=1.0 ; setter=set_attenuation ; getter=get_attenuation

The volume is attenuated over distance with this as an exponent.

> property autoplay : bool ; default=false ; setter=set_autoplay ; getter=is_autoplay_enabled

If `true`, audio plays when added to scene tree.

> property bus : StringName ; default=&"Master" ; setter=set_bus ; getter=get_bus

Bus on which this audio is playing.
**Note:** When setting this property, keep in mind that no validation is performed to see if the given name matches an existing bus. This is because audio bus layouts might be loaded after this property is set. If this given name can't be resolved at runtime, it will fall back to `"Master"`.

> property max_distance : float ; default=2000.0 ; setter=set_max_distance ; getter=get_max_distance

Maximum distance from which audio is still hearable.

> property max_polyphony : int ; default=1 ; setter=set_max_polyphony ; getter=get_max_polyphony

The maximum number of sounds this node can play at the same time. Playing additional sounds after this value is reached will cut off the oldest sounds.

> property panning_strength : float ; default=1.0 ; setter=set_panning_strength ; getter=get_panning_strength

Scales the panning strength for this node by multiplying the base `ProjectSettings.audio/general/2d_panning_strength` with this factor. Higher values will pan audio from left to right more dramatically than lower values.

> property pitch_scale : float ; default=1.0 ; setter=set_pitch_scale ; getter=get_pitch_scale

The pitch and the tempo of the audio, as a multiplier of the audio sample's sample rate.

> property playback_type : AudioServer.PlaybackType ; default=0 ; setter=set_playback_type ; getter=get_playback_type ; experimental=This property may be changed or removed in future versions.

The playback type of the stream player. If set other than to the default value, it will force that playback type.

> property playing : bool ; default=false ; setter=set_playing ; getter=is_playing

If `true`, audio is playing or is queued to be played (see `play`).

> property stream : AudioStream ; setter=set_stream ; getter=get_stream

The `AudioStream` object to be played.

> property stream_paused : bool ; default=false ; setter=set_stream_paused ; getter=get_stream_paused

If `true`, the playback is paused. You can resume it by setting `stream_paused` to `false`.

> property volume_db : float ; default=0.0 ; setter=set_volume_db ; getter=get_volume_db

Base volume before attenuation, in decibels.

> property volume_linear : float ; setter=set_volume_linear ; getter=get_volume_linear

Base volume before attenuation, as a linear value.
**Note:** This member modifies `volume_db` for convenience. The returned value is equivalent to the result of `@GlobalScope.db_to_linear` on `volume_db`. Setting this member is equivalent to setting `volume_db` to the result of `@GlobalScope.linear_to_db` on a value.

## Methods

> method get_playback_position() -> float

Returns the position in the `AudioStream`.

> method get_stream_playback() -> AudioStreamPlayback

Returns the `AudioStreamPlayback` object associated with this `AudioStreamPlayer2D`.

> method has_stream_playback() -> bool

Returns whether the `AudioStreamPlayer` can return the `AudioStreamPlayback` object or not.

> method play(from_position: float = 0.0) -> void

Queues the audio to play on the next physics frame, from the given position `from_position`, in seconds.

> method seek(to_position: float) -> void

Sets the position from which audio will be played, in seconds.

> method stop() -> void

Stops the audio.

## Signals

> signal finished()

Emitted when the audio stops playing.

## Tutorials
- [Audio streams]($DOCS_URL/tutorials/audio/audio_streams.html)
