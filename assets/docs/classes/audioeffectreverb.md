# AudioEffectReverb

> class AudioEffectReverb
> inherits AudioEffectReverb AudioEffect

## Brief

Adds a reverberation audio effect to an audio bus.
Emulates an echo by playing a blurred version of the input audio.

## Description

A "reverb" effect plays the input audio back continuously, decaying over a period of time. It simulates sounds in different kinds of spaces, ranging from small rooms, to big caverns.
See also `AudioEffectDelay` for a non-blurry type of echo.

## Properties

> property damping : float ; default=0.5 ; setter=set_damping ; getter=get_damping

Defines how reflective the imaginary room's walls are. The more reflective, the more high frequency content the reverb has. Value can range from 0 to 1.

> property dry : float ; default=1.0 ; setter=set_dry ; getter=get_dry

The volume ratio of the original audio. At 0, only the modified audio is outputted. Value can range from 0 to 1.

> property hipass : float ; default=0.0 ; setter=set_hpf ; getter=get_hpf

High-pass filter allows frequencies higher than a certain cutoff threshold and attenuates frequencies lower than the cutoff threshold. Value can range from 0 to 1.

> property predelay_feedback : float ; default=0.4 ; setter=set_predelay_feedback ; getter=get_predelay_feedback

Gain of early reflection copies. At higher values, early reflection copies are louder and ring out for longer. Value can range from 0 to 1.

> property predelay_msec : float ; default=150.0 ; setter=set_predelay_msec ; getter=get_predelay_msec

Time between the original audio and the early reflections of the reverb signal, in milliseconds. Value can range from 20 to 500.

> property room_size : float ; default=0.8 ; setter=set_room_size ; getter=get_room_size

Dimensions of simulated room. Bigger means more echoes. Value can range from 0 to 1.

> property spread : float ; default=1.0 ; setter=set_spread ; getter=get_spread

Widens or narrows the stereo image of the reverb tail. At 1, it fully widens. Value can range from 0 to 1.

> property wet : float ; default=0.5 ; setter=set_wet ; getter=get_wet

The volume ratio of the modified audio. At 0, only the original audio is outputted. Value can range from 0 to 1.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
- [Audio effects]($DOCS_URL/tutorials/audio/audio_effects.html)
- [Third Person Shooter (TPS) Demo](https://godotengine.org/asset-library/asset/2710)
