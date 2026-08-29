# ParticleProcessMaterial

> class ParticleProcessMaterial
> inherits ParticleProcessMaterial Material

## Brief

Holds a particle configuration for `GPUParticles2D` or `GPUParticles3D` nodes.

## Description

`ParticleProcessMaterial` defines particle properties and behavior. It is used in the `process_material` of the `GPUParticles2D` and `GPUParticles3D` nodes. Some of this material's properties are applied to each particle when emitted, while others can have a `CurveTexture` or a `GradientTexture1D` applied to vary numerical or color values over the lifetime of the particle.

## Properties

> property alpha_curve : Texture2D ; setter=set_alpha_curve ; getter=get_alpha_curve

The alpha value of each particle's color will be multiplied by this `CurveTexture` over its lifetime.
**Note:** `alpha_curve` multiplies the particle mesh's vertex colors. To have a visible effect on a `BaseMaterial3D`, `BaseMaterial3D.vertex_color_use_as_albedo` *must* be `true`. For a `ShaderMaterial`, `ALPHA *= COLOR.a;` must be inserted in the shader's `fragment()` function. Otherwise, `alpha_curve` will have no visible effect.

> property angle_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Each particle's rotation will be animated along this `CurveTexture`.

> property angle_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum initial rotation applied to each particle, in degrees.
Only applied when `particle_flag_disable_z` or `particle_flag_rotate_y` are `true` or the `BaseMaterial3D` being used to draw the particle is using `BaseMaterial3D.BILLBOARD_PARTICLES`.

> property angle_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `angle_max`.

> property angular_velocity_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Each particle's angular velocity (rotation speed) will vary along this `CurveTexture` over its lifetime.

> property angular_velocity_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum initial angular velocity (rotation speed) applied to each particle in *degrees* per second.
Only applied when `particle_flag_disable_z` or `particle_flag_rotate_y` are `true` or the `BaseMaterial3D` being used to draw the particle is using `BaseMaterial3D.BILLBOARD_PARTICLES`.

> property angular_velocity_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `angular_velocity_max`.

> property anim_offset_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Each particle's animation offset will vary along this `CurveTexture`.

> property anim_offset_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum animation offset that corresponds to frame index in the texture. `0` is the first frame, `1` is the last one. See `CanvasItemMaterial.particles_animation`.

> property anim_offset_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `anim_offset_max`.

> property anim_speed_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Each particle's animation speed will vary along this `CurveTexture`.

> property anim_speed_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum particle animation speed. Animation speed of `1` means that the particles will make full `0` to `1` offset cycle during lifetime, `2` means `2` cycles etc.
With animation speed greater than `1`, remember to enable `CanvasItemMaterial.particles_anim_loop` property if you want the animation to repeat.

> property anim_speed_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `anim_speed_max`.

> property attractor_interaction_enabled : bool ; default=true ; setter=set_attractor_interaction_enabled ; getter=is_attractor_interaction_enabled

If `true`, interaction with particle attractors is enabled. In 3D, attraction only occurs within the area defined by the `GPUParticles3D` node's `GPUParticles3D.visibility_aabb`.

> property collision_bounce : float ; setter=set_collision_bounce ; getter=get_collision_bounce

The particles' bounciness. Values range from `0` (no bounce) to `1` (full bounciness). Only effective if `collision_mode` is `COLLISION_RIGID`.

> property collision_friction : float ; setter=set_collision_friction ; getter=get_collision_friction

The particles' friction. Values range from `0` (frictionless) to `1` (maximum friction). Only effective if `collision_mode` is `COLLISION_RIGID`.

> property collision_mode : CollisionMode ; default=0 ; setter=set_collision_mode ; getter=get_collision_mode

The particles' collision mode.
**Note:** 3D Particles can only collide with `GPUParticlesCollision3D` nodes, not `PhysicsBody3D` nodes. To make particles collide with various objects, you can add `GPUParticlesCollision3D` nodes as children of `PhysicsBody3D` nodes. In 3D, collisions only occur within the area defined by the `GPUParticles3D` node's `GPUParticles3D.visibility_aabb`.
**Note:** 2D Particles can only collide with `LightOccluder2D` nodes, not `PhysicsBody2D` nodes.

