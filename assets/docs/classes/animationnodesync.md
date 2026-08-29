# AnimationNodeSync

> class AnimationNodeSync
> inherits AnimationNodeSync AnimationNode

## Brief

Base class for `AnimationNode`s with multiple input ports that must be synchronized.

## Description

An animation node used to combine, mix, or blend two or more animations together while keeping them synchronized within an `AnimationTree`.

## Properties

> property sync : bool ; default=false ; setter=set_use_sync ; getter=is_using_sync

If `false`, the blended animations' frame are stopped when the blend value is `0`.
If `true`, forcing the blended animations to advance frame.

## Tutorials
- [Using AnimationTree]($DOCS_URL/tutorials/animation/animation_tree.html)
