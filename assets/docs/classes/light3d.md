# Light3D

> class Light3D
> inherits Light3D VisualInstance3D

## Brief

Provides a base class for different kinds of light nodes.

## Description

Light3D is the *abstract* base class for light nodes. As it can't be instantiated, it shouldn't be used directly. Other types of light nodes inherit from it. Light3D contains the common variables and parameters used for lighting.

## Properties

> property distance_fade_begin : float ; default=40.0 ; setter=set_distance_fade_begin ; getter=get_distance_fade_begin

The distance from the camera at which the light begins to fade away (in 3D units).
**Note:** Only effective for `OmniLight3D` and `SpotLight3D`.

> property distance_fade_enabled : bool ; default=false ; setter=set_enable_distance_fade ; getter=is_distance_fade_enabled

If `true`, the light will smoothly fade away when far from the active `Camera3D` starting at `distance_fade_begin`. This acts as a form of level of detail (LOD). The light will fade out over `distance_fade_begin` + `distance_fade_length`, after which it will be culled and not sent to the shader at all. Use this to reduce the number of active lights in a scene and thus improve performance.
**Note:** Only effective for `OmniLight3D` and `SpotLight3D`.

> property distance_fade_length : float ; default=10.0 ; setter=set_distance_fade_length ; getter=get_distance_fade_length

Distance over which the light and its shadow fades. The light's energy and shadow's opacity is progressively reduced over this distance and is completely invisible at the end.
**Note:** Only effective for `OmniLight3D` and `SpotLight3D`.

> property distance_fade_shadow : float ; default=50.0 ; setter=set_distance_fade_shadow ; getter=get_distance_fade_shadow

The distance from the camera at which the light's shadow cuts off (in 3D units). Set this to a value lower than `distance_fade_begin` + `distance_fade_length` to further improve performance, as shadow rendering is often more expensive than light rendering itself.
**Note:** Only effective for `OmniLight3D` and `SpotLight3D`, and only when `shadow_enabled` is `true`.

> property editor_only : bool ; default=false ; setter=set_editor_only ; getter=is_editor_only

If `true`, the light only appears in the editor and will not be visible at runtime. If `true`, the light will never be baked in `LightmapGI` regardless of its `light_bake_mode`.

> property light_angular_distance : float ; default=0.0 ; setter=set_param ; getter=get_param

The light's angular size in degrees. Increasing this will make shadows softer at greater distances (also called percentage-closer soft shadows, or PCSS). Only available for `DirectionalLight3D`s. For reference, the Sun from the Earth is approximately `0.5`. Increasing this value above `0.0` for lights with shadows enabled will have a noticeable performance cost due to PCSS.
**Note:** `light_angular_distance` is not affected by `Node3D.scale` (the light's scale or its parent's scale).
**Note:** PCSS for directional lights is only supported in the Forward+ rendering method, not Mobile or Compatibility.

> property light_bake_mode : BakeMode ; default=2 ; setter=set_bake_mode ; getter=get_bake_mode

The light's bake mode. This will affect the global illumination techniques that have an effect on the light's rendering.
**Note:** Meshes' global illumination mode will also affect the global illumination rendering. See `GeometryInstance3D.gi_mode`.

> property light_color : Color ; default=Color(1, 1, 1, 1) ; setter=set_color ; getter=get_color

The light's color in nonlinear sRGB encoding. An *overbright* color can be used to achieve a result equivalent to increasing the light's `light_energy`.

> property light_cull_mask : int ; default=4294967295 ; setter=set_cull_mask ; getter=get_cull_mask

The light will affect objects in the selected layers.
**Note:** The light cull mask is ignored by `VoxelGI`, SDFGI, `LightmapGI`, and volumetric fog. These will always render lights in a way that ignores the cull mask. See also `VisualInstance3D.layers`.

> property light_energy : float ; default=1.0 ; setter=set_param ; getter=get_param

The light's strength multiplier (this is not a physical unit). For `OmniLight3D` and `SpotLight3D`, changing this value will only change the light color's intensity, not the light's radius.

> property light_indirect_energy : float ; default=1.0 ; setter=set_param ; getter=get_param