> property collision_use_scale : bool ; default=false ; setter=set_collision_use_scale ; getter=is_collision_using_scale

If `true`, `GPUParticles3D.collision_base_size` is multiplied by the particle's effective scale (see `scale_min`, `scale_max`, `scale_curve`, and `scale_over_velocity_curve`).

> property color : Color ; default=Color(1, 1, 1, 1) ; setter=set_color ; getter=get_color

Each particle's initial color. If the `GPUParticles2D`'s `texture` is defined, it will be multiplied by this color.
**Note:** `color` multiplies the particle mesh's vertex colors. To have a visible effect on a `BaseMaterial3D`, `BaseMaterial3D.vertex_color_use_as_albedo` *must* be `true`. For a `ShaderMaterial`, `ALBEDO *= COLOR.rgb;` must be inserted in the shader's `fragment()` function. Otherwise, `color` will have no visible effect.

> property color_initial_ramp : Texture2D ; setter=set_color_initial_ramp ; getter=get_color_initial_ramp

Each particle's initial color will vary along this `GradientTexture1D` (multiplied with `color`).
**Note:** `color_initial_ramp` multiplies the particle mesh's vertex colors. To have a visible effect on a `BaseMaterial3D`, `BaseMaterial3D.vertex_color_use_as_albedo` *must* be `true`. For a `ShaderMaterial`, `ALBEDO *= COLOR.rgb;` must be inserted in the shader's `fragment()` function. Otherwise, `color_initial_ramp` will have no visible effect.

> property color_ramp : Texture2D ; setter=set_color_ramp ; getter=get_color_ramp

Each particle's color will vary along this `GradientTexture1D` over its lifetime (multiplied with `color`).
**Note:** `color_ramp` multiplies the particle mesh's vertex colors. To have a visible effect on a `BaseMaterial3D`, `BaseMaterial3D.vertex_color_use_as_albedo` *must* be `true`. For a `ShaderMaterial`, `ALBEDO *= COLOR.rgb;` must be inserted in the shader's `fragment()` function. Otherwise, `color_ramp` will have no visible effect.

> property damping_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Damping will vary along this `CurveTexture`.

> property damping_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

The maximum rate at which particles lose velocity. For example value of `100` means that the particle will go from `100` velocity to `0` in `1` second.

> property damping_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `damping_max`.

> property direction : Vector3 ; default=Vector3(1, 0, 0) ; setter=set_direction ; getter=get_direction

Unit vector specifying the particles' emission direction.

> property directional_velocity_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

A curve that specifies the velocity along each of the axes of the particle system along its lifetime.
**Note:** Animated velocities will not be affected by damping, use `velocity_limit_curve` instead.

> property directional_velocity_max : float ; setter=set_param_max ; getter=get_param_max

Maximum directional velocity value, which is multiplied by `directional_velocity_curve`.
**Note:** Animated velocities will not be affected by damping, use `velocity_limit_curve` instead.

> property directional_velocity_min : float ; setter=set_param_min ; getter=get_param_min

Minimum directional velocity value, which is multiplied by `directional_velocity_curve`.
**Note:** Animated velocities will not be affected by damping, use `velocity_limit_curve` instead.

> property emission_box_extents : Vector3 ; setter=set_emission_box_extents ; getter=get_emission_box_extents

The box's extents if `emission_shape` is set to `EMISSION_SHAPE_BOX`.
**Note:** `emission_box_extents` starts from the center point and applies the X, Y, and Z values in both directions. The size is twice the area of the extents.

> property emission_color_texture : Texture2D ; setter=set_emission_color_texture ; getter=get_emission_color_texture

Particle color will be modulated by color determined by sampling this texture at the same point as the `emission_point_texture`.
**Note:** `emission_color_texture` multiplies the particle mesh's vertex colors. To have a visible effect on a `BaseMaterial3D`, `BaseMaterial3D.vertex_color_use_as_albedo` *must* be `true`. For a `ShaderMaterial`, `ALBEDO *= COLOR.rgb;` must be inserted in the shader's `fragment()` function. Otherwise, `emission_color_texture` will have no visible effect.

