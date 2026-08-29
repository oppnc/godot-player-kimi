# Generic6DOFJoint3D

> class Generic6DOFJoint3D
> inherits Generic6DOFJoint3D Joint3D

## Brief

A physics joint that allows for complex movement and rotation between two 3D physics bodies.

## Description

The `Generic6DOFJoint3D` (6 Degrees Of Freedom) joint allows for implementing custom types of joints by locking the rotation and translation of certain axes.
The first 3 DOF represent the linear motion of the physics bodies and the last 3 DOF represent the angular motion of the physics bodies. Each axis can be either locked, or limited.

## Properties

> property angular_limit_x/damping : float ; default=1.0 ; setter=set_param_x ; getter=get_param_x

The amount of rotational damping across the X axis.
The lower, the longer an impulse from one side takes to travel to the other side.

> property angular_limit_x/enabled : bool ; default=true ; setter=set_flag_x ; getter=get_flag_x

If `true`, rotation across the X axis is limited.

> property angular_limit_x/erp : float ; default=0.5 ; setter=set_param_x ; getter=get_param_x

When rotating across the X axis, this error tolerance factor defines how much the correction gets slowed down. The lower, the slower.

> property angular_limit_x/force_limit : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

The maximum amount of force that can occur, when rotating around the X axis.

> property angular_limit_x/lower_angle : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

The minimum rotation in negative direction to break loose and rotate around the X axis.

> property angular_limit_x/restitution : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

The amount of rotational restitution across the X axis. The lower, the more restitution occurs.

> property angular_limit_x/softness : float ; default=0.5 ; setter=set_param_x ; getter=get_param_x

The speed of all rotations across the X axis.

> property angular_limit_x/upper_angle : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

The minimum rotation in positive direction to break loose and rotate around the X axis.

> property angular_limit_y/damping : float ; default=1.0 ; setter=set_param_y ; getter=get_param_y

The amount of rotational damping across the Y axis. The lower, the more damping occurs.

> property angular_limit_y/enabled : bool ; default=true ; setter=set_flag_y ; getter=get_flag_y

If `true`, rotation across the Y axis is limited.

> property angular_limit_y/erp : float ; default=0.5 ; setter=set_param_y ; getter=get_param_y

When rotating across the Y axis, this error tolerance factor defines how much the correction gets slowed down. The lower, the slower.

> property angular_limit_y/force_limit : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

The maximum amount of force that can occur, when rotating around the Y axis.

> property angular_limit_y/lower_angle : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

The minimum rotation in negative direction to break loose and rotate around the Y axis.

> property angular_limit_y/restitution : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

The amount of rotational restitution across the Y axis. The lower, the more restitution occurs.

> property angular_limit_y/softness : float ; default=0.5 ; setter=set_param_y ; getter=get_param_y

The speed of all rotations across the Y axis.

> property angular_limit_y/upper_angle : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

The minimum rotation in positive direction to break loose and rotate around the Y axis.

> property angular_limit_z/damping : float ; default=1.0 ; setter=set_param_z ; getter=get_param_z

The amount of rotational damping across the Z axis. The lower, the more damping occurs.

> property angular_limit_z/enabled : bool ; default=true ; setter=set_flag_z ; getter=get_flag_z

If `true`, rotation across the Z axis is limited.

> property angular_limit_z/erp : float ; default=0.5 ; setter=set_param_z ; getter=get_param_z

When rotating across the Z axis, this error tolerance factor defines how much the correction gets slowed down. The lower, the slower.

> property angular_limit_z/force_limit : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

The maximum amount of force that can occur, when rotating around the Z axis.

> property angular_limit_z/lower_angle : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

The minimum rotation in negative direction to break loose and rotate around the Z axis.

> property angular_limit_z/restitution : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

The amount of rotational restitution across the Z axis. The lower, the more restitution occurs.

> property angular_limit_z/softness : float ; default=0.5 ; setter=set_param_z ; getter=get_param_z

The speed of all rotations across the Z axis.

