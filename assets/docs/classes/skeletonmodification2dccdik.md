# SkeletonModification2DCCDIK

> class SkeletonModification2DCCDIK ; experimental=This class may be changed or removed in future versions.
> inherits SkeletonModification2DCCDIK SkeletonModification2D

## Brief

A modification that uses CCDIK to manipulate a series of bones to reach a target in 2D.

## Description

This `SkeletonModification2D` uses an algorithm called Cyclic Coordinate Descent Inverse Kinematics, or CCDIK, to manipulate a chain of bones in a `Skeleton2D` so it reaches a defined target.
CCDIK works by rotating a set of bones, typically called a "bone chain", on a single axis. Each bone is rotated to face the target from the tip (by default), which over a chain of bones allow it to rotate properly to reach the target. Because the bones only rotate on a single axis, CCDIK *can* look more robotic than other IK solvers.
**Note:** The CCDIK modifier has `ccdik_joints`, which are the data objects that hold the data for each joint in the CCDIK chain. This is different from a bone! CCDIK joints hold the data needed for each bone in the bone chain used by CCDIK.
CCDIK also fully supports angle constraints, allowing for more control over how a solution is met.

## Properties

> property ccdik_data_chain_length : int ; default=0 ; setter=set_ccdik_data_chain_length ; getter=get_ccdik_data_chain_length

The number of CCDIK joints in the CCDIK modification.

> property target_nodepath : NodePath ; default=NodePath("") ; setter=set_target_node ; getter=get_target_node

The NodePath to the node that is the target for the CCDIK modification. This node is what the CCDIK chain will attempt to rotate the bone chain to.

> property tip_nodepath : NodePath ; default=NodePath("") ; setter=set_tip_node ; getter=get_tip_node

The end position of the CCDIK chain. Typically, this should be a child of a `Bone2D` node attached to the final `Bone2D` in the CCDIK chain.

## Methods

> method get_ccdik_joint_bone2d_node(joint_idx: int) -> NodePath ; qualifiers=const

Returns the `Bone2D` node assigned to the CCDIK joint at `joint_idx`.

> method get_ccdik_joint_bone_index(joint_idx: int) -> int ; qualifiers=const

Returns the index of the `Bone2D` node assigned to the CCDIK joint at `joint_idx`.

> method get_ccdik_joint_constraint_angle_invert(joint_idx: int) -> bool ; qualifiers=const

Returns whether the CCDIK joint at `joint_idx` uses an inverted joint constraint. See `set_ccdik_joint_constraint_angle_invert` for details.

> method get_ccdik_joint_constraint_angle_max(joint_idx: int) -> float ; qualifiers=const

Returns the maximum angle constraint for the joint at `joint_idx`.

> method get_ccdik_joint_constraint_angle_min(joint_idx: int) -> float ; qualifiers=const

Returns the minimum angle constraint for the joint at `joint_idx`.

> method get_ccdik_joint_enable_constraint(joint_idx: int) -> bool ; qualifiers=const

Returns whether angle constraints on the CCDIK joint at `joint_idx` are enabled.

> method get_ccdik_joint_rotate_from_joint(joint_idx: int) -> bool ; qualifiers=const

Returns whether the joint at `joint_idx` is set to rotate from the joint, `true`, or to rotate from the tip, `false`. The default is to rotate from the tip.

> method set_ccdik_joint_bone2d_node(joint_idx: int, bone2d_nodepath: NodePath) -> void

Sets the `Bone2D` node assigned to the CCDIK joint at `joint_idx`.

> method set_ccdik_joint_bone_index(joint_idx: int, bone_idx: int) -> void

Sets the bone index, `bone_idx`, of the CCDIK joint at `joint_idx`. When possible, this will also update the `bone2d_node` of the CCDIK joint based on data provided by the linked skeleton.

> method set_ccdik_joint_constraint_angle_invert(joint_idx: int, invert: bool) -> void

Sets whether the CCDIK joint at `joint_idx` uses an inverted joint constraint.
An inverted joint constraint only constraints the CCDIK joint to the angles *outside of* the inputted minimum and maximum angles. For this reason, it is referred to as an inverted joint constraint, as it constraints the joint to the outside of the inputted values.

> method set_ccdik_joint_constraint_angle_max(joint_idx: int, angle_max: float) -> void

Sets the maximum angle constraint for the joint at `joint_idx`.

> method set_ccdik_joint_constraint_angle_min(joint_idx: int, angle_min: float) -> void

Sets the minimum angle constraint for the joint at `joint_idx`.

> method set_ccdik_joint_enable_constraint(joint_idx: int, enable_constraint: bool) -> void

Determines whether angle constraints on the CCDIK joint at `joint_idx` are enabled. When `true`, constraints will be enabled and taken into account when solving.

> method set_ccdik_joint_rotate_from_joint(joint_idx: int, rotate_from_joint: bool) -> void

Sets whether the joint at `joint_idx` is set to rotate from the joint, `true`, or to rotate from the tip, `false`.
