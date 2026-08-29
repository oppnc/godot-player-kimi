# SpringBoneSimulator3D

> class SpringBoneSimulator3D
> inherits SpringBoneSimulator3D SkeletonModifier3D

## Brief

A `SkeletonModifier3D` to apply inertial wavering to bone chains.

## Description

This `SkeletonModifier3D` can be used to wiggle hair, cloth, and tails. This modifier behaves differently from `PhysicalBoneSimulator3D` as it attempts to return the original pose after modification.
If you setup `set_root_bone` and `set_end_bone`, it is treated as one bone chain. Note that it does not support a branched chain like Y-shaped chains.
When a bone chain is created, an array is generated from the bones that exist in between and listed in the joint list.
Several properties can be applied to each joint, such as `set_joint_stiffness`, `set_joint_drag`, and `set_joint_gravity`.
For simplicity, you can set values to all joints at the same time by using a `Curve`. If you want to specify detailed values individually, set `set_individual_config` to `true`.
For physical simulation, `SpringBoneSimulator3D` can have children as self-standing collisions that are not related to `PhysicsServer3D`, see also `SpringBoneCollision3D`.
**Warning:** A scaled `SpringBoneSimulator3D` will likely not behave as expected. Make sure that the parent `Skeleton3D` and its bones are not scaled.
**Note:** Most methods in this class take an `index` parameter. This parameter specifies which setting list entry to return if the IK has multiple entries (e.g. `settings/<index>/root_bone_name`).

## Properties

> property external_force : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_external_force ; getter=get_external_force

The constant force that always affected bones. It is equal to the result when the parent `Skeleton3D` moves at this speed in the opposite direction.
This is useful for effects such as wind and anti-gravity.

> property mutable_bone_axes : bool ; default=true ; setter=set_mutable_bone_axes ; getter=are_bone_axes_mutable

If `true`, the solver retrieves the bone axis from the bone pose every frame.
If `false`, the solver retrieves the bone axis from the bone rest and caches it, which increases performance slightly, but position changes in the bone pose made before processing this `SpringBoneSimulator3D` are ignored.

> property setting_count : int ; default=0 ; setter=set_setting_count ; getter=get_setting_count

The number of settings.

## Methods

> method are_all_child_collisions_enabled(index: int) -> bool ; qualifiers=const

Returns `true` if all child `SpringBoneCollision3D`s are contained in the collision list at `index` in the settings.

> method clear_collisions(index: int) -> void

Clears all collisions from the collision list at `index` in the settings when `are_all_child_collisions_enabled` is `false`.

> method clear_exclude_collisions(index: int) -> void

Clears all exclude collisions from the collision list at `index` in the settings when `are_all_child_collisions_enabled` is `true`.

> method clear_settings() -> void

Clears all settings.

> method get_center_bone(index: int) -> int ; qualifiers=const

Returns the center bone index of the bone chain.

> method get_center_bone_name(index: int) -> String ; qualifiers=const

Returns the center bone name of the bone chain.

> method get_center_from(index: int) -> CenterFrom ; qualifiers=const

Returns what the center originates from in the bone chain.

> method get_center_node(index: int) -> NodePath ; qualifiers=const

Returns the center node path of the bone chain.

> method get_collision_count(index: int) -> int ; qualifiers=const

Returns the collision count of the bone chain's collision list when `are_all_child_collisions_enabled` is `false`.

> method get_collision_path(index: int, collision: int) -> NodePath ; qualifiers=const

Returns the node path of the `SpringBoneCollision3D` at `collision` in the bone chain's collision list when `are_all_child_collisions_enabled` is `false`.

> method get_drag(index: int) -> float ; qualifiers=const

Returns the drag force damping curve of the bone chain.

> method get_drag_damping_curve(index: int) -> Curve ; qualifiers=const

Returns the drag force damping curve of the bone chain.

> method get_end_bone(index: int) -> int ; qualifiers=const

Returns the end bone index of the bone chain.

> method get_end_bone_direction(index: int) -> SkeletonModifier3D.BoneDirection ; qualifiers=const

Returns the tail direction of the end bone of the bone chain when `is_end_bone_extended` is `true`.

> method get_end_bone_length(index: int) -> float ; qualifiers=const

Returns the end bone tail length of the bone chain when `is_end_bone_extended` is `true`.

