# ConvertTransformModifier3D

> class ConvertTransformModifier3D
> inherits ConvertTransformModifier3D BoneConstraint3D

## Brief

A `SkeletonModifier3D` that apply transform to the bone which converted from reference.

## Description

Apply the copied transform of the bone set by `BoneConstraint3D.set_reference_bone` to the bone set by `BoneConstraint3D.set_apply_bone` about the specific axis with remapping it with some options.
There are 4 ways to apply the transform, depending on the combination of `set_relative` and `set_additive`.
**Relative + Additive:**
- Extract reference pose relative to the rest and add it to the apply bone's pose.
**Relative + Not Additive:**
- Extract reference pose relative to the rest and add it to the apply bone's rest.
**Not Relative + Additive:**
- Extract reference pose absolutely and add it to the apply bone's pose.
**Not Relative + Not Additive:**
- Extract reference pose absolutely and the apply bone's pose is replaced with it.
**Note:** Relative option is available only in the case `BoneConstraint3D.get_reference_type` is `BoneConstraint3D.REFERENCE_TYPE_BONE`. See also `BoneConstraint3D.ReferenceType`.
**Note:** If there is a rotation greater than `180` degrees with constrained axes, flipping may occur.

## Properties

> property setting_count : int ; default=0 ; setter=set_setting_count ; getter=get_setting_count

The number of settings in the modifier.

## Methods

> method get_apply_axis(index: int) -> Vector3.Axis ; qualifiers=const

Returns the axis of the remapping destination transform.

> method get_apply_range_max(index: int) -> float ; qualifiers=const

Returns the maximum value of the remapping destination range.

> method get_apply_range_min(index: int) -> float ; qualifiers=const

Returns the minimum value of the remapping destination range.

> method get_apply_transform_mode(index: int) -> TransformMode ; qualifiers=const

Returns the operation of the remapping destination transform.

> method get_reference_axis(index: int) -> Vector3.Axis ; qualifiers=const

Returns the axis of the remapping source transform.

> method get_reference_range_max(index: int) -> float ; qualifiers=const

Returns the maximum value of the remapping source range.

> method get_reference_range_min(index: int) -> float ; qualifiers=const

Returns the minimum value of the remapping source range.

> method get_reference_transform_mode(index: int) -> TransformMode ; qualifiers=const

Returns the operation of the remapping source transform.

> method is_additive(index: int) -> bool ; qualifiers=const

Returns `true` if the additive option is enabled in the setting at `index`.

> method is_relative(index: int) -> bool ; qualifiers=const

Returns `true` if the relative option is enabled in the setting at `index`.

> method set_additive(index: int, enabled: bool) -> void

Sets additive option in the setting at `index` to `enabled`. This mainly affects the process of applying transform to the `BoneConstraint3D.set_apply_bone`.
If sets `enabled` to `true`, the processed transform is added to the pose of the current apply bone.
If sets `enabled` to `false`, the pose of the current apply bone is replaced with the processed transform. However, if set `set_relative` to `true`, the transform is relative to rest.

> method set_apply_axis(index: int, axis: Vector3.Axis) -> void

Sets the axis of the remapping destination transform.

> method set_apply_range_max(index: int, range_max: float) -> void

Sets the maximum value of the remapping destination range.

> method set_apply_range_min(index: int, range_min: float) -> void

Sets the minimum value of the remapping destination range.

> method set_apply_transform_mode(index: int, transform_mode: TransformMode) -> void

Sets the operation of the remapping destination transform.

> method set_reference_axis(index: int, axis: Vector3.Axis) -> void

Sets the axis of the remapping source transform.

> method set_reference_range_max(index: int, range_max: float) -> void

Sets the maximum value of the remapping source range.

> method set_reference_range_min(index: int, range_min: float) -> void

Sets the minimum value of the remapping source range.

> method set_reference_transform_mode(index: int, transform_mode: TransformMode) -> void

Sets the operation of the remapping source transform.

> method set_relative(index: int, enabled: bool) -> void

Sets relative option in the setting at `index` to `enabled`.
If sets `enabled` to `true`, the extracted and applying transform is relative to the rest.
If sets `enabled` to `false`, the extracted transform is absolute.

## Enumerations

> enum TransformMode

> enum_value TransformMode.TRANSFORM_MODE_POSITION = 0

Convert with position. Transfer the difference.

> enum_value TransformMode.TRANSFORM_MODE_ROTATION = 1

Convert with rotation. The angle is the roll for the specified axis.

> enum_value TransformMode.TRANSFORM_MODE_SCALE = 2

Convert with scale. Transfers the ratio, not the difference.