> property emission_curve : Texture2D ; setter=set_emission_curve ; getter=get_emission_curve

Each particle's color will be multiplied by this `CurveTexture` over its lifetime.
**Note:** `emission_curve` multiplies the particle mesh's vertex colors. To have a visible effect on a `BaseMaterial3D`, `BaseMaterial3D.vertex_color_use_as_albedo` *must* be `true`. For a `ShaderMaterial`, `ALBEDO *= COLOR.rgb;` must be inserted in the shader's `fragment()` function. Otherwise, `emission_curve` will have no visible effect.

> property emission_normal_texture : Texture2D ; setter=set_emission_normal_texture ; getter=get_emission_normal_texture

Particle velocity and rotation will be set by sampling this texture at the same point as the `emission_point_texture`. Used only in `EMISSION_SHAPE_DIRECTED_POINTS`. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.

> property emission_point_count : int ; setter=set_emission_point_count ; getter=get_emission_point_count

The number of emission points if `emission_shape` is set to `EMISSION_SHAPE_POINTS` or `EMISSION_SHAPE_DIRECTED_POINTS`.

> property emission_point_texture : Texture2D ; setter=set_emission_point_texture ; getter=get_emission_point_texture

Particles will be emitted at positions determined by sampling this texture at a random position. Used with `EMISSION_SHAPE_POINTS` and `EMISSION_SHAPE_DIRECTED_POINTS`. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.

> property emission_ring_axis : Vector3 ; setter=set_emission_ring_axis ; getter=get_emission_ring_axis

The axis of the ring when using the emitter `EMISSION_SHAPE_RING`.

> property emission_ring_cone_angle : float ; setter=set_emission_ring_cone_angle ; getter=get_emission_ring_cone_angle

The angle of the cone when using the emitter `EMISSION_SHAPE_RING`. The default angle of 90 degrees results in a ring, while an angle of 0 degrees results in a cone. Intermediate values will result in a ring where one end is larger than the other.
**Note:** Depending on `emission_ring_height`, the angle may be clamped if the ring's end is reached to form a perfect cone.

> property emission_ring_height : float ; setter=set_emission_ring_height ; getter=get_emission_ring_height

The height of the ring when using the emitter `EMISSION_SHAPE_RING`.

> property emission_ring_inner_radius : float ; setter=set_emission_ring_inner_radius ; getter=get_emission_ring_inner_radius

The inner radius of the ring when using the emitter `EMISSION_SHAPE_RING`.

> property emission_ring_radius : float ; setter=set_emission_ring_radius ; getter=get_emission_ring_radius

The radius of the ring when using the emitter `EMISSION_SHAPE_RING`.

> property emission_shape : EmissionShape ; default=0 ; setter=set_emission_shape ; getter=get_emission_shape

Particles will be emitted inside this region.

> property emission_shape_offset : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_emission_shape_offset ; getter=get_emission_shape_offset

The offset for the `emission_shape`, in local space.

> property emission_shape_scale : Vector3 ; default=Vector3(1, 1, 1) ; setter=set_emission_shape_scale ; getter=get_emission_shape_scale

The scale of the `emission_shape`, in local space.

> property emission_sphere_radius : float ; setter=set_emission_sphere_radius ; getter=get_emission_sphere_radius

The sphere's radius if `emission_shape` is set to `EMISSION_SHAPE_SPHERE`.

> property flatness : float ; default=0.0 ; setter=set_flatness ; getter=get_flatness

Amount of `spread` along the Y axis.

> property gravity : Vector3 ; default=Vector3(0, -9.8, 0) ; setter=set_gravity ; getter=get_gravity

Gravity applied to every particle.

> property hue_variation_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Each particle's hue will vary along this `CurveTexture`.

> property hue_variation_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum initial hue variation applied to each particle. It will shift the particle color's hue.

> property hue_variation_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `hue_variation_max`.

> property inherit_velocity_ratio : float ; default=0.0 ; setter=set_inherit_velocity_ratio ; getter=get_inherit_velocity_ratio

Percentage of the velocity of the respective `GPUParticles2D` or `GPUParticles3D` inherited by each particle when spawning.

