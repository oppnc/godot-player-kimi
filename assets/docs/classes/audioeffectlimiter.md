# AudioEffectLimiter

> class AudioEffectLimiter ; deprecated=Use `AudioEffectHardLimiter` instead.
> inherits AudioEffectLimiter AudioEffect

## Brief

Adds a soft-clip limiter audio effect to an audio bus.

## Description

A "limiter" is an audio effect designed to stop audio signals from exceeding a specified volume threshold level, and usually works by decreasing the volume or soft-clipping the audio. Adding one in the Master bus is always recommended to prevent clipping when the volume goes above 0 dB.
Soft clipping starts to decrease the peaks a little below the volume threshold level and progressively increases its effect as the input volume increases such that the threshold level is never exceeded.
If hard clipping is desired, consider `AudioEffectDistortion.MODE_CLIP`.

## Properties

> property ceiling_db : float ; default=-0.1 ; setter=set_ceiling_db ; getter=get_ceiling_db

The waveform's maximum allowed value, in dB. Value can range from -20 to -0.1.

> property soft_clip_db : float ; default=2.0 ; setter=set_soft_clip_db ; getter=get_soft_clip_db

Modifies the volume of the limited waves, in dB. Value can range from 0 to 6.

> property soft_clip_ratio : float ; default=10.0 ; setter=set_soft_clip_ratio ; getter=get_soft_clip_ratio

This property has no effect on the audio. Use `AudioEffectHardLimiter` instead, as this Limiter effect is deprecated.

> property threshold_db : float ; default=0.0 ; setter=set_threshold_db ; getter=get_threshold_db

The volume threshold level from which the limiter begins to be active, in dB. Value can range from -30 to 0.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
- [Audio effects]($DOCS_URL/tutorials/audio/audio_effects.html)