Secondary multiplier used with indirect light (light bounces). Used with `VoxelGI` and SDFGI (see `Environment.sdfgi_enabled`).
**Note:** This property is ignored if `light_energy` is equal to `0.0`, as the light won't be present at all in the GI shader.

> property light_intensity_lumens : float ; setter=set_param ; getter=get_param

Used by positional lights (`OmniLight3D` and `SpotLight3D`) when `ProjectSettings.rendering/lights_and_shadows/use_physical_light_units` is `true`. Sets the intensity of the light source measured in Lumens. Lumens are a measure of luminous flux, which is the total amount of visible light emitted by a light source per unit of time.
For `SpotLight3D`s, we assume that the area outside the visible cone is surrounded by a perfect light absorbing material. Accordingly, the apparent brightness of the cone area does not change as the cone increases and decreases in size.
A typical household lightbulb can range from around 600 lumens to 1,200 lumens, a candle is about 13 lumens, while a streetlight can be approximately 60,000 lumens.

> property light_intensity_lux : float ; setter=set_param ; getter=get_param

Used by `DirectionalLight3D`s when `ProjectSettings.rendering/lights_and_shadows/use_physical_light_units` is `true`. Sets the intensity of the light source measured in Lux. Lux is a measure of luminous flux per unit area, it is equal to one lumen per square meter. Lux is the measure of how much light hits a surface at a given time.
On a clear sunny day a surface in direct sunlight may be approximately 100,000 lux, a typical room in a home may be approximately 50 lux, while the moonlit ground may be approximately 0.1 lux.

> property light_negative : bool ; default=false ; setter=set_negative ; getter=is_negative

If `true`, the light's effect is reversed, darkening areas and casting bright shadows.

> property light_projector : Texture2D ; setter=set_projector ; getter=get_projector

`Texture2D` projected by light. `shadow_enabled` must be on for the projector to work. Light projectors make the light appear as if it is shining through a colored but transparent object, almost like light shining through stained-glass.
**Note:** Unlike `BaseMaterial3D` whose filter mode can be adjusted on a per-material basis, the filter mode for light projector textures is set globally with `ProjectSettings.rendering/textures/light_projectors/filter`.
**Note:** Light projector textures are only supported in the Forward+ and Mobile rendering methods, not Compatibility.

> property light_size : float ; default=0.0 ; setter=set_param ; getter=get_param

The simulated size of the light in Godot units, affecting shading and shadows. For `OmniLight3D`s and `SpotLight3D`s, increasing this value simulates a spherical area light, expanding the size of specular highlights. If shadows are enabled, a penumbra is rendered, making shadows appear blurrier. For `AreaLight3D`s, only the shadows are affected. Penumbras are simulated with percentage-closer soft shadows, or PCSS, which has a noticeable performance cost for values above `0.0`.
**Note:** `light_size` is not affected by `Node3D.scale` (the light's scale or its parent's scale).
**Note:** PCSS for positional lights is only supported in the Forward+ and Mobile rendering methods, not Compatibility.

> property light_specular : float ; default=1.0 ; setter=set_param ; getter=get_param

The intensity of the specular blob in objects affected by the light. At `0`, the light becomes a pure diffuse light. When not baking emission, this can be used to avoid unrealistic reflections when placing lights above an emissive surface.

> property light_temperature : float ; setter=set_temperature ; getter=get_temperature

Sets the color temperature of the light source, measured in Kelvin. This is used to calculate a correlated color temperature which tints the `light_color`.
The sun on a cloudy day is approximately 6500 Kelvin, on a clear day it is between 5500 to 6000 Kelvin, and on a clear day at sunrise or sunset it ranges to around 1850 Kelvin.

> property light_volumetric_fog_energy : float ; default=1.0 ; setter=set_param ; getter=get_param

Secondary multiplier multiplied with `light_energy` then used with the `Environment`'s volumetric fog (if enabled). If set to `0.0`, computing volumetric fog will be skipped for this light, which can improve performance for large amounts of lights when volumetric fog is enabled.
**Note:** To prevent short-lived dynamic light effects from poorly interacting with volumetric fog, lights used in those effects should have `light_volumetric_fog_energy` set to `0.0` unless `Environment.volumetric_fog_temporal_reprojection_enabled` is disabled (or unless the reprojection amount is significantly lowered).

