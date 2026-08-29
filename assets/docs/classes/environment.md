# Environment

> class Environment
> inherits Environment Resource

## Brief

Resource for environment nodes (like `WorldEnvironment`) that define multiple rendering options.

## Description

Resource for environment nodes (like `WorldEnvironment`) that define multiple environment operations (such as background `Sky` or `Color`, ambient light, fog, depth-of-field...). These parameters affect the final render of the scene. The order of these operations is:
- Depth of Field Blur
- Auto Exposure
- Glow
- Tonemap
- Adjustments

## Properties

> property adjustment_brightness : float ; default=1.0 ; setter=set_adjustment_brightness ; getter=get_adjustment_brightness

Applies a simple brightness adjustment to the rendered image after tonemaping. To adjust scene brightness use `tonemap_exposure` instead, which is applied before tonemapping and thus less prone to issues with bright colors. Effective only if `adjustment_enabled` is `true`.

> property adjustment_color_correction : Texture ; setter=set_adjustment_color_correction ; getter=get_adjustment_color_correction

The `Texture2D` or `Texture3D` lookup table (LUT) to use for the built-in post-process color grading. Can use a `GradientTexture1D` for a 1-dimensional LUT, or a `Texture3D` for a more complex LUT. Effective only if `adjustment_enabled` is `true`.
**Note:** Color correction does not currently support HDR output due to only supporting values in the SDR (0.0 to 1.0) range.

> property adjustment_contrast : float ; default=1.0 ; setter=set_adjustment_contrast ; getter=get_adjustment_contrast

Increasing `adjustment_contrast` will make dark values darker and bright values brighter. This simple adjustment is applied to the rendered image after tonemaping. When set to a value greater than `1.0`, `adjustment_contrast` is prone to clipping colors that become too bright or too dark. Effective only if `adjustment_enabled` is `true`.

> property adjustment_enabled : bool ; default=false ; setter=set_adjustment_enabled ; getter=is_adjustment_enabled

If `true`, enables the `adjustment_*` properties provided by this resource. If `false`, modifications to the `adjustment_*` properties will have no effect on the rendered scene.

> property adjustment_saturation : float ; default=1.0 ; setter=set_adjustment_saturation ; getter=get_adjustment_saturation

Applies a simple saturation adjustment to the rendered image after tonemaping. When `adjustment_saturation` is set to `0.0`, the rendered image will be fully converted to a grayscale image. Effective only if `adjustment_enabled` is `true`.

> property ambient_light_color : Color ; default=Color(0, 0, 0, 1) ; setter=set_ambient_light_color ; getter=get_ambient_light_color

The ambient light's `Color`. Only effective if `ambient_light_sky_contribution` is lower than `1.0` (exclusive).

> property ambient_light_energy : float ; default=1.0 ; setter=set_ambient_light_energy ; getter=get_ambient_light_energy

The ambient light's energy. The higher the value, the stronger the light. Only effective if `ambient_light_sky_contribution` is lower than `1.0` (exclusive).

> property ambient_light_sky_contribution : float ; default=1.0 ; setter=set_ambient_light_sky_contribution ; getter=get_ambient_light_sky_contribution

Defines the amount of light that the sky brings on the scene. A value of `0.0` means that the sky's light emission has no effect on the scene illumination, thus all ambient illumination is provided by the ambient light. On the contrary, a value of `1.0` means that *all* the light that affects the scene is provided by the sky, thus the ambient light parameter has no effect on the scene.
**Note:** `ambient_light_sky_contribution` is internally clamped between `0.0` and `1.0` (inclusive).

> property ambient_light_source : AmbientSource ; default=0 ; setter=set_ambient_source ; getter=get_ambient_source

The ambient light source to use for rendering materials and global illumination.

> property background_camera_feed_id : int ; default=1 ; setter=set_camera_feed_id ; getter=get_camera_feed_id

The ID of the camera feed to show in the background.

> property background_canvas_max_layer : int ; default=0 ; setter=set_canvas_max_layer ; getter=get_canvas_max_layer

The maximum layer ID to display. Only effective when using the `BG_CANVAS` background mode.

> property background_color : Color ; default=Color(0, 0, 0, 1) ; setter=set_bg_color ; getter=get_bg_color

The `Color` displayed for clear areas of the scene. Only effective when using the `BG_COLOR` background mode.

> property background_energy_multiplier : float ; default=1.0 ; setter=set_bg_energy_multiplier ; getter=get_bg_energy_multiplier

Multiplier for background energy. Increase to make background brighter, decrease to make background dimmer.

> property background_intensity : float ; default=30000.0 ; setter=set_bg_intensity ; getter=get_bg_intensity

Luminance of background measured in nits (candela per square meter). Only used when `ProjectSettings.rendering/lights_and_shadows/use_physical_light_units` is enabled. The default value is roughly equivalent to the sky at midday.

> property background_mode : BGMode ; default=0 ; setter=set_background ; getter=get_background

The background mode.

> property fog_aerial_perspective : float ; default=0.0 ; setter=set_fog_aerial_perspective ; getter=get_fog_aerial_perspective

