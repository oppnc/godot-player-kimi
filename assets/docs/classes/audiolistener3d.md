# AudioListener3D

> class AudioListener3D ; keywords=sound
> inherits AudioListener3D Node3D

## Brief

Overrides the location sounds are heard from.

## Description

Once added to the scene tree and enabled using `make_current`, this node will override the location sounds are heard from. This can be used to listen from a location different from the `Camera3D`.

## Properties

> property doppler_tracking : DopplerTracking ; default=0 ; setter=set_doppler_tracking ; getter=get_doppler_tracking

If not `DOPPLER_TRACKING_DISABLED`, this listener will simulate the [Doppler effect](https://en.wikipedia.org/wiki/Doppler_effect) for objects changed in particular `_process` methods.
**Note:** The Doppler effect will only be heard on `AudioStreamPlayer3D`s if `AudioStreamPlayer3D.doppler_tracking` is not set to `AudioStreamPlayer3D.DOPPLER_TRACKING_DISABLED`.

## Methods

> method clear_current() -> void

Disables the listener to use the current camera's listener instead.

> method get_listener_transform() -> Transform3D ; qualifiers=const

Returns the listener's global orthonormalized `Transform3D`.

> method is_current() -> bool ; qualifiers=const

Returns `true` if the listener was made current using `make_current`, `false` otherwise.
**Note:** There may be more than one AudioListener3D marked as "current" in the scene tree, but only the one that was made current last will be used.

> method make_current() -> void

Enables the listener. This will override the current camera's listener.

## Enumerations

> enum DopplerTracking

> enum_value DopplerTracking.DOPPLER_TRACKING_DISABLED = 0

Disables [Doppler effect](https://en.wikipedia.org/wiki/Doppler_effect) simulation (default).

> enum_value DopplerTracking.DOPPLER_TRACKING_IDLE_STEP = 1

Simulate [Doppler effect](https://en.wikipedia.org/wiki/Doppler_effect) by tracking positions of objects that are changed in `_process`. Changes in the relative velocity of this listener compared to those objects affect how audio is perceived (changing the audio's `AudioStreamPlayer3D.pitch_scale`).

> enum_value DopplerTracking.DOPPLER_TRACKING_PHYSICS_STEP = 2

Simulate [Doppler effect](https://en.wikipedia.org/wiki/Doppler_effect) by tracking positions of objects that are changed in `_physics_process`. Changes in the relative velocity of this listener compared to those objects affect how audio is perceived (changing the audio's `AudioStreamPlayer3D.pitch_scale`).
