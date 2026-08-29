# CylinderMesh

> class CylinderMesh
> inherits CylinderMesh PrimitiveMesh

## Brief

Class representing a cylindrical `PrimitiveMesh`.

## Description

Class representing a cylindrical `PrimitiveMesh`. This class can be used to create cones by setting either the `top_radius` or `bottom_radius` properties to `0.0`.

## Properties

> property bottom_radius : float ; default=0.5 ; setter=set_bottom_radius ; getter=get_bottom_radius

Bottom radius of the cylinder. If set to `0.0`, the bottom faces will not be generated, resulting in a conic shape. See also `cap_bottom`.

> property cap_bottom : bool ; default=true ; setter=set_cap_bottom ; getter=is_cap_bottom

If `true`, generates a cap at the bottom of the cylinder. This can be set to `false` to speed up generation and rendering when the cap is never seen by the camera. See also `bottom_radius`.
**Note:** If `bottom_radius` is `0.0`, cap generation is always skipped even if `cap_bottom` is `true`.

> property cap_top : bool ; default=true ; setter=set_cap_top ; getter=is_cap_top

If `true`, generates a cap at the top of the cylinder. This can be set to `false` to speed up generation and rendering when the cap is never seen by the camera. See also `top_radius`.
**Note:** If `top_radius` is `0.0`, cap generation is always skipped even if `cap_top` is `true`.

> property height : float ; default=2.0 ; setter=set_height ; getter=get_height

Full height of the cylinder.

> property radial_segments : int ; default=64 ; setter=set_radial_segments ; getter=get_radial_segments

Number of radial segments on the cylinder. Higher values result in a more detailed cylinder/cone at the cost of performance.

> property rings : int ; default=4 ; setter=set_rings ; getter=get_rings

Number of edge rings along the height of the cylinder. Changing `rings` does not have any visual impact unless a shader or procedural mesh tool is used to alter the vertex data. Higher values result in more subdivisions, which can be used to create smoother-looking effects with shaders or procedural mesh tools (at the cost of performance). When not altering the vertex data using a shader or procedural mesh tool, `rings` should be kept to its default value.

> property top_radius : float ; default=0.5 ; setter=set_top_radius ; getter=get_top_radius

Top radius of the cylinder. If set to `0.0`, the top faces will not be generated, resulting in a conic shape. See also `cap_top`.
