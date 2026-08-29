# Joint3D

> class Joint3D
> inherits Joint3D Node3D

## Brief

Abstract base class for all 3D physics joints.

## Description

Abstract base class for all joints in 3D physics. 3D joints bind together two physics bodies (`node_a` and `node_b`) and apply a constraint. If only one body is defined, it is attached to a fixed `StaticBody3D` without collision shapes.

## Properties

> property exclude_nodes_from_collision : bool ; default=true ; setter=set_exclude_nodes_from_collision ; getter=get_exclude_nodes_from_collision

If `true`, the two bodies bound together do not collide with each other.

> property node_a : NodePath ; default=NodePath("") ; setter=set_node_a ; getter=get_node_a

Path to the first node (A) attached to the joint. The node must inherit `PhysicsBody3D`.
If left empty and `node_b` is set, the body is attached to a fixed `StaticBody3D` without collision shapes.

> property node_b : NodePath ; default=NodePath("") ; setter=set_node_b ; getter=get_node_b

Path to the second node (B) attached to the joint. The node must inherit `PhysicsBody3D`.
If left empty and `node_a` is set, the body is attached to a fixed `StaticBody3D` without collision shapes.

> property solver_priority : int ; default=1 ; setter=set_solver_priority ; getter=get_solver_priority

The priority used to define which solver is executed first for multiple joints. The lower the value, the higher the priority.
**Note:** Only supported when using GodotPhysics3D. This property is ignored when using Jolt Physics.

## Methods

> method get_rid() -> RID ; qualifiers=const

Returns the joint's internal `RID` from the `PhysicsServer3D`.

## Tutorials
- [3D Truck Town Demo](https://godotengine.org/asset-library/asset/2752)