> method get_end_bone_name(index: int) -> String ; qualifiers=const

Returns the end bone name of the bone chain.

> method get_exclude_collision_count(index: int) -> int ; qualifiers=const

Returns the exclude collision count of the bone chain's exclude collision list when `are_all_child_collisions_enabled` is `true`.

> method get_exclude_collision_path(index: int, collision: int) -> NodePath ; qualifiers=const

Returns the node path of the `SpringBoneCollision3D` at `collision` in the bone chain's exclude collision list when `are_all_child_collisions_enabled` is `true`.

> method get_gravity(index: int) -> float ; qualifiers=const

Returns the gravity amount of the bone chain.

> method get_gravity_damping_curve(index: int) -> Curve ; qualifiers=const

Returns the gravity amount damping curve of the bone chain.

> method get_gravity_direction(index: int) -> Vector3 ; qualifiers=const

Returns the gravity direction of the bone chain.

> method get_joint_bone(index: int, joint: int) -> int ; qualifiers=const

Returns the bone index at `joint` in the bone chain's joint list.

> method get_joint_bone_name(index: int, joint: int) -> String ; qualifiers=const

Returns the bone name at `joint` in the bone chain's joint list.

> method get_joint_count(index: int) -> int ; qualifiers=const

Returns the joint count of the bone chain's joint list.

> method get_joint_drag(index: int, joint: int) -> float ; qualifiers=const

Returns the drag force at `joint` in the bone chain's joint list.

> method get_joint_gravity(index: int, joint: int) -> float ; qualifiers=const

Returns the gravity amount at `joint` in the bone chain's joint list.

> method get_joint_gravity_direction(index: int, joint: int) -> Vector3 ; qualifiers=const

Returns the gravity direction at `joint` in the bone chain's joint list.

> method get_joint_radius(index: int, joint: int) -> float ; qualifiers=const

Returns the radius at `joint` in the bone chain's joint list.

> method get_joint_rotation_axis(index: int, joint: int) -> SkeletonModifier3D.RotationAxis ; qualifiers=const

Returns the rotation axis at `joint` in the bone chain's joint list.

> method get_joint_rotation_axis_vector(index: int, joint: int) -> Vector3 ; qualifiers=const

Returns the rotation axis vector for the specified joint in the bone chain. This vector represents the axis around which the joint can rotate. It is determined based on the rotation axis set for the joint.
If `get_joint_rotation_axis` is `SkeletonModifier3D.ROTATION_AXIS_ALL`, this method returns `Vector3(0, 0, 0)`.

> method get_joint_stiffness(index: int, joint: int) -> float ; qualifiers=const

Returns the stiffness force at `joint` in the bone chain's joint list.

> method get_radius(index: int) -> float ; qualifiers=const

Returns the joint radius of the bone chain.

> method get_radius_damping_curve(index: int) -> Curve ; qualifiers=const

Returns the joint radius damping curve of the bone chain.

> method get_root_bone(index: int) -> int ; qualifiers=const

Returns the root bone index of the bone chain.

> method get_root_bone_name(index: int) -> String ; qualifiers=const

Returns the root bone name of the bone chain.

> method get_rotation_axis(index: int) -> SkeletonModifier3D.RotationAxis ; qualifiers=const

Returns the rotation axis of the bone chain.

> method get_rotation_axis_vector(index: int) -> Vector3 ; qualifiers=const

Returns the rotation axis vector of the bone chain. This vector represents the axis around which the bone chain can rotate. It is determined based on the rotation axis set for the bone chain.
If `get_rotation_axis` is `SkeletonModifier3D.ROTATION_AXIS_ALL`, this method returns `Vector3(0, 0, 0)`.

> method get_stiffness(index: int) -> float ; qualifiers=const

Returns the stiffness force of the bone chain.

> method get_stiffness_damping_curve(index: int) -> Curve ; qualifiers=const

Returns the stiffness force damping curve of the bone chain.

> method is_config_individual(index: int) -> bool ; qualifiers=const

Returns `true` if the config can be edited individually for each joint.

> method is_end_bone_extended(index: int) -> bool ; qualifiers=const

Returns `true` if the end bone is extended to have a tail.

> method reset() -> void