> property shadow_bias : float ; default=0.1 ; setter=set_param ; getter=get_param

Used to adjust shadow appearance. Too small a value results in self-shadowing ("shadow acne"), while too large a value causes shadows to separate from casters ("peter-panning"). Adjust as needed.

> property shadow_blur : float ; default=1.0 ; setter=set_param ; getter=get_param

Blurs the edges of the shadow. Can be used to hide pixel artifacts in low-resolution shadow maps. A high value can impact performance, make shadows appear grainy and can cause other unwanted artifacts. Try to keep as near default as possible.

> property shadow_caster_mask : int ; default=4294967295 ; setter=set_shadow_caster_mask ; getter=get_shadow_caster_mask

The light will only cast shadows using objects in the selected layers.

> property shadow_enabled : bool ; default=false ; setter=set_shadow ; getter=has_shadow

If `true`, the light will cast real-time shadows. This has a significant performance cost. Only enable shadow rendering when it makes a noticeable difference in the scene's appearance, and consider using `distance_fade_enabled` to hide the light when far away from the `Camera3D`.

> property shadow_normal_bias : float ; default=2.0 ; setter=set_param ; getter=get_param

Offsets the lookup into the shadow map by the object's normal. This can be used to reduce self-shadowing artifacts without using `shadow_bias`. In practice, this value should be tweaked along with `shadow_bias` to reduce artifacts as much as possible.

> property shadow_opacity : float ; default=1.0 ; setter=set_param ; getter=get_param

The opacity to use when rendering the light's shadow map. Values lower than `1.0` make the light appear through shadows. This can be used to fake global illumination at a low performance cost.

> property shadow_reverse_cull_face : bool ; default=false ; setter=set_shadow_reverse_cull_face ; getter=get_shadow_reverse_cull_face

If `true`, reverses the backface culling of the mesh. This can be useful when you have a flat mesh that has a light behind it. If you need to cast a shadow on both sides of the mesh, set the mesh to use double-sided shadows with `GeometryInstance3D.SHADOW_CASTING_SETTING_DOUBLE_SIDED`.

> property shadow_transmittance_bias : float ; default=0.05 ; setter=set_param ; getter=get_param

## Methods

> method get_correlated_color() -> Color ; qualifiers=const

Returns the `Color` of an idealized blackbody at the given `light_temperature`. This value is calculated internally based on the `light_temperature`. This `Color` is multiplied by `light_color` before being sent to the `RenderingServer`.

> method get_param(param: Param) -> float ; qualifiers=const

Returns the value of the specified `Light3D.Param` parameter.

> method set_param(param: Param, value: float) -> void

Sets the value of the specified `Light3D.Param` parameter.

## Enumerations

> enum BakeMode

> enum_value BakeMode.BAKE_DISABLED = 0

Light is ignored when baking. This is the fastest mode, but the light will not be taken into account when baking global illumination. This mode should generally be used for dynamic lights that change quickly, as the effect of global illumination is less noticeable on those lights.
**Note:** Hiding a light does *not* affect baking `LightmapGI`. Hiding a light will still affect baking `VoxelGI` and SDFGI (see `Environment.sdfgi_enabled`).

> enum_value BakeMode.BAKE_STATIC = 1

Light is taken into account in static baking (`VoxelGI`, `LightmapGI`, SDFGI (`Environment.sdfgi_enabled`)). The light can be moved around or modified, but its global illumination will not update in real-time.
**Note:** The light is not baked in `LightmapGI` if `editor_only` is `true`.
**Note:** When using `LightmapGI`, both the direct and indirect light are baked. Since direct light is baked, the light doesn't display a specular lobe on static lightmapped meshes. Shadows on static lightmapped meshes will also look less detailed, but the light still casts shadows that can be displayed on dynamic objects. Since real-time light computations are skipped on static lightmapped meshes, this bake mode improves runtime performance compared to `BAKE_DYNAMIC` and `BAKE_DISABLED`.

> enum_value BakeMode.BAKE_DYNAMIC = 2

