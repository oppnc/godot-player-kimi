# SphereMesh

> class SphereMesh
> inherits SphereMesh PrimitiveMesh

## Brief

Class representing a spherical `PrimitiveMesh`.

## Description

Class representing a spherical `PrimitiveMesh`.

## Properties

> property height : float ; default=1.0 ; setter=set_height ; getter=get_height

Full height of the sphere.

> property is_hemisphere : bool ; default=false ; setter=set_is_hemisphere ; getter=get_is_hemisphere

If `true`, a hemisphere is created rather than a full sphere.
**Note:** To get a regular hemisphere, the height and radius of the sphere must be equal.

> property radial_segments : int ; default=64 ; setter=set_radial_segments ; getter=get_radial_segments

Number of radial segments on the sphere.

> property radius : float ; default=0.5 ; setter=set_radius ; getter=get_radius

Radius of sphere.

> property rings : int ; default=32 ; setter=set_rings ; getter=get_rings

Number of segments along the height of the sphere.