> property angular_limit_z/upper_angle : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

The minimum rotation in positive direction to break loose and rotate around the Z axis.

> property angular_motor_x/enabled : bool ; default=false ; setter=set_flag_x ; getter=get_flag_x

If `true`, a rotating motor at the X axis is enabled.

> property angular_motor_x/force_limit : float ; default=300.0 ; setter=set_param_x ; getter=get_param_x

Maximum acceleration for the motor at the X axis.

> property angular_motor_x/target_velocity : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

Target speed for the motor at the X axis.

> property angular_motor_y/enabled : bool ; default=false ; setter=set_flag_y ; getter=get_flag_y

If `true`, a rotating motor at the Y axis is enabled.

> property angular_motor_y/force_limit : float ; default=300.0 ; setter=set_param_y ; getter=get_param_y

Maximum acceleration for the motor at the Y axis.

> property angular_motor_y/target_velocity : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

Target speed for the motor at the Y axis.

> property angular_motor_z/enabled : bool ; default=false ; setter=set_flag_z ; getter=get_flag_z

If `true`, a rotating motor at the Z axis is enabled.

> property angular_motor_z/force_limit : float ; default=300.0 ; setter=set_param_z ; getter=get_param_z

Maximum acceleration for the motor at the Z axis.

> property angular_motor_z/target_velocity : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

Target speed for the motor at the Z axis.

> property angular_spring_x/damping : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

> property angular_spring_x/enabled : bool ; default=false ; setter=set_flag_x ; getter=get_flag_x

> property angular_spring_x/equilibrium_point : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

> property angular_spring_x/stiffness : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

> property angular_spring_y/damping : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

> property angular_spring_y/enabled : bool ; default=false ; setter=set_flag_y ; getter=get_flag_y

> property angular_spring_y/equilibrium_point : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

> property angular_spring_y/stiffness : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

> property angular_spring_z/damping : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

> property angular_spring_z/enabled : bool ; default=false ; setter=set_flag_z ; getter=get_flag_z

> property angular_spring_z/equilibrium_point : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

> property angular_spring_z/stiffness : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

> property linear_limit_x/damping : float ; default=1.0 ; setter=set_param_x ; getter=get_param_x

The amount of damping that happens at the X motion.

> property linear_limit_x/enabled : bool ; default=true ; setter=set_flag_x ; getter=get_flag_x

If `true`, the linear motion across the X axis is limited.

> property linear_limit_x/lower_distance : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

The minimum difference between the pivot points' X axis.

> property linear_limit_x/restitution : float ; default=0.5 ; setter=set_param_x ; getter=get_param_x

The amount of restitution on the X axis movement. The lower, the more momentum gets lost.

> property linear_limit_x/softness : float ; default=0.7 ; setter=set_param_x ; getter=get_param_x

A factor applied to the movement across the X axis. The lower, the slower the movement.

> property linear_limit_x/upper_distance : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

The maximum difference between the pivot points' X axis.

> property linear_limit_y/damping : float ; default=1.0 ; setter=set_param_y ; getter=get_param_y

The amount of damping that happens at the Y motion.

> property linear_limit_y/enabled : bool ; default=true ; setter=set_flag_y ; getter=get_flag_y

If `true`, the linear motion across the Y axis is limited.

> property linear_limit_y/lower_distance : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

The minimum difference between the pivot points' Y axis.

> property linear_limit_y/restitution : float ; default=0.5 ; setter=set_param_y ; getter=get_param_y

The amount of restitution on the Y axis movement. The lower, the more momentum gets lost.

> property linear_limit_y/softness : float ; default=0.7 ; setter=set_param_y ; getter=get_param_y

A factor applied to the movement across the Y axis. The lower, the slower the movement.

> property linear_limit_y/upper_distance : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

The maximum difference between the pivot points' Y axis.

> property linear_limit_z/damping : float ; default=1.0 ; setter=set_param_z ; getter=get_param_z

The amount of damping that happens at the Z motion.

