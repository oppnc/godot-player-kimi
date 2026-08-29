# CPUParticles3D

> class CPUParticles3D
> inherits CPUParticles3D GeometryInstance3D

## Brief

A CPU-based 3D particle emitter.

## Description

CPU-based 3D particle node used to create a variety of particle systems and effects.
See also `GPUParticles3D`, which provides the same functionality with hardware acceleration, but may not run on older devices.

## Properties

> property amount : int ; default=8 ; setter=set_amount ; getter=get_amount

Number of particles emitted in one emission cycle.

> property angle_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's rotation will be animated along this `Curve`. Should be a unit `Curve`.

> property angle_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum angle.

> property angle_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum angle.

> property angular_velocity_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's angular velocity (rotation speed) will vary along this `Curve` over its lifetime. Should be a unit `Curve`.

> property angular_velocity_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum initial angular velocity (rotation speed) applied to each particle in *degrees* per second.

> property angular_velocity_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum initial angular velocity (rotation speed) applied to each particle in *degrees* per second.

> property anim_offset_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's animation offset will vary along this `Curve`. Should be a unit `Curve`.

> property anim_offset_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum animation offset.

> property anim_offset_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum animation offset.

> property anim_speed_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's animation speed will vary along this `Curve`. Should be a unit `Curve`.

> property anim_speed_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum particle animation speed.

> property anim_speed_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum particle animation speed.

> property color : Color ; default=Color(1, 1, 1, 1) ; setter=set_color ; getter=get_color

Each particle's initial color.
**Note:** `color` multiplies the particle mesh's vertex colors. To have a visible effect on a `BaseMaterial3D`, `BaseMaterial3D.vertex_color_use_as_albedo` *must* be `true`. For a `ShaderMaterial`, `ALBEDO *= COLOR.rgb;` must be inserted in the shader's `fragment()` function. Otherwise, `color` will have no visible effect.

> property color_initial_ramp : Gradient ; setter=set_color_initial_ramp ; getter=get_color_initial_ramp

Each particle's initial color will vary along this `Gradient` (multiplied with `color`).
**Note:** `color_initial_ramp` multiplies the particle mesh's vertex colors. To have a visible effect on a `BaseMaterial3D`, `BaseMaterial3D.vertex_color_use_as_albedo` *must* be `true`. For a `ShaderMaterial`, `ALBEDO *= COLOR.rgb;` must be inserted in the shader's `fragment()` function. Otherwise, `color_initial_ramp` will have no visible effect.

> property color_ramp : Gradient ; setter=set_color_ramp ; getter=get_color_ramp

Each particle's color will vary along this `Gradient` over its lifetime (multiplied with `color`).
**Note:** `color_ramp` multiplies the particle mesh's vertex colors. To have a visible effect on a `BaseMaterial3D`, `BaseMaterial3D.vertex_color_use_as_albedo` *must* be `true`. For a `ShaderMaterial`, `ALBEDO *= COLOR.rgb;` must be inserted in the shader's `fragment()` function. Otherwise, `color_ramp` will have no visible effect.

> property damping_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Damping will vary along this `Curve`. Should be a unit `Curve`.

> property damping_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum damping.

> property damping_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum damping.

> property direction : Vector3 ; default=Vector3(1, 0, 0) ; setter=set_direction ; getter=get_direction

Unit vector specifying the particles' emission direction.

> property draw_order : DrawOrder ; default=0 ; setter=set_draw_order ; getter=get_draw_order

Particle draw order.

> property emission_box_extents : Vector3 ; setter=set_emission_box_extents ; getter=get_emission_box_extents

The rectangle's extents if `emission_shape` is set to `EMISSION_SHAPE_BOX`.

> property emission_colors : PackedColorArray ; default=PackedColorArray() ; setter=set_emission_colors ; getter=get_emission_colors

Sets the `Color`s to modulate particles by when using `EMISSION_SHAPE_POINTS` or `EMISSION_SHAPE_DIRECTED_POINTS`.
**Note:** `emission_colors` multiplies the particle mesh's vertex colors. To have a visible effect on a `BaseMaterial3D`, `BaseMaterial3D.vertex_color_use_as_albedo` *must* be `true`. For a `ShaderMaterial`, `ALBEDO *= COLOR.rgb;` must be inserted in the shader's `fragment()` function. Otherwise, `emission_colors` will have no visible effect.

> property emission_normals : PackedVector3Array ; setter=set_emission_normals ; getter=get_emission_normals

