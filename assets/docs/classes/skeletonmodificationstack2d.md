# SkeletonModificationStack2D

> class SkeletonModificationStack2D ; experimental=This class may be changed or removed in future versions.
> inherits SkeletonModificationStack2D Resource

## Brief

A resource that holds a stack of `SkeletonModification2D`s.

## Description

This resource is used by the Skeleton and holds a stack of `SkeletonModification2D`s.
This controls the order of the modifications and how they are applied. Modification order is especially important for full-body IK setups, as you need to execute the modifications in the correct order to get the desired results. For example, you want to execute a modification on the spine *before* the arms on a humanoid skeleton.
This resource also controls how strongly all of the modifications are applied to the `Skeleton2D`.

## Properties

> property enabled : bool ; default=false ; setter=set_enabled ; getter=get_enabled

If `true`, the modification's in the stack will be called. This is handled automatically through the `Skeleton2D` node.

> property modification_count : int ; default=0 ; setter=set_modification_count ; getter=get_modification_count

The number of modifications in the stack.

> property strength : float ; default=1.0 ; setter=set_strength ; getter=get_strength

The interpolation strength of the modifications in stack. A value of `0` will make it where the modifications are not applied, a strength of `0.5` will be half applied, and a strength of `1` will allow the modifications to be fully applied and override the `Skeleton2D` `Bone2D` poses.

## Methods

> method add_modification(modification: SkeletonModification2D) -> void

Adds the passed-in `SkeletonModification2D` to the stack.

> method delete_modification(mod_idx: int) -> void

Deletes the `SkeletonModification2D` at the index position `mod_idx`, if it exists.

> method enable_all_modifications(enabled: bool) -> void

Enables all `SkeletonModification2D`s in the stack.

> method execute(delta: float, execution_mode: int) -> void

Executes all of the `SkeletonModification2D`s in the stack that use the same execution mode as the passed-in `execution_mode`, starting from index `0` to `modification_count`.
**Note:** The order of the modifications can matter depending on the modifications. For example, modifications on a spine should operate before modifications on the arms in order to get proper results.

> method get_is_setup() -> bool ; qualifiers=const

Returns a boolean that indicates whether the modification stack is setup and can execute.

> method get_modification(mod_idx: int) -> SkeletonModification2D ; qualifiers=const

Returns the `SkeletonModification2D` at the passed-in index, `mod_idx`.

> method get_skeleton() -> Skeleton2D ; qualifiers=const

Returns the `Skeleton2D` node that the SkeletonModificationStack2D is bound to.

> method set_modification(mod_idx: int, modification: SkeletonModification2D) -> void

Sets the modification at `mod_idx` to the passed-in modification, `modification`.

> method setup() -> void

Sets up the modification stack so it can execute. This function should be called by `Skeleton2D` and shouldn't be manually called unless you know what you are doing.
