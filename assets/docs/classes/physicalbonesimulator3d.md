# PhysicalBoneSimulator3D

> class PhysicalBoneSimulator3D
> inherits PhysicalBoneSimulator3D SkeletonModifier3D

## Brief

Node that can be the parent of `PhysicalBone3D` and can apply the simulation results to `Skeleton3D`.

## Description

Node that can be the parent of `PhysicalBone3D` and can apply the simulation results to `Skeleton3D`.

## Methods

> method is_simulating_physics() -> bool ; qualifiers=const

Returns a boolean that indicates whether the `PhysicalBoneSimulator3D` is running and simulating.

> method physical_bones_add_collision_exception(exception: RID) -> void

Adds a collision exception to the physical bone.
Works just like the `RigidBody3D` node.

> method physical_bones_remove_collision_exception(exception: RID) -> void

Removes a collision exception to the physical bone.
Works just like the `RigidBody3D` node.

> method physical_bones_start_simulation(bones: Array[StringName] = []) -> void

Tells the `PhysicalBone3D` nodes in the Skeleton to start simulating and reacting to the physics world.
Optionally, a list of bone names can be passed-in, allowing only the passed-in bones to be simulated.

> method physical_bones_stop_simulation() -> void

Tells the `PhysicalBone3D` nodes in the Skeleton to stop simulating.
