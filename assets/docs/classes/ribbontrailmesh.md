# RibbonTrailMesh

> class RibbonTrailMesh
> inherits RibbonTrailMesh PrimitiveMesh

## Brief

Represents a straight ribbon-shaped `PrimitiveMesh` with variable width.

## Description

`RibbonTrailMesh` represents a straight ribbon-shaped mesh with variable width. The ribbon is composed of a number of flat or cross-shaped sections, each with the same `section_length` and number of `section_segments`. A `curve` is sampled along the total length of the ribbon, meaning that the curve determines the size of the ribbon along its length.
This primitive mesh is usually used for particle trails.

## Properties

> property curve : Curve ; setter=set_curve ; getter=get_curve

Determines the size of the ribbon along its length. The size of a particular section segment is obtained by multiplying the baseline `size` by the value of this curve at the given distance. For values smaller than `0`, the faces will be inverted. Should be a unit `Curve`.

> property section_length : float ; default=0.2 ; setter=set_section_length ; getter=get_section_length

The length of a section of the ribbon.

> property section_segments : int ; default=3 ; setter=set_section_segments ; getter=get_section_segments

The number of segments in a section. The `curve` is sampled on each segment to determine its size. Higher values result in a more detailed ribbon at the cost of performance.

> property sections : int ; default=5 ; setter=set_sections ; getter=get_sections

The total number of sections on the ribbon.

> property shape : Shape ; default=1 ; setter=set_shape ; getter=get_shape

Determines the shape of the ribbon.

> property size : float ; default=1.0 ; setter=set_size ; getter=get_size

The baseline size of the ribbon. The size of a particular section segment is obtained by multiplying this size by the value of the `curve` at the given distance.

## Enumerations

> enum Shape

> enum_value Shape.SHAPE_FLAT = 0

Gives the mesh a single flat face.

> enum_value Shape.SHAPE_CROSS = 1

Gives the mesh two perpendicular flat faces, making a cross shape.

## Tutorials
- [3D Particle trails]($DOCS_URL/tutorials/3d/particles/trails.html)
- [Particle systems (3D)]($DOCS_URL/tutorials/3d/particles/index.html)
