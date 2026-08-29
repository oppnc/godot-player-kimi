# QuadMesh

> class QuadMesh
> inherits QuadMesh PlaneMesh

## Brief

Class representing a square mesh facing the camera.

## Description

Class representing a square `PrimitiveMesh`. This flat mesh does not have a thickness. By default, this mesh is aligned on the X and Y axes; this rotation is more suited for use with billboarded materials. A `QuadMesh` is equivalent to a `PlaneMesh` except its default `PlaneMesh.orientation` is `PlaneMesh.FACE_Z`.

## Properties

> property orientation : PlaneMesh.Orientation ; default=2 ; setter=set_orientation ; getter=get_orientation ; overrides=PlaneMesh

> property size : Vector2 ; default=Vector2(1, 1) ; setter=set_size ; getter=get_size ; overrides=PlaneMesh

## Tutorials
- [GUI in 3D Viewport Demo](https://godotengine.org/asset-library/asset/2807)
- [2D in 3D Viewport Demo](https://godotengine.org/asset-library/asset/2803)
