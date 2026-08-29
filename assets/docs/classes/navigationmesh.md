# NavigationMesh

> class NavigationMesh ; experimental=This class may be changed or removed in future versions.
> inherits NavigationMesh Resource

## Brief

A navigation mesh that defines traversable areas and obstacles.

## Description

A navigation mesh is a collection of polygons that define which areas of an environment are traversable to aid agents in pathfinding through complicated spaces.

## Properties

> property agent_height : float ; default=1.5 ; setter=set_agent_height ; getter=get_agent_height

The minimum floor to ceiling height that will still allow the floor area to be considered walkable.
**Note:** While baking, this value will be rounded up to the nearest multiple of `cell_height`.

> property agent_max_climb : float ; default=0.25 ; setter=set_agent_max_climb ; getter=get_agent_max_climb

The minimum ledge height that is considered to still be traversable.
**Note:** While baking, this value will be rounded down to the nearest multiple of `cell_height`.

> property agent_max_slope : float ; default=45.0 ; setter=set_agent_max_slope ; getter=get_agent_max_slope

The maximum slope that is considered walkable, in degrees.

> property agent_radius : float ; default=0.5 ; setter=set_agent_radius ; getter=get_agent_radius

The distance to erode/shrink the walkable area of the heightfield away from obstructions.
**Note:** While baking, this value will be rounded up to the nearest multiple of `cell_size`.
**Note:** The radius must be equal or higher than `0.0`. If the radius is `0.0`, it won't be possible to fix invalid outline overlaps and other precision errors during the baking process. As a result, some obstacles may be excluded incorrectly from the final navigation mesh, or may delete the navigation mesh's polygons.

> property border_size : float ; default=0.0 ; setter=set_border_size ; getter=get_border_size

The size of the non-navigable border around the bake bounding area.
In conjunction with the `filter_baking_aabb` and a `edge_max_error` value at `1.0` or below the border size can be used to bake tile aligned navigation meshes without the tile edges being shrunk by `agent_radius`.
**Note:** If this value is not `0.0`, it will be rounded up to the nearest multiple of `cell_size` during baking.

> property cell_height : float ; default=0.25 ; setter=set_cell_height ; getter=get_cell_height

The cell height used to rasterize the navigation mesh vertices on the Y axis. Must match with the cell height on the navigation map.

> property cell_size : float ; default=0.25 ; setter=set_cell_size ; getter=get_cell_size

The cell size used to rasterize the navigation mesh vertices on the XZ plane. Must match with the cell size on the navigation map.

> property detail_sample_distance : float ; default=6.0 ; setter=set_detail_sample_distance ; getter=get_detail_sample_distance

The sampling distance to use when generating the detail mesh, in cell unit.

> property detail_sample_max_error : float ; default=1.0 ; setter=set_detail_sample_max_error ; getter=get_detail_sample_max_error

The maximum distance the detail mesh surface should deviate from heightfield, in cell unit.

> property edge_max_error : float ; default=1.3 ; setter=set_edge_max_error ; getter=get_edge_max_error

The maximum distance a simplified contour's border edges should deviate the original raw contour.

> property edge_max_length : float ; default=0.0 ; setter=set_edge_max_length ; getter=get_edge_max_length

The maximum allowed length for contour edges along the border of the mesh. A value of `0.0` disables this feature.
**Note:** While baking, this value will be rounded up to the nearest multiple of `cell_size`.

> property filter_baking_aabb : AABB ; default=AABB(0, 0, 0, 0, 0, 0) ; setter=set_filter_baking_aabb ; getter=get_filter_baking_aabb

If the baking `AABB` has a volume the navigation mesh baking will be restricted to its enclosing area.

> property filter_baking_aabb_offset : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_filter_baking_aabb_offset ; getter=get_filter_baking_aabb_offset

The position offset applied to the `filter_baking_aabb` `AABB`.

> property filter_ledge_spans : bool ; default=false ; setter=set_filter_ledge_spans ; getter=get_filter_ledge_spans

If `true`, marks spans that are ledges as non-walkable.

> property filter_low_hanging_obstacles : bool ; default=false ; setter=set_filter_low_hanging_obstacles ; getter=get_filter_low_hanging_obstacles

If `true`, marks non-walkable spans as walkable if their maximum is within `agent_max_climb` of a walkable neighbor.

> property filter_walkable_low_height_spans : bool ; default=false ; setter=set_filter_walkable_low_height_spans ; getter=get_filter_walkable_low_height_spans

If `true`, marks walkable spans as not walkable if the clearance above the span is less than `agent_height`.

> property geometry_collision_mask : int ; default=4294967295 ; setter=set_collision_mask ; getter=get_collision_mask

The physics layers to scan for static colliders.
Only used when `geometry_parsed_geometry_type` is `PARSED_GEOMETRY_STATIC_COLLIDERS` or `PARSED_GEOMETRY_BOTH`.

> property geometry_parsed_geometry_type : ParsedGeometryType ; default=2 ; setter=set_parsed_geometry_type ; getter=get_parsed_geometry_type

Determines which type of nodes will be parsed as geometry.

> property geometry_source_geometry_mode : SourceGeometryMode ; default=0 ; setter=set_source_geometry_mode ; getter=get_source_geometry_mode

The source of the geometry used when baking.

> property geometry_source_group_name : StringName ; default=&"navigation_mesh_source_group" ; setter=set_source_group_name ; getter=get_source_group_name

