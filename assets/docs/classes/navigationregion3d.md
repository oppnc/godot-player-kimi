# NavigationRegion3D

> class NavigationRegion3D ; experimental=This class may be changed or removed in future versions.
> inherits NavigationRegion3D Node3D

## Brief

A traversable 3D region that `NavigationAgent3D`s can use for pathfinding.

## Description

A traversable 3D region based on a `NavigationMesh` that `NavigationAgent3D`s can use for pathfinding.
Two regions can be connected to each other if they share a similar edge. You can set the minimum distance between two vertices required to connect two edges by using `NavigationServer3D.map_set_edge_connection_margin`.
**Note:** Overlapping two regions' navigation meshes is not enough for connecting two regions. They must share a similar edge.
The cost of entering this region from another region can be controlled with the `enter_cost` value.
**Note:** This value is not added to the path cost when the start position is already inside this region.
The cost of traveling distances inside this region can be controlled with the `travel_cost` multiplier.
**Note:** This node caches changes to its properties, so if you make changes to the underlying region `RID` in `NavigationServer3D`, they will not be reflected in this node's properties.

## Properties

> property enabled : bool ; default=true ; setter=set_enabled ; getter=is_enabled

Determines if the `NavigationRegion3D` is enabled or disabled.

> property enter_cost : float ; default=0.0 ; setter=set_enter_cost ; getter=get_enter_cost

When pathfinding enters this region's navigation mesh from another regions navigation mesh the `enter_cost` value is added to the path distance for determining the shortest path.

> property navigation_layers : int ; default=1 ; setter=set_navigation_layers ; getter=get_navigation_layers

A bitfield determining all navigation layers the region belongs to. These navigation layers can be checked upon when requesting a path with `NavigationServer3D.map_get_path`.

> property navigation_mesh : NavigationMesh ; setter=set_navigation_mesh ; getter=get_navigation_mesh

The `NavigationMesh` resource to use.

> property travel_cost : float ; default=1.0 ; setter=set_travel_cost ; getter=get_travel_cost

When pathfinding moves inside this region's navigation mesh the traveled distances are multiplied with `travel_cost` for determining the shortest path.

> property use_edge_connections : bool ; default=true ; setter=set_use_edge_connections ; getter=get_use_edge_connections

If enabled the navigation region will use edge connections to connect with other navigation regions within proximity of the navigation map edge connection margin.

## Methods

> method bake_navigation_mesh(on_thread: bool = true) -> void

Bakes the `NavigationMesh`. If `on_thread` is set to `true` (default), the baking is done on a separate thread. Baking on separate thread is useful because navigation baking is not a cheap operation. When it is completed, it automatically sets the new `NavigationMesh`. Please note that baking on separate thread may be very slow if geometry is parsed from meshes as async access to each mesh involves heavy synchronization. Also, please note that baking on a separate thread is automatically disabled on operating systems that cannot use threads (such as Web with threads disabled).

> method get_bounds() -> AABB ; qualifiers=const

Returns the axis-aligned bounding box for the region's transformed navigation mesh.

> method get_navigation_layer_value(layer_number: int) -> bool ; qualifiers=const

Returns whether or not the specified layer of the `navigation_layers` bitmask is enabled, given a `layer_number` between 1 and 32.

> method get_navigation_map() -> RID ; qualifiers=const

Returns the current navigation map `RID` used by this region.

> method get_region_rid() -> RID ; qualifiers=const ; deprecated=Use `get_rid` instead.

Returns the `RID` of this region on the `NavigationServer3D`.

> method get_rid() -> RID ; qualifiers=const

Returns the `RID` of this region on the `NavigationServer3D`. Combined with `NavigationServer3D.map_get_closest_point_owner` can be used to identify the `NavigationRegion3D` closest to a point on the merged navigation map.

> method is_baking() -> bool ; qualifiers=const

Returns `true` when the `NavigationMesh` is being baked on a background thread.

> method set_navigation_layer_value(layer_number: int, value: bool) -> void

Based on `value`, enables or disables the specified layer in the `navigation_layers` bitmask, given a `layer_number` between 1 and 32.

> method set_navigation_map(navigation_map: RID) -> void

Sets the `RID` of the navigation map this region should use. By default the region will automatically join the `World3D` default navigation map so this function is only required to override the default map.

## Signals

> signal bake_finished()

Notifies when the navigation mesh bake operation is completed.

> signal navigation_mesh_changed()

Notifies when the `NavigationMesh` has changed.

## Tutorials
- [Using NavigationRegions]($DOCS_URL/tutorials/navigation/navigation_using_navigationregions.html)
