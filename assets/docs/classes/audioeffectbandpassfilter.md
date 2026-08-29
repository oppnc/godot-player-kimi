# AudioEffectBandPassFilter

> class AudioEffectBandPassFilter
> inherits AudioEffectBandPassFilter AudioEffectFilter

## Brief

Adds a band-pass filter to an audio bus.

## Description

A "band-pass" filter allows the frequencies at `AudioEffectFilter.cutoff_hz` to pass unchanged, and attenuates frequencies outside the frequency threshold. It is the opposite of `AudioEffectBandLimitFilter` and `AudioEffectNotchFilter`.
This filter can be used to emulate sounds coming from weak speakers.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
- [Audio effects]($DOCS_URL/tutorials/audio/audio_effects.html)
