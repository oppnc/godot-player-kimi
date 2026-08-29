# PrismMesh

> class PrismMesh
> inherits PrismMesh PrimitiveMesh

## Brief

Class representing a prism-shaped `PrimitiveMesh`.

## Description

Class representing a prism-shaped `PrimitiveMesh`.

## Properties

> property left_to_right : float ; default=0.5 ; setter=set_left_to_right ; getter=get_left_to_right

Displacement of the upper edge along the X axis. 0.0 positions edge straight above the bottom-left edge.

> property size : Vector3 ; default=Vector3(1, 1, 1) ; setter=set_size ; getter=get_size

Size of the prism.

> property subdivide_depth : int ; default=0 ; setter=set_subdivide_depth ; getter=get_subdivide_depth

Number of added edge loops along the Z axis.

> property subdivide_height : int ; default=0 ; setter=set_subdivide_height ; getter=get_subdivide_height

Number of added edge loops along the Y axis.

> property subdivide_width : int ; default=0 ; setter=set_subdivide_width ; getter=get_subdivide_width

Number of added edge loops along the X axis.
