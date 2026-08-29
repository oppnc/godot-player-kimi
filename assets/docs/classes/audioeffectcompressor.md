# AudioEffectCompressor

> class AudioEffectCompressor
> inherits AudioEffectCompressor AudioEffect

## Brief

Adds a downward compressor audio effect to an audio bus.
Allows control of the dynamic range via a volume threshold and timing controls.

## Description

A "compressor" decreases the volume of sounds when it exceeds a certain volume threshold level.
A compressor can have many uses in a mix:
- To compress the whole volume in the Master bus (although an `AudioEffectHardLimiter` is probably better).
- To ensure balance of voice audio clips.
- To sidechain, using another bus as a trigger. This decreases the volume of the bus it is attached to, by using the volume from another audio bus for threshold detection. This technique is common in video game mixing to decrease the volume of music and SFX while voices are being heard. This effect is also known as "ducking".
- To accentuate transients by using a long attack, letting sounds exceed the volume threshold level for a short period before compressing them. This can be used to make SFX more punchy.

## Properties

> property attack_us : float ; default=20.0 ; setter=set_attack_us ; getter=get_attack_us

Compressor's reaction time when the audio exceeds the volume threshold level, in microseconds. Value can range from 20 to 2000.

> property gain : float ; default=0.0 ; setter=set_gain ; getter=get_gain

Gain of the audio signal, in dB. Value can range from -20 to 20.

> property mix : float ; default=1.0 ; setter=set_mix ; getter=get_mix

Balance between the original audio and the compressed audio. Value can range from 0 (totally dry) to 1 (totally wet).

> property ratio : float ; default=4.0 ; setter=set_ratio ; getter=get_ratio

Amount of compression applied to the audio once it passes the volume threshold level. The higher the ratio, the stronger the compression applied to audio signals that pass the volume threshold level. Value can range from 1 to 48.

> property release_ms : float ; default=250.0 ; setter=set_release_ms ; getter=get_release_ms

Compressor's delay time to stop decreasing the volume after the it falls below the volume threshold level, in milliseconds. Value can range from 20 to 2000.

> property sidechain : StringName ; default=&"" ; setter=set_sidechain ; getter=get_sidechain

Audio bus to use for the volume threshold detection.

> property threshold : float ; default=0.0 ; setter=set_threshold ; getter=get_threshold

The volume level above which compression is applied to the audio, in dB. Value can range from -60 to 0.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
- [Audio effects]($DOCS_URL/tutorials/audio/audio_effects.html)
