# AudioEffectCapture

> class AudioEffectCapture
> inherits AudioEffectCapture AudioEffect

## Brief

Exposes audio samples from an audio bus in real-time, such that it can be accessed as data.

## Description

Copies all audio frames, also known as "samples" or "audio samples", from the attached audio bus into its internal ring buffer. This effect does not alter the audio. Can be used for storing real-time audio data for playback, and for creating real-time audio visualizations, like an oscilloscope.
Application code should consume these audio frames from this ring buffer using `get_buffer` and process it as needed, for example to capture data from an `AudioStreamMicrophone`, implement application-defined effects, or to transmit audio over the network. When capturing audio data from a microphone, the format of the samples will be stereo 32-bit floating-point PCM.
Unlike `AudioEffectRecord`, this effect only returns the raw audio samples instead of encoding them into an `AudioStream`.

## Properties

> property buffer_length : float ; default=0.1 ; setter=set_buffer_length ; getter=get_buffer_length

Length of the internal ring buffer, in seconds. Higher values keep data around for longer, but require more memory. Value can range from 0.01 to 10.
**Note:** Setting the buffer length will have no effect if already initialized.

## Methods

> method can_get_buffer(frames: int) -> bool ; qualifiers=const

Returns `true` if at least `frames` samples are available to read in the internal ring buffer.

> method clear_buffer() -> void

Clears the internal ring buffer.
**Note:** Calling this during a capture can cause the loss of samples which causes popping in the playback.

> method get_buffer(frames: int) -> PackedVector2Array

Gets the next `frames` samples from the internal ring buffer.
Returns a `PackedVector2Array` containing exactly `frames` samples if available, or an empty `PackedVector2Array` if insufficient data was available.
The samples are signed floating-point PCM between `-1` and `1`. You will have to scale them if you want to use them as 8 or 16-bit integer samples. (`v = 0x7fff * samples[0].x`)

> method get_buffer_length_frames() -> int ; qualifiers=const

Returns the total size of the internal ring buffer in number of samples.

> method get_discarded_frames() -> int ; qualifiers=const

Returns the number of samples discarded from the audio bus due to full buffer.

> method get_frames_available() -> int ; qualifiers=const

Returns the number of samples available to read using `get_buffer`.

> method get_pushed_frames() -> int ; qualifiers=const

Returns the number of samples inserted from the audio bus.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
