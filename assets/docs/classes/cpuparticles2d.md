# CPUParticles2D

> class CPUParticles2D
> inherits CPUParticles2D Node2D

## Brief

A CPU-based 2D particle emitter.

## Description

CPU-based 2D particle node used to create a variety of particle systems and effects.
See also `GPUParticles2D`, which provides the same functionality with hardware acceleration, but may not run on older devices.

## Properties

> property amount : int ; default=8 ; setter=set_amount ; getter=get_amount

Number of particles emitted in one emission cycle.

> property angle_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's rotation will be animated along this `Curve`. Should be a unit `Curve`.

> property angle_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum initial rotation applied to each particle, in degrees.

> property angle_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `angle_max`.

> property angular_velocity_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's angular velocity will vary along this `Curve`. Should be a unit `Curve`.

> property angular_velocity_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum initial angular velocity (rotation speed) applied to each particle in *degrees* per second.

> property angular_velocity_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `angular_velocity_max`.

> property anim_offset_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's animation offset will vary along this `Curve`. Should be a unit `Curve`.

> property anim_offset_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum animation offset that corresponds to frame index in the texture. `0` is the first frame, `1` is the last one. See `CanvasItemMaterial.particles_animation`.

> property anim_offset_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `anim_offset_max`.

> property anim_speed_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's animation speed will vary along this `Curve`. Should be a unit `Curve`.

> property anim_speed_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum particle animation speed. Animation speed of `1` means that the particles will make full `0` to `1` offset cycle during lifetime, `2` means `2` cycles etc.
With animation speed greater than `1`, remember to enable `CanvasItemMaterial.particles_anim_loop` property if you want the animation to repeat.

> property anim_speed_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `anim_speed_max`.

> property color : Color ; default=Color(1, 1, 1, 1) ; setter=set_color ; getter=get_color

Each particle's initial color. If `texture` is defined, it will be multiplied by this color.

> property color_initial_ramp : Gradient ; setter=set_color_initial_ramp ; getter=get_color_initial_ramp

Each particle's initial color will vary along this `Gradient` (multiplied with `color`).

> property color_ramp : Gradient ; setter=set_color_ramp ; getter=get_color_ramp

Each particle's color will vary along this `Gradient` over its lifetime (multiplied with `color`).

> property damping_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Damping will vary along this `Curve`. Should be a unit `Curve`.

> property damping_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

The maximum rate at which particles lose velocity. For example value of `100` means that the particle will go from `100` velocity to `0` in `1` second.

> property damping_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `damping_max`.

> property direction : Vector2 ; default=Vector2(1, 0) ; setter=set_direction ; getter=get_direction

Unit vector specifying the particles' emission direction.

> property draw_order : DrawOrder ; default=0 ; setter=set_draw_order ; getter=get_draw_order

Particle draw order.

> property emission_colors : PackedColorArray ; setter=set_emission_colors ; getter=get_emission_colors

Sets the `Color`s to modulate particles by when using `EMISSION_SHAPE_POINTS` or `EMISSION_SHAPE_DIRECTED_POINTS`.

> property emission_normals : PackedVector2Array ; setter=set_emission_normals ; getter=get_emission_normals

Sets the direction the particles will be emitted in when using `EMISSION_SHAPE_DIRECTED_POINTS`.

> property emission_points : PackedVector2Array ; setter=set_emission_points ; getter=get_emission_points

Sets the initial positions to spawn particles when using `EMISSION_SHAPE_POINTS` or `EMISSION_SHAPE_DIRECTED_POINTS`.

> property emission_rect_extents : Vector2 ; setter=set_emission_rect_extents ; getter=get_emission_rect_extents

The rectangle's extents if `emission_shape` is set to `EMISSION_SHAPE_RECTANGLE`.

> property emission_ring_inner_radius : float ; setter=set_emission_ring_inner_radius ; getter=get_emission_ring_inner_radius

The ring's inner radius if `emission_shape` is set to `EMISSION_SHAPE_RING`.

> property emission_ring_radius : float ; setter=set_emission_ring_radius ; getter=get_emission_ring_radius

