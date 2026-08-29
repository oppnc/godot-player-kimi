# ProceduralSkyMaterial

> class ProceduralSkyMaterial
> inherits ProceduralSkyMaterial Material

## Brief

A material that defines a simple sky for a `Sky` resource.

## Description

`ProceduralSkyMaterial` provides a way to create an effective background quickly by defining procedural parameters for the sun, the sky and the ground. The sky and ground are defined by a main color, a color at the horizon, and an easing curve to interpolate between them. Suns are described by a position in the sky, a color, and a max angle from the sun at which the easing curve ends. The max angle therefore defines the size of the sun in the sky.
`ProceduralSkyMaterial` supports up to 4 suns, using the color, and energy, direction, and angular distance of the first four `DirectionalLight3D` nodes in the scene. This means that the suns are defined individually by the properties of their corresponding `DirectionalLight3D`s and globally by `sun_angle_max` and `sun_curve`.
`ProceduralSkyMaterial` uses a lightweight shader to draw the sky and is therefore suited for real-time updates. This makes it a great option for a sky that is simple and computationally cheap, but unrealistic. If you need a more realistic procedural option, use `PhysicalSkyMaterial`.

## Properties

> property energy_multiplier : float ; default=1.0 ; setter=set_energy_multiplier ; getter=get_energy_multiplier

The sky's overall brightness multiplier. Higher values result in a brighter sky.

> property ground_bottom_color : Color ; default=Color(0.2, 0.169, 0.133, 1) ; setter=set_ground_bottom_color ; getter=get_ground_bottom_color

Color of the ground at the bottom. Blends with `ground_horizon_color`.

> property ground_curve : float ; default=0.02 ; setter=set_ground_curve ; getter=get_ground_curve

How quickly the `ground_horizon_color` fades into the `ground_bottom_color`.

> property ground_energy_multiplier : float ; default=1.0 ; setter=set_ground_energy_multiplier ; getter=get_ground_energy_multiplier

Multiplier for ground color. A higher value will make the ground brighter.

> property ground_horizon_color : Color ; default=Color(0.6463, 0.6558, 0.6708, 1) ; setter=set_ground_horizon_color ; getter=get_ground_horizon_color

Color of the ground at the horizon. Blends with `ground_bottom_color`.

> property sky_cover : Texture2D ; setter=set_sky_cover ; getter=get_sky_cover

The sky cover texture to use. This texture must use an equirectangular projection (similar to `PanoramaSkyMaterial`). The texture's colors will be *added* to the existing sky color, and will be multiplied by `sky_energy_multiplier` and `sky_cover_modulate`. This is mainly suited to displaying stars at night, but it can also be used to display clouds at day or night (with a non-physically-accurate look).

> property sky_cover_modulate : Color ; default=Color(1, 1, 1, 1) ; setter=set_sky_cover_modulate ; getter=get_sky_cover_modulate

The tint to apply to the `sky_cover` texture. This can be used to change the sky cover's colors or opacity independently of the sky energy, which is useful for day/night or weather transitions. Only effective if a texture is defined in `sky_cover`.

> property sky_curve : float ; default=0.15 ; setter=set_sky_curve ; getter=get_sky_curve

How quickly the `sky_horizon_color` fades into the `sky_top_color`.

> property sky_energy_multiplier : float ; default=1.0 ; setter=set_sky_energy_multiplier ; getter=get_sky_energy_multiplier

Multiplier for sky color. A higher value will make the sky brighter.

> property sky_horizon_color : Color ; default=Color(0.6463, 0.6558, 0.6708, 1) ; setter=set_sky_horizon_color ; getter=get_sky_horizon_color

Color of the sky at the horizon. Blends with `sky_top_color`.

> property sky_top_color : Color ; default=Color(0.385, 0.454, 0.55, 1) ; setter=set_sky_top_color ; getter=get_sky_top_color

Color of the sky at the top. Blends with `sky_horizon_color`.

> property sun_angle_max : float ; default=30.0 ; setter=set_sun_angle_max ; getter=get_sun_angle_max

Distance from center of sun where it fades out completely.

> property sun_curve : float ; default=0.15 ; setter=set_sun_curve ; getter=get_sun_curve

How quickly the sun fades away between the edge of the sun disk and `sun_angle_max`.

> property use_debanding : bool ; default=true ; setter=set_use_debanding ; getter=get_use_debanding

If `true`, enables debanding. Debanding adds a small amount of noise which helps reduce banding that appears from the smooth changes in color in the sky.