> property initial_velocity_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum initial velocity magnitude for each particle. Direction comes from `direction` and `spread`.

> property initial_velocity_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `initial_velocity_max`.

> property lifetime_randomness : float ; default=0.0 ; setter=set_lifetime_randomness ; getter=get_lifetime_randomness

Particle lifetime randomness ratio. The equation for the lifetime of a particle is `lifetime * (1.0 - randf() * lifetime_randomness)`. For example, a `lifetime_randomness` of `0.4` scales the lifetime between `0.6` to `1.0` of its original value.

> property linear_accel_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Each particle's linear acceleration will vary along this `CurveTexture`.

> property linear_accel_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum linear acceleration applied to each particle in the direction of motion.

> property linear_accel_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `linear_accel_max`.

> property orbit_velocity_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Each particle's orbital velocity will vary along this `CurveTexture`.
**Note:** For 3D orbital velocity, use a `CurveXYZTexture`.
**Note:** Animated velocities will not be affected by damping, use `velocity_limit_curve` instead.

> property orbit_velocity_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum orbital velocity applied to each particle. Makes the particles circle around origin. Specified in number of full rotations around origin per second.
**Note:** Animated velocities will not be affected by damping, use `velocity_limit_curve` instead.

> property orbit_velocity_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `orbit_velocity_max`.
**Note:** Animated velocities will not be affected by damping, use `velocity_limit_curve` instead.

> property particle_flag_align_y : bool ; default=false ; setter=set_particle_flag ; getter=get_particle_flag

Align Y axis of particle with the direction of its velocity.

> property particle_flag_damping_as_friction : bool ; default=false ; setter=set_particle_flag ; getter=get_particle_flag

Changes the behavior of the damping properties from a linear deceleration to a deceleration based on speed percentage.

> property particle_flag_disable_z : bool ; default=false ; setter=set_particle_flag ; getter=get_particle_flag

If `true`, particles will not move on the z axis.

> property particle_flag_inherit_emitter_scale : bool ; default=false ; setter=set_particle_flag ; getter=get_particle_flag

If `true`, particles will inherit the scale of the emitter.
**Note:** This has no effect when `GPUParticles3D.local_coords` is `true`, since particles in local space are already affected by the emitter's scale.

> property particle_flag_rotate_y : bool ; default=false ; setter=set_particle_flag ; getter=get_particle_flag

If `true`, particles rotate around Y axis by `angle_min`.

> property radial_accel_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Each particle's radial acceleration will vary along this `CurveTexture`.

> property radial_accel_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum radial acceleration applied to each particle. Makes particle accelerate away from the origin or towards it if negative.

> property radial_accel_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `radial_accel_max`.

> property radial_velocity_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

A `CurveTexture` that defines the velocity over the particle's lifetime away (or toward) the `velocity_pivot`.
**Note:** Animated velocities will not be affected by damping, use `velocity_limit_curve` instead.

> property radial_velocity_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum radial velocity applied to each particle. Makes particles move away from the `velocity_pivot`, or toward it if negative.
**Note:** Animated velocities will not be affected by damping, use `velocity_limit_curve` instead.

> property radial_velocity_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum radial velocity applied to each particle. Makes particles move away from the `velocity_pivot`, or toward it if negative.
**Note:** Animated velocities will not be affected by damping, use `velocity_limit_curve` instead.

> property rotation_3d_max : Vector3 ; setter=set_rotation_3d_max ; getter=get_rotation_3d_max

The maximum 3D orientation, in degrees. Works only in 3D and if `use_rotation_3d` is enabled.

> property rotation_3d_min : Vector3 ; setter=set_rotation_3d_min ; getter=get_rotation_3d_min

The minimum 3D orientation, in degrees. Works only in 3D and if `use_rotation_3d` is enabled.

> property rotation_velocity_3d_curve : Texture2D ; setter=set_rotation_velocity_3d_curve ; getter=get_rotation_velocity_3d_curve

Rotation velocity curve over lifetime, per-axis. Enable `use_rotation_velocity_3d` to use this.

> property rotation_velocity_3d_max : Vector3 ; setter=set_rotation_velocity_3d_max ; getter=get_rotation_velocity_3d_max

