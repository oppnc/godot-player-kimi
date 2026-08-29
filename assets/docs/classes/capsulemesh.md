# CapsuleMesh

> class CapsuleMesh
> inherits CapsuleMesh PrimitiveMesh

## Brief

Class representing a capsule-shaped `PrimitiveMesh`.

## Description

Class representing a capsule-shaped `PrimitiveMesh`.

## Properties

> property height : float ; default=2.0 ; setter=set_height ; getter=get_height

Total height of the capsule mesh (including the hemispherical ends).
**Note:** The `height` of a capsule must be at least twice its `radius`. Otherwise, the capsule becomes a circle. If the `height` is less than twice the `radius`, the properties adjust to a valid value.

> property radial_segments : int ; default=64 ; setter=set_radial_segments ; getter=get_radial_segments

Number of radial segments on the capsule mesh.

> property radius : float ; default=0.5 ; setter=set_radius ; getter=get_radius

Radius of the capsule mesh.
**Note:** The `radius` of a capsule cannot be greater than half of its `height`. Otherwise, the capsule becomes a circle. If the `radius` is greater than half of the `height`, the properties adjust to a valid value.

> property rings : int ; default=8 ; setter=set_rings ; getter=get_rings

Number of rings along the height of the capsule.