> property linear_limit_z/enabled : bool ; default=true ; setter=set_flag_z ; getter=get_flag_z

If `true`, the linear motion across the Z axis is limited.

> property linear_limit_z/lower_distance : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

The minimum difference between the pivot points' Z axis.

> property linear_limit_z/restitution : float ; default=0.5 ; setter=set_param_z ; getter=get_param_z

The amount of restitution on the Z axis movement. The lower, the more momentum gets lost.

> property linear_limit_z/softness : float ; default=0.7 ; setter=set_param_z ; getter=get_param_z

A factor applied to the movement across the Z axis. The lower, the slower the movement.

> property linear_limit_z/upper_distance : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

The maximum difference between the pivot points' Z axis.

> property linear_motor_x/enabled : bool ; default=false ; setter=set_flag_x ; getter=get_flag_x

If `true`, then there is a linear motor on the X axis. It will attempt to reach the target velocity while staying within the force limits.

> property linear_motor_x/force_limit : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

The maximum force the linear motor can apply on the X axis while trying to reach the target velocity.

> property linear_motor_x/target_velocity : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

The speed that the linear motor will attempt to reach on the X axis.

> property linear_motor_y/enabled : bool ; default=false ; setter=set_flag_y ; getter=get_flag_y

If `true`, then there is a linear motor on the Y axis. It will attempt to reach the target velocity while staying within the force limits.

> property linear_motor_y/force_limit : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

The maximum force the linear motor can apply on the Y axis while trying to reach the target velocity.

> property linear_motor_y/target_velocity : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

The speed that the linear motor will attempt to reach on the Y axis.

> property linear_motor_z/enabled : bool ; default=false ; setter=set_flag_z ; getter=get_flag_z

If `true`, then there is a linear motor on the Z axis. It will attempt to reach the target velocity while staying within the force limits.

> property linear_motor_z/force_limit : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

The maximum force the linear motor can apply on the Z axis while trying to reach the target velocity.

> property linear_motor_z/target_velocity : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

The speed that the linear motor will attempt to reach on the Z axis.

> property linear_spring_x/damping : float ; default=0.01 ; setter=set_param_x ; getter=get_param_x

> property linear_spring_x/enabled : bool ; default=false ; setter=set_flag_x ; getter=get_flag_x

> property linear_spring_x/equilibrium_point : float ; default=0.0 ; setter=set_param_x ; getter=get_param_x

> property linear_spring_x/stiffness : float ; default=0.01 ; setter=set_param_x ; getter=get_param_x

> property linear_spring_y/damping : float ; default=0.01 ; setter=set_param_y ; getter=get_param_y

> property linear_spring_y/enabled : bool ; default=false ; setter=set_flag_y ; getter=get_flag_y

> property linear_spring_y/equilibrium_point : float ; default=0.0 ; setter=set_param_y ; getter=get_param_y

> property linear_spring_y/stiffness : float ; default=0.01 ; setter=set_param_y ; getter=get_param_y

> property linear_spring_z/damping : float ; default=0.01 ; setter=set_param_z ; getter=get_param_z

> property linear_spring_z/enabled : bool ; default=false ; setter=set_flag_z ; getter=get_flag_z

> property linear_spring_z/equilibrium_point : float ; default=0.0 ; setter=set_param_z ; getter=get_param_z

> property linear_spring_z/stiffness : float ; default=0.01 ; setter=set_param_z ; getter=get_param_z

## Methods

> method get_flag_x(flag: Flag) -> bool ; qualifiers=const

> method get_flag_y(flag: Flag) -> bool ; qualifiers=const

> method get_flag_z(flag: Flag) -> bool ; qualifiers=const

> method get_param_x(param: Param) -> float ; qualifiers=const

> method get_param_y(param: Param) -> float ; qualifiers=const

> method get_param_z(param: Param) -> float ; qualifiers=const

> method set_flag_x(flag: Flag, value: bool) -> void

> method set_flag_y(flag: Flag, value: bool) -> void

> method set_flag_z(flag: Flag, value: bool) -> void