Sets the direction the particles will be emitted in when using `EMISSION_SHAPE_DIRECTED_POINTS`.

> property emission_points : PackedVector3Array ; setter=set_emission_points ; getter=get_emission_points

Sets the initial positions to spawn particles when using `EMISSION_SHAPE_POINTS` or `EMISSION_SHAPE_DIRECTED_POINTS`.

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

> property emission_sphere_radius : float ; setter=set_emission_sphere_radius ; getter=get_emission_sphere_radius

The sphere's radius if `EmissionShape` is set to `EMISSION_SHAPE_SPHERE`.

> property emitting : bool ; default=true ; setter=set_emitting ; getter=is_emitting

If `true`, particles are being emitted. `emitting` can be used to start and stop particles from emitting. However, if `one_shot` is `true` setting `emitting` to `true` will not restart the emission cycle until after all active particles finish processing. You can use the `finished` signal to be notified once all active particles finish processing.

> property explosiveness : float ; default=0.0 ; setter=set_explosiveness_ratio ; getter=get_explosiveness_ratio

How rapidly particles in an emission cycle are emitted. If greater than `0`, there will be a gap in emissions before the next cycle begins.

> property fixed_fps : int ; default=0 ; setter=set_fixed_fps ; getter=get_fixed_fps

The particle system's frame rate is fixed to a value. For example, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the particle system itself.

> property flatness : float ; default=0.0 ; setter=set_flatness ; getter=get_flatness

Amount of `spread` in Y/Z plane. A value of `1` restricts particles to X/Z plane.

> property fract_delta : bool ; default=true ; setter=set_fractional_delta ; getter=get_fractional_delta

If `true`, results in fractional delta calculation which has a smoother particles display effect.

> property gravity : Vector3 ; default=Vector3(0, -9.8, 0) ; setter=set_gravity ; getter=get_gravity

Gravity applied to every particle.

> property hue_variation_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's hue will vary along this `Curve`. Should be a unit `Curve`.

> property hue_variation_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum hue variation.

> property hue_variation_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum hue variation.

> property initial_velocity_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum value of the initial velocity.

> property initial_velocity_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum value of the initial velocity.

> property lifetime : float ; default=1.0 ; setter=set_lifetime ; getter=get_lifetime

Amount of time each particle will exist.

> property lifetime_randomness : float ; default=0.0 ; setter=set_lifetime_randomness ; getter=get_lifetime_randomness

Particle lifetime randomness ratio.

> property linear_accel_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's linear acceleration will vary along this `Curve`. Should be a unit `Curve`.

> property linear_accel_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum linear acceleration.

> property linear_accel_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum linear acceleration.

> property local_coords : bool ; default=false ; setter=set_use_local_coordinates ; getter=get_use_local_coordinates

If `true`, particles use the parent node's coordinate space (known as local coordinates). This will cause particles to move and rotate along the `CPUParticles3D` node (and its parents) when it is moved or rotated. If `false`, particles use global coordinates; they will not move or rotate along the `CPUParticles3D` node (and its parents) when it is moved or rotated.

> property mesh : Mesh ; setter=set_mesh ; getter=get_mesh

The `Mesh` used for each particle. If `null`, particles will be spheres.

> property one_shot : bool ; default=false ; setter=set_one_shot ; getter=get_one_shot

If `true`, only one emission cycle occurs. If set `true` during a cycle, emission will stop at the cycle's end.

> property orbit_velocity_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's orbital velocity will vary along this `Curve`. Should be a unit `Curve`.

> property orbit_velocity_max : float ; setter=set_param_max ; getter=get_param_max

Maximum orbit velocity.

> property orbit_velocity_min : float ; setter=set_param_min ; getter=get_param_min

Minimum orbit velocity.

> property particle_flag_align_y : bool ; default=false ; setter=set_particle_flag ; getter=get_particle_flag

Align Y axis of particle with the direction of its velocity.

> property particle_flag_disable_z : bool ; default=false ; setter=set_particle_flag ; getter=get_particle_flag

If `true`, particles will not move on the Z axis.

> property particle_flag_rotate_y : bool ; default=false ; setter=set_particle_flag ; getter=get_particle_flag

If `true`, particles rotate around Y axis by `angle_min`.

> property preprocess : float ; default=0.0 ; setter=set_pre_process_time ; getter=get_pre_process_time

Particle system starts as if it had already run for this many seconds.

