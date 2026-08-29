# Joint2D

> class Joint2D
> inherits Joint2D Node2D

## Brief

Abstract base class for all 2D physics joints.

## Description

Abstract base class for all joints in 2D physics. 2D joints bind together two physics bodies (`node_a` and `node_b`) and apply a constraint.

## Properties

> property bias : float ; default=0.0 ; setter=set_bias ; getter=get_bias

When `node_a` and `node_b` move in different directions the `bias` controls how fast the joint pulls them back to their original position. The lower the `bias` the more the two bodies can pull on the joint.
When set to `0`, the default value from `ProjectSettings.physics/2d/solver/default_constraint_bias` is used.

> property disable_collision : bool ; default=true ; setter=set_exclude_nodes_from_collision ; getter=get_exclude_nodes_from_collision

If `true`, the two bodies bound together do not collide with each other.

> property node_a : NodePath ; default=NodePath("") ; setter=set_node_a ; getter=get_node_a

Path to the first body (A) attached to the joint. The node must inherit `PhysicsBody2D`.

> property node_b : NodePath ; default=NodePath("") ; setter=set_node_b ; getter=get_node_b

Path to the second body (B) attached to the joint. The node must inherit `PhysicsBody2D`.

## Methods

> method get_rid() -> RID ; qualifiers=const

Returns the joint's internal `RID` from the `PhysicsServer2D`.