Resets a simulating state with respect to the current bone pose.
It is useful to prevent the simulation result getting violent. For example, calling this immediately after a call to `AnimationPlayer.play` without a fading, or within the previous `SkeletonModifier3D.modification_processed` signal if it's condition changes significantly.

> method set_center_bone(index: int, bone: int) -> void

Sets the center bone index of the bone chain.

> method set_center_bone_name(index: int, bone_name: String) -> void

Sets the center bone name of the bone chain.

> method set_center_from(index: int, center_from: CenterFrom) -> void

Sets what the center originates from in the bone chain.
Bone movement is calculated based on the difference in relative distance between center and bone in the previous and next frames.
For example, if the parent `Skeleton3D` is used as the center, the bones are considered to have not moved if the `Skeleton3D` moves in the world.
In this case, only a change in the bone pose is considered to be a bone movement.

> method set_center_node(index: int, node_path: NodePath) -> void

Sets the center node path of the bone chain.

> method set_collision_count(index: int, count: int) -> void

Sets the number of collisions in the collision list at `index` in the settings when `are_all_child_collisions_enabled` is `false`.

> method set_collision_path(index: int, collision: int, node_path: NodePath) -> void

Sets the node path of the `SpringBoneCollision3D` at `collision` in the bone chain's collision list when `are_all_child_collisions_enabled` is `false`.

> method set_drag(index: int, drag: float) -> void

Sets the drag force of the bone chain. The greater the value, the more suppressed the wiggling.
The value is scaled by `set_drag_damping_curve` and cached in each joint setting in the joint list.

> method set_drag_damping_curve(index: int, curve: Curve) -> void

Sets the drag force damping curve of the bone chain.

> method set_enable_all_child_collisions(index: int, enabled: bool) -> void

If `enabled` is `true`, all child `SpringBoneCollision3D`s are colliding and `set_exclude_collision_path` is enabled as an exclusion list at `index` in the settings.
If `enabled` is `false`, you need to manually register all valid collisions with `set_collision_path`.

> method set_end_bone(index: int, bone: int) -> void

Sets the end bone index of the bone chain.

> method set_end_bone_direction(index: int, bone_direction: SkeletonModifier3D.BoneDirection) -> void

Sets the end bone tail direction of the bone chain when `is_end_bone_extended` is `true`.

> method set_end_bone_length(index: int, length: float) -> void

Sets the end bone tail length of the bone chain when `is_end_bone_extended` is `true`.

> method set_end_bone_name(index: int, bone_name: String) -> void

Sets the end bone name of the bone chain.
**Note:** End bone must be the root bone or a child of the root bone. If they are the same, the tail must be extended by `set_extend_end_bone` to jiggle the bone.

> method set_exclude_collision_count(index: int, count: int) -> void

Sets the number of exclude collisions in the exclude collision list at `index` in the settings when `are_all_child_collisions_enabled` is `true`.

> method set_exclude_collision_path(index: int, collision: int, node_path: NodePath) -> void

Sets the node path of the `SpringBoneCollision3D` at `collision` in the bone chain's exclude collision list when `are_all_child_collisions_enabled` is `true`.

> method set_extend_end_bone(index: int, enabled: bool) -> void

If `enabled` is `true`, the end bone is extended to have a tail.
The extended tail config is allocated to the last element in the joint list. In other words, if you set `enabled` to `false`, the config of the last element in the joint list has no effect in the simulated result.

> method set_gravity(index: int, gravity: float) -> void

Sets the gravity amount of the bone chain. This value is not an acceleration, but a constant velocity of movement in `set_gravity_direction`.
If `gravity` is not `0`, the modified pose will not return to the original pose since it is always affected by gravity.
The value is scaled by `set_gravity_damping_curve` and cached in each joint setting in the joint list.

> method set_gravity_damping_curve(index: int, curve: Curve) -> void

Sets the gravity amount damping curve of the bone chain.

> method set_gravity_direction(index: int, gravity_direction: Vector3) -> void

Sets the gravity direction of the bone chain. This value is internally normalized and then multiplied by `set_gravity`.
The value is cached in each joint setting in the joint list.

> method set_individual_config(index: int, enabled: bool) -> void

If `enabled` is `true`, the config can be edited individually for each joint.

> method set_joint_drag(index: int, joint: int, drag: float) -> void

Sets the drag force at `joint` in the bone chain's joint list when `is_config_individual` is `true`.