The name of the group to scan for geometry.
Only used when `geometry_source_geometry_mode` is `SOURCE_GEOMETRY_GROUPS_WITH_CHILDREN` or `SOURCE_GEOMETRY_GROUPS_EXPLICIT`.

> property region_merge_size : float ; default=20.0 ; setter=set_region_merge_size ; getter=get_region_merge_size

Any regions with a size smaller than this will be merged with larger regions if possible.
**Note:** This value will be squared to calculate the number of cells. For example, a value of 20 will set the number of cells to 400.

> property region_min_size : float ; default=2.0 ; setter=set_region_min_size ; getter=get_region_min_size

The minimum size of a region for it to be created.
**Note:** This value will be squared to calculate the minimum number of cells allowed to form isolated island areas. For example, a value of 8 will set the number of cells to 64.

> property sample_partition_type : SamplePartitionType ; default=0 ; setter=set_sample_partition_type ; getter=get_sample_partition_type

Partitioning algorithm for creating the navigation mesh polys.

> property vertices_per_polygon : float ; default=6.0 ; setter=set_vertices_per_polygon ; getter=get_vertices_per_polygon

The maximum number of vertices allowed for polygons generated during the contour to polygon conversion process.

## Methods

> method add_polygon(polygon: PackedInt32Array) -> void

Adds a polygon using the indices of the vertices you get when calling `get_vertices`.

> method clear() -> void

Clears the internal arrays for vertices and polygon indices.

> method clear_polygons() -> void

Clears the array of polygons, but it doesn't clear the array of vertices.

> method create_from_mesh(mesh: Mesh) -> void

Initializes the navigation mesh by setting the vertices and indices according to a `Mesh`.
**Note:** The given `mesh` must be of type `Mesh.PRIMITIVE_TRIANGLES` and have an index array.

> method get_collision_mask_value(layer_number: int) -> bool ; qualifiers=const

Returns whether or not the specified layer of the `geometry_collision_mask` is enabled, given a `layer_number` between 1 and 32.

> method get_polygon(idx: int) -> PackedInt32Array

Returns a `PackedInt32Array` containing the indices of the vertices of a created polygon.

> method get_polygon_count() -> int ; qualifiers=const

Returns the number of polygons in the navigation mesh.

> method get_vertices() -> PackedVector3Array ; qualifiers=const

Returns a `PackedVector3Array` containing all the vertices being used to create the polygons.

> method set_collision_mask_value(layer_number: int, value: bool) -> void

Based on `value`, enables or disables the specified layer in the `geometry_collision_mask`, given a `layer_number` between 1 and 32.

> method set_vertices(vertices: PackedVector3Array) -> void

Sets the vertices that can be then indexed to create polygons with the `add_polygon` method.

## Enumerations

> enum ParsedGeometryType

> enum_value ParsedGeometryType.PARSED_GEOMETRY_MESH_INSTANCES = 0

Parses mesh instances as geometry. This includes `MeshInstance3D`, `CSGShape3D`, and `GridMap` nodes.

> enum_value ParsedGeometryType.PARSED_GEOMETRY_STATIC_COLLIDERS = 1

Parses `StaticBody3D` colliders as geometry. The collider should be in any of the layers specified by `geometry_collision_mask`.

> enum_value ParsedGeometryType.PARSED_GEOMETRY_BOTH = 2

Both `PARSED_GEOMETRY_MESH_INSTANCES` and `PARSED_GEOMETRY_STATIC_COLLIDERS`.

> enum_value ParsedGeometryType.PARSED_GEOMETRY_MAX = 3

Represents the size of the `ParsedGeometryType` enum.

> enum SamplePartitionType

> enum_value SamplePartitionType.SAMPLE_PARTITION_WATERSHED = 0

Watershed partitioning. Generally the best choice if you precompute the navigation mesh, use this if you have large open areas.

> enum_value SamplePartitionType.SAMPLE_PARTITION_MONOTONE = 1

Monotone partitioning. Use this if you want fast navigation mesh generation.

> enum_value SamplePartitionType.SAMPLE_PARTITION_LAYERS = 2

Layer partitioning. Good choice to use for tiled navigation mesh with medium and small sized tiles.

> enum_value SamplePartitionType.SAMPLE_PARTITION_MAX = 3

Represents the size of the `SamplePartitionType` enum.

> enum SourceGeometryMode

> enum_value SourceGeometryMode.SOURCE_GEOMETRY_ROOT_NODE_CHILDREN = 0

Scans the child nodes of the root node recursively for geometry.

> enum_value SourceGeometryMode.SOURCE_GEOMETRY_GROUPS_WITH_CHILDREN = 1

Scans nodes in a group and their child nodes recursively for geometry. The group is specified by `geometry_source_group_name`.

> enum_value SourceGeometryMode.SOURCE_GEOMETRY_GROUPS_EXPLICIT = 2

Uses nodes in a group for geometry. The group is specified by `geometry_source_group_name`.

> enum_value SourceGeometryMode.SOURCE_GEOMETRY_MAX = 3

Represents the size of the `SourceGeometryMode` enum.

## Tutorials
- [Using NavigationMeshes]($DOCS_URL/tutorials/navigation/navigation_using_navigationmeshes.html)
- [3D Navigation Demo](https://godotengine.org/asset-library/asset/2743)
