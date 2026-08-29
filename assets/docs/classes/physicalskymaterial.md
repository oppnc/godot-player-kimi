# PhysicalSkyMaterial

> class PhysicalSkyMaterial
> inherits PhysicalSkyMaterial Material

## Brief

A material that defines a sky for a `Sky` resource by a set of physical properties.

## Description

The `PhysicalSkyMaterial` uses the Preetham analytic daylight model to draw a sky based on physical properties. This results in a substantially more realistic sky than the `ProceduralSkyMaterial`, but it is slightly slower and less flexible.
The `PhysicalSkyMaterial` only supports one sun. The color, energy, and direction of the sun are taken from the first `DirectionalLight3D` in the scene tree.

## Properties

> property energy_multiplier : float ; default=1.0 ; setter=set_energy_multiplier ; getter=get_energy_multiplier

The sky's overall brightness multiplier. Higher values result in a brighter sky.

> property ground_color : Color ; default=Color(0.1, 0.07, 0.034, 1) ; setter=set_ground_color ; getter=get_ground_color

Modulates the `Color` on the bottom half of the sky to represent the ground.

> property mie_coefficient : float ; default=0.005 ; setter=set_mie_coefficient ; getter=get_mie_coefficient

Controls the strength of [Mie scattering](https://en.wikipedia.org/wiki/Mie_scattering) for the sky. Mie scattering results from light colliding with larger particles (like water). On earth, Mie scattering results in a whitish color around the sun and horizon.

> property mie_color : Color ; default=Color(0.69, 0.729, 0.812, 1) ; setter=set_mie_color ; getter=get_mie_color

Controls the `Color` of the [Mie scattering](https://en.wikipedia.org/wiki/Mie_scattering) effect. While not physically accurate, this allows for the creation of alien-looking planets.

> property mie_eccentricity : float ; default=0.8 ; setter=set_mie_eccentricity ; getter=get_mie_eccentricity

Controls the direction of the [Mie scattering](https://en.wikipedia.org/wiki/Mie_scattering). A value of `1` means that when light hits a particle it's passing through straight forward. A value of `-1` means that all light is scatter backwards.

> property night_sky : Texture2D ; setter=set_night_sky ; getter=get_night_sky

`Texture2D` for the night sky. This is added to the sky, so if it is bright enough, it may be visible during the day.

> property rayleigh_coefficient : float ; default=2.0 ; setter=set_rayleigh_coefficient ; getter=get_rayleigh_coefficient

Controls the strength of the [Rayleigh scattering](https://en.wikipedia.org/wiki/Rayleigh_scattering). Rayleigh scattering results from light colliding with small particles. It is responsible for the blue color of the sky.

> property rayleigh_color : Color ; default=Color(0.3, 0.405, 0.6, 1) ; setter=set_rayleigh_color ; getter=get_rayleigh_color

Controls the `Color` of the [Rayleigh scattering](https://en.wikipedia.org/wiki/Rayleigh_scattering). While not physically accurate, this allows for the creation of alien-looking planets. For example, setting this to a red `Color` results in a Mars-looking atmosphere with a corresponding blue sunset.

> property sun_disk_scale : float ; default=1.0 ; setter=set_sun_disk_scale ; getter=get_sun_disk_scale

Sets the size of the sun disk. Default value is based on Sol's perceived size from Earth.

> property turbidity : float ; default=10.0 ; setter=set_turbidity ; getter=get_turbidity

Sets the thickness of the atmosphere. High turbidity creates a foggy-looking atmosphere, while a low turbidity results in a clearer atmosphere.

> property use_debanding : bool ; default=true ; setter=set_use_debanding ; getter=get_use_debanding

If `true`, enables debanding. Debanding adds a small amount of noise which helps reduce banding that appears from the smooth changes in color in the sky.
