# AudioStreamRandomizer

> class AudioStreamRandomizer
> inherits AudioStreamRandomizer AudioStream

## Brief

Wraps a pool of audio streams with pitch and volume shifting.

## Description

Picks a random AudioStream from the pool, depending on the playback mode, and applies random pitch shifting and volume shifting during playback.

## Properties

> property playback_mode : PlaybackMode ; default=0 ; setter=set_playback_mode ; getter=get_playback_mode

Controls how this AudioStreamRandomizer picks which AudioStream to play next.

> property random_pitch : float ; default=1.0 ; setter=set_random_pitch ; getter=get_random_pitch

The largest possible frequency multiplier of the random pitch variation. Pitch will be randomly chosen within a range of `1.0 / random_pitch` and `random_pitch`. A value of `1.0` means no variation. A value of `2.0` means pitch will be randomized between double and half.
**Note:** Setting this property also sets `random_pitch_semitones`.

> property random_pitch_semitones : float ; default=0.0 ; setter=set_random_pitch_semitones ; getter=get_random_pitch_semitones

The largest possible distance, in semitones, of the random pitch variation. A value of `0.0` means no variation.
**Note:** Setting this property also sets `random_pitch`.

> property random_volume_offset_db : float ; default=0.0 ; setter=set_random_volume_offset_db ; getter=get_random_volume_offset_db

The intensity of random volume variation. Volume will be increased or decreased by a random value up to `random_volume_offset_db`. A value of `0.0` means no variation. A value of `3.0` means volume will be randomized between `-3.0 dB` and `+3.0 dB`.

> property stream_{index}/stream : AudioStream

The `AudioStream` at `index`.
**Note:** `index` is a value in the `0 .. streams_count - 1` range.

> property stream_{index}/weight : float ; default=1.0

The probability weight of the `AudioStream` at `index`.
**Note:** `index` is a value in the `0 .. streams_count - 1` range.

> property streams_count : int ; default=0 ; setter=set_streams_count ; getter=get_streams_count

The number of streams in the stream pool.

## Methods

> method add_stream(index: int, stream: AudioStream, weight: float = 1.0) -> void

Insert a stream at the specified index. If the index is less than zero, the insertion occurs at the end of the underlying pool.

> method get_stream(index: int) -> AudioStream ; qualifiers=const

Returns the stream at the specified index.

> method get_stream_probability_weight(index: int) -> float ; qualifiers=const

Returns the probability weight associated with the stream at the given index.

> method move_stream(index_from: int, index_to: int) -> void

Move a stream from one index to another.

> method remove_stream(index: int) -> void

Remove the stream at the specified index.

> method set_stream(index: int, stream: AudioStream) -> void

Set the AudioStream at the specified index.

> method set_stream_probability_weight(index: int, weight: float) -> void

Set the probability weight of the stream at the specified index. The higher this value, the more likely that the randomizer will choose this stream during random playback modes.

## Enumerations

> enum PlaybackMode

> enum_value PlaybackMode.PLAYBACK_RANDOM_NO_REPEATS = 0

Pick a stream at random according to the probability weights chosen for each stream, but avoid playing the same stream twice in a row whenever possible. If only 1 sound is present in the pool, the same sound will always play, effectively allowing repeats to occur.

> enum_value PlaybackMode.PLAYBACK_RANDOM = 1

Pick a stream at random according to the probability weights chosen for each stream. If only 1 sound is present in the pool, the same sound will always play.

> enum_value PlaybackMode.PLAYBACK_SEQUENTIAL = 2

Play streams in the order they appear in the stream pool. If only 1 sound is present in the pool, the same sound will always play.

## Tutorials
- [Audio streams]($DOCS_URL/tutorials/audio/audio_streams.html)
