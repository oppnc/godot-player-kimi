# AudioEffectDelay

> class AudioEffectDelay
> inherits AudioEffectDelay AudioEffect

## Brief

Adds a delay audio effect to an audio bus.
Emulates an echo by playing the input audio back after a period of time.

## Description

A "delay" effect plays the input audio signal back after a period of time. Each repetition is called a "delay tap" or simply "tap". Delay taps may be played back multiple times to create the sound of a repeating, decaying echo. Delay effects range from a subtle echo to a pronounced blending of previous sounds with new sounds.
See also `AudioEffectReverb` for a blurry, continuous echo.

## Properties

> property dry : float ; default=1.0 ; setter=set_dry ; getter=get_dry

The volume ratio of the original audio. Value can range from 0 to 1.

> property feedback_active : bool ; default=false ; setter=set_feedback_active ; getter=is_feedback_active

If `true`, feedback is enabled, repeating taps after they are played.

> property feedback_delay_ms : float ; default=340.0 ; setter=set_feedback_delay_ms ; getter=get_feedback_delay_ms

Feedback delay time in milliseconds. Value can range from 0 to 1500.

> property feedback_level_db : float ; default=-6.0 ; setter=set_feedback_level_db ; getter=get_feedback_level_db

Gain for feedback, in dB. Value can range from -60 to 0.

> property feedback_lowpass : float ; default=16000.0 ; setter=set_feedback_lowpass ; getter=get_feedback_lowpass

Low-pass filter for feedback, in Hz. Frequencies above this value are filtered out. Value can range from 1 to 16000.

> property tap1_active : bool ; default=true ; setter=set_tap1_active ; getter=is_tap1_active

If `true`, the first tap will be enabled.

> property tap1_delay_ms : float ; default=250.0 ; setter=set_tap1_delay_ms ; getter=get_tap1_delay_ms

First tap delay time in milliseconds, compared to the original audio. Value can range from 0 to 1500.

> property tap1_level_db : float ; default=-6.0 ; setter=set_tap1_level_db ; getter=get_tap1_level_db

Gain for the first tap, in dB. Value can range from -60 to 0.

> property tap1_pan : float ; default=0.2 ; setter=set_tap1_pan ; getter=get_tap1_pan

Pan position for the first tap. Negative values pan the sound to the left, positive pan to the right. Value can range from -1 to 1.

> property tap2_active : bool ; default=true ; setter=set_tap2_active ; getter=is_tap2_active

If `true`, the second tap will be enabled.

> property tap2_delay_ms : float ; default=500.0 ; setter=set_tap2_delay_ms ; getter=get_tap2_delay_ms

Second tap delay time in milliseconds, compared to the original audio. Value can range from 0 to 1500.

> property tap2_level_db : float ; default=-12.0 ; setter=set_tap2_level_db ; getter=get_tap2_level_db

Gain for the second tap, in dB. Value can range from -60 to 0.

> property tap2_pan : float ; default=-0.4 ; setter=set_tap2_pan ; getter=get_tap2_pan

Pan position for the second tap. Negative values pan the sound to the left, positive pan to the right. Value can range from -1 to 1.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
- [Audio effects]($DOCS_URL/tutorials/audio/audio_effects.html)
