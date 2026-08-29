# RenderSceneBuffersExtension

> class RenderSceneBuffersExtension
> inherits RenderSceneBuffersExtension RenderSceneBuffers

## Brief

This class allows for a RenderSceneBuffer implementation to be made in GDExtension.

## Description

This class allows for a RenderSceneBuffer implementation to be made in GDExtension.

## Methods

> method _configure(config: RenderSceneBuffersConfiguration) -> void ; qualifiers=virtual

Implement this in GDExtension to handle the (re)sizing of a viewport.

> method _set_anisotropic_filtering_level(anisotropic_filtering_level: int) -> void ; qualifiers=virtual

Implement this in GDExtension to change the anisotropic filtering level.

> method _set_fsr_sharpness(fsr_sharpness: float) -> void ; qualifiers=virtual

Implement this in GDExtension to record a new FSR sharpness value.

> method _set_texture_mipmap_bias(texture_mipmap_bias: float) -> void ; qualifiers=virtual

Implement this in GDExtension to change the texture mipmap bias.

> method _set_use_debanding(use_debanding: bool) -> void ; qualifiers=virtual

Implement this in GDExtension to react to the debanding flag changing.
