# TubeTrailMesh

> class TubeTrailMesh
> inherits TubeTrailMesh PrimitiveMesh

## Brief

Represents a straight tube-shaped `PrimitiveMesh` with variable width.

## Description

`TubeTrailMesh` represents a straight tube-shaped mesh with variable width. The tube is composed of a number of cylindrical sections, each with the same `section_length` and number of `section_rings`. A `curve` is sampled along the total length of the tube, meaning that the curve determines the radius of the tube along its length.
This primitive mesh is usually used for particle trails.

## Properties

> property cap_bottom : bool ; default=true ; setter=set_cap_bottom ; getter=is_cap_bottom

If `true`, generates a cap at the bottom of the tube. This can be set to `false` to speed up generation and rendering when the cap is never seen by the camera.

> property cap_top : bool ; default=true ; setter=set_cap_top ; getter=is_cap_top

If `true`, generates a cap at the top of the tube. This can be set to `false` to speed up generation and rendering when the cap is never seen by the camera.

> property curve : Curve ; setter=set_curve ; getter=get_curve

Determines the radius of the tube along its length. The radius of a particular section ring is obtained by multiplying the baseline `radius` by the value of this curve at the given distance. For values smaller than `0`, the faces will be inverted. Should be a unit `Curve`.

> property radial_steps : int ; default=8 ; setter=set_radial_steps ; getter=get_radial_steps

The number of sides on the tube. For example, a value of `5` means the tube will be pentagonal. Higher values result in a more detailed tube at the cost of performance.

> property radius : float ; default=0.5 ; setter=set_radius ; getter=get_radius

The baseline radius of the tube. The radius of a particular section ring is obtained by multiplying this radius by the value of the `curve` at the given distance.

> property section_length : float ; default=0.2 ; setter=set_section_length ; getter=get_section_length

The length of a section of the tube.

> property section_rings : int ; default=3 ; setter=set_section_rings ; getter=get_section_rings

The number of rings in a section. The `curve` is sampled on each ring to determine its radius. Higher values result in a more detailed tube at the cost of performance.

> property sections : int ; default=5 ; setter=set_sections ; getter=get_sections

The total number of sections on the tube.

## Tutorials
- [3D Particle trails]($DOCS_URL/tutorials/3d/particles/trails.html)
- [Particle systems (3D)]($DOCS_URL/tutorials/3d/particles/index.html)
