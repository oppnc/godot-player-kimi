# PlaneMesh

> class PlaneMesh
> inherits PlaneMesh PrimitiveMesh

## Brief

Class representing a planar `PrimitiveMesh`.

## Description

Class representing a planar `PrimitiveMesh`. This flat mesh does not have a thickness. By default, this mesh is aligned on the X and Z axes; this default rotation isn't suited for use with billboarded materials. For billboarded materials, change `orientation` to `FACE_Z`.
**Note:** When using a large textured `PlaneMesh` (e.g. as a floor), you may stumble upon UV jittering issues depending on the camera angle. To solve this, increase `subdivide_depth` and `subdivide_width` until you no longer notice UV jittering.

## Properties

> property center_offset : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_center_offset ; getter=get_center_offset

Offset of the generated plane. Useful for particles.

> property orientation : Orientation ; default=1 ; setter=set_orientation ; getter=get_orientation

Direction that the `PlaneMesh` is facing.

> property size : Vector2 ; default=Vector2(2, 2) ; setter=set_size ; getter=get_size

Size of the generated plane.

> property subdivide_depth : int ; default=0 ; setter=set_subdivide_depth ; getter=get_subdivide_depth

Number of subdivision along the Z axis.

> property subdivide_width : int ; default=0 ; setter=set_subdivide_width ; getter=get_subdivide_width

Number of subdivision along the X axis.

## Enumerations

> enum Orientation

> enum_value Orientation.FACE_X = 0

`PlaneMesh` will face the positive X-axis.

> enum_value Orientation.FACE_Y = 1

`PlaneMesh` will face the positive Y-axis. This matches the behavior of the `PlaneMesh` in Godot 3.x.

> enum_value Orientation.FACE_Z = 2

`PlaneMesh` will face the positive Z-axis. This matches the behavior of the QuadMesh in Godot 3.x.
