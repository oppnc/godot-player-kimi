# AudioEffectFilter

> class AudioEffectFilter
> inherits AudioEffectFilter AudioEffect

## Brief

Base class for filters. Use effects that inherit this class instead of using it directly.

## Description

A "filter" controls the gain of frequencies, using `cutoff_hz` as a frequency threshold. Filters can help to give room for each sound, and create interesting effects.
There are different types of filter that inherit this class:
Shelf filters: `AudioEffectLowShelfFilter` and `AudioEffectHighShelfFilter`
Band-pass and notch filters: `AudioEffectBandPassFilter`, `AudioEffectBandLimitFilter`, and `AudioEffectNotchFilter`
Low/high-pass filters: `AudioEffectLowPassFilter` and `AudioEffectHighPassFilter`

## Properties

> property cutoff_hz : float ; default=2000.0 ; setter=set_cutoff ; getter=get_cutoff

Frequency threshold for the filter, in Hz. Value can range from 1 to 20500.

> property db : FilterDB ; default=0 ; setter=set_db ; getter=get_db

Steepness of the cutoff curve in dB per octave (twice the frequency above `cutoff_hz`, or half the frequency below `cutoff_hz`), also known as the "order" of the filter. Higher orders have a more aggressive cutoff.

> property gain : float ; default=1.0 ; setter=set_gain ; getter=get_gain

Gain of the frequencies affected by the filter. This property is only available for `AudioEffectLowShelfFilter` and `AudioEffectHighShelfFilter`. Value can range from 0 to 4.

> property resonance : float ; default=0.5 ; setter=set_resonance ; getter=get_resonance

Gain at or directly next to the `cutoff_hz` frequency threshold. Value can range from 0 to 1.
Its exact behavior depends on the selected filter type:
- For shelf filters, it accentuates or masks the order by increasing frequencies right next to the `cutoff_hz` frequency and decreasing frequencies on the opposite side.
- For the band-pass and notch filters, it widens or narrows the filter at the `cutoff_hz` frequency threshold.
- For low/high-pass filters, it increases or decreases frequencies at the `cutoff_hz` frequency threshold.

## Enumerations

> enum FilterDB

> enum_value FilterDB.FILTER_6DB = 0

Cutting off at 6 dB per octave. One octave is twice the frequency above `cutoff_hz`, or half the frequency below `cutoff_hz`.

> enum_value FilterDB.FILTER_12DB = 1

Cutting off at 12 dB per octave. One octave is twice the frequency above `cutoff_hz`, or half the frequency below `cutoff_hz`.

> enum_value FilterDB.FILTER_18DB = 2

Cutting off at 18 dB per octave. One octave is twice the frequency above `cutoff_hz`, or half the frequency below `cutoff_hz`.

> enum_value FilterDB.FILTER_24DB = 3

Cutting off at 24 dB per octave. One octave is twice the frequency above `cutoff_hz`, or half the frequency below `cutoff_hz`.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
- [Audio effects]($DOCS_URL/tutorials/audio/audio_effects.html)
