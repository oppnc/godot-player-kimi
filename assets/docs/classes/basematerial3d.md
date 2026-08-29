# BaseMaterial3D

> class BaseMaterial3D
> inherits BaseMaterial3D Material

## Brief

Abstract base class for defining the 3D rendering properties of meshes.

## Description

This class serves as a default material with a wide variety of rendering features and properties without the need to write shader code. See the tutorial below for details.

## Properties

> property albedo_color : Color ; default=Color(1, 1, 1, 1) ; setter=set_albedo ; getter=get_albedo

The material's base color.
**Note:** If `detail_enabled` is `true` and a `detail_albedo` texture is specified, `albedo_color` will *not* modulate the detail texture. This can be used to color partial areas of a material by not specifying an albedo texture and using a transparent `detail_albedo` texture instead.

> property albedo_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture to multiply by `albedo_color`. Used for basic texturing of objects.
If the texture appears unexpectedly too dark or too bright, check `albedo_texture_force_srgb`.

> property albedo_texture_force_srgb : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, forces a conversion of the `albedo_texture` from nonlinear sRGB encoding to linear encoding. See also `vertex_color_is_srgb`.
This should only be enabled when needed (typically when using a `ViewportTexture` as `albedo_texture`). If `albedo_texture_force_srgb` is `true` when it shouldn't be, the texture will appear to be too dark. If `albedo_texture_force_srgb` is `false` when it shouldn't be, the texture will appear to be too bright.

> property albedo_texture_msdf : bool ; default=false ; setter=set_flag ; getter=get_flag

Enables multichannel signed distance field rendering shader. Use `msdf_pixel_range` and `msdf_outline_size` to configure MSDF parameters.

> property alpha_antialiasing_edge : float ; setter=set_alpha_antialiasing_edge ; getter=get_alpha_antialiasing_edge

Threshold at which antialiasing will be applied on the alpha channel.

> property alpha_antialiasing_mode : AlphaAntiAliasing ; setter=set_alpha_antialiasing ; getter=get_alpha_antialiasing

The type of alpha antialiasing to apply.

> property alpha_hash_scale : float ; setter=set_alpha_hash_scale ; getter=get_alpha_hash_scale

The hashing scale for Alpha Hash. Recommended values between `0` and `2`.

> property alpha_scissor_threshold : float ; setter=set_alpha_scissor_threshold ; getter=get_alpha_scissor_threshold

Threshold at which the alpha scissor will discard values. Higher values will result in more pixels being discarded. If the material becomes too opaque at a distance, try increasing `alpha_scissor_threshold`. If the material disappears at a distance, try decreasing `alpha_scissor_threshold`.

> property anisotropy : float ; default=0.0 ; setter=set_anisotropy ; getter=get_anisotropy

The strength of the anisotropy effect. This is multiplied by `anisotropy_flowmap`'s alpha channel if a texture is defined there and the texture contains an alpha channel.

> property anisotropy_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, anisotropy is enabled. Anisotropy changes the shape of the specular blob and aligns it to tangent space. This is useful for brushed aluminum and hair reflections.
**Note:** Mesh tangents are needed for anisotropy to work. If the mesh does not contain tangents, the anisotropy effect will appear broken.
**Note:** Material anisotropy should not to be confused with anisotropic texture filtering, which can be enabled by setting `texture_filter` to `TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC`.

> property anisotropy_flowmap : Texture2D ; setter=set_texture ; getter=get_texture

Texture that offsets the tangent map for anisotropy calculations and optionally controls the anisotropy effect (if an alpha channel is present). The flowmap texture is expected to be a derivative map, with the red channel representing distortion on the X axis and green channel representing distortion on the Y axis. Values below 0.5 will result in negative distortion, whereas values above 0.5 will result in positive distortion.
If present, the texture's alpha channel will be used to multiply the strength of the `anisotropy` effect. Fully opaque pixels will keep the anisotropy effect's original strength while fully transparent pixels will disable the anisotropy effect entirely. The flowmap texture's blue channel is ignored.

> property ao_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, ambient occlusion is enabled. Ambient occlusion darkens areas based on the `ao_texture`.

> property ao_light_affect : float ; default=0.0 ; setter=set_ao_light_affect ; getter=get_ao_light_affect

Amount that ambient occlusion affects lighting from lights. If `0`, ambient occlusion only affects ambient light. If `1`, ambient occlusion affects lights just as much as it affects ambient light. This can be used to impact the strength of the ambient occlusion effect, but typically looks unrealistic.

> property ao_on_uv2 : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, use `UV2` coordinates to look up from the `ao_texture`.

> property ao_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture that defines the amount of ambient occlusion for a given point on the object.

> property ao_texture_channel : TextureChannel ; default=0 ; setter=set_ao_texture_channel ; getter=get_ao_texture_channel

Specifies the channel of the `ao_texture` in which the ambient occlusion information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.

> property backlight : Color ; default=Color(0, 0, 0, 1) ; setter=set_backlight ; getter=get_backlight

The color used by the backlight effect. Represents the light passing through an object.

> property backlight_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, the backlight effect is enabled. See also `subsurf_scatter_transmittance_enabled`.

> property backlight_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture used to control the backlight effect per-pixel. Added to `backlight`.

> property bent_normal_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, the bent normal map is enabled. This allows for more accurate indirect lighting and specular occlusion.

> property bent_normal_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture that specifies the average direction of incoming ambient light at a given pixel. The `bent_normal_texture` only uses the red and green channels; the blue and alpha channels are ignored. The normal read from `bent_normal_texture` is oriented around the surface normal provided by the `Mesh`.
**Note:** A bent normal map is different from a regular normal map. When baking a bent normal map make sure to use **a cosine distribution** for the bent normal map to work correctly.
**Note:** The mesh must have both normals and tangents defined in its vertex data. Otherwise, the shading produced by the bent normal map will not look correct. If creating geometry with `SurfaceTool`, you can use `SurfaceTool.generate_normals` and `SurfaceTool.generate_tangents` to automatically generate normals and tangents respectively.
**Note:** Godot expects the bent normal map to use X+, Y+, and Z+ coordinates. See [this page](http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates) for a comparison of normal map coordinates expected by popular engines.

> property billboard_keep_scale : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, the shader will keep the scale set for the mesh. Otherwise, the scale is lost when billboarding. Only applies when `billboard_mode` is not `BILLBOARD_DISABLED`.

> property billboard_mode : BillboardMode ; default=0 ; setter=set_billboard_mode ; getter=get_billboard_mode

