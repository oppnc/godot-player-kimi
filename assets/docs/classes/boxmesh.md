# BoxMesh

> class BoxMesh
> inherits BoxMesh PrimitiveMesh

## Brief

Generate an axis-aligned box `PrimitiveMesh`.

## Description

Generate an axis-aligned box `PrimitiveMesh`.
The box's UV layout is arranged in a 3×2 layout that allows texturing each face individually. To apply the same texture on all faces, change the material's UV property to `Vector3(3, 2, 1)`. This is equivalent to adding `UV *= vec2(3.0, 2.0)` in a vertex shader.
**Note:** When using a large textured `BoxMesh` (e.g. as a floor), you may stumble upon UV jittering issues depending on the camera angle. To solve this, increase `subdivide_depth`, `subdivide_height` and `subdivide_width` until you no longer notice UV jittering.

## Properties

> property size : Vector3 ; default=Vector3(1, 1, 1) ; setter=set_size ; getter=get_size

The box's width, height and depth.

> property subdivide_depth : int ; default=0 ; setter=set_subdivide_depth ; getter=get_subdivide_depth

Number of extra edge loops inserted along the Z axis.

> property subdivide_height : int ; default=0 ; setter=set_subdivide_height ; getter=get_subdivide_height

Number of extra edge loops inserted along the Y axis.

> property subdivide_width : int ; default=0 ; setter=set_subdivide_width ; getter=get_subdivide_width

Number of extra edge loops inserted along the X axis.
