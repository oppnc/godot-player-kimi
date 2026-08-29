# TorusMesh

> class TorusMesh
> inherits TorusMesh PrimitiveMesh

## Brief

Class representing a torus `PrimitiveMesh`.

## Description

Class representing a torus `PrimitiveMesh`.

## Properties

> property inner_radius : float ; default=0.5 ; setter=set_inner_radius ; getter=get_inner_radius

The inner radius of the torus.

> property outer_radius : float ; default=1.0 ; setter=set_outer_radius ; getter=get_outer_radius

The outer radius of the torus.

> property ring_segments : int ; default=32 ; setter=set_ring_segments ; getter=get_ring_segments

The number of edges each ring of the torus is constructed of.

> property rings : int ; default=64 ; setter=set_rings ; getter=get_rings

The number of slices the torus is constructed of.
