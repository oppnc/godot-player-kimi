# MeshConvexDecompositionSettings

> class MeshConvexDecompositionSettings
> inherits MeshConvexDecompositionSettings RefCounted

## Brief

Parameters to be used with a `Mesh` convex decomposition operation.

## Description

Parameters to be used with a `Mesh` convex decomposition operation.

## Properties

> property convex_hull_approximation : bool ; default=true ; setter=set_convex_hull_approximation ; getter=get_convex_hull_approximation

If `true`, uses approximation for computing convex hulls.

> property convex_hull_downsampling : int ; default=4 ; setter=set_convex_hull_downsampling ; getter=get_convex_hull_downsampling

Controls the precision of the convex-hull generation process during the clipping plane selection stage. Ranges from `1` to `16`.

> property max_concavity : float ; default=1.0 ; setter=set_max_concavity ; getter=get_max_concavity

Maximum concavity. Ranges from `0.0` to `1.0`.

> property max_convex_hulls : int ; default=1 ; setter=set_max_convex_hulls ; getter=get_max_convex_hulls

The maximum number of convex hulls to produce from the merge operation.

> property max_num_vertices_per_convex_hull : int ; default=32 ; setter=set_max_num_vertices_per_convex_hull ; getter=get_max_num_vertices_per_convex_hull

Controls the maximum number of triangles per convex-hull. Ranges from `4` to `1024`.

> property min_volume_per_convex_hull : float ; default=0.0001 ; setter=set_min_volume_per_convex_hull ; getter=get_min_volume_per_convex_hull

Controls the adaptive sampling of the generated convex-hulls. Ranges from `0.0` to `0.01`.

> property mode : Mode ; default=0 ; setter=set_mode ; getter=get_mode

Mode for the approximate convex decomposition.

> property normalize_mesh : bool ; default=false ; setter=set_normalize_mesh ; getter=get_normalize_mesh

If `true`, normalizes the mesh before applying the convex decomposition.

> property plane_downsampling : int ; default=4 ; setter=set_plane_downsampling ; getter=get_plane_downsampling

Controls the granularity of the search for the "best" clipping plane. Ranges from `1` to `16`.

> property project_hull_vertices : bool ; default=true ; setter=set_project_hull_vertices ; getter=get_project_hull_vertices

If `true`, projects output convex hull vertices onto the original source mesh to increase floating-point accuracy of the results.

> property resolution : int ; default=10000 ; setter=set_resolution ; getter=get_resolution

Maximum number of voxels generated during the voxelization stage.

> property revolution_axes_clipping_bias : float ; default=0.05 ; setter=set_revolution_axes_clipping_bias ; getter=get_revolution_axes_clipping_bias

Controls the bias toward clipping along revolution axes. Ranges from `0.0` to `1.0`.

> property symmetry_planes_clipping_bias : float ; default=0.05 ; setter=set_symmetry_planes_clipping_bias ; getter=get_symmetry_planes_clipping_bias

Controls the bias toward clipping along symmetry planes. Ranges from `0.0` to `1.0`.

## Enumerations

> enum Mode

> enum_value Mode.CONVEX_DECOMPOSITION_MODE_VOXEL = 0

Constant for voxel-based approximate convex decomposition.

> enum_value Mode.CONVEX_DECOMPOSITION_MODE_TETRAHEDRON = 1

Constant for tetrahedron-based approximate convex decomposition.
