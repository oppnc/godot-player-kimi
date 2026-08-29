# AnimationNodeBlendSpace1D

> class AnimationNodeBlendSpace1D
> inherits AnimationNodeBlendSpace1D AnimationRootNode

## Brief

A set of `AnimationRootNode`s placed on a virtual axis, crossfading between the two adjacent ones. Used by `AnimationTree`.

## Description

A resource used by `AnimationNodeBlendTree`.
`AnimationNodeBlendSpace1D` represents a virtual axis on which any type of `AnimationRootNode`s can be added using `add_blend_point`. Outputs the linear blend of the two `AnimationRootNode`s adjacent to the current value.
You can set the extents of the axis with `min_space` and `max_space`.

## Properties

> property blend_mode : BlendMode ; default=0 ; setter=set_blend_mode ; getter=get_blend_mode

Controls the interpolation between animations.

> property cyclic_length : float ; default=0.0 ; setter=set_cyclic_length ; getter=get_cyclic_length

The cycle length in seconds used by `SYNC_MODE_CYCLIC_CONSTANT`. All animations are time-scaled so they complete one full cycle in this duration. Must be greater than `0` for cyclic sync to take effect.

> property max_space : float ; default=1.0 ; setter=set_max_space ; getter=get_max_space

The blend space's axis's upper limit for the points' position. See `add_blend_point`.

> property min_space : float ; default=-1.0 ; setter=set_min_space ; getter=get_min_space

The blend space's axis's lower limit for the points' position. See `add_blend_point`.

> property snap : float ; default=0.1 ; setter=set_snap ; getter=get_snap

Position increment to snap to when moving a point on the axis.

> property sync : bool ; setter=set_use_sync ; getter=is_using_sync ; deprecated=Use `sync_mode` instead.

If `true`, sync mode is enabled (equivalent to `SYNC_MODE_INDEPENDENT`). This property is kept for backward compatibility.

> property sync_mode : SyncMode ; default=0 ; setter=set_sync_mode ; getter=get_sync_mode

Controls how animations are synced when blended. See `SyncMode` for available options.

> property value_label : String ; default="value" ; setter=set_value_label ; getter=get_value_label

Label of the virtual axis of the blend space.

## Methods

> method add_blend_point(node: AnimationRootNode, pos: float, at_index: int = -1, name: StringName = &"") -> void

Adds a new point with `name` that represents a `node` on the virtual axis at a given position set by `pos`. You can insert it at a specific index using the `at_index` argument. If you use the default value for `at_index`, the point is inserted at the end of the blend points array.
**Note:** If no name is provided, safe index is used as reference. In the future, empty names will be deprecated, so explicitly passing a name is recommended.

> method find_blend_point_by_name(name: StringName) -> int ; qualifiers=const

Returns the index of the blend point with the given `name`. Returns `-1` if no blend point with that name is found.

> method get_blend_point_count() -> int ; qualifiers=const

Returns the number of points on the blend axis.

> method get_blend_point_name(point: int) -> StringName ; qualifiers=const

Returns the name of the blend point at index `point`.

> method get_blend_point_node(point: int) -> AnimationRootNode ; qualifiers=const

Returns the `AnimationNode` referenced by the point at index `point`.

> method get_blend_point_position(point: int) -> float ; qualifiers=const

Returns the position of the point at index `point`.

> method remove_blend_point(point: int) -> void

Removes the point at index `point` from the blend axis.

> method reorder_blend_point(from_index: int, to_index: int) -> void

Swaps the blend points at indices `from_index` and `to_index`, exchanging their positions and properties.

> method set_blend_point_name(point: int, name: StringName) -> void

Sets the name of the blend point at index `point`. If the name conflicts with an existing point, a unique name will be generated automatically.

> method set_blend_point_node(point: int, node: AnimationRootNode) -> void

Changes the `AnimationNode` referenced by the point at index `point`.

> method set_blend_point_position(point: int, pos: float) -> void

Updates the position of the point at index `point` on the blend axis.

## Enumerations

> enum BlendMode

> enum_value BlendMode.BLEND_MODE_INTERPOLATED = 0

The interpolation between animations is linear.

> enum_value BlendMode.BLEND_MODE_DISCRETE = 1

The blend space plays the animation of the animation node which blending position is closest to. Useful for frame-by-frame 2D animations.

> enum_value BlendMode.BLEND_MODE_DISCRETE_CARRY = 2

Similar to `BLEND_MODE_DISCRETE`, but starts the new animation at the last animation's playback position.

> enum SyncMode

> enum_value SyncMode.SYNC_MODE_NONE = 0

Inactive animations are frozen and do not advance.

> enum_value SyncMode.SYNC_MODE_INDEPENDENT = 1

Inactive animations advance with a weight of `0`. This is equivalent to the previous `sync = true` behavior.

> enum_value SyncMode.SYNC_MODE_CYCLIC_MUTABLE = 2

All animations are time-scaled so they stay in sync, with the cycle length dynamically computed from active blend weights. This is self-normalizing: a solo animation plays at normal speed.
**Note:** If you apply `AnimationNodeTimeSeek` to the result when handling animations of different lengths, synchronization will be broken. In such cases, it is recommended to use `AnimationNodeAnimation.use_custom_timeline` to align the animation lengths.

> enum_value SyncMode.SYNC_MODE_CYCLIC_CONSTANT = 3

All animations are time-scaled so they complete one cycle in `cyclic_length` seconds, keeping them in sync regardless of their individual lengths.
**Note:** If you apply `AnimationNodeTimeSeek` to the result when handling animations of different lengths, synchronization will be broken. In such cases, it is recommended to use `AnimationNodeAnimation.use_custom_timeline` to align the animation lengths.

## Tutorials
- [Using AnimationTree]($DOCS_URL/tutorials/animation/animation_tree.html)