Maximum 3D rotation velocity on the particle's local axis. Enable `use_rotation_velocity_3d` to use this.

> property rotation_velocity_3d_min : Vector3 ; setter=set_rotation_velocity_3d_min ; getter=get_rotation_velocity_3d_min

Minimum 3D rotation velocity on the particle's local axis. Enable `use_rotation_velocity_3d` to use this.

> property scale_3d_max : Vector3 ; setter=set_scale_3d_max ; getter=get_scale_3d_max

The maximum value of the random scale vector for each particle.
Works only if `use_scale_3d` is enabled.

> property scale_3d_min : Vector3 ; setter=set_scale_3d_min ; getter=get_scale_3d_min

The minimum value of the random scale vector for each particle.
Works only if `use_scale_3d` is enabled.

> property scale_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Each particle's scale will vary along this `CurveTexture` over its lifetime. If a `CurveXYZTexture` is supplied instead, the scale will be separated per-axis.

> property scale_max : float ; default=1.0 ; setter=set_param_max ; getter=get_param_max

Maximum initial scale applied to each particle.

> property scale_min : float ; default=1.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `scale_max`.

> property scale_over_velocity_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Either a `CurveTexture` or a `CurveXYZTexture` that scales each particle based on its velocity.

> property scale_over_velocity_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum velocity value reference for `scale_over_velocity_curve`.
`scale_over_velocity_curve` will be interpolated between `scale_over_velocity_min` and `scale_over_velocity_max`.

> property scale_over_velocity_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum velocity value reference for `scale_over_velocity_curve`.
`scale_over_velocity_curve` will be interpolated between `scale_over_velocity_min` and `scale_over_velocity_max`.

> property spread : float ; default=45.0 ; setter=set_spread ; getter=get_spread

Each particle's initial direction range from `+spread` to `-spread` degrees.

> property sub_emitter_amount_at_collision : int ; setter=set_sub_emitter_amount_at_collision ; getter=get_sub_emitter_amount_at_collision

The amount of particles to spawn from the subemitter node when a collision occurs. When combined with `COLLISION_HIDE_ON_CONTACT` on the main particles material, this can be used to achieve effects such as raindrops hitting the ground.
**Note:** This value shouldn't exceed `GPUParticles2D.amount` or `GPUParticles3D.amount` defined on the *subemitter node* (not the main node), relative to the subemitter's particle lifetime. If the number of particles is exceeded, no new particles will spawn from the subemitter until enough particles have expired.

> property sub_emitter_amount_at_end : int ; setter=set_sub_emitter_amount_at_end ; getter=get_sub_emitter_amount_at_end

The amount of particles to spawn from the subemitter node when the particle expires.
**Note:** This value shouldn't exceed `GPUParticles2D.amount` or `GPUParticles3D.amount` defined on the *subemitter node* (not the main node), relative to the subemitter's particle lifetime. If the number of particles is exceeded, no new particles will spawn from the subemitter until enough particles have expired.

> property sub_emitter_amount_at_start : int ; setter=set_sub_emitter_amount_at_start ; getter=get_sub_emitter_amount_at_start

The amount of particles to spawn from the subemitter node when the particle spawns.
**Note:** This value shouldn't exceed `GPUParticles2D.amount` or `GPUParticles3D.amount` defined on the *subemitter node* (not the main node), relative to the subemitter's particle lifetime. If the number of particles is exceeded, no new particles will spawn from the subemitter until enough particles have expired.

> property sub_emitter_frequency : float ; setter=set_sub_emitter_frequency ; getter=get_sub_emitter_frequency

The frequency at which particles should be emitted from the subemitter node. One particle will be spawned every `sub_emitter_frequency` seconds.
**Note:** This value shouldn't exceed `GPUParticles2D.amount` or `GPUParticles3D.amount` defined on the *subemitter node* (not the main node), relative to the subemitter's particle lifetime. If the number of particles is exceeded, no new particles will spawn from the subemitter until enough particles have expired.

> property sub_emitter_keep_velocity : bool ; default=false ; setter=set_sub_emitter_keep_velocity ; getter=get_sub_emitter_keep_velocity