The ring's outer radius if `emission_shape` is set to `EMISSION_SHAPE_RING`.

> property emission_shape : EmissionShape ; default=0 ; setter=set_emission_shape ; getter=get_emission_shape

Particles will be emitted inside this region.

> property emission_sphere_radius : float ; setter=set_emission_sphere_radius ; getter=get_emission_sphere_radius

The sphere's radius if `emission_shape` is set to `EMISSION_SHAPE_SPHERE`.

> property emitting : bool ; default=true ; setter=set_emitting ; getter=is_emitting

If `true`, particles are being emitted. `emitting` can be used to start and stop particles from emitting. However, if `one_shot` is `true` setting `emitting` to `true` will not restart the emission cycle until after all active particles finish processing. You can use the `finished` signal to be notified once all active particles finish processing.

> property explosiveness : float ; default=0.0 ; setter=set_explosiveness_ratio ; getter=get_explosiveness_ratio

How rapidly particles in an emission cycle are emitted. If greater than `0`, there will be a gap in emissions before the next cycle begins.

> property fixed_fps : int ; default=0 ; setter=set_fixed_fps ; getter=get_fixed_fps

The particle system's frame rate is fixed to a value. For example, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.

> property fract_delta : bool ; default=true ; setter=set_fractional_delta ; getter=get_fractional_delta

If `true`, results in fractional delta calculation which has a smoother particles display effect.

> property gravity : Vector2 ; default=Vector2(0, 980) ; setter=set_gravity ; getter=get_gravity

Gravity applied to every particle.

> property hue_variation_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's hue will vary along this `Curve`. Should be a unit `Curve`.

> property hue_variation_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum initial hue variation applied to each particle. It will shift the particle color's hue.

> property hue_variation_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `hue_variation_max`.

> property initial_velocity_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum initial velocity magnitude for each particle. Direction comes from `direction` and `spread`.

> property initial_velocity_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `initial_velocity_max`.

> property lifetime : float ; default=1.0 ; setter=set_lifetime ; getter=get_lifetime

Amount of time each particle will exist.

> property lifetime_randomness : float ; default=0.0 ; setter=set_lifetime_randomness ; getter=get_lifetime_randomness

Particle lifetime randomness ratio.

> property linear_accel_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's linear acceleration will vary along this `Curve`. Should be a unit `Curve`.

> property linear_accel_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum linear acceleration applied to each particle in the direction of motion.

> property linear_accel_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `linear_accel_max`.

> property local_coords : bool ; default=false ; setter=set_use_local_coordinates ; getter=get_use_local_coordinates

If `true`, particles use the parent node's coordinate space (known as local coordinates). This will cause particles to move and rotate along the `CPUParticles2D` node (and its parents) when it is moved or rotated. If `false`, particles use global coordinates; they will not move or rotate along the `CPUParticles2D` node (and its parents) when it is moved or rotated.

> property one_shot : bool ; default=false ; setter=set_one_shot ; getter=get_one_shot

If `true`, only one emission cycle occurs. If set `true` during a cycle, emission will stop at the cycle's end.

> property orbit_velocity_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's orbital velocity will vary along this `Curve`. Should be a unit `Curve`.

> property orbit_velocity_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum orbital velocity applied to each particle. Makes the particles circle around origin. Specified in number of full rotations around origin per second.

> property orbit_velocity_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `orbit_velocity_max`.

> property particle_flag_align_y : bool ; default=false ; setter=set_particle_flag ; getter=get_particle_flag

Align Y axis of particle with the direction of its velocity.

> property physics_interpolation_mode : Node.PhysicsInterpolationMode ; default=2 ; setter=set_physics_interpolation_mode ; getter=get_physics_interpolation_mode ; overrides=Node

> property preprocess : float ; default=0.0 ; setter=set_pre_process_time ; getter=get_pre_process_time

Particle system starts as if it had already run for this many seconds.

> property radial_accel_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's radial acceleration will vary along this `Curve`. Should be a unit `Curve`.

