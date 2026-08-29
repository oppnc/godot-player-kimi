# AudioStreamPlayer

> class AudioStreamPlayer ; keywords=sound, music, song
> inherits AudioStreamPlayer Node

## Brief

A node for audio playback.

## Description

The `AudioStreamPlayer` node plays an audio stream non-positionally. It is ideal for user interfaces, menus, or background music.
To use this node, `stream` needs to be set to a valid `AudioStream` resource. Playing more than one sound at the same time is also supported, see `max_polyphony`.
If you need to play audio at a specific position, use `AudioStreamPlayer2D` or `AudioStreamPlayer3D` instead.

## Properties

> property autoplay : bool ; default=false ; setter=set_autoplay ; getter=is_autoplay_enabled

If `true`, this node calls `play` when entering the tree.

> property bus : StringName ; default=&"Master" ; setter=set_bus ; getter=get_bus

The target bus name. All sounds from this node will be playing on this bus.
**Note:** At runtime, if no bus with the given name exists, all sounds will fall back on `"Master"`. See also `AudioServer.get_bus_name`.

> property max_polyphony : int ; default=1 ; setter=set_max_polyphony ; getter=get_max_polyphony

The maximum number of sounds this node can play at the same time. Calling `play` after this value is reached will cut off the oldest sounds.

> property mix_target : MixTarget ; default=0 ; setter=set_mix_target ; getter=get_mix_target

The mix target channels. Has no effect when two speakers or less are detected (see `AudioServer.SpeakerMode`).

> property pitch_scale : float ; default=1.0 ; setter=set_pitch_scale ; getter=get_pitch_scale

The audio's pitch and tempo, as a multiplier of the `stream`'s sample rate. A value of `2.0` doubles the audio's pitch, while a value of `0.5` halves the pitch.

> property playback_type : AudioServer.PlaybackType ; default=0 ; setter=set_playback_type ; getter=get_playback_type ; experimental=This property may be changed or removed in future versions.

The playback type of the stream player. If set other than to the default value, it will force that playback type.

> property playing : bool ; default=false ; setter=set_playing ; getter=is_playing

If `true`, this node is playing sounds. Setting this property has the same effect as `play` and `stop`.

> property stream : AudioStream ; setter=set_stream ; getter=get_stream

The `AudioStream` resource to be played. Setting this property stops all currently playing sounds. If left empty, the `AudioStreamPlayer` does not work.

> property stream_paused : bool ; default=false ; setter=set_stream_paused ; getter=get_stream_paused

If `true`, the sounds are paused. Setting `stream_paused` to `false` resumes all sounds.
**Note:** This property is automatically changed when exiting or entering the tree, or this node is paused (see `Node.process_mode`).

> property volume_db : float ; default=0.0 ; setter=set_volume_db ; getter=get_volume_db

Volume of sound, in decibels. This is an offset of the `stream`'s volume.
**Note:** To convert between decibel and linear energy (like most volume sliders do), use `volume_linear`, or `@GlobalScope.db_to_linear` and `@GlobalScope.linear_to_db`.

> property volume_linear : float ; setter=set_volume_linear ; getter=get_volume_linear

Volume of sound, as a linear value.
**Note:** This member modifies `volume_db` for convenience. The returned value is equivalent to the result of `@GlobalScope.db_to_linear` on `volume_db`. Setting this member is equivalent to setting `volume_db` to the result of `@GlobalScope.linear_to_db` on a value.

## Methods

> method get_playback_position() -> float

Returns the position in the `AudioStream` of the latest sound, in seconds. Returns `0.0` if no sounds are playing.
**Note:** The position is not always accurate, as the `AudioServer` does not mix audio every processed frame. To get more accurate results, add `AudioServer.get_time_since_last_mix` to the returned position.
**Note:** This method always returns `0.0` if the `stream` is an `AudioStreamInteractive`, since it can have multiple clips playing at once.

> method get_stream_playback() -> AudioStreamPlayback

Returns the latest `AudioStreamPlayback` of this node, usually the most recently created by `play`. If no sounds are playing, this method fails and returns an empty playback.

> method has_stream_playback() -> bool

Returns `true` if any sound is active, even if `stream_paused` is set to `true`. See also `playing` and `get_stream_playback`.

> method play(from_position: float = 0.0) -> void

Plays a sound from the beginning, or the given `from_position` in seconds.

> method seek(to_position: float) -> void

Restarts all sounds to be played from the given `to_position`, in seconds. Does nothing if no sounds are playing.

> method stop() -> void

Stops all sounds from this node.

## Signals

> signal finished()

Emitted when a sound finishes playing without interruptions. This signal is *not* emitted when calling `stop`, or when exiting the tree while sounds are playing.

## Enumerations

> enum MixTarget

> enum_value MixTarget.MIX_TARGET_STEREO = 0

The audio will be played only on the first channel. This is the default.

> enum_value MixTarget.MIX_TARGET_SURROUND = 1

The audio will be played on all surround channels.

> enum_value MixTarget.MIX_TARGET_CENTER = 2

The audio will be played on the second channel, which is usually the center.

## Tutorials
- [Audio streams]($DOCS_URL/tutorials/audio/audio_streams.html)
- [2D Dodge The Creeps Demo](https://godotengine.org/asset-library/asset/2712)
- [Audio Device Changer Demo](https://godotengine.org/asset-library/asset/2758)
- [Audio Generator Demo](https://godotengine.org/asset-library/asset/2759)
- [Audio Microphone Record Demo](https://godotengine.org/asset-library/asset/2760)
- [Audio Spectrum Visualizer Demo](https://godotengine.org/asset-library/asset/2762)