If `true`, the subemitter inherits the parent particle's velocity when it spawns.

> property sub_emitter_mode : SubEmitterMode ; default=0 ; setter=set_sub_emitter_mode ; getter=get_sub_emitter_mode

The particle subemitter mode (see `GPUParticles2D.sub_emitter` and `GPUParticles3D.sub_emitter`).

> property tangential_accel_curve : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Each particle's tangential acceleration will vary along this `CurveTexture`.

> property tangential_accel_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum tangential acceleration applied to each particle. Tangential acceleration is perpendicular to the particle's velocity giving the particles a swirling motion.

> property tangential_accel_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `tangential_accel_max`.

> property turbulence_enabled : bool ; default=false ; setter=set_turbulence_enabled ; getter=get_turbulence_enabled

If `true`, enables turbulence for the particle system. Turbulence can be used to vary particle movement according to its position (based on a 3D noise pattern). In 3D, `GPUParticlesAttractorVectorField3D` with `NoiseTexture3D` can be used as an alternative to turbulence that works in world space and with multiple particle systems reacting in the same way.
**Note:** Enabling turbulence has a high performance cost on the GPU. Only enable turbulence on a few particle systems at once at most, and consider disabling it when targeting mobile/web platforms.

> property turbulence_influence_max : float ; default=0.1 ; setter=set_param_max ; getter=get_param_max

Maximum turbulence influence on each particle.
The actual amount of turbulence influence on each particle is calculated as a random value between `turbulence_influence_min` and `turbulence_influence_max` and multiplied by the amount of turbulence influence from `turbulence_influence_over_life`.

> property turbulence_influence_min : float ; default=0.1 ; setter=set_param_min ; getter=get_param_min

Minimum turbulence influence on each particle.
The actual amount of turbulence influence on each particle is calculated as a random value between `turbulence_influence_min` and `turbulence_influence_max` and multiplied by the amount of turbulence influence from `turbulence_influence_over_life`.

> property turbulence_influence_over_life : Texture2D ; setter=set_param_texture ; getter=get_param_texture

Each particle's amount of turbulence will be influenced along this `CurveTexture` over its life time.

> property turbulence_initial_displacement_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum displacement of each particle's spawn position by the turbulence.
The actual amount of displacement will be a factor of the underlying turbulence multiplied by a random value between `turbulence_initial_displacement_min` and `turbulence_initial_displacement_max`.

> property turbulence_initial_displacement_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum displacement of each particle's spawn position by the turbulence.
The actual amount of displacement will be a factor of the underlying turbulence multiplied by a random value between `turbulence_initial_displacement_min` and `turbulence_initial_displacement_max`.

> property turbulence_noise_scale : float ; default=9.0 ; setter=set_turbulence_noise_scale ; getter=get_turbulence_noise_scale

This value controls the overall scale/frequency of the turbulence noise pattern.
A small scale will result in smaller features with more detail while a high scale will result in smoother noise with larger features.

> property turbulence_noise_speed : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_turbulence_noise_speed ; getter=get_turbulence_noise_speed

A scrolling velocity for the turbulence field. This sets a directional trend for the pattern to move in over time.
The default value of `Vector3(0, 0, 0)` turns off the scrolling.

> property turbulence_noise_speed_random : float ; default=0.2 ; setter=set_turbulence_noise_speed_random ; getter=get_turbulence_noise_speed_random

The in-place rate of change of the turbulence field. This defines how quickly the noise pattern varies over time.
A value of 0.0 will result in a fixed pattern.

> property turbulence_noise_strength : float ; default=1.0 ; setter=set_turbulence_noise_strength ; getter=get_turbulence_noise_strength

The turbulence noise strength. Increasing this will result in a stronger, more contrasting, flow pattern.

> property use_rotation_3d : bool ; default=false ; setter=set_use_rotation_3d ; getter=is_using_rotation_3d

Enable the usage of `rotation_3d_min` and `rotation_3d_max`.

> property use_rotation_velocity_3d : bool ; default=false ; setter=set_using_rotation_velocity_3d ; getter=is_using_rotation_velocity_3d

Enable 3D rotation velocity.

