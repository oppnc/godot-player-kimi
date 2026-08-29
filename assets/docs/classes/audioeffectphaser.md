# AudioEffectPhaser

> class AudioEffectPhaser
> inherits AudioEffectPhaser AudioEffect

## Brief

Adds a phaser audio effect to an audio bus.
Creates several notch and peak filters that sweep across the spectrum.

## Description

A "phaser" effect creates a copy of the original audio that phase-rotates differently across the entire frequency spectrum, with the use of a series of all-pass filter stages (6 in this effect). This copy modulates with a low-frequency oscillator and combines with the original audio, resulting in peaks and troughs that sweep across the spectrum.
This effect can be used to create a "glassy" or "bubbly" sound.

## Properties

> property depth : float ; default=1.0 ; setter=set_depth ; getter=get_depth

Intensity of the effect. Value can range from 0.1 to 4.0.

> property feedback : float ; default=0.7 ; setter=set_feedback ; getter=get_feedback

The volume ratio of the filtered audio that is fed back to the all-pass filters. The higher the value, the sharper and louder the peak filters created by the effect. Value can range from 0.1 to 0.9.

> property range_max_hz : float ; default=1600.0 ; setter=set_range_max_hz ; getter=get_range_max_hz

Determines the maximum frequency affected by the low-frequency oscillator modulations, in Hz. Value can range from 10 to 10000.

> property range_min_hz : float ; default=440.0 ; setter=set_range_min_hz ; getter=get_range_min_hz

Determines the minimum frequency affected by the low-frequency oscillator modulations, in Hz. Value can range from 10 to 10000.

> property rate_hz : float ; default=0.5 ; setter=set_rate_hz ; getter=get_rate_hz

Adjusts the rate in Hz at which the effect sweeps up and down across the frequency range. Value can range from 0.01 to 20.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
- [Audio effects]($DOCS_URL/tutorials/audio/audio_effects.html)
