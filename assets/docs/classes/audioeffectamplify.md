# AudioEffectAmplify

> class AudioEffectAmplify
> inherits AudioEffectAmplify AudioEffect

## Brief

Adds a volume manipulation audio effect to an audio bus.

## Description

Increases or decreases the volume being routed through the audio bus.

## Properties

> property volume_db : float ; default=0.0 ; setter=set_volume_db ; getter=get_volume_db

Amount of amplification in dB. Positive values make the sound louder, negative values make it quieter. Value can range from -80 to 24.

> property volume_linear : float ; setter=set_volume_linear ; getter=get_volume_linear

Amount of amplification as a linear value.
**Note:** This member modifies `volume_db` for convenience. The returned value is equivalent to the result of `@GlobalScope.db_to_linear` on `volume_db`. Setting this member is equivalent to setting `volume_db` to the result of `@GlobalScope.linear_to_db` on a value.

## Tutorials
- [Audio buses]($DOCS_URL/tutorials/audio/audio_buses.html)
- [Audio effects]($DOCS_URL/tutorials/audio/audio_effects.html)
