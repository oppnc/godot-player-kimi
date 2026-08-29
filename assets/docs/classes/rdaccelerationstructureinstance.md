# RDAccelerationStructureInstance

> class RDAccelerationStructureInstance ; experimental=This class may be changed or removed in future versions.
> inherits RDAccelerationStructureInstance RefCounted

## Brief

Acceleration structure instance (used by `RenderingDevice`).

## Description

`RDAccelerationStructureInstance` describes an instance of a Bottom-Level Acceleration Structure (BLAS) used in the `RenderingDevice.tlas_build` method.

## Properties

> property blas : RID ; default=RID() ; setter=set_blas ; getter=get_blas

The BLAS referenced by this instance. If `null`, the instance is treated as a placeholder but still contributes to `gl_InstanceIndex` in GLSL.

> property flags : BitField[RenderingDevice.AccelerationStructureInstanceFlagBits] ; default=0 ; setter=set_flags ; getter=get_flags

Flags for the instance.

> property hit_sbt_range : int ; default=0 ; setter=set_hit_sbt_range ; getter=get_hit_sbt_range

Hit shader binding table range used for this instance, allocated using the `RenderingDevice.hit_sbt_range_alloc` method.

> property id : int ; default=0 ; setter=set_id ; getter=get_id

Custom instance ID that can be accessed in GLSL using `gl_InstanceCustomIndexEXT`.

> property mask : int ; default=255 ; setter=set_mask ; getter=get_mask

Visibility mask used to control which rays can intersect this instance.

> property transform : Transform3D ; default=Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0) ; setter=set_transform ; getter=get_transform

Transform applied to the referenced BLAS for this instance.
