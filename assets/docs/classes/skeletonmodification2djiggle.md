# SkeletonModification2DJiggle

> class SkeletonModification2DJiggle ; experimental=This class may be changed or removed in future versions.
> inherits SkeletonModification2DJiggle SkeletonModification2D

## Brief

A modification that jiggles `Bone2D` nodes as they move towards a target.

## Description

This modification moves a series of bones, typically called a bone chain, towards a target. What makes this modification special is that it calculates the velocity and acceleration for each bone in the bone chain, and runs a very light physics-like calculation using the inputted values. This allows the bones to overshoot the target and "jiggle" around. It can be configured to act more like a spring, or sway around like cloth might.
This modification is useful for adding additional motion to things like hair, the edges of clothing, and more. It has several settings to that allow control over how the joint moves when the target moves.
**Note:** The Jiggle modifier has `jiggle_joints`, which are the data objects that hold the data for each joint in the Jiggle chain. This is different from than `Bone2D` nodes! Jiggle joints hold the data needed for each `Bone2D` in the bone chain used by the Jiggle modification.

## Properties

> property damping : float ; default=0.75 ; setter=set_damping ; getter=get_damping

The default amount of damping applied to the Jiggle joints, if they are not overridden. Higher values lead to more of the calculated velocity being applied.

> property gravity : Vector2 ; default=Vector2(0, 6) ; setter=set_gravity ; getter=get_gravity

The default amount of gravity applied to the Jiggle joints, if they are not overridden.

> property jiggle_data_chain_length : int ; default=0 ; setter=set_jiggle_data_chain_length ; getter=get_jiggle_data_chain_length

The amount of Jiggle joints in the Jiggle modification.

> property mass : float ; default=0.75 ; setter=set_mass ; getter=get_mass

The default amount of mass assigned to the Jiggle joints, if they are not overridden. Higher values lead to faster movements and more overshooting.

> property stiffness : float ; default=3.0 ; setter=set_stiffness ; getter=get_stiffness

The default amount of stiffness assigned to the Jiggle joints, if they are not overridden. Higher values act more like springs, quickly moving into the correct position.

> property target_nodepath : NodePath ; default=NodePath("") ; setter=set_target_node ; getter=get_target_node

The NodePath to the node that is the target for the Jiggle modification. This node is what the Jiggle chain will attempt to rotate the bone chain to.

> property use_gravity : bool ; default=false ; setter=set_use_gravity ; getter=get_use_gravity

Whether the gravity vector, `gravity`, should be applied to the Jiggle joints, assuming they are not overriding the default settings.

## Methods

> method get_collision_mask() -> int ; qualifiers=const

Returns the collision mask used by the Jiggle modifier when collisions are enabled.

> method get_jiggle_joint_bone2d_node(joint_idx: int) -> NodePath ; qualifiers=const

Returns the `Bone2D` node assigned to the Jiggle joint at `joint_idx`.

> method get_jiggle_joint_bone_index(joint_idx: int) -> int ; qualifiers=const

Returns the index of the `Bone2D` node assigned to the Jiggle joint at `joint_idx`.

> method get_jiggle_joint_damping(joint_idx: int) -> float ; qualifiers=const

Returns the amount of damping of the Jiggle joint at `joint_idx`.

> method get_jiggle_joint_gravity(joint_idx: int) -> Vector2 ; qualifiers=const

Returns a `Vector2` representing the amount of gravity the Jiggle joint at `joint_idx` is influenced by.

> method get_jiggle_joint_mass(joint_idx: int) -> float ; qualifiers=const

Returns the amount of mass of the jiggle joint at `joint_idx`.

> method get_jiggle_joint_override(joint_idx: int) -> bool ; qualifiers=const

Returns a boolean that indicates whether the joint at `joint_idx` is overriding the default Jiggle joint data defined in the modification.

> method get_jiggle_joint_stiffness(joint_idx: int) -> float ; qualifiers=const

Returns the stiffness of the Jiggle joint at `joint_idx`.

> method get_jiggle_joint_use_gravity(joint_idx: int) -> bool ; qualifiers=const

Returns a boolean that indicates whether the joint at `joint_idx` is using gravity or not.

> method get_use_colliders() -> bool ; qualifiers=const

Returns whether the jiggle modifier is taking physics colliders into account when solving.

> method reset() -> void

Resets the internal jiggle simulation state to the current bone positions, clearing velocity, acceleration, and accumulated forces.

> method set_collision_mask(collision_mask: int) -> void

Sets the collision mask that the Jiggle modifier will use when reacting to colliders, if the Jiggle modifier is set to take colliders into account.

> method set_jiggle_joint_bone2d_node(joint_idx: int, bone2d_node: NodePath) -> void

Sets the `Bone2D` node assigned to the Jiggle joint at `joint_idx`.

> method set_jiggle_joint_bone_index(joint_idx: int, bone_idx: int) -> void

Sets the bone index, `bone_idx`, of the Jiggle joint at `joint_idx`. When possible, this will also update the `bone2d_node` of the Jiggle joint based on data provided by the linked skeleton.

> method set_jiggle_joint_damping(joint_idx: int, damping: float) -> void

Sets the amount of damping of the Jiggle joint at `joint_idx`.

> method set_jiggle_joint_gravity(joint_idx: int, gravity: Vector2) -> void

Sets the gravity vector of the Jiggle joint at `joint_idx`.

> method set_jiggle_joint_mass(joint_idx: int, mass: float) -> void

Sets the of mass of the Jiggle joint at `joint_idx`.

> method set_jiggle_joint_override(joint_idx: int, override: bool) -> void

Sets whether the Jiggle joint at `joint_idx` should override the default Jiggle joint settings. Setting this to `true` will make the joint use its own settings rather than the default ones attached to the modification.

> method set_jiggle_joint_stiffness(joint_idx: int, stiffness: float) -> void

Sets the of stiffness of the Jiggle joint at `joint_idx`.

> method set_jiggle_joint_use_gravity(joint_idx: int, use_gravity: bool) -> void

Sets whether the Jiggle joint at `joint_idx` should use gravity.

> method set_use_colliders(use_colliders: bool) -> void

If `true`, the Jiggle modifier will take colliders into account, keeping them from entering into these collision objects.
