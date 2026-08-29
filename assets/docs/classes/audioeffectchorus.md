# AudioEffectChorus

> class AudioEffectChorus
> inherits AudioEffectChorus AudioEffect

## Brief

Adds a chorus audio effect to an audio bus.
Gives the impression of multiple audio sources.

## Description

A "chorus" effect creates multiple copies of the original audio (called "voices") with variations in pitch, and layers on top of the original, giving the impression that the sound comes from multiple sources. This creates spectral and spatial movement.
Each voice is played a short period of time after the original audio, controlled by `delay`. An internal low-frequency oscillator (LFO) controls their pitch, and `depth` controls the LFO's maximum amount.
In the real world, this kind of effect is found in pianos, choirs, and instrument ensembles.
This effect can also be used to widen mono audio and make digital sounds have a more natural or analog quality.

## Properties

> property dry : float ; default=1.0 ; setter=set_dry ; getter=get_dry

The volume ratio of the original audio. Value can range from 0 to 1.

> property voice/1/cutoff_hz : float ; default=8000.0 ; setter=set_voice_cutoff_hz ; getter=get_voice_cutoff_hz

The frequency threshold of the voice's low-pass filter in Hz.

> property voice/1/delay_ms : float ; default=15.0 ; setter=set_voice_delay_ms ; getter=get_voice_delay_ms

The delay of the voice in milliseconds, compared to the original audio.

> property voice/1/depth_ms : float ; default=2.0 ; setter=set_voice_depth_ms ; getter=get_voice_depth_ms

The depth of the voice's low-frequency oscillator in milliseconds.

> property voice/1/level_db : float ; default=0.0 ; setter=set_voice_level_db ; getter=get_voice_level_db

The gain of the voice in dB.

> property voice/1/pan : float ; default=-0.5 ; setter=set_voice_pan ; getter=get_voice_pan

The pan position of the voice.

> property voice/1/rate_hz : float ; default=0.8 ; setter=set_voice_rate_hz ; getter=get_voice_rate_hz

The rate of the voice's low-frequency oscillator in Hz.

> property voice/2/cutoff_hz : float ; default=8000.0 ; setter=set_voice_cutoff_hz ; getter=get_voice_cutoff_hz

The frequency threshold of the voice's low-pass filter in Hz.

> property voice/2/delay_ms : float ; default=20.0 ; setter=set_voice_delay_ms ; getter=get_voice_delay_ms

The delay of the voice in milliseconds, compared to the original audio.

> property voice/2/depth_ms : float ; default=3.0 ; setter=set_voice_depth_ms ; getter=get_voice_depth_ms

The depth of the voice's low-frequency oscillator in milliseconds.

> property voice/2/level_db : float ; default=0.0 ; setter=set_voice_level_db ; getter=get_voice_level_db

The gain of the voice in dB.

> property voice/2/pan : float ; default=0.5 ; setter=set_voice_pan ; getter=get_voice_pan

The pan position of the voice.

> property voice/2/rate_hz : float ; default=1.2 ; setter=set_voice_rate_hz ; getter=get_voice_rate_hz

The rate of the voice's low-frequency oscillator in Hz.

> property voice/3/cutoff_hz : float ; setter=set_voice_cutoff_hz ; getter=get_voice_cutoff_hz

The frequency threshold of the voice's low-pass filter in Hz.

> property voice/3/delay_ms : float ; setter=set_voice_delay_ms ; getter=get_voice_delay_ms

The delay of the voice in milliseconds, compared to the original audio.

> property voice/3/depth_ms : float ; setter=set_voice_depth_ms ; getter=get_voice_depth_ms

The depth of the voice's low-frequency oscillator in milliseconds.

> property voice/3/level_db : float ; setter=set_voice_level_db ; getter=get_voice_level_db

The gain of the voice in dB.

> property voice/3/pan : float ; setter=set_voice_pan ; getter=get_voice_pan

The pan position of the voice.

> property voice/3/rate_hz : float ; setter=set_voice_rate_hz ; getter=get_voice_rate_hz

The rate of the voice's low-frequency oscillator in Hz.

> property voice/4/cutoff_hz : float ; setter=set_voice_cutoff_hz ; getter=get_voice_cutoff_hz

The frequency threshold of the voice's low-pass filter in Hz.

> property voice/4/delay_ms : float ; setter=set_voice_delay_ms ; getter=get_voice_delay_ms

The delay of the voice in milliseconds, compared to the original audio.

> property voice/4/depth_ms : float ; setter=set_voice_depth_ms ; getter=get_voice_depth_ms

The depth of the voice's low-frequency oscillator in milliseconds.

> property voice/4/level_db : float ; setter=set_voice_level_db ; getter=get_voice_level_db

The gain of the voice in dB.

> property voice/4/pan : float ; setter=set_voice_pan ; getter=get_voice_pan

The pan position of the voice.

> property voice/4/rate_hz : float ; setter=set_voice_rate_hz ; getter=get_voice_rate_hz

The rate of the voice's low-frequency oscillator in Hz.

> property voice_count : int ; default=2 ; setter=set_voice_count ; getter=get_voice_count

The number of voices in the effect. Value can range from 1 to 4.

> property wet : float ; default=0.5 ; setter=set_wet ; getter=get_wet

The volume ratio of all voices. Value can range from 0 to 1.

## Methods

> method get_voice_cutoff_hz(voice_idx: int) -> float ; qualifiers=const

Returns the frequency threshold of a given `voice_idx`'s low-pass filter in Hz. Frequencies above this value are removed from the voice.

> method get_voice_delay_ms(voice_idx: int) -> float ; qualifiers=const

Returns the delay of a given `voice_idx` in milliseconds, compared to the original audio.

> method get_voice_depth_ms(voice_idx: int) -> float ; qualifiers=const

Returns the depth of a given `voice_idx`'s low-frequency oscillator in milliseconds.

> method get_voice_level_db(voice_idx: int) -> float ; qualifiers=const

Returns the gain of a given `voice_idx` in dB.

> method get_voice_pan(voice_idx: int) -> float ; qualifiers=const

Returns the pan position of a given `voice_idx`. Negative values mean the left channel, positive mean the right.

> method get_voice_rate_hz(voice_idx: int) -> float ; qualifiers=const

Returns the rate of a given `voice_idx`'s low-frequency oscillator in Hz.

> method set_voice_cutoff_hz(voice_idx: int, cutoff_hz: float) -> void

Sets the frequency threshold of a given `voice_idx`'s low-pass filter in Hz. Frequencies above `cutoff_hz` are removed from `voice_idx`. Value can range from 1 to 20500.

> method set_voice_delay_ms(voice_idx: int, delay_ms: float) -> void

Sets the delay of a given `voice_idx` in milliseconds, compared to the original audio. Value can range from 0 to 50.

> method set_voice_depth_ms(voice_idx: int, depth_ms: float) -> void

Sets the depth of a given `voice_idx`'s low-frequency oscillator in milliseconds. Value can range from 0 to 20.

> method set_voice_level_db(voice_idx: int, level_db: float) -> void

Sets the gain of a given `voice_idx` in dB. Value can range from -60 to 24.

> method set_voice_pan(voice_idx: int, pan: float) -> void

Sets the pan position of a given `voice_idx`. Negative values pan the sound to the left, positive pan to the right. Value can range from -1 to 1.

> method set_voice_rate_hz(voice_idx: int, rate_hz: float) -> void

Sets the rate of a given `voice_idx`'s low-frequency oscillator in Hz. Value can range from 0.1 to 20.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
- [Audio effects]($DOCS_URL/tutorials/audio/audio_effects.html)