> property use_scale_3d : bool ; default=false ; setter=set_use_scale_3d ; getter=is_using_scale_3d

Enable the usage of `scale_3d_min` and `scale_3d_max`.

> property velocity_limit_curve : Texture2D ; setter=set_velocity_limit_curve ; getter=get_velocity_limit_curve

A `CurveTexture` that defines the maximum velocity of a particle during its lifetime.

> property velocity_pivot : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_velocity_pivot ; getter=get_velocity_pivot

A pivot point used to calculate radial and orbital velocity of particles.

## Methods

> method get_param(param: Parameter) -> Vector2 ; qualifiers=const

Returns the minimum and maximum values of the given `param` as a vector.
The `x` component of the returned vector corresponds to minimum and the `y` component corresponds to maximum.

> method get_param_max(param: Parameter) -> float ; qualifiers=const

Returns the maximum value range for the given parameter.

> method get_param_min(param: Parameter) -> float ; qualifiers=const

Returns the minimum value range for the given parameter.

> method get_param_texture(param: Parameter) -> Texture2D ; qualifiers=const

Returns the `Texture2D` used by the specified parameter.

> method get_particle_flag(particle_flag: ParticleFlags) -> bool ; qualifiers=const

Returns `true` if the specified particle flag is enabled.

> method set_param(param: Parameter, value: Vector2) -> void

Sets the minimum and maximum values of the given `param`.
The `x` component of the argument vector corresponds to minimum and the `y` component corresponds to maximum.

> method set_param_max(param: Parameter, value: float) -> void

Sets the maximum value range for the given parameter.

> method set_param_min(param: Parameter, value: float) -> void

Sets the minimum value range for the given parameter.

> method set_param_texture(param: Parameter, texture: Texture2D) -> void

Sets the `Texture2D` for the specified `Parameter`.

> method set_particle_flag(particle_flag: ParticleFlags, enable: bool) -> void

Sets the `particle_flag` to `enable`.

## Signals

> signal emission_shape_changed()

Emitted when this material's emission shape is changed in any way. This includes changes to `emission_shape`, `emission_shape_scale`, or `emission_sphere_radius`, and any other property that affects the emission shape's offset, size, scale, or orientation.
**Note:** This signal is only emitted inside the editor for performance reasons.

## Enumerations

> enum CollisionMode

> enum_value CollisionMode.COLLISION_DISABLED = 0

No collision for particles. Particles will go through `GPUParticlesCollision3D` nodes.

> enum_value CollisionMode.COLLISION_RIGID = 1

`RigidBody3D`-style collision for particles using `GPUParticlesCollision3D` nodes.

> enum_value CollisionMode.COLLISION_HIDE_ON_CONTACT = 2

Hide particles instantly when colliding with a `GPUParticlesCollision3D` node. This can be combined with a subemitter that uses the `COLLISION_RIGID` collision mode to "replace" the parent particle with the subemitter on impact.

> enum_value CollisionMode.COLLISION_MAX = 3

Represents the size of the `CollisionMode` enum.

> enum EmissionShape

> enum_value EmissionShape.EMISSION_SHAPE_POINT = 0

All particles will be emitted from a single point.

> enum_value EmissionShape.EMISSION_SHAPE_SPHERE = 1

Particles will be emitted in the volume of a sphere.

> enum_value EmissionShape.EMISSION_SHAPE_SPHERE_SURFACE = 2

Particles will be emitted on the surface of a sphere.

> enum_value EmissionShape.EMISSION_SHAPE_BOX = 3

Particles will be emitted in the volume of a box.

> enum_value EmissionShape.EMISSION_SHAPE_POINTS = 4

Particles will be emitted at a position determined by sampling a random point on the `emission_point_texture`. Particle color will be modulated by `emission_color_texture`.

> enum_value EmissionShape.EMISSION_SHAPE_DIRECTED_POINTS = 5

Particles will be emitted at a position determined by sampling a random point on the `emission_point_texture`. Particle velocity and rotation will be set based on `emission_normal_texture`. Particle color will be modulated by `emission_color_texture`.

> enum_value EmissionShape.EMISSION_SHAPE_RING = 6

Particles will be emitted in a ring or cylinder.