Light is taken into account in dynamic baking (`VoxelGI` and SDFGI (`Environment.sdfgi_enabled`)). The light can be moved around or modified with global illumination updating in real-time. The light's global illumination appearance will be slightly different compared to `BAKE_STATIC`. This has a greater performance cost compared to `BAKE_STATIC`. When using SDFGI, the update speed of dynamic lights is affected by `ProjectSettings.rendering/global_illumination/sdfgi/frames_to_update_lights`.
**Note:** When using `LightmapGI`, the light's indirect light is baked, but direct light and shadows remain real-time. This mode allows performing *subtle* changes to a light's color, energy, and position while still looking fairly correct. For example, you can use this to create flickering static torches that have their indirect light baked.

> enum Param

> enum_value Param.PARAM_ENERGY = 0

Constant for accessing `light_energy`.

> enum_value Param.PARAM_INDIRECT_ENERGY = 1

Constant for accessing `light_indirect_energy`.

> enum_value Param.PARAM_VOLUMETRIC_FOG_ENERGY = 2

Constant for accessing `light_volumetric_fog_energy`.

> enum_value Param.PARAM_SPECULAR = 3

Constant for accessing `light_specular`.

> enum_value Param.PARAM_RANGE = 4

Constant for accessing `OmniLight3D.omni_range` or `SpotLight3D.spot_range`.

> enum_value Param.PARAM_SIZE = 5

Constant for accessing `light_size`.

> enum_value Param.PARAM_ATTENUATION = 6

Constant for accessing `OmniLight3D.omni_attenuation` or `SpotLight3D.spot_attenuation`.

> enum_value Param.PARAM_SPOT_ANGLE = 7

Constant for accessing `SpotLight3D.spot_angle`.

> enum_value Param.PARAM_SPOT_ATTENUATION = 8

Constant for accessing `SpotLight3D.spot_angle_attenuation`.

> enum_value Param.PARAM_SHADOW_MAX_DISTANCE = 9

Constant for accessing `DirectionalLight3D.directional_shadow_max_distance`.

> enum_value Param.PARAM_SHADOW_SPLIT_1_OFFSET = 10

Constant for accessing `DirectionalLight3D.directional_shadow_split_1`.

> enum_value Param.PARAM_SHADOW_SPLIT_2_OFFSET = 11

Constant for accessing `DirectionalLight3D.directional_shadow_split_2`.

> enum_value Param.PARAM_SHADOW_SPLIT_3_OFFSET = 12

Constant for accessing `DirectionalLight3D.directional_shadow_split_3`.

> enum_value Param.PARAM_SHADOW_FADE_START = 13

Constant for accessing `DirectionalLight3D.directional_shadow_fade_start`.

> enum_value Param.PARAM_SHADOW_NORMAL_BIAS = 14

Constant for accessing `shadow_normal_bias`.

> enum_value Param.PARAM_SHADOW_BIAS = 15

Constant for accessing `shadow_bias`.

> enum_value Param.PARAM_SHADOW_PANCAKE_SIZE = 16

Constant for accessing `DirectionalLight3D.directional_shadow_pancake_size`.

> enum_value Param.PARAM_SHADOW_OPACITY = 17

Constant for accessing `shadow_opacity`.

> enum_value Param.PARAM_SHADOW_BLUR = 18

Constant for accessing `shadow_blur`.

> enum_value Param.PARAM_TRANSMITTANCE_BIAS = 19

Constant for accessing `shadow_transmittance_bias`.

> enum_value Param.PARAM_INTENSITY = 20

Constant for accessing `light_intensity_lumens` and `light_intensity_lux`. Only used when `ProjectSettings.rendering/lights_and_shadows/use_physical_light_units` is `true`.

> enum_value Param.PARAM_MAX = 21

Represents the size of the `Param` enum.

## Tutorials
- [3D lights and shadows]($DOCS_URL/tutorials/3d/lights_and_shadows.html)
- [Faking global illumination]($DOCS_URL/tutorials/3d/global_illumination/faking_global_illumination.html)
- [Third Person Shooter (TPS) Demo](https://godotengine.org/asset-library/asset/2710)