If set above `0.0` (exclusive), blends between the fog's color and the color of the background `Sky`, as read from the radiance cubemap. This has a small performance cost when set above `0.0`. Must have `background_mode` set to `BG_SKY`.
This is useful to simulate [aerial perspective](https://en.wikipedia.org/wiki/Aerial_perspective) in large scenes with low density fog. However, it is not very useful for high-density fog, as the sky will shine through. When set to `1.0`, the fog color comes completely from the `Sky`. If set to `0.0`, aerial perspective is disabled.
Notice that this does not sample the `Sky` directly, but rather the radiance cubemap. The cubemap is sampled at a mipmap level depending on the depth of the rendered pixel; the farther away, the higher the resolution of the sampled mipmap. This results in the actual color being a blurred version of the sky, with more blur closer to the camera. The highest mipmap resolution is used at a depth of `Camera3D.far`.

> property fog_density : float ; default=0.01 ; setter=set_fog_density ; getter=get_fog_density

The fog density to be used. This is demonstrated in different ways depending on the `fog_mode` mode chosen:
**Exponential Fog Mode:** Higher values result in denser fog. The fog rendering is exponential like in real life.
**Depth Fog mode:** The maximum intensity of the deep fog, effect will appear in the distance (relative to the camera). At `1.0` the fog will fully obscure the scene, at `0.0` the fog will not be visible.

> property fog_depth_begin : float ; default=10.0 ; setter=set_fog_depth_begin ; getter=get_fog_depth_begin

The fog's depth starting distance from the camera. Only available when `fog_mode` is set to `FOG_MODE_DEPTH`.

> property fog_depth_curve : float ; default=1.0 ; setter=set_fog_depth_curve ; getter=get_fog_depth_curve

The fog depth's intensity curve. A number of presets are available in the Inspector by right-clicking the curve. Only available when `fog_mode` is set to `FOG_MODE_DEPTH`.

> property fog_depth_end : float ; default=100.0 ; setter=set_fog_depth_end ; getter=get_fog_depth_end

The fog's depth end distance from the camera. If this value is set to `0`, it will be equal to the current camera's `Camera3D.far` value. Only available when `fog_mode` is set to `FOG_MODE_DEPTH`.

> property fog_enabled : bool ; default=false ; setter=set_fog_enabled ; getter=is_fog_enabled

If `true`, fog effects are enabled.

> property fog_height : float ; default=0.0 ; setter=set_fog_height ; getter=get_fog_height

The height at which the height fog effect begins.

> property fog_height_density : float ; default=0.0 ; setter=set_fog_height_density ; getter=get_fog_height_density

The density used to increase fog as height decreases. To make fog increase as height increases, use a negative value.

> property fog_light_color : Color ; default=Color(0.518, 0.553, 0.608, 1) ; setter=set_fog_light_color ; getter=get_fog_light_color

The fog's color.

> property fog_light_energy : float ; default=1.0 ; setter=set_fog_light_energy ; getter=get_fog_light_energy

The fog's brightness. Higher values result in brighter fog.

> property fog_mode : FogMode ; default=0 ; setter=set_fog_mode ; getter=get_fog_mode

The fog mode.

> property fog_sky_affect : float ; default=1.0 ; setter=set_fog_sky_affect ; getter=get_fog_sky_affect

The factor to use when affecting the sky with non-volumetric fog. `1.0` means that fog can fully obscure the sky. Lower values reduce the impact of fog on sky rendering, with `0.0` not affecting sky rendering at all.
**Note:** `fog_sky_affect` has no visual effect if `fog_aerial_perspective` is `1.0`.

> property fog_sun_scatter : float ; default=0.0 ; setter=set_fog_sun_scatter ; getter=get_fog_sun_scatter

If set above `0.0`, renders the scene's directional light(s) in the fog color depending on the view angle. This can be used to give the impression that the sun is "piercing" through the fog.

> property glow_blend_mode : GlowBlendMode ; default=1 ; setter=set_glow_blend_mode ; getter=get_glow_blend_mode

The glow blending mode.
**Note:** The Compatibility renderer always uses `GLOW_BLEND_MODE_SCREEN` and `glow_blend_mode` will have no effect.

> property glow_bloom : float ; default=0.0 ; setter=set_glow_bloom ; getter=get_glow_bloom

The bloom's intensity. If set to a value higher than `0`, this will make glow visible in areas darker than the `glow_hdr_threshold`.

> property glow_enabled : bool ; default=false ; setter=set_glow_enabled ; getter=is_glow_enabled

If `true`, the glow effect is enabled. This simulates real world atmosphere and eye/camera behavior by causing bright pixels to bleed onto surrounding pixels.
**Note:** When using the Mobile rendering method, glow looks different due to the lower dynamic range available in the Mobile rendering method.
**Note:** When using the Compatibility rendering method, glow uses a different implementation with some properties being unavailable and hidden from the inspector: `glow_levels/*`, `glow_normalized`, `glow_strength`, `glow_blend_mode`, `glow_mix`, `glow_map`, and `glow_map_strength`. This implementation is optimized to run on low-end devices and is less flexible as a result.

> property glow_hdr_luminance_cap : float ; default=12.0 ; setter=set_glow_hdr_luminance_cap ; getter=get_glow_hdr_luminance_cap

The higher threshold of the HDR glow. Areas brighter than this threshold will be clamped for the purposes of the glow effect.

> property glow_hdr_scale : float ; default=2.0 ; setter=set_glow_hdr_bleed_scale ; getter=get_glow_hdr_bleed_scale

Smooths the transition between values that are below and above `glow_hdr_threshold` by reducing the amount of glow generated by values that are close to `glow_hdr_threshold`. Values above `glow_hdr_threshold + glow_hdr_scale` will not have glow reduced in this way.

> property glow_hdr_threshold : float ; default=1.0 ; setter=set_glow_hdr_bleed_threshold ; getter=get_glow_hdr_bleed_threshold

The lower threshold of the HDR glow. When using the Mobile rendering method (which only supports a lower dynamic range up to `2.0`), this may need to be below `1.0` for glow to be visible. A value of `0.9` works well in this case. This value also needs to be decreased below `1.0` when using glow in 2D, as 2D rendering is performed in SDR.

> property glow_intensity : float ; default=0.3 ; setter=set_glow_intensity ; getter=get_glow_intensity

The overall brightness multiplier that is applied to the glow effect just before it is blended with the scene. When using the Mobile rendering method (which only supports a lower dynamic range up to `2.0`), this should be increased to `1.5` to compensate.

> property glow_levels/1 : float ; default=0.0 ; setter=set_glow_level ; getter=get_glow_level

The intensity of the 1st level of glow. This is the most "local" level (least blurry).
**Note:** `glow_levels/1` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property glow_levels/2 : float ; default=0.8 ; setter=set_glow_level ; getter=get_glow_level

The intensity of the 2nd level of glow.
**Note:** `glow_levels/2` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property glow_levels/3 : float ; default=0.4 ; setter=set_glow_level ; getter=get_glow_level

The intensity of the 3rd level of glow.
**Note:** `glow_levels/3` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property glow_levels/4 : float ; default=0.1 ; setter=set_glow_level ; getter=get_glow_level

The intensity of the 4th level of glow.
**Note:** `glow_levels/4` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property glow_levels/5 : float ; default=0.0 ; setter=set_glow_level ; getter=get_glow_level

The intensity of the 5th level of glow.
**Note:** `glow_levels/5` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property glow_levels/6 : float ; default=0.0 ; setter=set_glow_level ; getter=get_glow_level

The intensity of the 6th level of glow.
**Note:** `glow_levels/6` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property glow_levels/7 : float ; default=0.0 ; setter=set_glow_level ; getter=get_glow_level

The intensity of the 7th level of glow. This is the most "global" level (blurriest).
**Note:** `glow_levels/7` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property glow_map : Texture ; setter=set_glow_map ; getter=get_glow_map

The texture that should be used as a glow map to *multiply* the resulting glow color according to `glow_map_strength`. This can be used to create a "lens dirt" effect. The texture's RGB color channels are used for modulation, but the alpha channel is ignored.
**Note:** The texture will be stretched to fit the screen. Therefore, it's recommended to use a texture with an aspect ratio that matches your project's base aspect ratio (typically 16:9).
**Note:** `glow_map` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property glow_map_strength : float ; default=0.8 ; setter=set_glow_map_strength ; getter=get_glow_map_strength

How strong of an influence the `glow_map` should have on the overall glow effect. A strength of `0.0` means the glow map has no influence, while a strength of `1.0` means the glow map has full influence.
**Note:** If the glow map has black areas, a value of `1.0` can also turn off the glow effect entirely in specific areas of the screen.
**Note:** `glow_map_strength` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property glow_mix : float ; default=0.05 ; setter=set_glow_mix ; getter=get_glow_mix

When using the `GLOW_BLEND_MODE_MIX` `glow_blend_mode`, this controls how much the source image is blended with the glow layer. A value of `0.0` makes the glow rendering invisible, while a value of `1.0` is equivalent to `GLOW_BLEND_MODE_REPLACE`.
**Note:** `glow_mix` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property glow_normalized : bool ; default=false ; setter=set_glow_normalized ; getter=is_glow_normalized

If `true`, glow levels will be normalized so that summed together their intensities equal `1.0`.
**Note:** `glow_normalized` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property glow_strength : float ; default=1.0 ; setter=set_glow_strength ; getter=get_glow_strength

The strength that is used when blurring across the screen to generate the glow effect. This affects the distance and intensity of the blur. When using the Mobile rendering method, this should be increased to compensate for the lower dynamic range.
**Note:** `glow_strength` has no effect when using the Compatibility rendering method, due to this rendering method using a simpler glow implementation optimized for low-end devices.

> property reflected_light_source : ReflectionSource ; default=0 ; setter=set_reflection_source ; getter=get_reflection_source

The reflected (specular) light source.

> property sdfgi_bounce_feedback : float ; default=0.5 ; setter=set_sdfgi_bounce_feedback ; getter=get_sdfgi_bounce_feedback

The energy multiplier applied to light every time it bounces from a surface when using SDFGI. Values greater than `0.0` will simulate multiple bounces, resulting in a more realistic appearance. Increasing `sdfgi_bounce_feedback` generally has no performance impact. See also `sdfgi_energy`.
**Note:** Values greater than `0.5` can cause infinite feedback loops and should be avoided in scenes with bright materials.
**Note:** If `sdfgi_bounce_feedback` is `0.0`, indirect lighting will not be represented in reflections as light will only bounce one time.

> property sdfgi_cascade0_distance : float ; default=12.8 ; setter=set_sdfgi_cascade0_distance ; getter=get_sdfgi_cascade0_distance

**Note:** This property is linked to `sdfgi_min_cell_size` and `sdfgi_max_distance`. Changing its value will automatically change those properties as well.

> property sdfgi_cascades : int ; default=4 ; setter=set_sdfgi_cascades ; getter=get_sdfgi_cascades

The number of cascades to use for SDFGI (between 1 and 8). A higher number of cascades allows displaying SDFGI further away while preserving detail up close, at the cost of performance. When using SDFGI on small-scale levels, `sdfgi_cascades` can often be decreased between `1` and `4` to improve performance.

> property sdfgi_enabled : bool ; default=false ; setter=set_sdfgi_enabled ; getter=is_sdfgi_enabled

If `true`, enables signed distance field global illumination for meshes that have their `GeometryInstance3D.gi_mode` set to `GeometryInstance3D.GI_MODE_STATIC`. SDFGI is a real-time global illumination technique that works well with procedurally generated and user-built levels, including in situations where geometry is created during gameplay. The signed distance field is automatically generated around the camera as it moves. Dynamic lights are supported, but dynamic occluders and emissive surfaces are not.
**Note:** SDFGI is only supported in the Forward+ rendering method, not Mobile or Compatibility.
**Performance:** SDFGI is relatively demanding on the GPU and is not suited to low-end hardware such as integrated graphics (consider `LightmapGI` instead). To improve SDFGI performance, enable `ProjectSettings.rendering/global_illumination/gi/use_half_resolution` in the Project Settings.
**Note:** Meshes should have sufficiently thick walls to avoid light leaks (avoid one-sided walls). For interior levels, enclose your level geometry in a sufficiently large box and bridge the loops to close the mesh.

> property sdfgi_energy : float ; default=1.0 ; setter=set_sdfgi_energy ; getter=get_sdfgi_energy

The energy multiplier to use for SDFGI. Higher values will result in brighter indirect lighting and reflections. See also `sdfgi_bounce_feedback`.

> property sdfgi_max_distance : float ; default=204.8 ; setter=set_sdfgi_max_distance ; getter=get_sdfgi_max_distance

The maximum distance at which SDFGI is visible. Beyond this distance, environment lighting or other sources of GI such as `ReflectionProbe` will be used as a fallback.
**Note:** This property is linked to `sdfgi_min_cell_size` and `sdfgi_cascade0_distance`. Changing its value will automatically change those properties as well.

> property sdfgi_min_cell_size : float ; default=0.2 ; setter=set_sdfgi_min_cell_size ; getter=get_sdfgi_min_cell_size

The cell size to use for the closest SDFGI cascade (in 3D units). Lower values allow SDFGI to be more precise up close, at the cost of making SDFGI updates more demanding. This can cause stuttering when the camera moves fast. Higher values allow SDFGI to cover more ground, while also reducing the performance impact of SDFGI updates.
**Note:** This property is linked to `sdfgi_max_distance` and `sdfgi_cascade0_distance`. Changing its value will automatically change those properties as well.

> property sdfgi_normal_bias : float ; default=1.1 ; setter=set_sdfgi_normal_bias ; getter=get_sdfgi_normal_bias

The normal bias to use for SDFGI probes. Increasing this value can reduce visible streaking artifacts on sloped surfaces, at the cost of increased light leaking.

> property sdfgi_probe_bias : float ; default=1.1 ; setter=set_sdfgi_probe_bias ; getter=get_sdfgi_probe_bias

The constant bias to use for SDFGI probes. Increasing this value can reduce visible streaking artifacts on sloped surfaces, at the cost of increased light leaking.

> property sdfgi_read_sky_light : bool ; default=true ; setter=set_sdfgi_read_sky_light ; getter=is_sdfgi_reading_sky_light

If `true`, SDFGI takes the environment lighting into account. This should be set to `false` for interior scenes.

> property sdfgi_use_occlusion : bool ; default=false ; setter=set_sdfgi_use_occlusion ; getter=is_sdfgi_using_occlusion

If `true`, SDFGI uses an occlusion detection approach to reduce light leaking. Occlusion may however introduce dark blotches in certain spots, which may be undesired in mostly outdoor scenes. `sdfgi_use_occlusion` has a performance impact and should only be enabled when needed.

> property sdfgi_y_scale : SDFGIYScale ; default=1 ; setter=set_sdfgi_y_scale ; getter=get_sdfgi_y_scale

The Y scale to use for SDFGI cells. Lower values will result in SDFGI cells being packed together more closely on the Y axis. This is used to balance between quality and covering a lot of vertical ground. `sdfgi_y_scale` should be set depending on how vertical your scene is (and how fast your camera may move on the Y axis).

> property sky : Sky ; setter=set_sky ; getter=get_sky

The `Sky` resource used for this `Environment`.

> property sky_custom_fov : float ; default=0.0 ; setter=set_sky_custom_fov ; getter=get_sky_custom_fov

If set to a value greater than `0.0`, overrides the field of view to use for sky rendering. If set to `0.0`, the same FOV as the current `Camera3D` is used for sky rendering.

> property sky_rotation : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_sky_rotation ; getter=get_sky_rotation

The rotation to use for sky rendering.

> property ssao_ao_channel_affect : float ; default=0.0 ; setter=set_ssao_ao_channel_affect ; getter=get_ssao_ao_channel_affect

The screen-space ambient occlusion intensity on materials that have an AO texture defined. Values higher than `0` will make the SSAO effect visible in areas darkened by AO textures.

> property ssao_detail : float ; default=0.5 ; setter=set_ssao_detail ; getter=get_ssao_detail

Sets the strength of the additional level of detail for the screen-space ambient occlusion effect. A high value makes the detail pass more prominent, but it may contribute to aliasing in your final image.

> property ssao_enabled : bool ; default=false ; setter=set_ssao_enabled ; getter=is_ssao_enabled

If `true`, the screen-space ambient occlusion effect is enabled. This darkens objects' corners and cavities to simulate ambient light not reaching the entire object as in real life. This works well for small, dynamic objects, but baked lighting or ambient occlusion textures will do a better job at displaying ambient occlusion on large static objects. Godot uses a form of SSAO called Adaptive Screen Space Ambient Occlusion which is itself a form of Horizon Based Ambient Occlusion.
**Note:** SSAO is only supported in the Forward+ and Compatibility rendering methods, not Mobile.

> property ssao_horizon : float ; default=0.06 ; setter=set_ssao_horizon ; getter=get_ssao_horizon

The threshold for considering whether a given point on a surface is occluded or not represented as an angle from the horizon mapped into the `0.0-1.0` range. A value of `1.0` results in no occlusion.

> property ssao_intensity : float ; default=2.0 ; setter=set_ssao_intensity ; getter=get_ssao_intensity

The primary screen-space ambient occlusion intensity. Acts as a multiplier for the screen-space ambient occlusion effect. A higher value results in darker occlusion.

> property ssao_light_affect : float ; default=0.0 ; setter=set_ssao_direct_light_affect ; getter=get_ssao_direct_light_affect

The screen-space ambient occlusion intensity in direct light. In real life, ambient occlusion only applies to indirect light, which means its effects can't be seen in direct light. Values higher than `0` will make the SSAO effect visible in direct light.

> property ssao_power : float ; default=1.5 ; setter=set_ssao_power ; getter=get_ssao_power

The distribution of occlusion. A higher value results in darker occlusion, similar to `ssao_intensity`, but with a sharper falloff.

> property ssao_radius : float ; default=1.0 ; setter=set_ssao_radius ; getter=get_ssao_radius

The distance at which objects can occlude each other when calculating screen-space ambient occlusion. Higher values will result in occlusion over a greater distance at the cost of performance and quality.

> property ssao_sharpness : float ; default=0.98 ; setter=set_ssao_sharpness ; getter=get_ssao_sharpness

The amount that the screen-space ambient occlusion effect is allowed to blur over the edges of objects. Setting too high will result in aliasing around the edges of objects. Setting too low will make object edges appear blurry.

> property ssil_enabled : bool ; default=false ; setter=set_ssil_enabled ; getter=is_ssil_enabled

If `true`, the screen-space indirect lighting effect is enabled. Screen space indirect lighting is a form of indirect lighting that allows diffuse light to bounce between nearby objects. Screen-space indirect lighting works very similarly to screen-space ambient occlusion, in that it only affects a limited range. It is intended to be used along with a form of proper global illumination like SDFGI or `VoxelGI`. Screen-space indirect lighting is not affected by individual light's `Light3D.light_indirect_energy`.
**Note:** SSIL is only supported in the Forward+ rendering method, not Mobile or Compatibility.

> property ssil_intensity : float ; default=1.0 ; setter=set_ssil_intensity ; getter=get_ssil_intensity

The brightness multiplier for the screen-space indirect lighting effect. A higher value will result in brighter light.

> property ssil_normal_rejection : float ; default=1.0 ; setter=set_ssil_normal_rejection ; getter=get_ssil_normal_rejection

Amount of normal rejection used when calculating screen-space indirect lighting. Normal rejection uses the normal of a given sample point to reject samples that are facing away from the current pixel. Normal rejection is necessary to avoid light leaking when only one side of an object is illuminated. However, normal rejection can be disabled if light leaking is desirable, such as when the scene mostly contains emissive objects that emit light from faces that cannot be seen from the camera.

> property ssil_radius : float ; default=5.0 ; setter=set_ssil_radius ; getter=get_ssil_radius

The distance that bounced lighting can travel when using the screen space indirect lighting effect. A larger value will result in light bouncing further in a scene, but may result in under-sampling artifacts which look like long spikes surrounding light sources.

> property ssil_sharpness : float ; default=0.98 ; setter=set_ssil_sharpness ; getter=get_ssil_sharpness

The amount that the screen-space indirect lighting effect is allowed to blur over the edges of objects. Setting too high will result in aliasing around the edges of objects. Setting too low will make object edges appear blurry.

> property ssr_depth_tolerance : float ; default=0.5 ; setter=set_ssr_depth_tolerance ; getter=get_ssr_depth_tolerance

The depth tolerance for screen-space reflections.

> property ssr_enabled : bool ; default=false ; setter=set_ssr_enabled ; getter=is_ssr_enabled

If `true`, screen-space reflections are enabled. Screen-space reflections are more accurate than reflections from `VoxelGI`s or `ReflectionProbe`s, but are slower and can't reflect surfaces occluded by others.
**Note:** SSR is only supported in the Forward+ rendering method, not Mobile or Compatibility.
**Note:** SSR is not supported on viewports that have a transparent background (where `Viewport.transparent_bg` is `true`).

> property ssr_fade_in : float ; default=0.15 ; setter=set_ssr_fade_in ; getter=get_ssr_fade_in

The fade-in distance for screen-space reflections. Affects the area from the reflected material to the screen-space reflection. Only positive values are valid (negative values will be clamped to `0.0`).

> property ssr_fade_out : float ; default=2.0 ; setter=set_ssr_fade_out ; getter=get_ssr_fade_out

The fade-out distance for screen-space reflections. Affects the area from the screen-space reflection to the "global" reflection. Only positive values are valid (negative values will be clamped to `0.0`).

> property ssr_max_steps : int ; default=64 ; setter=set_ssr_max_steps ; getter=get_ssr_max_steps

The maximum number of steps for screen-space reflections. Higher values are slower.

> property tonemap_agx_contrast : float ; default=1.25 ; setter=set_tonemap_agx_contrast ; getter=get_tonemap_agx_contrast

Increasing `tonemap_agx_contrast` will make dark values darker and bright values brighter. Produces a higher quality result than `adjustment_contrast` without any additional performance cost, but is only available when using the `TONE_MAPPER_AGX` tonemapper.

> property tonemap_agx_white : float ; default=16.29 ; setter=set_tonemap_agx_white ; getter=get_tonemap_agx_white

The white reference value for tonemapping, which indicates where bright white is located in the scale of values provided to the tonemapper. For photorealistic lighting, it is recommended to set `tonemap_agx_white` to at least `6.0`. Higher values result in less blown out highlights, but may make the scene appear lower contrast. `tonemap_agx_white` is the same as `tonemap_white`, but is only effective with the `TONE_MAPPER_AGX` tonemapper. See also `tonemap_exposure`.
**Note:** When using the Mobile renderer with `Viewport.use_hdr_2d` disabled, `tonemap_agx_white` is ignored and a white value of `2.0` will always be used instead. Otherwise, `tonemap_agx_white` will be dynamically adjusted at runtime by multiplying it by the parent window's `Window.get_output_max_linear_value` when using `Viewport.use_hdr_2d` to ensure good behavior with both SDR and HDR output.

> property tonemap_exposure : float ; default=1.0 ; setter=set_tonemap_exposure ; getter=get_tonemap_exposure

Adjusts the brightness of values before they are provided to the tonemapper. Higher `tonemap_exposure` values result in a brighter image. See also `tonemap_white`.
**Note:** Values provided to the tonemapper will also be multiplied by `2.0` and `1.8` for `TONE_MAPPER_FILMIC` and `TONE_MAPPER_ACES` respectively to produce a similar apparent brightness as `TONE_MAPPER_LINEAR`.

> property tonemap_mode : ToneMapper ; default=0 ; setter=set_tonemapper ; getter=get_tonemapper

The tonemapping mode to use. Tonemapping is the process that "converts" HDR values to be suitable for rendering on an LDR display. (Godot doesn't support rendering on HDR displays yet.)

> property tonemap_white : float ; default=1.0 ; setter=set_tonemap_white ; getter=get_tonemap_white

The white reference value for tonemapping, which indicates where bright white is located in the scale of values provided to the tonemapper. For photorealistic lighting, it is recommended to set `tonemap_white` to at least `6.0`. Higher values result in less blown out highlights, but may make the scene appear lower contrast. `tonemap_agx_white` will be used instead when using the `TONE_MAPPER_AGX` tonemapper. See also `tonemap_exposure`.
**Note:** `tonemap_white` must be set to `2.0` or lower on the Mobile renderer to produce bright images.
**Note:** `tonemap_white` is ignored when using `TONE_MAPPER_LINEAR` and will be dynamically adjusted at runtime to never be less than the parent window's `Window.get_output_max_linear_value` when using `TONE_MAPPER_REINHARDT` with `Viewport.use_hdr_2d`.

> property volumetric_fog_albedo : Color ; default=Color(1, 1, 1, 1) ; setter=set_volumetric_fog_albedo ; getter=get_volumetric_fog_albedo

The `Color` of the volumetric fog when interacting with lights. Mist and fog have an albedo close to `Color(1, 1, 1, 1)` while smoke has a darker albedo.

> property volumetric_fog_ambient_inject : float ; default=0.0 ; setter=set_volumetric_fog_ambient_inject ; getter=get_volumetric_fog_ambient_inject

Scales the strength of ambient light used in the volumetric fog. A value of `0.0` means that ambient light will not impact the volumetric fog. `volumetric_fog_ambient_inject` has a small performance cost when set above `0.0`.
**Note:** This has no visible effect if `volumetric_fog_density` is `0.0` or if `volumetric_fog_albedo` is a fully black color.

> property volumetric_fog_anisotropy : float ; default=0.2 ; setter=set_volumetric_fog_anisotropy ; getter=get_volumetric_fog_anisotropy

The direction of scattered light as it goes through the volumetric fog. A value close to `1.0` means almost all light is scattered forward. A value close to `0.0` means light is scattered equally in all directions. A value close to `-1.0` means light is scattered mostly backward. Fog and mist scatter light slightly forward, while smoke scatters light equally in all directions.

> property volumetric_fog_density : float ; default=0.05 ; setter=set_volumetric_fog_density ; getter=get_volumetric_fog_density

The base *exponential* density of the volumetric fog. Set this to the lowest density you want to have globally. `FogVolume`s can be used to add to or subtract from this density in specific areas. Fog rendering is exponential as in real life.
A value of `0.0` disables global volumetric fog while allowing `FogVolume`s to display volumetric fog in specific areas.
To make volumetric fog work as a volumetric *lighting* solution, set `volumetric_fog_density` to the lowest non-zero value (`0.0001`) then increase lights' `Light3D.light_volumetric_fog_energy` to values between `10000` and `100000` to compensate for the very low density.

> property volumetric_fog_detail_spread : float ; default=2.0 ; setter=set_volumetric_fog_detail_spread ; getter=get_volumetric_fog_detail_spread

The distribution of size down the length of the froxel buffer. A higher value compresses the froxels closer to the camera and places more detail closer to the camera.

> property volumetric_fog_emission : Color ; default=Color(0, 0, 0, 1) ; setter=set_volumetric_fog_emission ; getter=get_volumetric_fog_emission

The emitted light from the volumetric fog. Even with emission, volumetric fog will not cast light onto other surfaces. Emission is useful to establish an ambient color. As the volumetric fog effect uses single-scattering only, fog tends to need a little bit of emission to soften the harsh shadows.

> property volumetric_fog_emission_energy : float ; default=1.0 ; setter=set_volumetric_fog_emission_energy ; getter=get_volumetric_fog_emission_energy

The brightness of the emitted light from the volumetric fog.

> property volumetric_fog_enabled : bool ; default=false ; setter=set_volumetric_fog_enabled ; getter=is_volumetric_fog_enabled

Enables the volumetric fog effect. Volumetric fog uses a screen-aligned froxel buffer to calculate accurate volumetric scattering in the short to medium range. Volumetric fog interacts with `FogVolume`s and lights to calculate localized and global fog. Volumetric fog uses a PBR single-scattering model based on extinction, scattering, and emission which it exposes to users as density, albedo, and emission.
**Note:** Volumetric fog is only supported in the Forward+ rendering method, not Mobile or Compatibility.

> property volumetric_fog_gi_inject : float ; default=1.0 ; setter=set_volumetric_fog_gi_inject ; getter=get_volumetric_fog_gi_inject

Scales the strength of Global Illumination used in the volumetric fog's albedo color. A value of `0.0` means that Global Illumination will not impact the volumetric fog. `volumetric_fog_gi_inject` has a small performance cost when set above `0.0`.
**Note:** This has no visible effect if `volumetric_fog_density` is `0.0` or if `volumetric_fog_albedo` is a fully black color.
**Note:** Only `VoxelGI` and SDFGI (`Environment.sdfgi_enabled`) are taken into account when using `volumetric_fog_gi_inject`. Global illumination from `LightmapGI`, `ReflectionProbe` and SSIL (see `ssil_enabled`) will be ignored by volumetric fog.

> property volumetric_fog_length : float ; default=64.0 ; setter=set_volumetric_fog_length ; getter=get_volumetric_fog_length

The distance over which the volumetric fog is computed. Increase to compute fog over a greater range, decrease to add more detail when a long range is not needed. For best quality fog, keep this as low as possible. See also `ProjectSettings.rendering/environment/volumetric_fog/volume_depth`.

> property volumetric_fog_sky_affect : float ; default=1.0 ; setter=set_volumetric_fog_sky_affect ; getter=get_volumetric_fog_sky_affect

The factor to use when affecting the sky with volumetric fog. `1.0` means that volumetric fog can fully obscure the sky. Lower values reduce the impact of volumetric fog on sky rendering, with `0.0` not affecting sky rendering at all.
**Note:** `volumetric_fog_sky_affect` also affects `FogVolume`s, even if `volumetric_fog_density` is `0.0`. If you notice `FogVolume`s are disappearing when looking towards the sky, set `volumetric_fog_sky_affect` to `1.0`.

> property volumetric_fog_temporal_reprojection_amount : float ; default=0.9 ; setter=set_volumetric_fog_temporal_reprojection_amount ; getter=get_volumetric_fog_temporal_reprojection_amount

The amount by which to blend the last frame with the current frame. A higher number results in smoother volumetric fog, but makes "ghosting" much worse. A lower value reduces ghosting but can result in the per-frame temporal jitter becoming visible.

> property volumetric_fog_temporal_reprojection_enabled : bool ; default=true ; setter=set_volumetric_fog_temporal_reprojection_enabled ; getter=is_volumetric_fog_temporal_reprojection_enabled

Enables temporal reprojection in the volumetric fog. Temporal reprojection blends the current frame's volumetric fog with the last frame's volumetric fog to smooth out jagged edges. The performance cost is minimal; however, it leads to moving `FogVolume`s and `Light3D`s "ghosting" and leaving a trail behind them. When temporal reprojection is enabled, try to avoid moving `FogVolume`s or `Light3D`s too fast. Short-lived dynamic lighting effects should have `Light3D.light_volumetric_fog_energy` set to `0.0` to avoid ghosting.

## Methods

> method get_glow_level(idx: int) -> float ; qualifiers=const

Returns the intensity of the glow level `idx`.

> method set_glow_level(idx: int, intensity: float) -> void

Sets the intensity of the glow level `idx`. A value above `0.0` enables the level. Each level relies on the previous level. This means that enabling higher glow levels will slow down the glow effect rendering, even if previous levels aren't enabled.

## Enumerations

> enum AmbientSource

> enum_value AmbientSource.AMBIENT_SOURCE_BG = 0

Gather ambient light from whichever source is specified as the background.

> enum_value AmbientSource.AMBIENT_SOURCE_DISABLED = 1

Disable ambient light. This provides a slight performance boost over `AMBIENT_SOURCE_SKY`.

> enum_value AmbientSource.AMBIENT_SOURCE_COLOR = 2

Specify a specific `Color` for ambient light. This provides a slight performance boost over `AMBIENT_SOURCE_SKY`.

> enum_value AmbientSource.AMBIENT_SOURCE_SKY = 3

Gather ambient light from the `Sky` regardless of what the background is.

> enum BGMode

> enum_value BGMode.BG_CLEAR_COLOR = 0

Clears the background using the clear color defined in `ProjectSettings.rendering/environment/defaults/default_clear_color`.

> enum_value BGMode.BG_COLOR = 1

Clears the background using a custom clear color.

> enum_value BGMode.BG_SKY = 2

Displays a user-defined sky in the background.

> enum_value BGMode.BG_CANVAS = 3

Displays a `CanvasLayer` in the background.

> enum_value BGMode.BG_KEEP = 4

Keeps on screen every pixel drawn in the background. This is the fastest background mode, but it can only be safely used in fully-interior scenes (no visible sky or sky reflections). If enabled in a scene where the background is visible, "ghost trail" artifacts will be visible when moving the camera.

> enum_value BGMode.BG_CAMERA_FEED = 5

Displays a camera feed in the background.

> enum_value BGMode.BG_MAX = 6

Represents the size of the `BGMode` enum.

> enum FogMode

> enum_value FogMode.FOG_MODE_EXPONENTIAL = 0

Use a physically-based fog model defined primarily by fog density.

> enum_value FogMode.FOG_MODE_DEPTH = 1

Use a simple fog model defined by start and end positions and a custom curve. While not physically accurate, this model can be useful when you need more artistic control.

> enum GlowBlendMode

> enum_value GlowBlendMode.GLOW_BLEND_MODE_ADDITIVE = 0

Adds the glow effect to the scene.

> enum_value GlowBlendMode.GLOW_BLEND_MODE_SCREEN = 1

Adds the glow effect to the scene after modifying the glow influence based on the scene value; dark values will be highly influenced by glow and bright values will not be influenced by glow. This approach avoids bright values becoming overly bright from the glow effect. `tonemap_white` is used to determine the maximum scene value where the glow should have no influence. When `tonemap_mode` is set to `TONE_MAPPER_LINEAR` and `Viewport.use_hdr_2d` is `true`, the parent window's `Window.get_output_max_linear_value` will be used as the maximum scene value.

> enum_value GlowBlendMode.GLOW_BLEND_MODE_SOFTLIGHT = 2

Adds the glow effect to the tonemapped image after modifying the glow influence based on the image value; dark values and bright values will not be influenced by glow and mid-range values will be highly influenced by glow. This approach avoids bright values becoming overly bright from the glow effect. The glow will have the largest influence on image values of `0.25` and will have no influence when applied to image values greater than `1.0`.
**Note:** This blend mode does not support HDR output because expects a maximum output value of `1.0`. It is recommended to use a different blend mode when rendering to an HDR screen.

> enum_value GlowBlendMode.GLOW_BLEND_MODE_REPLACE = 3

Replaces all pixels' color by the glow effect. This can be used to simulate a full-screen blur effect by tweaking the glow parameters to match the original image's brightness or to preview glow configuration in the editor.

> enum_value GlowBlendMode.GLOW_BLEND_MODE_MIX = 4

Mixes the glow image with the scene image. Best used with `glow_bloom` to avoid darkening the scene.

> enum ReflectionSource

> enum_value ReflectionSource.REFLECTION_SOURCE_BG = 0

Use the background for reflections.

> enum_value ReflectionSource.REFLECTION_SOURCE_DISABLED = 1

Disable reflections. This provides a slight performance boost over other options.

> enum_value ReflectionSource.REFLECTION_SOURCE_SKY = 2

Use the `Sky` for reflections regardless of what the background is.

> enum SDFGIYScale

> enum_value SDFGIYScale.SDFGI_Y_SCALE_50_PERCENT = 0

Use 50% scale for SDFGI on the Y (vertical) axis. SDFGI cells will be twice as short as they are wide. This allows providing increased GI detail and reduced light leaking with thin floors and ceilings. This is usually the best choice for scenes that don't feature much verticality.

> enum_value SDFGIYScale.SDFGI_Y_SCALE_75_PERCENT = 1

Use 75% scale for SDFGI on the Y (vertical) axis. This is a balance between the 50% and 100% SDFGI Y scales.

> enum_value SDFGIYScale.SDFGI_Y_SCALE_100_PERCENT = 2

Use 100% scale for SDFGI on the Y (vertical) axis. SDFGI cells will be as tall as they are wide. This is usually the best choice for highly vertical scenes. The downside is that light leaking may become more noticeable with thin floors and ceilings.

> enum ToneMapper

> enum_value ToneMapper.TONE_MAPPER_LINEAR = 0

Does not modify color data, resulting in a linear tonemapping curve which unnaturally clips bright values, causing bright lighting to look blown out. The simplest and fastest tonemapper.

> enum_value ToneMapper.TONE_MAPPER_REINHARDT = 1

A simple tonemapping curve that rolls off bright values to prevent clipping. This results in an image that can appear dull and low contrast. Slower than `TONE_MAPPER_LINEAR`.
**Note:** When `tonemap_white` is left at the default value of `1.0`, `TONE_MAPPER_REINHARDT` produces an identical image to `TONE_MAPPER_LINEAR`.

> enum_value ToneMapper.TONE_MAPPER_FILMIC = 2

Uses a film-like tonemapping curve to prevent clipping of bright values and provide better contrast than `TONE_MAPPER_REINHARDT`. Slightly slower than `TONE_MAPPER_REINHARDT`.
**Note:** This tonemapper does not support HDR output because it produces output in the SDR range. It is recommended to use a different tonemapper when rendering to an HDR screen.

> enum_value ToneMapper.TONE_MAPPER_ACES = 3

Uses a high-contrast film-like tonemapping curve and desaturates bright values for a more realistic appearance. Slightly slower than `TONE_MAPPER_FILMIC`.
**Note:** This tonemapping operator is called "ACES Fitted" in Godot 3.x.
**Note:** This tonemapper does not support HDR output because it produces output in the SDR range. It is recommended to use a different tonemapper when rendering to an HDR screen.

> enum_value ToneMapper.TONE_MAPPER_AGX = 4

Uses an adjustable film-like tonemapping curve and desaturates bright values for a more realistic appearance. Better than other tonemappers at maintaining the hue of colors as they become brighter. The slowest tonemapping option.

## Tutorials
- [Environment and post-processing]($DOCS_URL/tutorials/3d/environment_and_post_processing.html)
- [High dynamic range lighting]($DOCS_URL/tutorials/3d/high_dynamic_range.html)
- [3D Material Testers Demo](https://godotengine.org/asset-library/asset/2742)
- [Third Person Shooter (TPS) Demo](https://godotengine.org/asset-library/asset/2710)