> property radial_accel_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's radial acceleration will vary along this `Curve`. Should be a unit `Curve`.

> property radial_accel_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum radial acceleration.

> property radial_accel_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum radial acceleration.

> property randomness : float ; default=0.0 ; setter=set_randomness_ratio ; getter=get_randomness_ratio

Emission lifetime randomness ratio.

> property scale_amount_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's scale will vary along this `Curve`. Should be a unit `Curve`.

> property scale_amount_max : float ; default=1.0 ; setter=set_param_max ; getter=get_param_max

Maximum scale.

> property scale_amount_min : float ; default=1.0 ; setter=set_param_min ; getter=get_param_min

Minimum scale.

> property scale_curve_x : Curve ; setter=set_scale_curve_x ; getter=get_scale_curve_x

Curve for the scale over life, along the x axis.

> property scale_curve_y : Curve ; setter=set_scale_curve_y ; getter=get_scale_curve_y

Curve for the scale over life, along the y axis.

> property scale_curve_z : Curve ; setter=set_scale_curve_z ; getter=get_scale_curve_z

Curve for the scale over life, along the z axis.

> property seed : int ; default=0 ; setter=set_seed ; getter=get_seed

Sets the random seed used by the particle system. Only effective if `use_fixed_seed` is `true`.

> property speed_scale : float ; default=1.0 ; setter=set_speed_scale ; getter=get_speed_scale

Particle system's running speed scaling ratio. A value of `0` can be used to pause the particles.

> property split_scale : bool ; default=false ; setter=set_split_scale ; getter=get_split_scale

If set to `true`, three different scale curves can be specified, one per scale axis.

> property spread : float ; default=45.0 ; setter=set_spread ; getter=get_spread

Each particle's initial direction range from `+spread` to `-spread` degrees. Applied to X/Z plane and Y/Z planes.

> property tangential_accel_curve : Curve ; setter=set_param_curve ; getter=get_param_curve

Each particle's tangential acceleration will vary along this `Curve`. Should be a unit `Curve`.

> property tangential_accel_max : float ; default=0.0 ; setter=set_param_max ; getter=get_param_max

Maximum tangent acceleration.

> property tangential_accel_min : float ; default=0.0 ; setter=set_param_min ; getter=get_param_min

Minimum tangent acceleration.

> property use_fixed_seed : bool ; default=false ; setter=set_use_fixed_seed ; getter=get_use_fixed_seed

If `true`, particles will use the same seed for every simulation using the seed defined in `seed`. This is useful for situations where the visual outcome should be consistent across replays, for example when using Movie Maker mode.

> property visibility_aabb : AABB ; default=AABB(0, 0, 0, 0, 0, 0) ; setter=set_visibility_aabb ; getter=get_visibility_aabb

The `AABB` that determines the node's region which needs to be visible on screen for the particle system to be active.
Grow the box if particles suddenly appear/disappear when the node enters/exits the screen. The `AABB` can be grown via code or with the **Particles → Generate AABB** editor tool.

## Methods

> method capture_aabb() -> AABB ; qualifiers=const

Returns the axis-aligned bounding box that contains all the particles that are active in the current frame.

> method convert_from_particles(particles: Node) -> void

Sets this node's properties to match a given `GPUParticles3D` node with an assigned `ParticleProcessMaterial`.

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

> enum_value DrawOrder.DRAW_ORDER_VIEW_DEPTH = 2

Particles are drawn in order of depth.

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

Particles will be emitted at a position chosen randomly among `emission_points`. Particle color will be modulated by `emission_colors`.

> enum_value EmissionShape.EMISSION_SHAPE_DIRECTED_POINTS = 5

Particles will be emitted at a position chosen randomly among `emission_points`. Particle velocity and rotation will be set based on `emission_normals`. Particle color will be modulated by `emission_colors`.

> enum_value EmissionShape.EMISSION_SHAPE_RING = 6

Particles will be emitted in a ring or cylinder.

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

Use with `set_particle_flag` to set `particle_flag_rotate_y`.

> enum_value ParticleFlags.PARTICLE_FLAG_DISABLE_Z = 2

Use with `set_particle_flag` to set `particle_flag_disable_z`.

> enum_value ParticleFlags.PARTICLE_FLAG_MAX = 3

Represents the size of the `ParticleFlags` enum.

## Tutorials
- [Particle systems (3D)]($DOCS_URL/tutorials/3d/particles/index.html)
