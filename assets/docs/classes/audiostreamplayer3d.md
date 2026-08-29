# AudioStreamPlayer3D

> class AudioStreamPlayer3D ; keywords=sound, sfx
> inherits AudioStreamPlayer3D Node3D

## Brief

Plays positional sound in 3D space.

## Description

Plays audio with positional sound effects, based on the relative position of the audio listener. Positional effects include distance attenuation, directionality, and the Doppler effect. For greater realism, a low-pass filter is applied to distant sounds. This can be disabled by setting `attenuation_filter_cutoff_hz` to `20500`.
By default, audio is heard from the camera position. This can be changed by adding an `AudioListener3D` node to the scene and enabling it by calling `AudioListener3D.make_current` on it.
See also `AudioStreamPlayer` to play a sound non-positionally.
**Note:** Hiding an `AudioStreamPlayer3D` node does not disable its audio output. To temporarily disable an `AudioStreamPlayer3D`'s audio output, set `volume_db` to a very low value like `-100` (which isn't audible to human hearing).

## Properties

> property area_mask : int ; default=0 ; setter=set_area_mask ; getter=get_area_mask

Determines which `Area3D` layers affect the sound for reverb and audio bus effects. Areas can be used to redirect `AudioStream`s so that they play in a certain audio bus. An example of how you might use this is making a "water" area so that sounds played in the water are redirected through an audio bus to make them sound like they are being played underwater.

> property attenuation_filter_cutoff_hz : float ; default=5000.0 ; setter=set_attenuation_filter_cutoff_hz ; getter=get_attenuation_filter_cutoff_hz

The cutoff frequency of the attenuation low-pass filter, in Hz. A sound above this frequency is attenuated more than a sound below this frequency. To disable this effect, set this to `20500` as this frequency is above the human hearing limit.

> property attenuation_filter_db : float ; default=-24.0 ; setter=set_attenuation_filter_db ; getter=get_attenuation_filter_db

Amount how much the filter affects the loudness, in decibels.

> property attenuation_model : AttenuationModel ; default=0 ; setter=set_attenuation_model ; getter=get_attenuation_model

Decides if audio should get quieter with distance linearly, quadratically, logarithmically, or not be affected by distance, effectively disabling attenuation.

> property autoplay : bool ; default=false ; setter=set_autoplay ; getter=is_autoplay_enabled

If `true`, audio plays when the AudioStreamPlayer3D node is added to scene tree.

> property bus : StringName ; default=&"Master" ; setter=set_bus ; getter=get_bus

The bus on which this audio is playing.
**Note:** When setting this property, keep in mind that no validation is performed to see if the given name matches an existing bus. This is because audio bus layouts might be loaded after this property is set. If this given name can't be resolved at runtime, it will fall back to `"Master"`.

> property doppler_tracking : DopplerTracking ; default=0 ; setter=set_doppler_tracking ; getter=get_doppler_tracking

Decides in which step the Doppler effect should be calculated.
**Note:** If `doppler_tracking` is not `DOPPLER_TRACKING_DISABLED` but the current `Camera3D`/`AudioListener3D` has doppler tracking disabled, the Doppler effect will be heard but will not take the movement of the current listener into account. If accurate Doppler effect is desired, doppler tracking should be enabled on both the `AudioStreamPlayer3D` and the current `Camera3D`/`AudioListener3D`.

> property emission_angle_degrees : float ; default=45.0 ; setter=set_emission_angle ; getter=get_emission_angle

The angle in which the audio reaches a listener unattenuated.

> property emission_angle_enabled : bool ; default=false ; setter=set_emission_angle_enabled ; getter=is_emission_angle_enabled

If `true`, the audio should be attenuated according to the direction of the sound.

> property emission_angle_filter_attenuation_db : float ; default=-12.0 ; setter=set_emission_angle_filter_attenuation_db ; getter=get_emission_angle_filter_attenuation_db

Attenuation factor used if listener is outside of `emission_angle_degrees` and `emission_angle_enabled` is set, in decibels.

> property max_db : float ; default=3.0 ; setter=set_max_db ; getter=get_max_db

Sets the absolute maximum of the sound level, in decibels.

> property max_distance : float ; default=0.0 ; setter=set_max_distance ; getter=get_max_distance

The distance past which the sound can no longer be heard at all. Only has an effect if set to a value greater than `0.0`. `max_distance` works in tandem with `unit_size`. However, unlike `unit_size` whose behavior depends on the `attenuation_model`, `max_distance` always works in a linear fashion. This can be used to prevent the `AudioStreamPlayer3D` from requiring audio mixing when the listener is far away, which saves CPU resources.

