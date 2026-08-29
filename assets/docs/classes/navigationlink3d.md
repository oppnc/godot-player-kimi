# NavigationLink3D

> class NavigationLink3D ; experimental=This class may be changed or removed in future versions.
> inherits NavigationLink3D Node3D

## Brief

A link between two positions on `NavigationRegion3D`s that agents can be routed through.

## Description

A link between two positions on `NavigationRegion3D`s that agents can be routed through. These positions can be on the same `NavigationRegion3D` or on two different ones. Links are useful to express navigation methods other than traveling along the surface of the navigation mesh, such as ziplines, teleporters, or gaps that can be jumped across.

## Properties

> property bidirectional : bool ; default=true ; setter=set_bidirectional ; getter=is_bidirectional

Whether this link can be traveled in both directions or only from `start_position` to `end_position`.

> property enabled : bool ; default=true ; setter=set_enabled ; getter=is_enabled

Whether this link is currently active. If `false`, `NavigationServer3D.map_get_path` will ignore this link.

> property end_position : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_end_position ; getter=get_end_position

Ending position of the link.
This position will search out the nearest polygon in the navigation mesh to attach to.
The distance the link will search is controlled by `NavigationServer3D.map_set_link_connection_radius`.

> property enter_cost : float ; default=0.0 ; setter=set_enter_cost ; getter=get_enter_cost

When pathfinding enters this link from another regions navigation mesh the `enter_cost` value is added to the path distance for determining the shortest path.

> property navigation_layers : int ; default=1 ; setter=set_navigation_layers ; getter=get_navigation_layers

A bitfield determining all navigation layers the link belongs to. These navigation layers will be checked when requesting a path with `NavigationServer3D.map_get_path`.

> property start_position : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_start_position ; getter=get_start_position

Starting position of the link.
This position will search out the nearest polygon in the navigation mesh to attach to.
The distance the link will search is controlled by `NavigationServer3D.map_set_link_connection_radius`.

> property travel_cost : float ; default=1.0 ; setter=set_travel_cost ; getter=get_travel_cost

When pathfinding moves along the link the traveled distance is multiplied with `travel_cost` for determining the shortest path.

## Methods

> method get_global_end_position() -> Vector3 ; qualifiers=const

Returns the `end_position` that is relative to the link as a global position.

> method get_global_start_position() -> Vector3 ; qualifiers=const

Returns the `start_position` that is relative to the link as a global position.

> method get_navigation_layer_value(layer_number: int) -> bool ; qualifiers=const

Returns whether or not the specified layer of the `navigation_layers` bitmask is enabled, given a `layer_number` between 1 and 32.

> method get_navigation_map() -> RID ; qualifiers=const

Returns the current navigation map `RID` used by this link.

> method get_rid() -> RID ; qualifiers=const

Returns the `RID` of this link on the `NavigationServer3D`.

> method set_global_end_position(position: Vector3) -> void

Sets the `end_position` that is relative to the link from a global `position`.

> method set_global_start_position(position: Vector3) -> void

Sets the `start_position` that is relative to the link from a global `position`.

> method set_navigation_layer_value(layer_number: int, value: bool) -> void

Based on `value`, enables or disables the specified layer in the `navigation_layers` bitmask, given a `layer_number` between 1 and 32.

> method set_navigation_map(navigation_map: RID) -> void

Sets the `RID` of the navigation map this link should use. By default the link will automatically join the `World3D` default navigation map so this function is only required to override the default map.

## Tutorials
- [Using NavigationLinks]($DOCS_URL/tutorials/navigation/navigation_using_navigationlinks.html)
