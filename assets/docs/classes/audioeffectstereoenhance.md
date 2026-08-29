# AudioEffectStereoEnhance

> class AudioEffectStereoEnhance
> inherits AudioEffectStereoEnhance AudioEffect

## Brief

Adds a stereo manipulation audio effect to an audio bus.
Controls gain of the side channels, and widens the stereo image.

## Description

Adjusts gain of the left and right channels, and makes mono sounds stereo through phase shifting.

## Properties

> property pan_pullout : float ; default=1.0 ; setter=set_pan_pullout ; getter=get_pan_pullout

Gain of the side channels, if they exist. A value of 0 will downmix stereo to mono. Value can range from 0 to 4.

> property surround : float ; default=0.0 ; setter=set_surround ; getter=get_surround

Widens the stereo image through phase shifting in conjunction with `time_pullout_ms`. Just pans sound to the left channel if `time_pullout_ms` is 0. Value can range from 0 to 1.

> property time_pullout_ms : float ; default=0.0 ; setter=set_time_pullout ; getter=get_time_pullout

Widens the stereo image through phase shifting in conjunction with `surround`. Just delays the right channel if `surround` is 0. Value is in milliseconds, and can range from 0 to 50.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
- [Audio effects]($DOCS_URL/tutorials/audio/audio_effects.html)
