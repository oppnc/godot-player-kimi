# PanoramaSkyMaterial

> class PanoramaSkyMaterial
> inherits PanoramaSkyMaterial Material

## Brief

A material that provides a special texture to a `Sky`, usually an HDR panorama.

## Description

A resource referenced in a `Sky` that is used to draw a background. `PanoramaSkyMaterial` functions similar to skyboxes in other engines, except it uses an equirectangular sky map instead of a `Cubemap`.
Using an HDR panorama is strongly recommended for accurate, high-quality reflections. Godot supports the Radiance HDR (`.hdr`) and OpenEXR (`.exr`) image formats for this purpose.
You can use [this tool](https://danilw.github.io/GLSL-howto/cubemap_to_panorama_js/cubemap_to_panorama.html) to convert a cubemap to an equirectangular sky map.

## Properties

> property energy_multiplier : float ; default=1.0 ; setter=set_energy_multiplier ; getter=get_energy_multiplier

The sky's overall brightness multiplier. Higher values result in a brighter sky.

> property filter : bool ; default=true ; setter=set_filtering_enabled ; getter=is_filtering_enabled

A boolean value to determine if the background texture should be filtered or not.

> property panorama : Texture2D ; setter=set_panorama ; getter=get_panorama

`Texture2D` to be applied to the `PanoramaSkyMaterial`.
