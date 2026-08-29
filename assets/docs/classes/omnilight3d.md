# OmniLight3D

> class OmniLight3D ; keywords=point
> inherits OmniLight3D Light3D

## Brief

Omnidirectional light, such as a light bulb or a candle.

## Description

An Omnidirectional light is a type of `Light3D` that emits light in all directions. The light is attenuated by distance and this attenuation can be configured by changing its energy, radius, and attenuation parameters.
**Note:** When using the Mobile rendering method, only 8 omni lights can be displayed on each mesh resource. Attempting to display more than 8 omni lights on a single mesh resource will result in omni lights flickering in and out as the camera moves. When using the Compatibility rendering method, only 8 omni lights can be displayed on each mesh resource by default, but this can be increased by adjusting `ProjectSettings.rendering/limits/opengl/max_lights_per_object`.
**Note:** When using the Mobile or Compatibility rendering methods, omni lights will only correctly affect meshes whose visibility AABB intersects with the light's AABB. If using a shader to deform the mesh in a way that makes it go outside its AABB, `GeometryInstance3D.extra_cull_margin` must be increased on the mesh. Otherwise, the light may not be visible on the mesh.

## Properties

> property light_specular : float ; default=0.5 ; setter=set_param ; getter=get_param ; overrides=Light3D

> property omni_attenuation : float ; default=1.0 ; setter=set_param ; getter=get_param

Controls the distance attenuation function for omnilights.
A value of `0.0` will maintain a constant brightness through most of the range, but smoothly attenuate the light at the edge of the range. Use a value of `2.0` for physically accurate lights as it results in the proper inverse square attenutation.
**Note:** Setting attenuation to `2.0` or higher may result in distant objects receiving minimal light, even within range. For example, with a range of `4096`, an object at `100` units is attenuated by a factor of `0.0001`. With a default brightness of `1`, the light would not be visible at that distance.
**Note:** Using negative or values higher than `10.0` may lead to unexpected results.

> property omni_range : float ; default=5.0 ; setter=set_param ; getter=get_param

The light's radius. Note that the effectively lit area may appear to be smaller depending on the `omni_attenuation` in use. No matter the `omni_attenuation` in use, the light will never reach anything outside this radius.
**Note:** `omni_range` is not affected by `Node3D.scale` (the light's scale or its parent's scale).

> property omni_shadow_mode : ShadowMode ; default=1 ; setter=set_shadow_mode ; getter=get_shadow_mode

> property shadow_normal_bias : float ; default=1.0 ; setter=set_param ; getter=get_param ; overrides=Light3D

## Enumerations

> enum ShadowMode

> enum_value ShadowMode.SHADOW_DUAL_PARABOLOID = 0

Shadows are rendered to a dual-paraboloid texture. Faster than `SHADOW_CUBE`, but lower-quality.

> enum_value ShadowMode.SHADOW_CUBE = 1

Shadows are rendered to a cubemap. Slower than `SHADOW_DUAL_PARABOLOID`, but higher-quality.

## Tutorials
- [3D lights and shadows]($DOCS_URL/tutorials/3d/lights_and_shadows.html#omni-light)
- [Faking global illumination]($DOCS_URL/tutorials/3d/global_illumination/faking_global_illumination.html)
