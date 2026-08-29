# SkeletonModification2DStackHolder

> class SkeletonModification2DStackHolder ; experimental=This class may be changed or removed in future versions.
> inherits SkeletonModification2DStackHolder SkeletonModification2D

## Brief

A modification that holds and executes a `SkeletonModificationStack2D`.

## Description

This `SkeletonModification2D` holds a reference to a `SkeletonModificationStack2D`, allowing you to use multiple modification stacks on a single `Skeleton2D`.
**Note:** The modifications in the held `SkeletonModificationStack2D` will only be executed if their execution mode matches the execution mode of the SkeletonModification2DStackHolder.

## Methods

> method get_held_modification_stack() -> SkeletonModificationStack2D ; qualifiers=const

Returns the `SkeletonModificationStack2D` that this modification is holding.

> method set_held_modification_stack(held_modification_stack: SkeletonModificationStack2D) -> void

Sets the `SkeletonModificationStack2D` that this modification is holding. This modification stack will then be executed when this modification is executed.
