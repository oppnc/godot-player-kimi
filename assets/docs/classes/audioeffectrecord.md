# AudioEffectRecord

> class AudioEffectRecord
> inherits AudioEffectRecord AudioEffect

## Brief

Audio effect used for recording the sound from an audio bus.

## Description

Allows the user to record the sound from an audio bus into an `AudioStreamWAV`. When used on the Master audio bus, this includes all audio output by Godot.
Unlike `AudioEffectCapture`, this effect encodes the recording with the given format (8-bit, 16-bit, or compressed) instead of giving access to the raw audio samples.
Can be used (with an `AudioStreamMicrophone`) to record from a microphone.
**Note:** `ProjectSettings.audio/driver/enable_input` must be `true` for audio input to work. See also that setting's description for caveats related to permissions and operating system privacy settings.

## Properties

> property format : AudioStreamWAV.Format ; default=1 ; setter=set_format ; getter=get_format

Specifies the format in which the sample will be recorded.

## Methods

> method get_recording() -> AudioStreamWAV ; qualifiers=const

Returns the recorded sample.

> method is_recording_active() -> bool ; qualifiers=const

Returns whether the recording is active or not.

> method set_recording_active(record: bool) -> void

If `true`, the sound will be recorded. Note that restarting the recording will remove the previously recorded sample.

## Tutorials
- [Recording with microphone]($DOCS_URL/tutorials/audio/recording_with_microphone.html)
- [Audio Microphone Record Demo](https://godotengine.org/asset-library/asset/2760)
