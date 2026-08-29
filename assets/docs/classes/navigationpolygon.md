# NavigationPolygon

> class NavigationPolygon ; experimental=This class may be changed or removed in future versions.
> inherits NavigationPolygon Resource

## Brief

A 2D navigation mesh that describes a traversable surface for pathfinding.

## Description

A navigation mesh can be created either by baking it with the help of the `NavigationServer2D`, or by adding vertices and convex polygon indices arrays manually.
To bake a navigation mesh at least one outline needs to be added that defines the outer bounds of the baked area.

```gdscript
        var new_navigation_mesh = NavigationPolygon.new()
        var bounding_outline = PackedVector2Array([Vector2(0, 0), Vector2(0, 50), Vector2(50, 50), Vector2(50, 0)])
        new_navigation_mesh.add_outline(bounding_outline)
        NavigationServer2D.bake_from_source_geometry_data(new_navigation_mesh, NavigationMeshSourceGeometryData2D.new());
        $NavigationRegion2D.navigation_polygon = new_navigation_mesh

```

```csharp
        var newNavigationMesh = new NavigationPolygon();
        Vector2[] boundingOutline = [new Vector2(0, 0), new Vector2(0, 50), new Vector2(50, 50), new Vector2(50, 0)];
        newNavigationMesh.AddOutline(boundingOutline);
        NavigationServer2D.BakeFromSourceGeometryData(newNavigationMesh, new NavigationMeshSourceGeometryData2D());
        GetNode<NavigationRegion2D>("NavigationRegion2D").NavigationPolygon = newNavigationMesh;

```

Adding vertices and polygon indices manually.

```gdscript
        var new_navigation_mesh = NavigationPolygon.new()
        var new_vertices = PackedVector2Array([Vector2(0, 0), Vector2(0, 50), Vector2(50, 50), Vector2(50, 0)])
        new_navigation_mesh.vertices = new_vertices
        var new_polygon_indices = PackedInt32Array([0, 1, 2, 3])
        new_navigation_mesh.add_polygon(new_polygon_indices)
        $NavigationRegion2D.navigation_polygon = new_navigation_mesh

```

```csharp
        var newNavigationMesh = new NavigationPolygon();
        Vector2[] newVertices = [new Vector2(0, 0), new Vector2(0, 50), new Vector2(50, 50), new Vector2(50, 0)];
        newNavigationMesh.Vertices = newVertices;
        int[] newPolygonIndices = [0, 1, 2, 3];
        newNavigationMesh.AddPolygon(newPolygonIndices);
        GetNode<NavigationRegion2D>("NavigationRegion2D").NavigationPolygon = newNavigationMesh;

```

## Properties

> property agent_radius : float ; default=10.0 ; setter=set_agent_radius ; getter=get_agent_radius

The distance to erode/shrink the walkable surface when baking the navigation mesh.
**Note:** The radius must be equal or higher than `0.0`. If the radius is `0.0`, it won't be possible to fix invalid outline overlaps and other precision errors during the baking process. As a result, some obstacles may be excluded incorrectly from the final navigation mesh, or may delete the navigation mesh's polygons.

> property baking_rect : Rect2 ; default=Rect2(0, 0, 0, 0) ; setter=set_baking_rect ; getter=get_baking_rect

If the baking `Rect2` has an area the navigation mesh baking will be restricted to its enclosing area.

> property baking_rect_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_baking_rect_offset ; getter=get_baking_rect_offset

The position offset applied to the `baking_rect` `Rect2`.

> property border_size : float ; default=0.0 ; setter=set_border_size ; getter=get_border_size

The size of the non-navigable border around the bake bounding area defined by the `baking_rect` `Rect2`.
In conjunction with the `baking_rect` the border size can be used to bake tile aligned navigation meshes without the tile edges being shrunk by `agent_radius`.

> property cell_size : float ; default=1.0 ; setter=set_cell_size ; getter=get_cell_size

The cell size used to rasterize the navigation mesh vertices. Must match with the cell size on the navigation map.

> property parsed_collision_mask : int ; default=4294967295 ; setter=set_parsed_collision_mask ; getter=get_parsed_collision_mask

The physics layers to scan for static colliders.
Only used when `parsed_geometry_type` is `PARSED_GEOMETRY_STATIC_COLLIDERS` or `PARSED_GEOMETRY_BOTH`.

> property parsed_geometry_type : ParsedGeometryType ; default=2 ; setter=set_parsed_geometry_type ; getter=get_parsed_geometry_type

Determines which type of nodes will be parsed as geometry.

> property sample_partition_type : SamplePartitionType ; default=0 ; setter=set_sample_partition_type ; getter=get_sample_partition_type

Partitioning algorithm for creating the navigation mesh polys.

> property source_geometry_group_name : StringName ; default=&"navigation_polygon_source_geometry_group" ; setter=set_source_geometry_group_name ; getter=get_source_geometry_group_name

The group name of nodes that should be parsed for baking source geometry.
Only used when `source_geometry_mode` is `SOURCE_GEOMETRY_GROUPS_WITH_CHILDREN` or `SOURCE_GEOMETRY_GROUPS_EXPLICIT`.

> property source_geometry_mode : SourceGeometryMode ; default=0 ; setter=set_source_geometry_mode ; getter=get_source_geometry_mode

The source of the geometry used when baking.

## Methods

