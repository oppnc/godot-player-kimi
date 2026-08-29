# SkeletonModification2DFABRIK

> class SkeletonModification2DFABRIK ; experimental=This class may be changed or removed in future versions.
> inherits SkeletonModification2DFABRIK SkeletonModification2D

## Brief

A modification that uses FABRIK to manipulate a series of `Bone2D` nodes to reach a target.

## Description

This `SkeletonModification2D` uses an algorithm called Forward And Backward Reaching Inverse Kinematics, or FABRIK, to rotate a bone chain so that it reaches a target.
FABRIK works by knowing the positions and lengths of a series of bones, typically called a "bone chain". It first starts by running a forward pass, which places the final bone at the target's position. Then all other bones are moved towards the tip bone, so they stay at the defined bone length away. Then a backwards pass is performed, where the root/first bone in the FABRIK chain is placed back at the origin. Then all other bones are moved so they stay at the defined bone length away. This positions the bone chain so that it reaches the target when possible, but all of the bones stay the correct length away from each other.
Because of how FABRIK works, it often gives more natural results than those seen in `SkeletonModification2DCCDIK`.
**Note:** The FABRIK modifier has `fabrik_joints`, which are the data objects that hold the data for each joint in the FABRIK chain. This is different from `Bone2D` nodes! FABRIK joints hold the data needed for each `Bone2D` in the bone chain used by FABRIK.
To help control how the FABRIK joints move, a magnet vector can be passed, which can nudge the bones in a certain direction prior to solving, giving a level of control over the final result.

## Properties

> property fabrik_data_chain_length : int ; default=0 ; setter=set_fabrik_data_chain_length ; getter=get_fabrik_data_chain_length

The number of FABRIK joints in the FABRIK modification.

> property target_nodepath : NodePath ; default=NodePath("") ; setter=set_target_node ; getter=get_target_node

The NodePath to the node that is the target for the FABRIK modification. This node is what the FABRIK chain will attempt to rotate the bone chain to.

## Methods

> method get_fabrik_joint_bone2d_node(joint_idx: int) -> NodePath ; qualifiers=const

Returns the `Bone2D` node assigned to the FABRIK joint at `joint_idx`.

> method get_fabrik_joint_bone_index(joint_idx: int) -> int ; qualifiers=const

Returns the index of the `Bone2D` node assigned to the FABRIK joint at `joint_idx`.

> method get_fabrik_joint_magnet_position(joint_idx: int) -> Vector2 ; qualifiers=const

Returns the magnet position vector for the joint at `joint_idx`.

> method get_fabrik_joint_use_target_rotation(joint_idx: int) -> bool ; qualifiers=const

Returns whether the joint is using the target's rotation rather than allowing FABRIK to rotate the joint. This option only applies to the tip/final joint in the chain.

> method set_fabrik_joint_bone2d_node(joint_idx: int, bone2d_nodepath: NodePath) -> void

Sets the `Bone2D` node assigned to the FABRIK joint at `joint_idx`.

> method set_fabrik_joint_bone_index(joint_idx: int, bone_idx: int) -> void

Sets the bone index, `bone_idx`, of the FABRIK joint at `joint_idx`. When possible, this will also update the `bone2d_node` of the FABRIK joint based on data provided by the linked skeleton.

> method set_fabrik_joint_magnet_position(joint_idx: int, magnet_position: Vector2) -> void

Sets the magnet position vector for the joint at `joint_idx`.

> method set_fabrik_joint_use_target_rotation(joint_idx: int, use_target_rotation: bool) -> void

Sets whether the joint at `joint_idx` will use the target node's rotation rather than letting FABRIK rotate the node.
**Note:** This option only works for the tip/final joint in the chain. For all other nodes, this option will be ignored.