> method set_param_x(param: Param, value: float) -> void

> method set_param_y(param: Param, value: float) -> void

> method set_param_z(param: Param, value: float) -> void

## Enumerations

> enum Flag

> enum_value Flag.FLAG_ENABLE_LINEAR_LIMIT = 0

If enabled, linear motion is possible within the given limits.

> enum_value Flag.FLAG_ENABLE_ANGULAR_LIMIT = 1

If enabled, rotational motion is possible within the given limits.

> enum_value Flag.FLAG_ENABLE_LINEAR_SPRING = 3

> enum_value Flag.FLAG_ENABLE_ANGULAR_SPRING = 2

> enum_value Flag.FLAG_ENABLE_MOTOR = 4

If enabled, there is a rotational motor across these axes.

> enum_value Flag.FLAG_ENABLE_LINEAR_MOTOR = 5

If enabled, there is a linear motor across these axes.

> enum_value Flag.FLAG_MAX = 6

Represents the size of the `Flag` enum.

> enum Param

> enum_value Param.PARAM_LINEAR_LOWER_LIMIT = 0

The minimum difference between the pivot points' axes.

> enum_value Param.PARAM_LINEAR_UPPER_LIMIT = 1

The maximum difference between the pivot points' axes.

> enum_value Param.PARAM_LINEAR_LIMIT_SOFTNESS = 2

A factor applied to the movement across the axes. The lower, the slower the movement.

> enum_value Param.PARAM_LINEAR_RESTITUTION = 3

The amount of restitution on the axes' movement. The lower, the more momentum gets lost.

> enum_value Param.PARAM_LINEAR_DAMPING = 4

The amount of damping that happens at the linear motion across the axes.

> enum_value Param.PARAM_LINEAR_MOTOR_TARGET_VELOCITY = 5

The velocity the linear motor will try to reach.

> enum_value Param.PARAM_LINEAR_MOTOR_FORCE_LIMIT = 6

The maximum force the linear motor will apply while trying to reach the velocity target.

> enum_value Param.PARAM_LINEAR_SPRING_STIFFNESS = 7

> enum_value Param.PARAM_LINEAR_SPRING_DAMPING = 8

> enum_value Param.PARAM_LINEAR_SPRING_EQUILIBRIUM_POINT = 9

> enum_value Param.PARAM_ANGULAR_LOWER_LIMIT = 10

The minimum rotation in negative direction to break loose and rotate around the axes.

> enum_value Param.PARAM_ANGULAR_UPPER_LIMIT = 11

The minimum rotation in positive direction to break loose and rotate around the axes.

> enum_value Param.PARAM_ANGULAR_LIMIT_SOFTNESS = 12

The speed of all rotations across the axes.

> enum_value Param.PARAM_ANGULAR_DAMPING = 13

The amount of rotational damping across the axes. The lower, the more damping occurs.

> enum_value Param.PARAM_ANGULAR_RESTITUTION = 14

The amount of rotational restitution across the axes. The lower, the more restitution occurs.

> enum_value Param.PARAM_ANGULAR_FORCE_LIMIT = 15

The maximum amount of force that can occur, when rotating around the axes.

> enum_value Param.PARAM_ANGULAR_ERP = 16

When rotating across the axes, this error tolerance factor defines how much the correction gets slowed down. The lower, the slower.

> enum_value Param.PARAM_ANGULAR_MOTOR_TARGET_VELOCITY = 17

Target speed for the motor at the axes.

> enum_value Param.PARAM_ANGULAR_MOTOR_FORCE_LIMIT = 18

Maximum acceleration for the motor at the axes.

> enum_value Param.PARAM_ANGULAR_SPRING_STIFFNESS = 19

> enum_value Param.PARAM_ANGULAR_SPRING_DAMPING = 20

> enum_value Param.PARAM_ANGULAR_SPRING_EQUILIBRIUM_POINT = 21

> enum_value Param.PARAM_MAX = 22

Represents the size of the `Param` enum.