> property radial_accel_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum radial acceleration applied to each particle. Makes particle accelerate away from the origin or towards it if negative.

> property radial_accel_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `radial_accel_max`.

> property randomness : float ; default=0.0 ; setter=set_randomness_ratio ; getter=get_randomness_ratio

Emission lifetime randomness ratio.

> property scale_amount_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's scale will vary along this `Curve`. Should be a unit `Curve`.

> property scale_amount_max : float ; default=1.0 ; setter=set_param_max ; getter=get_param_max

Maximum initial scale applied to each particle.

> property scale_amount_min : float ; default=1.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `scale_amount_max`.

> property scale_curve_x : Curve ; setter=set_scale_curve_x ; getter=get_scale_curve_x

Each particle's horizontal scale will vary along this `Curve`. Should be a unit `Curve`.
`split_scale` must be enabled.

> property scale_curve_y : Curve ; setter=set_scale_curve_y ; getter=get_scale_curve_y

Each particle's vertical scale will vary along this `Curve`. Should be a unit `Curve`.
`split_scale` must be enabled.

> property seed : int ; default=0 ; setter=set_seed ; getter=get_seed

Sets the random seed used by the particle system. Only effective if `use_fixed_seed` is `true`.

> property speed_scale : float ; default=1.0 ; setter=set_speed_scale ; getter=get_speed_scale

Particle system's running speed scaling ratio. A value of `0` can be used to pause the particles.

> property split_scale : bool ; default=false ; setter=set_split_scale ; getter=get_split_scale

If `true`, the scale curve will be split into x and y components. See `scale_curve_x` and `scale_curve_y`.

> property spread : float ; default=45.0 ; setter=set_spread ; getter=get_spread

Each particle's initial direction range from `+spread` to `-spread` degrees.

> property tangential_accel_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's tangential acceleration will vary along this `Curve`. Should be a unit `Curve`.

> property tangential_accel_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum tangential acceleration applied to each particle. Tangential acceleration is perpendicular to the particle's velocity giving the particles a swirling motion.

> property tangential_accel_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum equivalent of `tangential_accel_max`.

> property texture : Texture2D ; setter=set_texture ; getter=get_texture

Particle texture. If `null`, particles will be squares.

> property use_fixed_seed : bool ; default=false ; setter=set_use_fixed_seed ; getter=get_use_fixed_seed

If `true`, particles will use the same seed for every simulation using the seed defined in `seed`. This is useful for situations where the visual outcome should be consistent across replays, for example when using Movie Maker mode.

## Methods

> method convert_from_particles(particles: Node) -> void

Sets this node's properties to match a given `GPUParticles2D` node with an assigned `ParticleProcessMaterial`.

> method get_param_curve(param: Parameter) -> Curve ; qualifiers=const

Returns the `Curve` of the parameter specified by `Parameter`.

> method get_param_max(param: Parameter) -> float ; qualifiers=const

Returns the maximum value range for the given parameter.

> method get_param_min(param: Parameter) -> float ; qualifiers=const

Returns the minimum value range for the given parameter.

> method get_particle_flag(particle_flag: ParticleFlags) -> bool ; qualifiers=const

Returns the enabled state of the given particle flag.

> method request_particles_process(process_time: float, process_time_residual: float = 0.0) -> void

Requests the particles to process for extra process time during a single frame.
`process_time` defines the time that the particles will process while emitting is on. `process_time_residual` defines the time that particles will process with emitting turned off for the simulation. When combined with `speed_scale` set to `0.0`, this is useful to be able to seek a particle system timeline.

> method restart(keep_seed: bool = false) -> void

Restarts the particle emitter.
If `keep_seed` is `true`, the current random seed will be preserved. Useful for seeking and playback.

> method set_param_curve(param: Parameter, curve: Curve) -> void

Sets the `Curve` of the parameter specified by `Parameter`. Should be a unit `Curve`.

> method set_param_max(param: Parameter, value: float) -> void

Sets the maximum value for the given parameter.

> method set_param_min(param: Parameter, value: float) -> void

Sets the minimum value for the given parameter.