> method set_joint_gravity(index: int, joint: int, gravity: float) -> void

Sets the gravity amount at `joint` in the bone chain's joint list when `is_config_individual` is `true`.

> method set_joint_gravity_direction(index: int, joint: int, gravity_direction: Vector3) -> void

Sets the gravity direction at `joint` in the bone chain's joint list when `is_config_individual` is `true`.

> method set_joint_radius(index: int, joint: int, radius: float) -> void

Sets the joint radius at `joint` in the bone chain's joint list when `is_config_individual` is `true`.

> method set_joint_rotation_axis(index: int, joint: int, axis: SkeletonModifier3D.RotationAxis) -> void

Sets the rotation axis at `joint` in the bone chain's joint list when `is_config_individual` is `true`.
The axes are based on the reference pose's space, if `axis` is `SkeletonModifier3D.ROTATION_AXIS_CUSTOM`, you can specify any axis.
In here, the reference pose is the bone pose immediately before the simulation.
**Note:** The rotation axis and the forward vector shouldn't be colinear to avoid unintended rotation since `SpringBoneSimulator3D` does not factor in twisting forces.

> method set_joint_rotation_axis_vector(index: int, joint: int, vector: Vector3) -> void

Sets the rotation axis vector for the specified joint in the bone chain.
This vector is normalized by an internal process and represents the axis around which the bone chain can rotate.
If the vector length is `0`, it is considered synonymous with `SkeletonModifier3D.ROTATION_AXIS_ALL`.

> method set_joint_stiffness(index: int, joint: int, stiffness: float) -> void

Sets the stiffness force at `joint` in the bone chain's joint list when `is_config_individual` is `true`.

> method set_radius(index: int, radius: float) -> void

Sets the joint radius of the bone chain. It is used to move and slide with the `SpringBoneCollision3D` in the collision list.
The value is scaled by `set_radius_damping_curve` and cached in each joint setting in the joint list.

> method set_radius_damping_curve(index: int, curve: Curve) -> void

Sets the joint radius damping curve of the bone chain.

> method set_root_bone(index: int, bone: int) -> void

Sets the root bone index of the bone chain.

> method set_root_bone_name(index: int, bone_name: String) -> void

Sets the root bone name of the bone chain.

> method set_rotation_axis(index: int, axis: SkeletonModifier3D.RotationAxis) -> void

Sets the rotation axis of the bone chain. If set to a specific axis, it acts like a hinge joint. The value is cached in each joint setting in the joint list.
The axes are based on the reference pose's space, if `axis` is `SkeletonModifier3D.ROTATION_AXIS_CUSTOM`, you can specify any axis.
In here, the reference pose is the bone pose immediately before the simulation.
**Note:** The rotation axis vector and the forward vector shouldn't be colinear to avoid unintended rotation since `SpringBoneSimulator3D` does not factor in twisting forces.

> method set_rotation_axis_vector(index: int, vector: Vector3) -> void

Sets the rotation axis vector of the bone chain. The value is cached in each joint setting in the joint list.
This vector is normalized by an internal process and represents the axis around which the bone chain can rotate.
If the vector length is `0`, it is considered synonymous with `SkeletonModifier3D.ROTATION_AXIS_ALL`.

> method set_stiffness(index: int, stiffness: float) -> void

Sets the stiffness force of the bone chain. The greater the value, the faster it recovers to its initial pose.
If `stiffness` is `0`, the modified pose will not return to the original pose.
The value is scaled by `set_stiffness_damping_curve` and cached in each joint setting in the joint list.

> method set_stiffness_damping_curve(index: int, curve: Curve) -> void

Sets the stiffness force damping curve of the bone chain.

## Enumerations

> enum CenterFrom

> enum_value CenterFrom.CENTER_FROM_WORLD_ORIGIN = 0

The world origin is defined as center.

> enum_value CenterFrom.CENTER_FROM_NODE = 1

The `Node3D` specified by `set_center_node` is defined as center.
If `Node3D` is not found, the parent `Skeleton3D` is treated as center.

> enum_value CenterFrom.CENTER_FROM_BONE = 2

The bone pose origin of the parent `Skeleton3D` specified by `set_center_bone` is defined as center.
If `Node3D` is not found, the parent `Skeleton3D` is treated as center.