Controls how the object faces the camera.
**Note:** Billboard mode is not suitable for VR because the left-right vector of the camera is not horizontal when the screen is attached to your head instead of on the table. See [GitHub issue #41567](https://github.com/godotengine/godot/issues/41567) for details.

> property blend_mode : BlendMode ; default=0 ; setter=set_blend_mode ; getter=get_blend_mode

The material's blend mode.
**Note:** Values other than `Mix` force the object into the transparent pipeline.

> property clearcoat : float ; default=1.0 ; setter=set_clearcoat ; getter=get_clearcoat

Sets the strength of the clearcoat effect. Setting to `0` looks the same as disabling the clearcoat effect.

> property clearcoat_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, clearcoat rendering is enabled. Adds a secondary transparent pass to the lighting calculation resulting in an added specular blob. This makes materials appear as if they have a clear layer on them that can be either glossy or rough.
**Note:** Clearcoat rendering is not visible if the material's `shading_mode` is `SHADING_MODE_UNSHADED`.

> property clearcoat_roughness : float ; default=0.5 ; setter=set_clearcoat_roughness ; getter=get_clearcoat_roughness

Sets the roughness of the clearcoat pass. A higher value results in a rougher clearcoat while a lower value results in a smoother clearcoat.

> property clearcoat_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture that defines the strength of the clearcoat effect and the glossiness of the clearcoat. Strength is specified in the red channel while glossiness is specified in the green channel.

> property cull_mode : CullMode ; default=0 ; setter=set_cull_mode ; getter=get_cull_mode

Determines which side of the triangle to cull depending on whether the triangle faces towards or away from the camera.

> property depth_draw_mode : DepthDrawMode ; default=0 ; setter=set_depth_draw_mode ; getter=get_depth_draw_mode

Determines when depth rendering takes place. See also `transparency`.

> property depth_test : DepthTest ; default=0 ; setter=set_depth_test ; getter=get_depth_test ; experimental=May be affected by future rendering pipeline changes.

Determines which comparison operator is used when testing depth.
**Note:** Changing `depth_test` to a non-default value only has a visible effect when used on a transparent material, or a material that has `depth_draw_mode` set to `DEPTH_DRAW_DISABLED`.

> property detail_albedo : Texture2D ; setter=set_texture ; getter=get_texture

Texture that specifies the color of the detail overlay. `detail_albedo`'s alpha channel is used as a mask, even when the material is opaque. To use a dedicated texture as a mask, see `detail_mask`.
**Note:** `detail_albedo` is *not* modulated by `albedo_color`.

> property detail_blend_mode : BlendMode ; default=0 ; setter=set_detail_blend_mode ; getter=get_detail_blend_mode

Specifies how the `detail_albedo` should blend with the current `ALBEDO`.

> property detail_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, enables the detail overlay. Detail is a second texture that gets mixed over the surface of the object based on `detail_mask` and `detail_albedo`'s alpha channel. This can be used to add variation to objects, or to blend between two different albedo/normal textures.

> property detail_mask : Texture2D ; setter=set_texture ; getter=get_texture

Texture used to specify how the detail textures get blended with the base textures. `detail_mask` can be used together with `detail_albedo`'s alpha channel (if any).

> property detail_normal : Texture2D ; setter=set_texture ; getter=get_texture

Texture that specifies the per-pixel normal of the detail overlay. The `detail_normal` texture only uses the red and green channels; the blue and alpha channels are ignored. The normal read from `detail_normal` is oriented around the surface normal provided by the `Mesh`.
**Note:** Godot expects the normal map to use X+, Y+, and Z+ coordinates. See [this page](http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates) for a comparison of normal map coordinates expected by popular engines.

> property detail_uv_layer : DetailUV ; default=0 ; setter=set_detail_uv ; getter=get_detail_uv

Specifies whether to use `UV` or `UV2` for the detail layer.

> property diffuse_mode : DiffuseMode ; default=0 ; setter=set_diffuse_mode ; getter=get_diffuse_mode

The algorithm used for diffuse light scattering.

> property disable_ambient_light : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, the object receives no ambient light.

> property disable_fog : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, the object will not be affected by fog (neither volumetric nor depth fog). This is useful for unshaded or transparent materials (e.g. particles), which without this setting will be affected even if fully transparent.

> property disable_receive_shadows : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, the object receives no shadow that would otherwise be cast onto it.

> property disable_specular_occlusion : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, disables specular occlusion even if `ProjectSettings.rendering/reflections/specular_occlusion/enabled` is `false`.

> property distance_fade_max_distance : float ; default=10.0 ; setter=set_distance_fade_max_distance ; getter=get_distance_fade_max_distance

Distance at which the object appears fully opaque.
**Note:** If `distance_fade_max_distance` is less than `distance_fade_min_distance`, the behavior will be reversed. The object will start to fade away at `distance_fade_max_distance` and will fully disappear once it reaches `distance_fade_min_distance`.

> property distance_fade_min_distance : float ; default=0.0 ; setter=set_distance_fade_min_distance ; getter=get_distance_fade_min_distance

Distance at which the object starts to become visible. If the object is less than this distance away, it will be invisible.
**Note:** If `distance_fade_min_distance` is greater than `distance_fade_max_distance`, the behavior will be reversed. The object will start to fade away at `distance_fade_max_distance` and will fully disappear once it reaches `distance_fade_min_distance`.

> property distance_fade_mode : DistanceFadeMode ; default=0 ; setter=set_distance_fade ; getter=get_distance_fade

Specifies which type of fade to use. Can be any of the `DistanceFadeMode`s.

> property emission : Color ; default=Color(0, 0, 0, 1) ; setter=set_emission ; getter=get_emission

The emitted light's color. See `emission_enabled`.

> property emission_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, the body emits light. Emitting light makes the object appear brighter. The object can also cast light on other objects if a `VoxelGI`, SDFGI, or `LightmapGI` is used and this object is used in baked lighting.

> property emission_energy_multiplier : float ; default=1.0 ; setter=set_emission_energy_multiplier ; getter=get_emission_energy_multiplier

Multiplier for emitted light. See `emission_enabled`.

> property emission_intensity : float ; setter=set_emission_intensity ; getter=get_emission_intensity

Luminance of emitted light, measured in nits (candela per square meter). Only available when `ProjectSettings.rendering/lights_and_shadows/use_physical_light_units` is enabled. The default is roughly equivalent to an indoor lightbulb.

> property emission_on_uv2 : bool ; default=false ; setter=set_flag ; getter=get_flag

Use `UV2` to read from the `emission_texture`.

> property emission_operator : EmissionOperator ; default=0 ; setter=set_emission_operator ; getter=get_emission_operator

Sets how `emission` interacts with `emission_texture`. Can either add or multiply.

> property emission_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture that specifies how much surface emits light at a given point.

> property fixed_size : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, the object is rendered at the same size regardless of distance. The object's size on screen is the same as if the camera was `1.0` units away from the object's origin, regardless of the actual distance from the camera. The `Camera3D`'s field of view (or `Camera3D.size` when in orthogonal/frustum mode) still affects the size the object is drawn at.

> property fov_override : float ; default=75.0 ; setter=set_fov_override ; getter=get_fov_override

Overrides the `Camera3D`'s field of view angle (in degrees).
**Note:** This behaves as if the field of view is set on a `Camera3D` with `Camera3D.keep_aspect` set to `Camera3D.KEEP_HEIGHT`. Additionally, it may not look correct on a non-perspective camera where the field of view setting is ignored.

> property grow : bool ; default=false ; setter=set_grow_enabled ; getter=is_grow_enabled

If `true`, enables the vertex grow setting. This can be used to create mesh-based outlines using a second material pass and its `cull_mode` set to `CULL_FRONT`. See also `grow_amount`.
**Note:** Vertex growth cannot create new vertices, which means that visible gaps may occur in sharp corners. This can be alleviated by designing the mesh to use smooth normals exclusively using [face weighted normals](http://wiki.polycount.com/wiki/Face_weighted_normals) in the 3D authoring software. In this case, grow will be able to join every outline together, just like in the original mesh.

> property grow_amount : float ; default=0.0 ; setter=set_grow ; getter=get_grow

Grows object vertices in the direction of their normals. Only effective if `grow` is `true`.

> property heightmap_deep_parallax : bool ; default=false ; setter=set_heightmap_deep_parallax ; getter=is_heightmap_deep_parallax_enabled

If `true`, uses parallax occlusion mapping to represent depth in the material instead of simple offset mapping (see `heightmap_enabled`). This results in a more convincing depth effect, but is much more expensive on the GPU. Only enable this on materials where it makes a significant visual difference.

> property heightmap_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, height mapping is enabled (also called "parallax mapping" or "depth mapping"). See also `normal_enabled`. Height mapping is a demanding feature on the GPU, so it should only be used on materials where it makes a significant visual difference.
**Note:** Height mapping is not supported if triplanar mapping is used on the same material. The value of `heightmap_enabled` will be ignored if `uv1_triplanar` is enabled.

> property heightmap_flip_binormal : bool ; default=false ; setter=set_heightmap_deep_parallax_flip_binormal ; getter=get_heightmap_deep_parallax_flip_binormal

If `true`, flips the mesh's binormal vectors when interpreting the height map. If the heightmap effect looks strange when the camera moves (even with a reasonable `heightmap_scale`), try setting this to `true`.

> property heightmap_flip_tangent : bool ; default=false ; setter=set_heightmap_deep_parallax_flip_tangent ; getter=get_heightmap_deep_parallax_flip_tangent

If `true`, flips the mesh's tangent vectors when interpreting the height map. If the heightmap effect looks strange when the camera moves (even with a reasonable `heightmap_scale`), try setting this to `true`.

> property heightmap_flip_texture : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, interprets the height map texture as a depth map, with brighter values appearing to be "lower" in altitude compared to darker values.
This can be enabled for compatibility with some materials authored for Godot 3.x. This is not necessary if the Invert import option was used to invert the depth map in Godot 3.x, in which case `heightmap_flip_texture` should remain `false`.

> property heightmap_max_layers : int ; setter=set_heightmap_deep_parallax_max_layers ; getter=get_heightmap_deep_parallax_max_layers

The number of layers to use for parallax occlusion mapping when the camera is up close to the material. Higher values result in a more convincing depth effect, especially in materials that have steep height changes. Higher values have a significant cost on the GPU, so it should only be increased on materials where it makes a significant visual difference.
**Note:** Only effective if `heightmap_deep_parallax` is `true`.

> property heightmap_min_layers : int ; setter=set_heightmap_deep_parallax_min_layers ; getter=get_heightmap_deep_parallax_min_layers

The number of layers to use for parallax occlusion mapping when the camera is far away from the material. Higher values result in a more convincing depth effect, especially in materials that have steep height changes. Higher values have a significant cost on the GPU, so it should only be increased on materials where it makes a significant visual difference.
**Note:** Only effective if `heightmap_deep_parallax` is `true`.

> property heightmap_scale : float ; default=5.0 ; setter=set_heightmap_scale ; getter=get_heightmap_scale

The heightmap scale to use for the parallax effect (see `heightmap_enabled`). The default value is tuned so that the highest point (value = 255) appears to be 5 cm higher than the lowest point (value = 0). Higher values result in a deeper appearance, but may result in artifacts appearing when looking at the material from oblique angles, especially when the camera moves. Negative values can be used to invert the parallax effect, but this is different from inverting the texture using `heightmap_flip_texture` as the material will also appear to be "closer" to the camera. In most cases, `heightmap_scale` should be kept to a positive value.
**Note:** If the height map effect looks strange regardless of this value, try adjusting `heightmap_flip_binormal` and `heightmap_flip_tangent`. See also `heightmap_texture` for recommendations on authoring heightmap textures, as the way the heightmap texture is authored affects how `heightmap_scale` behaves.

> property heightmap_texture : Texture2D ; setter=set_texture ; getter=get_texture

The texture to use as a height map. See also `heightmap_enabled`.
For best results, the texture should be normalized (with `heightmap_scale` reduced to compensate). In [GIMP](https://gimp.org), this can be done using **Colors > Auto > Equalize**. If the texture only uses a small part of its available range, the parallax effect may look strange, especially when the camera moves.
**Note:** To reduce memory usage and improve loading times, you may be able to use a lower-resolution heightmap texture as most heightmaps are only comprised of low-frequency data.

> property metallic : float ; default=0.0 ; setter=set_metallic ; getter=get_metallic

A high value makes the material appear more like a metal. Non-metals use their albedo as the diffuse color and add diffuse to the specular reflection. With non-metals, the reflection appears on top of the albedo color. Metals use their albedo as a multiplier to the specular reflection and set the diffuse color to black resulting in a tinted reflection. Materials work better when fully metal or fully non-metal, values between `0` and `1` should only be used for blending between metal and non-metal sections. To alter the amount of reflection use `roughness`.

> property metallic_specular : float ; default=0.5 ; setter=set_specular ; getter=get_specular

Adjusts the strength of specular reflections. Specular reflections are composed of scene reflections and the specular lobe which is the bright spot that is reflected from light sources. When set to `0.0`, no specular reflections will be visible. This differs from the `SPECULAR_DISABLED` `SpecularMode` as `SPECULAR_DISABLED` only applies to the specular lobe from the light source.
**Note:** Unlike `metallic`, this is not energy-conserving, so it should be left at `0.5` in most cases. See also `roughness`.

> property metallic_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture used to specify metallic for an object. This is multiplied by `metallic`.

> property metallic_texture_channel : TextureChannel ; default=0 ; setter=set_metallic_texture_channel ; getter=get_metallic_texture_channel

Specifies the channel of the `metallic_texture` in which the metallic information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.

> property msdf_outline_size : float ; default=0.0 ; setter=set_msdf_outline_size ; getter=get_msdf_outline_size

The width of the shape outline.

> property msdf_pixel_range : float ; default=4.0 ; setter=set_msdf_pixel_range ; getter=get_msdf_pixel_range

The width of the range around the shape between the minimum and maximum representable signed distance.

> property no_depth_test : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, depth testing is disabled and the object will be drawn in render order.

> property normal_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, normal mapping is enabled. This has a slight performance cost, especially on mobile GPUs.

> property normal_scale : float ; default=1.0 ; setter=set_normal_scale ; getter=get_normal_scale

The strength of the normal map's effect.

> property normal_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture used to specify the normal at a given pixel. The `normal_texture` only uses the red and green channels; the blue and alpha channels are ignored. The normal read from `normal_texture` is oriented around the surface normal provided by the `Mesh`.
**Note:** The mesh must have both normals and tangents defined in its vertex data. Otherwise, the normal map won't render correctly and will only appear to darken the whole surface. If creating geometry with `SurfaceTool`, you can use `SurfaceTool.generate_normals` and `SurfaceTool.generate_tangents` to automatically generate normals and tangents respectively.
**Note:** Godot expects the normal map to use X+, Y+, and Z+ coordinates. See [this page](http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates) for a comparison of normal map coordinates expected by popular engines.
**Note:** If `detail_enabled` is `true`, the `detail_albedo` texture is drawn *below* the `normal_texture`. To display a normal map *above* the `detail_albedo` texture, use `detail_normal` instead.

> property orm_texture : Texture2D ; setter=set_texture ; getter=get_texture

The Occlusion/Roughness/Metallic texture to use. This is a more efficient replacement of `ao_texture`, `roughness_texture` and `metallic_texture` in `ORMMaterial3D`. Ambient occlusion is stored in the red channel. Roughness map is stored in the green channel. Metallic map is stored in the blue channel. The alpha channel is ignored.

> property particles_anim_h_frames : int ; setter=set_particles_anim_h_frames ; getter=get_particles_anim_h_frames

The number of horizontal frames in the particle sprite sheet. Only enabled when using `BILLBOARD_PARTICLES`. See `billboard_mode`.

> property particles_anim_loop : bool ; setter=set_particles_anim_loop ; getter=get_particles_anim_loop

If `true`, particle animations are looped. Only enabled when using `BILLBOARD_PARTICLES`. See `billboard_mode`.

> property particles_anim_v_frames : int ; setter=set_particles_anim_v_frames ; getter=get_particles_anim_v_frames

The number of vertical frames in the particle sprite sheet. Only enabled when using `BILLBOARD_PARTICLES`. See `billboard_mode`.

> property point_size : float ; default=1.0 ; setter=set_point_size ; getter=get_point_size

The point size in pixels. See `use_point_size`.

> property proximity_fade_distance : float ; default=1.0 ; setter=set_proximity_fade_distance ; getter=get_proximity_fade_distance

Distance over which the fade effect takes place. The larger the distance the longer it takes for an object to fade.

> property proximity_fade_enabled : bool ; default=false ; setter=set_proximity_fade_enabled ; getter=is_proximity_fade_enabled

If `true`, the proximity fade effect is enabled. The proximity fade effect fades out each pixel based on its distance to another object.

> property refraction_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, the refraction effect is enabled. Distorts transparency based on light from behind the object.
**Note:** Refraction is implemented using the screen texture. Only opaque materials will appear in the refraction, since transparent materials do not appear in the screen texture.

> property refraction_scale : float ; default=0.05 ; setter=set_refraction ; getter=get_refraction

The strength of the refraction effect.

> property refraction_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture that controls the strength of the refraction per-pixel. Multiplied by `refraction_scale`.

> property refraction_texture_channel : TextureChannel ; default=0 ; setter=set_refraction_texture_channel ; getter=get_refraction_texture_channel

Specifies the channel of the `refraction_texture` in which the refraction information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored refraction in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.

> property rim : float ; default=1.0 ; setter=set_rim ; getter=get_rim

Sets the strength of the rim lighting effect.

> property rim_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, rim effect is enabled. Rim lighting increases the brightness at glancing angles on an object.
**Note:** Rim lighting is not visible if the material's `shading_mode` is `SHADING_MODE_UNSHADED`.

> property rim_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture used to set the strength of the rim lighting effect per-pixel. Multiplied by `rim`.

> property rim_tint : float ; default=0.5 ; setter=set_rim_tint ; getter=get_rim_tint

The amount of to blend light and albedo color when rendering rim effect. If `0` the light color is used, while `1` means albedo color is used. An intermediate value generally works best.

> property roughness : float ; default=1.0 ; setter=set_roughness ; getter=get_roughness

Surface reflection. A value of `0` represents a perfect mirror while a value of `1` completely blurs the reflection. See also `metallic`.

> property roughness_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture used to control the roughness per-pixel. Multiplied by `roughness`.

> property roughness_texture_channel : TextureChannel ; default=0 ; setter=set_roughness_texture_channel ; getter=get_roughness_texture_channel

Specifies the channel of the `roughness_texture` in which the roughness information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.

> property shading_mode : ShadingMode ; default=1 ; setter=set_shading_mode ; getter=get_shading_mode

Sets whether the shading takes place, per-pixel, per-vertex or unshaded. Per-vertex lighting is faster, making it the best choice for mobile applications, however it looks considerably worse than per-pixel. Unshaded rendering is the fastest, but disables all interactions with lights.

> property shadow_to_opacity : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, enables the "shadow to opacity" render mode where lighting modifies the alpha so shadowed areas are opaque and non-shadowed areas are transparent. Useful for overlaying shadows onto a camera feed in AR.

> property specular_mode : SpecularMode ; default=0 ; setter=set_specular_mode ; getter=get_specular_mode

The method for rendering the specular blob.
**Note:** `specular_mode` only applies to the specular blob. It does not affect specular reflections from the sky, screen-space reflections, `VoxelGI`, SDFGI or `ReflectionProbe`s. To disable reflections from these sources as well, set `metallic_specular` to `0.0` instead.

> property stencil_color : Color ; default=Color(0, 0, 0, 1) ; setter=set_stencil_effect_color ; getter=get_stencil_effect_color ; experimental=May be affected by future rendering pipeline changes.

The primary color of the stencil effect.

> property stencil_compare : StencilCompare ; default=0 ; setter=set_stencil_compare ; getter=get_stencil_compare ; experimental=May be affected by future rendering pipeline changes.

The comparison operator to use for stencil masking operations.

> property stencil_flags : int ; default=0 ; setter=set_stencil_flags ; getter=get_stencil_flags ; experimental=May be affected by future rendering pipeline changes.

The flags dictating how the stencil operation behaves.

> property stencil_mode : StencilMode ; default=0 ; setter=set_stencil_mode ; getter=get_stencil_mode ; experimental=May be affected by future rendering pipeline changes.

The stencil effect mode.

> property stencil_outline_thickness : float ; default=0.01 ; setter=set_stencil_effect_outline_thickness ; getter=get_stencil_effect_outline_thickness ; experimental=May be affected by future rendering pipeline changes.

The outline thickness for `STENCIL_MODE_OUTLINE`.

> property stencil_reference : int ; default=1 ; setter=set_stencil_reference ; getter=get_stencil_reference ; experimental=May be affected by future rendering pipeline changes.

The stencil reference value (0-255). Typically a power of 2.

> property subsurf_scatter_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, subsurface scattering is enabled. Emulates light that penetrates an object's surface, is scattered, and then emerges. Subsurface scattering quality is controlled by `ProjectSettings.rendering/environment/subsurface_scattering/subsurface_scattering_quality`.
**Note:** Subsurface scattering is not supported on viewports that have a transparent background (where `Viewport.transparent_bg` is `true`).

> property subsurf_scatter_skin_mode : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, subsurface scattering will use a special mode optimized for the color and density of human skin, such as boosting the intensity of the red channel in subsurface scattering.

> property subsurf_scatter_strength : float ; default=0.0 ; setter=set_subsurface_scattering_strength ; getter=get_subsurface_scattering_strength

The strength of the subsurface scattering effect. The depth of the effect is also controlled by `ProjectSettings.rendering/environment/subsurface_scattering/subsurface_scattering_scale`, which is set globally.

> property subsurf_scatter_texture : Texture2D ; setter=set_texture ; getter=get_texture

Texture used to control the subsurface scattering strength. Stored in the red texture channel. Multiplied by `subsurf_scatter_strength`.

> property subsurf_scatter_transmittance_boost : float ; default=0.0 ; setter=set_transmittance_boost ; getter=get_transmittance_boost

The intensity of the subsurface scattering transmittance effect.

> property subsurf_scatter_transmittance_color : Color ; default=Color(1, 1, 1, 1) ; setter=set_transmittance_color ; getter=get_transmittance_color

The color to multiply the subsurface scattering transmittance effect with. Ignored if `subsurf_scatter_skin_mode` is `true`.

> property subsurf_scatter_transmittance_depth : float ; default=0.1 ; setter=set_transmittance_depth ; getter=get_transmittance_depth

The depth of the subsurface scattering transmittance effect.

> property subsurf_scatter_transmittance_enabled : bool ; default=false ; setter=set_feature ; getter=get_feature

If `true`, enables subsurface scattering transmittance. Only effective if `subsurf_scatter_enabled` is `true`. See also `backlight_enabled`.

> property subsurf_scatter_transmittance_texture : Texture2D ; setter=set_texture ; getter=get_texture

The texture to use for multiplying the intensity of the subsurface scattering transmittance intensity. See also `subsurf_scatter_texture`. Ignored if `subsurf_scatter_skin_mode` is `true`.

> property texture_filter : TextureFilter ; default=3 ; setter=set_texture_filter ; getter=get_texture_filter

Filter flags for the texture.
**Note:** `heightmap_texture` is always sampled with linear filtering, even if nearest-neighbor filtering is selected here. This is to ensure the heightmap effect looks as intended. If you need sharper height transitions between pixels, resize the heightmap texture in an image editor with nearest-neighbor filtering.

> property texture_repeat : bool ; default=true ; setter=set_flag ; getter=get_flag

If `true`, the texture repeats when exceeding the texture's size. See `FLAG_USE_TEXTURE_REPEAT`.

> property transparency : Transparency ; default=0 ; setter=set_transparency ; getter=get_transparency

The material's transparency mode. Some transparency modes will disable shadow casting. Any transparency mode other than `TRANSPARENCY_DISABLED` has a greater performance impact compared to opaque rendering. See also `blend_mode`.

> property use_fov_override : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true` use `fov_override` to override the `Camera3D`'s field of view angle.

> property use_particle_trails : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, enables parts of the shader required for `GPUParticles3D` trails to function. This also requires using a mesh with appropriate skinning, such as `RibbonTrailMesh` or `TubeTrailMesh`. Enabling this feature outside of materials used in `GPUParticles3D` meshes will break material rendering.

> property use_point_size : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, render point size can be changed.
**Note:** This is only effective for objects whose geometry is point-based rather than triangle-based. See also `point_size`.

> property use_z_clip_scale : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true` use `z_clip_scale` to scale the object being rendered towards the camera to avoid clipping into things like walls.

> property uv1_offset : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_uv1_offset ; getter=get_uv1_offset

How much to offset the `UV` coordinates. This amount will be added to `UV` in the vertex function. This can be used to offset a texture. The Z component is used when `uv1_triplanar` is enabled, but it is not used anywhere else.

> property uv1_scale : Vector3 ; default=Vector3(1, 1, 1) ; setter=set_uv1_scale ; getter=get_uv1_scale

How much to scale the `UV` coordinates. This is multiplied by `UV` in the vertex function. The Z component is used when `uv1_triplanar` is enabled, but it is not used anywhere else.

> property uv1_triplanar : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, instead of using `UV` textures will use a triplanar texture lookup to determine how to apply textures. Triplanar uses the orientation of the object's surface to blend between texture coordinates. It reads from the source texture 3 times, once for each axis and then blends between the results based on how closely the pixel aligns with each axis. This is often used for natural features to get a realistic blend of materials. Because triplanar texturing requires many more texture reads per-pixel it is much slower than normal UV texturing. Additionally, because it is blending the texture between the three axes, it is unsuitable when you are trying to achieve crisp texturing.

> property uv1_triplanar_sharpness : float ; default=1.0 ; setter=set_uv1_triplanar_blend_sharpness ; getter=get_uv1_triplanar_blend_sharpness

A lower number blends the texture more softly while a higher number blends the texture more sharply.
**Note:** `uv1_triplanar_sharpness` is clamped between `0.0` and `150.0` (inclusive) as values outside that range can look broken depending on the mesh.

> property uv1_world_triplanar : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, triplanar mapping for `UV` is calculated in world space rather than object local space. See also `uv1_triplanar`.

> property uv2_offset : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_uv2_offset ; getter=get_uv2_offset

How much to offset the `UV2` coordinates. This amount will be added to `UV2` in the vertex function. This can be used to offset a texture. The Z component is used when `uv2_triplanar` is enabled, but it is not used anywhere else.

> property uv2_scale : Vector3 ; default=Vector3(1, 1, 1) ; setter=set_uv2_scale ; getter=get_uv2_scale

How much to scale the `UV2` coordinates. This is multiplied by `UV2` in the vertex function. The Z component is used when `uv2_triplanar` is enabled, but it is not used anywhere else.

> property uv2_triplanar : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, instead of using `UV2` textures will use a triplanar texture lookup to determine how to apply textures. Triplanar uses the orientation of the object's surface to blend between texture coordinates. It reads from the source texture 3 times, once for each axis and then blends between the results based on how closely the pixel aligns with each axis. This is often used for natural features to get a realistic blend of materials. Because triplanar texturing requires many more texture reads per-pixel it is much slower than normal UV texturing. Additionally, because it is blending the texture between the three axes, it is unsuitable when you are trying to achieve crisp texturing.

> property uv2_triplanar_sharpness : float ; default=1.0 ; setter=set_uv2_triplanar_blend_sharpness ; getter=get_uv2_triplanar_blend_sharpness

A lower number blends the texture more softly while a higher number blends the texture more sharply.
**Note:** `uv2_triplanar_sharpness` is clamped between `0.0` and `150.0` (inclusive) as values outside that range can look broken depending on the mesh.

> property uv2_world_triplanar : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, triplanar mapping for `UV2` is calculated in world space rather than object local space. See also `uv2_triplanar`.

> property vertex_color_is_srgb : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, vertex colors are considered to be stored in nonlinear sRGB encoding and are converted to linear encoding during rendering. If `false`, vertex colors are considered to be stored in linear encoding and are rendered as-is. See also `albedo_texture_force_srgb`.
**Note:** Only effective when using the Forward+ and Mobile rendering methods, not Compatibility.

> property vertex_color_use_as_albedo : bool ; default=false ; setter=set_flag ; getter=get_flag

If `true`, the vertex color is used as albedo color.

> property z_clip_scale : float ; default=1.0 ; setter=set_z_clip_scale ; getter=get_z_clip_scale

Scales the object being rendered towards the camera to avoid clipping into things like walls. This is intended to be used for objects that are fixed with respect to the camera like player arms, tools, etc. Lighting and shadows will continue to work correctly when this setting is adjusted, but screen-space effects like SSAO and SSR may break with lower scales. Therefore, try to keep this setting as close to `1.0` as possible.

## Methods

> method get_feature(feature: Feature) -> bool ; qualifiers=const

Returns `true` if the specified `feature` is enabled.

> method get_flag(flag: Flags) -> bool ; qualifiers=const

Returns `true` if the specified `flag` is enabled.

> method get_texture(param: TextureParam) -> Texture2D ; qualifiers=const

Returns the `Texture2D` associated with the specified texture `param`.

> method set_feature(feature: Feature, enable: bool) -> void

If `enable` is `true`, enables the specified `feature`. Many features that are available in `BaseMaterial3D` need to be enabled before use. This way, the cost for using the feature is only incurred when specified. Features can also be enabled by setting their corresponding property to `true`.

> method set_flag(flag: Flags, enable: bool) -> void

If `enable` is `true`, enables the specified `flag`. Flags are optional behavior that can be turned on and off. Only one flag can be enabled at a time with this function, the flag enumerators cannot be bit-masked together to enable or disable multiple flags at once. Flags can also be enabled by setting their corresponding property to `true`.

> method set_texture(param: TextureParam, texture: Texture2D) -> void

Sets the texture for the slot specified by `param`.

## Enumerations

> enum AlphaAntiAliasing

> enum_value AlphaAntiAliasing.ALPHA_ANTIALIASING_OFF = 0

Disables Alpha AntiAliasing for the material.

> enum_value AlphaAntiAliasing.ALPHA_ANTIALIASING_ALPHA_TO_COVERAGE = 1

Enables AlphaToCoverage. Alpha values in the material are passed to the AntiAliasing sample mask.

> enum_value AlphaAntiAliasing.ALPHA_ANTIALIASING_ALPHA_TO_COVERAGE_AND_TO_ONE = 2

Enables AlphaToCoverage and forces all non-zero alpha values to `1`. Alpha values in the material are passed to the AntiAliasing sample mask.

> enum BillboardMode

> enum_value BillboardMode.BILLBOARD_DISABLED = 0

Billboard mode is disabled.

> enum_value BillboardMode.BILLBOARD_ENABLED = 1

The object's Z axis will always face the camera.

> enum_value BillboardMode.BILLBOARD_FIXED_Y = 2

The object's X axis will always face the camera.

> enum_value BillboardMode.BILLBOARD_PARTICLES = 3

Used for particle systems when assigned to `GPUParticles3D` and `CPUParticles3D` nodes (flipbook animation). Enables `particles_anim_*` properties.
The `ParticleProcessMaterial.anim_speed_min` or `CPUParticles3D.anim_speed_min` should also be set to a value bigger than zero for the animation to play.

> enum BlendMode

> enum_value BlendMode.BLEND_MODE_MIX = 0

Default blend mode. The color of the object is blended over the background based on the object's alpha value.

> enum_value BlendMode.BLEND_MODE_ADD = 1

The color of the object is added to the background.

> enum_value BlendMode.BLEND_MODE_SUB = 2

The color of the object is subtracted from the background.

> enum_value BlendMode.BLEND_MODE_MUL = 3

The color of the object is multiplied by the background.

> enum_value BlendMode.BLEND_MODE_PREMULT_ALPHA = 4

The color of the object is added to the background and the alpha channel is used to mask out the background. This is effectively a hybrid of the blend mix and add modes, useful for effects like fire where you want the flame to add but the smoke to mix. By default, this works with unshaded materials using premultiplied textures. For shaded materials, use the `PREMUL_ALPHA_FACTOR` built-in so that lighting can be modulated as well.

> enum CullMode

> enum_value CullMode.CULL_BACK = 0

Default cull mode. The back of the object is culled when not visible. Back face triangles will be culled when facing the camera. This results in only the front side of triangles being drawn. For closed-surface meshes, this means that only the exterior of the mesh will be visible.

> enum_value CullMode.CULL_FRONT = 1

Front face triangles will be culled when facing the camera. This results in only the back side of triangles being drawn. For closed-surface meshes, this means that the interior of the mesh will be drawn instead of the exterior.

> enum_value CullMode.CULL_DISABLED = 2

No face culling is performed; both the front face and back face will be visible.

> enum DepthDrawMode

> enum_value DepthDrawMode.DEPTH_DRAW_OPAQUE_ONLY = 0

Default depth draw mode. Depth is drawn only for opaque objects during the opaque prepass (if any) and during the opaque pass.

> enum_value DepthDrawMode.DEPTH_DRAW_ALWAYS = 1

Objects will write to depth during the opaque and the transparent passes. Transparent objects that are close to the camera may obscure other transparent objects behind them.
**Note:** This does not influence whether transparent objects are included in the depth prepass or not. For that, see `Transparency`.

> enum_value DepthDrawMode.DEPTH_DRAW_DISABLED = 2

Objects will not write their depth to the depth buffer, even during the depth prepass (if enabled).

> enum DepthTest

> enum_value DepthTest.DEPTH_TEST_DEFAULT = 0

Depth test will discard the pixel if it is behind other pixels.

> enum_value DepthTest.DEPTH_TEST_INVERTED = 1

Depth test will discard the pixel if it is in front of other pixels. Useful for stencil effects.

> enum DetailUV

> enum_value DetailUV.DETAIL_UV_1 = 0

Use `UV` with the detail texture.

> enum_value DetailUV.DETAIL_UV_2 = 1

Use `UV2` with the detail texture.

> enum DiffuseMode

> enum_value DiffuseMode.DIFFUSE_BURLEY = 0

Default diffuse scattering algorithm.

> enum_value DiffuseMode.DIFFUSE_LAMBERT = 1

Diffuse scattering ignores roughness.

> enum_value DiffuseMode.DIFFUSE_LAMBERT_WRAP = 2

Extends Lambert to cover more than 90 degrees when roughness increases.

> enum_value DiffuseMode.DIFFUSE_TOON = 3

Uses a hard cut for lighting, with smoothing affected by roughness.

> enum DistanceFadeMode

> enum_value DistanceFadeMode.DISTANCE_FADE_DISABLED = 0

Do not use distance fade.

> enum_value DistanceFadeMode.DISTANCE_FADE_PIXEL_ALPHA = 1

Smoothly fades the object out based on each pixel's distance from the camera using the alpha channel.

> enum_value DistanceFadeMode.DISTANCE_FADE_PIXEL_DITHER = 2

Smoothly fades the object out based on each pixel's distance from the camera using a dithering approach. Dithering discards pixels based on a set pattern to smoothly fade without enabling transparency. On certain hardware, this can be faster than `DISTANCE_FADE_PIXEL_ALPHA`.

> enum_value DistanceFadeMode.DISTANCE_FADE_OBJECT_DITHER = 3

Smoothly fades the object out based on the object's distance from the camera using a dithering approach. Dithering discards pixels based on a set pattern to smoothly fade without enabling transparency. On certain hardware, this can be faster than `DISTANCE_FADE_PIXEL_ALPHA` and `DISTANCE_FADE_PIXEL_DITHER`.

> enum EmissionOperator

> enum_value EmissionOperator.EMISSION_OP_ADD = 0

Adds the emission color to the color from the emission texture.

> enum_value EmissionOperator.EMISSION_OP_MULTIPLY = 1

Multiplies the emission color by the color from the emission texture.

> enum Feature

> enum_value Feature.FEATURE_EMISSION = 0

Constant for setting `emission_enabled`.

> enum_value Feature.FEATURE_NORMAL_MAPPING = 1

Constant for setting `normal_enabled`.

> enum_value Feature.FEATURE_RIM = 2

Constant for setting `rim_enabled`.

> enum_value Feature.FEATURE_CLEARCOAT = 3

Constant for setting `clearcoat_enabled`.

> enum_value Feature.FEATURE_ANISOTROPY = 4

Constant for setting `anisotropy_enabled`.

> enum_value Feature.FEATURE_AMBIENT_OCCLUSION = 5

Constant for setting `ao_enabled`.

> enum_value Feature.FEATURE_HEIGHT_MAPPING = 6

Constant for setting `heightmap_enabled`.

> enum_value Feature.FEATURE_SUBSURFACE_SCATTERING = 7

Constant for setting `subsurf_scatter_enabled`.

> enum_value Feature.FEATURE_SUBSURFACE_TRANSMITTANCE = 8

Constant for setting `subsurf_scatter_transmittance_enabled`.

> enum_value Feature.FEATURE_BACKLIGHT = 9

Constant for setting `backlight_enabled`.

> enum_value Feature.FEATURE_REFRACTION = 10

Constant for setting `refraction_enabled`.

> enum_value Feature.FEATURE_DETAIL = 11

Constant for setting `detail_enabled`.

> enum_value Feature.FEATURE_BENT_NORMAL_MAPPING = 12

Constant for setting `bent_normal_enabled`.

> enum_value Feature.FEATURE_MAX = 13

Represents the size of the `Feature` enum.

> enum Flags

> enum_value Flags.FLAG_DISABLE_DEPTH_TEST = 0

Disables the depth test, so this object is drawn on top of all others drawn before it. This puts the object in the transparent draw pass where it is sorted based on distance to camera. Objects drawn after it in the draw order may cover it. This also disables writing to depth.

> enum_value Flags.FLAG_ALBEDO_FROM_VERTEX_COLOR = 1

Set `ALBEDO` to the per-vertex color specified in the mesh.

> enum_value Flags.FLAG_SRGB_VERTEX_COLOR = 2

Vertex colors are considered to be stored in nonlinear sRGB encoding and are converted to linear encoding during rendering. See also `vertex_color_is_srgb`.
**Note:** Only effective when using the Forward+ and Mobile rendering methods.

> enum_value Flags.FLAG_USE_POINT_SIZE = 3

Uses point size to alter the size of primitive points. Also changes the albedo texture lookup to use `POINT_COORD` instead of `UV`.

> enum_value Flags.FLAG_FIXED_SIZE = 4

Object is scaled by depth so that it always appears the same size on screen.

> enum_value Flags.FLAG_BILLBOARD_KEEP_SCALE = 5

Shader will keep the scale set for the mesh. Otherwise the scale is lost when billboarding. Only applies when `billboard_mode` is `BILLBOARD_ENABLED`.

> enum_value Flags.FLAG_UV1_USE_TRIPLANAR = 6

Use triplanar texture lookup for all texture lookups that would normally use `UV`.

> enum_value Flags.FLAG_UV2_USE_TRIPLANAR = 7

Use triplanar texture lookup for all texture lookups that would normally use `UV2`.

> enum_value Flags.FLAG_UV1_USE_WORLD_TRIPLANAR = 8

Use triplanar texture lookup for all texture lookups that would normally use `UV`.

> enum_value Flags.FLAG_UV2_USE_WORLD_TRIPLANAR = 9

Use triplanar texture lookup for all texture lookups that would normally use `UV2`.

> enum_value Flags.FLAG_AO_ON_UV2 = 10

Use `UV2` coordinates to look up from the `ao_texture`.

> enum_value Flags.FLAG_EMISSION_ON_UV2 = 11

Use `UV2` coordinates to look up from the `emission_texture`.

> enum_value Flags.FLAG_ALBEDO_TEXTURE_FORCE_SRGB = 12

Forces the shader to convert albedo from nonlinear sRGB encoding to linear encoding. See also `albedo_texture_force_srgb`.

> enum_value Flags.FLAG_DONT_RECEIVE_SHADOWS = 13

Disables receiving shadows from other objects.

> enum_value Flags.FLAG_DISABLE_AMBIENT_LIGHT = 14

Disables receiving ambient light.

> enum_value Flags.FLAG_USE_SHADOW_TO_OPACITY = 15

Enables the shadow to opacity feature.

> enum_value Flags.FLAG_USE_TEXTURE_REPEAT = 16

Enables the texture to repeat when UV coordinates are outside the 0-1 range. If using one of the linear filtering modes, this can result in artifacts at the edges of a texture when the sampler filters across the edges of the texture.

> enum_value Flags.FLAG_INVERT_HEIGHTMAP = 17

Invert values read from a depth texture to convert them to height values (heightmap).

> enum_value Flags.FLAG_SUBSURFACE_MODE_SKIN = 18

Enables the skin mode for subsurface scattering which is used to improve the look of subsurface scattering when used for human skin.

> enum_value Flags.FLAG_PARTICLE_TRAILS_MODE = 19

Enables parts of the shader required for `GPUParticles3D` trails to function. This also requires using a mesh with appropriate skinning, such as `RibbonTrailMesh` or `TubeTrailMesh`. Enabling this feature outside of materials used in `GPUParticles3D` meshes will break material rendering.

> enum_value Flags.FLAG_ALBEDO_TEXTURE_MSDF = 20

Enables multichannel signed distance field rendering shader.

> enum_value Flags.FLAG_DISABLE_FOG = 21

Disables receiving depth-based or volumetric fog.

> enum_value Flags.FLAG_DISABLE_SPECULAR_OCCLUSION = 22

Disables specular occlusion.

> enum_value Flags.FLAG_USE_Z_CLIP_SCALE = 23

Enables using `z_clip_scale`.

> enum_value Flags.FLAG_USE_FOV_OVERRIDE = 24

Enables using `fov_override`.

> enum_value Flags.FLAG_MAX = 25

Represents the size of the `Flags` enum.

> enum ShadingMode

> enum_value ShadingMode.SHADING_MODE_UNSHADED = 0

The object will not receive shadows. This is the fastest to render, but it disables all interactions with lights.

> enum_value ShadingMode.SHADING_MODE_PER_PIXEL = 1

The object will be shaded per pixel. Useful for realistic shading effects.

> enum_value ShadingMode.SHADING_MODE_PER_VERTEX = 2

The object will be shaded per vertex. Useful when you want cheaper shaders and do not care about visual quality.

> enum_value ShadingMode.SHADING_MODE_MAX = 3

Represents the size of the `ShadingMode` enum.

> enum SpecularMode

> enum_value SpecularMode.SPECULAR_SCHLICK_GGX = 0

Default specular blob.
**Note:** Forward+ uses multiscattering for more accurate reflections, although the impact of multiscattering is more noticeable on rough metallic surfaces than on smooth, non-metallic surfaces.
**Note:** Mobile and Compatibility don't perform multiscattering for performance reasons. Instead, they perform single scattering, which means rough metallic surfaces may look slightly darker than intended.

> enum_value SpecularMode.SPECULAR_TOON = 1

Toon blob which changes size based on roughness.

> enum_value SpecularMode.SPECULAR_DISABLED = 2

No specular blob. This is slightly faster to render than other specular modes.

> enum StencilCompare

> enum_value StencilCompare.STENCIL_COMPARE_ALWAYS = 0

Always passes the stencil test.

> enum_value StencilCompare.STENCIL_COMPARE_LESS = 1

Passes the stencil test when the reference value is less than the existing stencil value.

> enum_value StencilCompare.STENCIL_COMPARE_EQUAL = 2

Passes the stencil test when the reference value is equal to the existing stencil value.

> enum_value StencilCompare.STENCIL_COMPARE_LESS_OR_EQUAL = 3

Passes the stencil test when the reference value is less than or equal to the existing stencil value.

> enum_value StencilCompare.STENCIL_COMPARE_GREATER = 4

Passes the stencil test when the reference value is greater than the existing stencil value.

> enum_value StencilCompare.STENCIL_COMPARE_NOT_EQUAL = 5

Passes the stencil test when the reference value is not equal to the existing stencil value.

> enum_value StencilCompare.STENCIL_COMPARE_GREATER_OR_EQUAL = 6

Passes the stencil test when the reference value is greater than or equal to the existing stencil value.

> enum StencilFlags

> enum_value StencilFlags.STENCIL_FLAG_READ = 1

The material will only be rendered where it passes a stencil comparison with existing stencil buffer values.

> enum_value StencilFlags.STENCIL_FLAG_WRITE = 2

The material will write the reference value to the stencil buffer where it passes the depth test.

> enum_value StencilFlags.STENCIL_FLAG_WRITE_DEPTH_FAIL = 4

The material will write the reference value to the stencil buffer where it fails the depth test.

> enum StencilMode

> enum_value StencilMode.STENCIL_MODE_DISABLED = 0

Disables stencil operations.

> enum_value StencilMode.STENCIL_MODE_OUTLINE = 1

Stencil preset which applies an outline to the object.
**Note:** Requires a `Material.next_pass` material which will be automatically applied. Any manual changes made to `Material.next_pass` will be lost when the stencil properties are modified or the scene is reloaded. To safely apply a `Material.next_pass` material on a material that uses stencil presets, use `GeometryInstance3D.material_overlay` instead.

> enum_value StencilMode.STENCIL_MODE_XRAY = 2

Stencil preset which shows a silhouette of the object behind walls.
**Note:** Requires a `Material.next_pass` material which will be automatically applied. Any manual changes made to `Material.next_pass` will be lost when the stencil properties are modified or the scene is reloaded. To safely apply a `Material.next_pass` material on a material that uses stencil presets, use `GeometryInstance3D.material_overlay` instead.

> enum_value StencilMode.STENCIL_MODE_CUSTOM = 3

Enables stencil operations without a preset.

> enum TextureChannel

> enum_value TextureChannel.TEXTURE_CHANNEL_RED = 0

Used to read from the red channel of a texture.

> enum_value TextureChannel.TEXTURE_CHANNEL_GREEN = 1

Used to read from the green channel of a texture.

> enum_value TextureChannel.TEXTURE_CHANNEL_BLUE = 2

Used to read from the blue channel of a texture.

> enum_value TextureChannel.TEXTURE_CHANNEL_ALPHA = 3

Used to read from the alpha channel of a texture.

> enum_value TextureChannel.TEXTURE_CHANNEL_GRAYSCALE = 4

Used to read from the linear (non-perceptual) average of the red, green and blue channels of a texture.

> enum TextureFilter

> enum_value TextureFilter.TEXTURE_FILTER_NEAREST = 0

The texture filter reads from the nearest pixel only. This makes the texture look pixelated from up close, and grainy from a distance (due to mipmaps not being sampled).

> enum_value TextureFilter.TEXTURE_FILTER_LINEAR = 1

The texture filter blends between the nearest 4 pixels. This makes the texture look smooth from up close, and grainy from a distance (due to mipmaps not being sampled).

> enum_value TextureFilter.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS = 2

The texture filter reads from the nearest pixel and blends between the nearest 2 mipmaps (or uses the nearest mipmap if `ProjectSettings.rendering/textures/default_filters/use_nearest_mipmap_filter` is `true`). This makes the texture look pixelated from up close, and smooth from a distance.

> enum_value TextureFilter.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS = 3

The texture filter blends between the nearest 4 pixels and between the nearest 2 mipmaps (or uses the nearest mipmap if `ProjectSettings.rendering/textures/default_filters/use_nearest_mipmap_filter` is `true`). This makes the texture look smooth from up close, and smooth from a distance.

> enum_value TextureFilter.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC = 4

The texture filter reads from the nearest pixel and blends between 2 mipmaps (or uses the nearest mipmap if `ProjectSettings.rendering/textures/default_filters/use_nearest_mipmap_filter` is `true`) based on the angle between the surface and the camera view. This makes the texture look pixelated from up close, and smooth from a distance. Anisotropic filtering improves texture quality on surfaces that are almost in line with the camera, but is slightly slower. The anisotropic filtering level can be changed by adjusting `ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level`.

> enum_value TextureFilter.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC = 5

The texture filter blends between the nearest 4 pixels and blends between 2 mipmaps (or uses the nearest mipmap if `ProjectSettings.rendering/textures/default_filters/use_nearest_mipmap_filter` is `true`) based on the angle between the surface and the camera view. This makes the texture look smooth from up close, and smooth from a distance. Anisotropic filtering improves texture quality on surfaces that are almost in line with the camera, but is slightly slower. The anisotropic filtering level can be changed by adjusting `ProjectSettings.rendering/textures/default_filters/anisotropic_filtering_level`.

> enum_value TextureFilter.TEXTURE_FILTER_MAX = 6

Represents the size of the `TextureFilter` enum.

> enum TextureParam

> enum_value TextureParam.TEXTURE_ALBEDO = 0

Texture specifying per-pixel color.

> enum_value TextureParam.TEXTURE_METALLIC = 1

Texture specifying per-pixel metallic value.

> enum_value TextureParam.TEXTURE_ROUGHNESS = 2

Texture specifying per-pixel roughness value.

> enum_value TextureParam.TEXTURE_EMISSION = 3

Texture specifying per-pixel emission color.

> enum_value TextureParam.TEXTURE_NORMAL = 4

Texture specifying per-pixel normal vector.

> enum_value TextureParam.TEXTURE_BENT_NORMAL = 18

Texture specifying per-pixel bent normal vector.

> enum_value TextureParam.TEXTURE_RIM = 5

Texture specifying per-pixel rim value.

> enum_value TextureParam.TEXTURE_CLEARCOAT = 6

Texture specifying per-pixel clearcoat value.

> enum_value TextureParam.TEXTURE_FLOWMAP = 7

Texture specifying per-pixel flowmap direction for use with `anisotropy`.

> enum_value TextureParam.TEXTURE_AMBIENT_OCCLUSION = 8

Texture specifying per-pixel ambient occlusion value.

> enum_value TextureParam.TEXTURE_HEIGHTMAP = 9

Texture specifying per-pixel height.

> enum_value TextureParam.TEXTURE_SUBSURFACE_SCATTERING = 10

Texture specifying per-pixel subsurface scattering.

> enum_value TextureParam.TEXTURE_SUBSURFACE_TRANSMITTANCE = 11

Texture specifying per-pixel transmittance for subsurface scattering.

> enum_value TextureParam.TEXTURE_BACKLIGHT = 12

Texture specifying per-pixel backlight color.

> enum_value TextureParam.TEXTURE_REFRACTION = 13

Texture specifying per-pixel refraction strength.

> enum_value TextureParam.TEXTURE_DETAIL_MASK = 14

Texture specifying per-pixel detail mask blending value.

> enum_value TextureParam.TEXTURE_DETAIL_ALBEDO = 15

Texture specifying per-pixel detail color.

> enum_value TextureParam.TEXTURE_DETAIL_NORMAL = 16

Texture specifying per-pixel detail normal.

> enum_value TextureParam.TEXTURE_ORM = 17

Texture holding ambient occlusion, roughness, and metallic.

> enum_value TextureParam.TEXTURE_MAX = 19

Represents the size of the `TextureParam` enum.

> enum Transparency

> enum_value Transparency.TRANSPARENCY_DISABLED = 0

The material will not use transparency. This is the fastest to render.

> enum_value Transparency.TRANSPARENCY_ALPHA = 1

The material will use the texture's alpha values for transparency. This is the slowest to render, and disables shadow casting.

> enum_value Transparency.TRANSPARENCY_ALPHA_SCISSOR = 2

The material will cut off all values below a threshold, the rest will remain opaque. The opaque portions will be rendered in the depth prepass. This is faster to render than alpha blending, but slower than opaque rendering. This also supports casting shadows.

> enum_value Transparency.TRANSPARENCY_ALPHA_HASH = 3

The material will cut off all values below a spatially-deterministic threshold, the rest will remain opaque. This is faster to render than alpha blending, but slower than opaque rendering. This also supports casting shadows. Alpha hashing is suited for hair rendering.

> enum_value Transparency.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS = 4

The material will use the texture's alpha value for transparency, but will discard fragments with an alpha of less than 0.99 during the depth prepass and fragments with an alpha less than 0.1 during the shadow pass. This also supports casting shadows.

> enum_value Transparency.TRANSPARENCY_MAX = 5

Represents the size of the `Transparency` enum.

## Tutorials
- [Standard Material 3D and ORM Material 3D]($DOCS_URL/tutorials/3d/standard_material_3d.html)