> method set_particle_flag(particle_flag: ParticleFlags, enable: bool) -> void

Enables or disables the given particle flag.

## Signals

> signal finished()

Emitted when all active particles have finished processing. When `one_shot` is disabled, particles will process continuously, so this is never emitted.

## Enumerations

> enum DrawOrder

> enum_value DrawOrder.DRAW_ORDER_INDEX = 0

Particles are drawn in the order emitted.

> enum_value DrawOrder.DRAW_ORDER_LIFETIME = 1

Particles are drawn in order of remaining lifetime. In other words, the particle with the highest lifetime is drawn at the front.

> enum EmissionShape

> enum_value EmissionShape.EMISSION_SHAPE_POINT = 0

All particles will be emitted from a single point.

> enum_value EmissionShape.EMISSION_SHAPE_SPHERE = 1

Particles will be emitted in the volume of a sphere flattened to two dimensions.

> enum_value EmissionShape.EMISSION_SHAPE_SPHERE_SURFACE = 2

Particles will be emitted on the surface of a sphere flattened to two dimensions.

> enum_value EmissionShape.EMISSION_SHAPE_RECTANGLE = 3

Particles will be emitted in the area of a rectangle.

> enum_value EmissionShape.EMISSION_SHAPE_POINTS = 4

Particles will be emitted at a position chosen randomly among `emission_points`. Particle color will be modulated by `emission_colors`.

> enum_value EmissionShape.EMISSION_SHAPE_DIRECTED_POINTS = 5

Particles will be emitted at a position chosen randomly among `emission_points`. Particle velocity and rotation will be set based on `emission_normals`. Particle color will be modulated by `emission_colors`.

> enum_value EmissionShape.EMISSION_SHAPE_RING = 6

Particles will be emitted in the area of a ring parameterized by its outer and inner radius.

> enum_value EmissionShape.EMISSION_SHAPE_MAX = 7

Represents the size of the `EmissionShape` enum.

> enum Parameter

> enum_value Parameter.PARAM_INITIAL_LINEAR_VELOCITY = 0

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set initial velocity properties.

> enum_value Parameter.PARAM_ANGULAR_VELOCITY = 1

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set angular velocity properties.

> enum_value Parameter.PARAM_ORBIT_VELOCITY = 2

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set orbital velocity properties.

> enum_value Parameter.PARAM_LINEAR_ACCEL = 3

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set linear acceleration properties.

> enum_value Parameter.PARAM_RADIAL_ACCEL = 4

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set radial acceleration properties.

> enum_value Parameter.PARAM_TANGENTIAL_ACCEL = 5

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set tangential acceleration properties.

> enum_value Parameter.PARAM_DAMPING = 6

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set damping properties.

> enum_value Parameter.PARAM_ANGLE = 7

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set angle properties.

> enum_value Parameter.PARAM_SCALE = 8

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set scale properties.

> enum_value Parameter.PARAM_HUE_VARIATION = 9

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set hue variation properties.

> enum_value Parameter.PARAM_ANIM_SPEED = 10

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set animation speed properties.

> enum_value Parameter.PARAM_ANIM_OFFSET = 11

Use with `set_param_min`, `set_param_max`, and `set_param_curve` to set animation offset properties.

> enum_value Parameter.PARAM_MAX = 12

Represents the size of the `Parameter` enum.

> enum ParticleFlags

> enum_value ParticleFlags.PARTICLE_FLAG_ALIGN_Y_TO_VELOCITY = 0

Use with `set_particle_flag` to set `particle_flag_align_y`.

> enum_value ParticleFlags.PARTICLE_FLAG_ROTATE_Y = 1

Present for consistency with 3D particle nodes, not used in 2D.

> enum_value ParticleFlags.PARTICLE_FLAG_DISABLE_Z = 2

Present for consistency with 3D particle nodes, not used in 2D.

> enum_value ParticleFlags.PARTICLE_FLAG_MAX = 3

Represents the size of the `ParticleFlags` enum.

## Tutorials
- [Particle systems (2D)]($DOCS_URL/tutorials/2d/particle_systems_2d.html)