> method add_outline(outline: PackedVector2Array) -> void

Appends a `PackedVector2Array` that contains the vertices of an outline to the internal array that contains all the outlines.

> method add_outline_at_index(outline: PackedVector2Array, index: int) -> void

Adds a `PackedVector2Array` that contains the vertices of an outline to the internal array that contains all the outlines at a fixed position.

> method add_polygon(polygon: PackedInt32Array) -> void

Adds a polygon using the indices of the vertices you get when calling `get_vertices`.

> method clear() -> void

Clears the internal arrays for vertices and polygon indices.

> method clear_outlines() -> void

Clears the array of the outlines, but it doesn't clear the vertices and the polygons that were created by them.

> method clear_polygons() -> void

Clears the array of polygons, but it doesn't clear the array of outlines and vertices.

> method get_navigation_mesh() -> NavigationMesh

Returns the `NavigationMesh` resulting from this navigation polygon. This navigation mesh can be used to update the navigation mesh of a region with the `NavigationServer3D.region_set_navigation_mesh` API directly.

> method get_outline(idx: int) -> PackedVector2Array ; qualifiers=const

Returns a `PackedVector2Array` containing the vertices of an outline that was created in the editor or by script.

> method get_outline_count() -> int ; qualifiers=const

Returns the number of outlines that were created in the editor or by script.

> method get_parsed_collision_mask_value(layer_number: int) -> bool ; qualifiers=const

Returns whether or not the specified layer of the `parsed_collision_mask` is enabled, given a `layer_number` between 1 and 32.

> method get_polygon(idx: int) -> PackedInt32Array

Returns a `PackedInt32Array` containing the indices of the vertices of a created polygon.

> method get_polygon_count() -> int ; qualifiers=const

Returns the count of all polygons.

> method get_vertices() -> PackedVector2Array ; qualifiers=const

Returns a `PackedVector2Array` containing all the vertices being used to create the polygons.

> method make_polygons_from_outlines() -> void ; deprecated=Use `NavigationServer2D.parse_source_geometry_data` and `NavigationServer2D.bake_from_source_geometry_data` instead.

Creates polygons from the outlines added in the editor or by script.

> method remove_outline(idx: int) -> void

Removes an outline created in the editor or by script. You have to call `make_polygons_from_outlines` for the polygons to update.

> method set_outline(idx: int, outline: PackedVector2Array) -> void

Changes an outline created in the editor or by script. You have to call `make_polygons_from_outlines` for the polygons to update.

> method set_parsed_collision_mask_value(layer_number: int, value: bool) -> void

Based on `value`, enables or disables the specified layer in the `parsed_collision_mask`, given a `layer_number` between 1 and 32.

> method set_vertices(vertices: PackedVector2Array) -> void

Sets the vertices that can be then indexed to create polygons with the `add_polygon` method.

## Enumerations

> enum ParsedGeometryType

> enum_value ParsedGeometryType.PARSED_GEOMETRY_MESH_INSTANCES = 0

Parses mesh instances as obstruction geometry. This includes `Polygon2D`, `MeshInstance2D`, `MultiMeshInstance2D`, and `TileMap` nodes.
Meshes are only parsed when they use a 2D vertices surface format.

> enum_value ParsedGeometryType.PARSED_GEOMETRY_STATIC_COLLIDERS = 1

Parses `StaticBody2D` and `TileMap` colliders as obstruction geometry. The collider should be in any of the layers specified by `parsed_collision_mask`.

> enum_value ParsedGeometryType.PARSED_GEOMETRY_BOTH = 2

Both `PARSED_GEOMETRY_MESH_INSTANCES` and `PARSED_GEOMETRY_STATIC_COLLIDERS`.

> enum_value ParsedGeometryType.PARSED_GEOMETRY_MAX = 3

Represents the size of the `ParsedGeometryType` enum.

> enum SamplePartitionType

> enum_value SamplePartitionType.SAMPLE_PARTITION_CONVEX_PARTITION = 0

Convex partitioning that results in a navigation mesh with convex polygons.

> enum_value SamplePartitionType.SAMPLE_PARTITION_TRIANGULATE = 1

Triangulation partitioning that results in a navigation mesh with triangle polygons.

> enum_value SamplePartitionType.SAMPLE_PARTITION_MAX = 2

Represents the size of the `SamplePartitionType` enum.

> enum SourceGeometryMode

> enum_value SourceGeometryMode.SOURCE_GEOMETRY_ROOT_NODE_CHILDREN = 0

Scans the child nodes of the root node recursively for geometry.

> enum_value SourceGeometryMode.SOURCE_GEOMETRY_GROUPS_WITH_CHILDREN = 1

Scans nodes in a group and their child nodes recursively for geometry. The group is specified by `source_geometry_group_name`.

> enum_value SourceGeometryMode.SOURCE_GEOMETRY_GROUPS_EXPLICIT = 2

Uses nodes in a group for geometry. The group is specified by `source_geometry_group_name`.

> enum_value SourceGeometryMode.SOURCE_GEOMETRY_MAX = 3

Represents the size of the `SourceGeometryMode` enum.

## Tutorials
- [Using NavigationMeshes]($DOCS_URL/tutorials/navigation/navigation_using_navigationmeshes.html)
- [Navigation Polygon 2D Demo](https://godotengine.org/asset-library/asset/2722)
