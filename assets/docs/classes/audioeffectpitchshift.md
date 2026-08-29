# AudioEffectPitchShift

> class AudioEffectPitchShift
> inherits AudioEffectPitchShift AudioEffect

## Brief

Adds a pitch-shifting audio effect to an audio bus.
Raises or lowers the pitch of the input audio.

## Description

Allows modulation of pitch without modifying speed. All frequencies can be raised or lowered with minimal effect on transients.

## Properties

> property fft_size : FFTSize ; default=3 ; setter=set_fft_size ; getter=get_fft_size

The size of the [Fast Fourier transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform) buffer. Higher values smooth out the effect over time, but have greater latency. The effects of this higher latency are especially noticeable on audio signals that have sudden amplitude changes.

> property oversampling : int ; default=4 ; setter=set_oversampling ; getter=get_oversampling

The oversampling factor to use. Higher values result in better quality, but are more demanding on the CPU and may cause audio cracking if the CPU can't keep up.

> property pitch_scale : float ; default=1.0 ; setter=set_pitch_scale ; getter=get_pitch_scale

The pitch scale to use. `1.0` is the default pitch and plays sounds unaffected. `pitch_scale` can range from 0 (infinitely low pitch, inaudible) to 16 (16 times higher than the initial pitch).

## Enumerations

> enum FFTSize

> enum_value FFTSize.FFT_SIZE_256 = 0

Use a buffer of 256 samples for the Fast Fourier transform. Lowest latency, but least stable over time.

> enum_value FFTSize.FFT_SIZE_512 = 1

Use a buffer of 512 samples for the Fast Fourier transform. Low latency, but less stable over time.

> enum_value FFTSize.FFT_SIZE_1024 = 2

Use a buffer of 1024 samples for the Fast Fourier transform. This is a compromise between latency and stability over time.

> enum_value FFTSize.FFT_SIZE_2048 = 3

Use a buffer of 2048 samples for the Fast Fourier transform. High latency, but stable over time.

> enum_value FFTSize.FFT_SIZE_4096 = 4

Use a buffer of 4096 samples for the Fast Fourier transform. Highest latency, but most stable over time.

> enum_value FFTSize.FFT_SIZE_MAX = 5

Represents the size of the `FFTSize` enum.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
- [Audio effects]($DOCS_URL/tutorials/audio/audio_effects.html)
