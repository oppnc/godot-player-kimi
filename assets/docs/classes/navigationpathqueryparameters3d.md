# NavigationPathQueryParameters3D

> class NavigationPathQueryParameters3D ; experimental=This class may be changed or removed in future versions.
> inherits NavigationPathQueryParameters3D RefCounted

## Brief

Provides parameters for 3D navigation path queries.

## Description

By changing various properties of this object, such as the start and target position, you can configure path queries to the `NavigationServer3D`.

## Properties

> property excluded_regions : Array[RID] ; default=[] ; setter=set_excluded_regions ; getter=get_excluded_regions

The list of region `RID`s that will be excluded from the path query. Use `NavigationRegion3D.get_rid` to get the `RID` associated with a `NavigationRegion3D` node.
**Note:** The returned array is copied and any changes to it will not update the original property value. To update the value you need to modify the returned array, and then set it to the property again.

> property included_regions : Array[RID] ; default=[] ; setter=set_included_regions ; getter=get_included_regions

The list of region `RID`s that will be included by the path query. Use `NavigationRegion3D.get_rid` to get the `RID` associated with a `NavigationRegion3D` node. If left empty all regions are included. If a region ends up being both included and excluded at the same time it will be excluded.
**Note:** The returned array is copied and any changes to it will not update the original property value. To update the value you need to modify the returned array, and then set it to the property again.

> property map : RID ; default=RID() ; setter=set_map ; getter=get_map

The navigation map `RID` used in the path query.

> property metadata_flags : BitField[PathMetadataFlags] ; default=7 ; setter=set_metadata_flags ; getter=get_metadata_flags

Additional information to include with the navigation path.

> property navigation_layers : int ; default=1 ; setter=set_navigation_layers ; getter=get_navigation_layers

The navigation layers the query will use (as a bitmask).

> property path_postprocessing : PathPostProcessing ; default=0 ; setter=set_path_postprocessing ; getter=get_path_postprocessing

The path postprocessing applied to the raw path corridor found by the `pathfinding_algorithm`.

> property path_return_max_length : float ; default=0.0 ; setter=set_path_return_max_length ; getter=get_path_return_max_length

The maximum allowed length of the returned path in world units. A path will be clipped when going over this length. A value of `0` or below counts as disabled.

> property path_return_max_radius : float ; default=0.0 ; setter=set_path_return_max_radius ; getter=get_path_return_max_radius

The maximum allowed radius in world units that the returned path can be from the path start. The path will be clipped when going over this radius. A value of `0` or below counts as disabled.
**Note:** This will perform a sphere shaped clip operation on the path with the first path position being the sphere's center position.

> property path_search_max_distance : float ; default=0.0 ; setter=set_path_search_max_distance ; getter=get_path_search_max_distance

The maximum distance a searched polygon can be away from the start polygon before the pathfinding cancels the search for a path to the (possibly unreachable or very far away) target position polygon. In this case the pathfinding resets and builds a path from the start polygon to the polygon that was found closest to the target position so far. A value of `0` or below counts as unlimited. In case of unlimited the pathfinding will search all polygons connected with the start polygon until either the target position polygon is found or all available polygon search options are exhausted.

> property path_search_max_polygons : int ; default=4096 ; setter=set_path_search_max_polygons ; getter=get_path_search_max_polygons

The maximum number of polygons that are searched before the pathfinding cancels the search for a path to the (possibly unreachable or very far away) target position polygon. In this case the pathfinding resets and builds a path from the start polygon to the polygon that was found closest to the target position so far. A value of `0` or below counts as unlimited. In case of unlimited the pathfinding will search all polygons connected with the start polygon until either the target position polygon is found or all available polygon search options are exhausted.

> property pathfinding_algorithm : PathfindingAlgorithm ; default=0 ; setter=set_pathfinding_algorithm ; getter=get_pathfinding_algorithm

The pathfinding algorithm used in the path query.

> property simplify_epsilon : float ; default=0.0 ; setter=set_simplify_epsilon ; getter=get_simplify_epsilon

The path simplification amount in worlds units.

> property simplify_path : bool ; default=false ; setter=set_simplify_path ; getter=get_simplify_path

If `true` a simplified version of the path will be returned with less critical path points removed. The simplification amount is controlled by `simplify_epsilon`. The simplification uses a variant of Ramer-Douglas-Peucker algorithm for curve point decimation.
Path simplification can be helpful to mitigate various path following issues that can arise with certain agent types and script behaviors. E.g. "steering" agents or avoidance in "open fields".

> property start_position : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_start_position ; getter=get_start_position

The pathfinding start position in global coordinates.

> property target_position : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_target_position ; getter=get_target_position

The pathfinding target position in global coordinates.

## Enumerations

> enum PathMetadataFlags ; bitfield=true

> enum_value PathMetadataFlags.PATH_METADATA_INCLUDE_NONE = 0

Don't include any additional metadata about the returned path.

> enum_value PathMetadataFlags.PATH_METADATA_INCLUDE_TYPES = 1

Include the type of navigation primitive (region or link) that each point of the path goes through.

> enum_value PathMetadataFlags.PATH_METADATA_INCLUDE_RIDS = 2

Include the `RID`s of the regions and links that each point of the path goes through.

> enum_value PathMetadataFlags.PATH_METADATA_INCLUDE_OWNERS = 4

Include the `ObjectID`s of the `Object`s which manage the regions and links each point of the path goes through.

> enum_value PathMetadataFlags.PATH_METADATA_INCLUDE_ALL = 7

Include all available metadata about the returned path.

> enum PathPostProcessing

> enum_value PathPostProcessing.PATH_POSTPROCESSING_CORRIDORFUNNEL = 0

Applies a funnel algorithm to the raw path corridor found by the pathfinding algorithm. This will result in the shortest path possible inside the path corridor. This postprocessing very much depends on the navigation mesh polygon layout and the created corridor. Especially tile- or gridbased layouts can face artificial corners with diagonal movement due to a jagged path corridor imposed by the cell shapes.

> enum_value PathPostProcessing.PATH_POSTPROCESSING_EDGECENTERED = 1

Centers every path position in the middle of the traveled navigation mesh polygon edge. This creates better paths for tile- or gridbased layouts that restrict the movement to the cells center.

> enum_value PathPostProcessing.PATH_POSTPROCESSING_NONE = 2

Applies no postprocessing and returns the raw path corridor as found by the pathfinding algorithm.

> enum PathfindingAlgorithm

> enum_value PathfindingAlgorithm.PATHFINDING_ALGORITHM_ASTAR = 0

The path query uses the default A* pathfinding algorithm.

## Tutorials
- [Using NavigationPathQueryObjects]($DOCS_URL/tutorials/navigation/navigation_using_navigationpathqueryobjects.html)