> enum_value EmissionShape.EMISSION_SHAPE_MAX = 7

Represents the size of the `EmissionShape` enum.

> enum Parameter

> enum_value Parameter.PARAM_INITIAL_LINEAR_VELOCITY = 0

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set initial velocity properties.

> enum_value Parameter.PARAM_ANGULAR_VELOCITY = 1

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set angular velocity properties.

> enum_value Parameter.PARAM_ORBIT_VELOCITY = 2

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set orbital velocity properties.

> enum_value Parameter.PARAM_LINEAR_ACCEL = 3

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set linear acceleration properties.

> enum_value Parameter.PARAM_RADIAL_ACCEL = 4

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set radial acceleration properties.

> enum_value Parameter.PARAM_TANGENTIAL_ACCEL = 5

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set tangential acceleration properties.

> enum_value Parameter.PARAM_DAMPING = 6

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set damping properties.

> enum_value Parameter.PARAM_ANGLE = 7

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set angle properties.

> enum_value Parameter.PARAM_SCALE = 8

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set scale properties.

> enum_value Parameter.PARAM_HUE_VARIATION = 9

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set hue variation properties.

> enum_value Parameter.PARAM_ANIM_SPEED = 10

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set animation speed properties.

> enum_value Parameter.PARAM_ANIM_OFFSET = 11

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set animation offset properties.

> enum_value Parameter.PARAM_RADIAL_VELOCITY = 15

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set radial velocity properties.

> enum_value Parameter.PARAM_DIRECTIONAL_VELOCITY = 16

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set directional velocity properties.

> enum_value Parameter.PARAM_SCALE_OVER_VELOCITY = 17

Use with `set_param_min`, `set_param_max`, and `set_param_texture` to set scale over velocity properties.

> enum_value Parameter.PARAM_MAX = 18

Represents the size of the `Parameter` enum.

> enum_value Parameter.PARAM_TURB_VEL_INFLUENCE = 13

Use with `set_param_min` and `set_param_max` to set the turbulence minimum und maximum influence on each particles velocity.

> enum_value Parameter.PARAM_TURB_INIT_DISPLACEMENT = 14

Use with `set_param_min` and `set_param_max` to set the turbulence minimum and maximum displacement of the particles spawn position.

> enum_value Parameter.PARAM_TURB_INFLUENCE_OVER_LIFE = 12

Use with `set_param_texture` to set the turbulence influence over the particles life time.

> enum ParticleFlags

> enum_value ParticleFlags.PARTICLE_FLAG_ALIGN_Y_TO_VELOCITY = 0

Use with `set_particle_flag` to set `particle_flag_align_y`.

> enum_value ParticleFlags.PARTICLE_FLAG_ROTATE_Y = 1

Use with `set_particle_flag` to set `particle_flag_rotate_y`.

> enum_value ParticleFlags.PARTICLE_FLAG_DISABLE_Z = 2

Use with `set_particle_flag` to set `particle_flag_disable_z`.

> enum_value ParticleFlags.PARTICLE_FLAG_DAMPING_AS_FRICTION = 3

> enum_value ParticleFlags.PARTICLE_FLAG_INHERIT_EMITTER_SCALE = 4

> enum_value ParticleFlags.PARTICLE_FLAG_MAX = 5

Represents the size of the `ParticleFlags` enum.

> enum SubEmitterMode

> enum_value SubEmitterMode.SUB_EMITTER_DISABLED = 0

The subemitter is disabled.

> enum_value SubEmitterMode.SUB_EMITTER_CONSTANT = 1

The submitter is emitted on the constant interval defined by `sub_emitter_frequency`.

> enum_value SubEmitterMode.SUB_EMITTER_AT_END = 2

The subemitter is emitted at the end of the particle's lifetime.

> enum_value SubEmitterMode.SUB_EMITTER_AT_COLLISION = 3

The subemitter is emitted when the particle collides.

> enum_value SubEmitterMode.SUB_EMITTER_AT_START = 4

The subemitter is emitted when the particle spawns.

> enum_value SubEmitterMode.SUB_EMITTER_MAX = 5

Represents the size of the `SubEmitterMode` enum.