> property max_polyphony : int ; default=1 ; setter=set_max_polyphony ; getter=get_max_polyphony

The maximum number of sounds this node can play at the same time. Playing additional sounds after this value is reached will cut off the oldest sounds.

> property panning_strength : float ; default=1.0 ; setter=set_panning_strength ; getter=get_panning_strength

Scales the panning strength for this node by multiplying the base `ProjectSettings.audio/general/3d_panning_strength` by this factor. If the product is `0.0` then stereo panning is disabled and the volume is the same for all channels. If the product is `1.0` then one of the channels will be muted when the sound is located exactly to the left (or right) of the listener.
Two speaker stereo arrangements implement the [WebAudio standard for StereoPannerNode Panning](https://webaudio.github.io/web-audio-api/#stereopanner-algorithm) where the volume is cosine of half the azimuth angle to the ear.
For other speaker arrangements such as the 5.1 and 7.1 the SPCAP (Speaker-Placement Correction Amplitude) algorithm is implemented.

> property pitch_scale : float ; default=1.0 ; setter=set_pitch_scale ; getter=get_pitch_scale

The pitch and the tempo of the audio, as a multiplier of the audio sample's sample rate.

> property playback_type : AudioServer.PlaybackType ; default=0 ; setter=set_playback_type ; getter=get_playback_type ; experimental=This property may be changed or removed in future versions.

The playback type of the stream player. If set other than to the default value, it will force that playback type.

> property playing : bool ; default=false ; setter=set_playing ; getter=is_playing

If `true`, audio is playing or is queued to be played (see `play`).

> property stream : AudioStream ; setter=set_stream ; getter=get_stream

The `AudioStream` resource to be played.

> property stream_paused : bool ; default=false ; setter=set_stream_paused ; getter=get_stream_paused

If `true`, the playback is paused. You can resume it by setting `stream_paused` to `false`.

> property unit_size : float ; default=10.0 ; setter=set_unit_size ; getter=get_unit_size

The factor for the attenuation effect. Higher values make the sound audible over a larger distance.

> property volume_db : float ; default=0.0 ; setter=set_volume_db ; getter=get_volume_db

The base sound level before attenuation, in decibels.

> property volume_linear : float ; setter=set_volume_linear ; getter=get_volume_linear

The base sound level before attenuation, as a linear value.
**Note:** This member modifies `volume_db` for convenience. The returned value is equivalent to the result of `@GlobalScope.db_to_linear` on `volume_db`. Setting this member is equivalent to setting `volume_db` to the result of `@GlobalScope.linear_to_db` on a value.

## Methods

> method get_playback_position() -> float

Returns the position in the `AudioStream`.

> method get_stream_playback() -> AudioStreamPlayback

Returns the `AudioStreamPlayback` object associated with this `AudioStreamPlayer3D`.

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

## Enumerations

> enum AttenuationModel

> enum_value AttenuationModel.ATTENUATION_INVERSE_DISTANCE = 0

Attenuation of loudness according to linear distance.

> enum_value AttenuationModel.ATTENUATION_INVERSE_SQUARE_DISTANCE = 1

Attenuation of loudness according to squared distance.

> enum_value AttenuationModel.ATTENUATION_LOGARITHMIC = 2

Attenuation of loudness according to logarithmic distance.

> enum_value AttenuationModel.ATTENUATION_DISABLED = 3

No attenuation of loudness according to distance. The sound will still be heard positionally, unlike an `AudioStreamPlayer`. `ATTENUATION_DISABLED` can be combined with a `max_distance` value greater than `0.0` to achieve linear attenuation clamped to a sphere of a defined size.

> enum DopplerTracking

> enum_value DopplerTracking.DOPPLER_TRACKING_DISABLED = 0

Disables doppler tracking.

> enum_value DopplerTracking.DOPPLER_TRACKING_IDLE_STEP = 1

Executes doppler tracking during process frames (see `Node.NOTIFICATION_INTERNAL_PROCESS`).

> enum_value DopplerTracking.DOPPLER_TRACKING_PHYSICS_STEP = 2

Executes doppler tracking during physics frames (see `Node.NOTIFICATION_INTERNAL_PHYSICS_PROCESS`).

## Tutorials
- [Audio streams]($DOCS_URL/tutorials/audio/audio_streams.html)
