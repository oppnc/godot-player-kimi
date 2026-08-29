# BoneConstraint3D

> class BoneConstraint3D
> inherits BoneConstraint3D SkeletonModifier3D

## Brief

A node that may modify Skeleton3D's bone with associating the two bones.

## Description

Base class of `SkeletonModifier3D` that modifies the bone set in `set_apply_bone` based on the transform of the bone retrieved by `get_reference_bone`.
**Note:** Most methods in this class take an `index` parameter. This parameter specifies which setting list entry to return if the IK has multiple entries (e.g. `settings/<index>/amount`).

## Methods

> method clear_setting() -> void

Clear all settings.

> method get_amount(index: int) -> float ; qualifiers=const

Returns the apply amount of the setting at `index`.

> method get_apply_bone(index: int) -> int ; qualifiers=const

Returns the apply bone of the setting at `index`. This bone will be modified.

> method get_apply_bone_name(index: int) -> String ; qualifiers=const

Returns the apply bone name of the setting at `index`. This bone will be modified.

> method get_reference_bone(index: int) -> int ; qualifiers=const

Returns the reference bone of the setting at `index`.
This bone will be only referenced and not modified by this modifier.

> method get_reference_bone_name(index: int) -> String ; qualifiers=const

Returns the reference bone name of the setting at `index`.
This bone will be only referenced and not modified by this modifier.

> method get_reference_node(index: int) -> NodePath ; qualifiers=const

Returns the reference node path of the setting at `index`.
This node will be only referenced and not modified by this modifier.

> method get_reference_type(index: int) -> ReferenceType ; qualifiers=const

Returns the reference target type of the setting at `index`. See also `ReferenceType`.

> method get_setting_count() -> int ; qualifiers=const

Returns the number of settings in the modifier.

> method set_amount(index: int, amount: float) -> void

Sets the apply amount of the setting at `index` to `amount`.

> method set_apply_bone(index: int, bone: int) -> void

Sets the apply bone of the setting at `index` to `bone`. This bone will be modified.

> method set_apply_bone_name(index: int, bone_name: String) -> void

Sets the apply bone of the setting at `index` to `bone_name`. This bone will be modified.

> method set_reference_bone(index: int, bone: int) -> void

Sets the reference bone of the setting at `index` to `bone`.
This bone will be only referenced and not modified by this modifier.

> method set_reference_bone_name(index: int, bone_name: String) -> void

Sets the reference bone of the setting at `index` to `bone_name`.
This bone will be only referenced and not modified by this modifier.

> method set_reference_node(index: int, node: NodePath) -> void

Sets the reference node path of the setting at `index` to `node`.
This node will be only referenced and not modified by this modifier.

> method set_reference_type(index: int, type: ReferenceType) -> void

Sets the reference target type of the setting at `index` to `type`. See also `ReferenceType`.

> method set_setting_count(count: int) -> void

Sets the number of settings in the modifier.

## Enumerations

> enum ReferenceType

> enum_value ReferenceType.REFERENCE_TYPE_BONE = 0

The reference target is a bone. In this case, the reference target spaces is local space.

> enum_value ReferenceType.REFERENCE_TYPE_NODE = 1

The reference target is a `Node3D`. In this case, the reference target spaces is model space.
In other words, the reference target's coordinates are treated as if it were placed directly under `Skeleton3D` which parent of the `BoneConstraint3D`.
