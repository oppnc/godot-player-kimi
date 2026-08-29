# AStar2D

> class AStar2D
> inherits AStar2D RefCounted

## Brief

An implementation of A* for finding the shortest path between two vertices on a connected graph in 2D space.

## Description

An implementation of the A* algorithm, used to find the shortest path between two vertices on a connected graph in 2D space.
See `AStar3D` for a more thorough explanation on how to use this class. `AStar2D` is a wrapper for `AStar3D` that enforces 2D coordinates.

## Properties

> property neighbor_filter_enabled : bool ; default=false ; setter=set_neighbor_filter_enabled ; getter=is_neighbor_filter_enabled

If `true` enables the filtering of neighbors via `_filter_neighbor`.

## Methods

> method _compute_cost(from_id: int, to_id: int) -> float ; qualifiers=virtual const

Called when computing the cost between two connected points.
Note that this function is hidden in the default `AStar2D` class.

> method _estimate_cost(from_id: int, end_id: int) -> float ; qualifiers=virtual const

Called when estimating the cost between a point and the path's ending point.
Note that this function is hidden in the default `AStar2D` class.

> method _filter_neighbor(from_id: int, neighbor_id: int) -> bool ; qualifiers=virtual const

Called when neighboring enters processing and if `neighbor_filter_enabled` is `true`. If `true` is returned the point will not be processed.
Note that this function is hidden in the default `AStar2D` class.

> method add_point(id: int, position: Vector2, weight_scale: float = 1.0) -> void

Adds a new point at the given position with the given identifier. The `id` must be 0 or larger, and the `weight_scale` must be 0.0 or greater.
The `weight_scale` is multiplied by the result of `_compute_cost` when determining the overall cost of traveling across a segment from a neighboring point to this point. Thus, all else being equal, the algorithm prefers points with lower `weight_scale`s to form a path.

```gdscript
                var astar = AStar2D.new()
                astar.add_point(1, Vector2(1, 0), 4) # Adds the point (1, 0) with weight_scale 4 and id 1

```

```csharp
                var astar = new AStar2D();
                astar.AddPoint(1, new Vector2(1, 0), 4); // Adds the point (1, 0) with weight_scale 4 and id 1

```

If there already exists a point for the given `id`, its position and weight scale are updated to the given values.

> method are_points_connected(id: int, to_id: int, bidirectional: bool = true) -> bool ; qualifiers=const

Returns whether there is a connection/segment between the given points. If `bidirectional` is `false`, returns whether movement from `id` to `to_id` is possible through this segment.

> method clear() -> void

Clears all the points and segments.

> method connect_points(id: int, to_id: int, bidirectional: bool = true) -> void

Creates a segment between the given points. If `bidirectional` is `false`, only movement from `id` to `to_id` is allowed, not the reverse direction.

```gdscript
                var astar = AStar2D.new()
                astar.add_point(1, Vector2(1, 1))
                astar.add_point(2, Vector2(0, 5))
                astar.connect_points(1, 2, false)

```

```csharp
                var astar = new AStar2D();
                astar.AddPoint(1, new Vector2(1, 1));
                astar.AddPoint(2, new Vector2(0, 5));
                astar.ConnectPoints(1, 2, false);

```

> method disconnect_points(id: int, to_id: int, bidirectional: bool = true) -> void

Deletes the segment between the given points. If `bidirectional` is `false`, only movement from `id` to `to_id` is prevented, and a unidirectional segment possibly remains.

> method get_available_point_id() -> int ; qualifiers=const

Returns the next available point ID with no point associated to it.

> method get_closest_point(to_position: Vector2, include_disabled: bool = false) -> int ; qualifiers=const

Returns the ID of the closest point to `to_position`, optionally taking disabled points into account. Returns `-1` if there are no points in the points pool.
**Note:** If several points are the closest to `to_position`, the one with the smallest ID will be returned, ensuring a deterministic result.

> method get_closest_position_in_segment(to_position: Vector2) -> Vector2 ; qualifiers=const

Returns the closest position to `to_position` that resides inside a segment between two connected points.

```gdscript
                var astar = AStar2D.new()
                astar.add_point(1, Vector2(0, 0))
                astar.add_point(2, Vector2(0, 5))
                astar.connect_points(1, 2)
                var res = astar.get_closest_position_in_segment(Vector2(3, 3)) # Returns (0, 3)

```

```csharp
                var astar = new AStar2D();
                astar.AddPoint(1, new Vector2(0, 0));
                astar.AddPoint(2, new Vector2(0, 5));
                astar.ConnectPoints(1, 2);
                Vector2 res = astar.GetClosestPositionInSegment(new Vector2(3, 3)); // Returns (0, 3)

```

The result is in the segment that goes from `y = 0` to `y = 5`. It's the closest position in the segment to the given point.

> method get_id_path(from_id: int, to_id: int, allow_partial_path: bool = false) -> PackedInt64Array

Returns an array with the IDs of the points that form the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.
If `from_id` point is disabled, returns an empty array (even if `from_id == to_id`).
If `from_id` point is not disabled, there is no valid path to the target, and `allow_partial_path` is `true`, returns a path to the point closest to the target that can be reached.
**Note:** When `allow_partial_path` is `true` and `to_id` is disabled the search may take an unusually long time to finish.

```gdscript
                var astar = AStar2D.new()
                astar.add_point(1, Vector2(0, 0))
                astar.add_point(2, Vector2(0, 1), 1) # Default weight is 1
                astar.add_point(3, Vector2(1, 1))
                astar.add_point(4, Vector2(2, 0))

                astar.connect_points(1, 2, false)
                astar.connect_points(2, 3, false)
                astar.connect_points(4, 3, false)
                astar.connect_points(1, 4, false)

                var res = astar.get_id_path(1, 3) # Returns [1, 2, 3]

```

```csharp
                var astar = new AStar2D();
                astar.AddPoint(1, new Vector2(0, 0));
                astar.AddPoint(2, new Vector2(0, 1), 1); // Default weight is 1
                astar.AddPoint(3, new Vector2(1, 1));
                astar.AddPoint(4, new Vector2(2, 0));

                astar.ConnectPoints(1, 2, false);
                astar.ConnectPoints(2, 3, false);
                astar.ConnectPoints(4, 3, false);
                astar.ConnectPoints(1, 4, false);
                long[] res = astar.GetIdPath(1, 3); // Returns [1, 2, 3]

```

If you change the 2nd point's weight to 3, then the result will be `[1, 4, 3]` instead, because now even though the distance is longer, it's "easier" to get through point 4 than through point 2.

> method get_point_capacity() -> int ; qualifiers=const

Returns the capacity of the structure backing the points, useful in conjunction with `reserve_space`.

> method get_point_connections(id: int) -> PackedInt64Array

Returns an array with the IDs of the points that form the connection with the given point.

```gdscript
                var astar = AStar2D.new()
                astar.add_point(1, Vector2(0, 0))
                astar.add_point(2, Vector2(0, 1))
                astar.add_point(3, Vector2(1, 1))
                astar.add_point(4, Vector2(2, 0))

                astar.connect_points(1, 2, true)
                astar.connect_points(1, 3, true)

                var neighbors = astar.get_point_connections(1) # Returns [2, 3]

```

```csharp
                var astar = new AStar2D();
                astar.AddPoint(1, new Vector2(0, 0));
                astar.AddPoint(2, new Vector2(0, 1));
                astar.AddPoint(3, new Vector2(1, 1));
                astar.AddPoint(4, new Vector2(2, 0));

                astar.ConnectPoints(1, 2, true);
                astar.ConnectPoints(1, 3, true);

                long[] neighbors = astar.GetPointConnections(1); // Returns [2, 3]

```

> method get_point_count() -> int ; qualifiers=const

Returns the number of points currently in the points pool.

> method get_point_ids() -> PackedInt64Array

Returns an array of all point IDs.

> method get_point_path(from_id: int, to_id: int, allow_partial_path: bool = false) -> PackedVector2Array

Returns an array with the points that are in the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.
If `from_id` point is disabled, returns an empty array (even if `from_id == to_id`).
If `from_id` point is not disabled, there is no valid path to the target, and `allow_partial_path` is `true`, returns a path to the point closest to the target that can be reached.
**Note:** This method is not thread-safe; it can only be used from a single `Thread` at a given time. Consider using `Mutex` to ensure exclusive access to one thread to avoid race conditions.
Additionally, when `allow_partial_path` is `true` and `to_id` is disabled the search may take an unusually long time to finish.

> method get_point_position(id: int) -> Vector2 ; qualifiers=const

Returns the position of the point associated with the given `id`.

> method get_point_weight_scale(id: int) -> float ; qualifiers=const

Returns the weight scale of the point associated with the given `id`.

> method has_point(id: int) -> bool ; qualifiers=const

Returns whether a point associated with the given `id` exists.

> method is_point_disabled(id: int) -> bool ; qualifiers=const

Returns whether a point is disabled or not for pathfinding. By default, all points are enabled.

> method remove_point(id: int) -> void

Removes the point associated with the given `id` from the points pool.

> method reserve_space(num_nodes: int) -> void

Reserves space internally for `num_nodes` points. Useful if you're adding a known large number of points at once, such as points on a grid.

> method set_point_disabled(id: int, disabled: bool = true) -> void

Disables or enables the specified point for pathfinding. Useful for making a temporary obstacle.

> method set_point_position(id: int, position: Vector2) -> void

Sets the `position` for the point with the given `id`.

> method set_point_weight_scale(id: int, weight_scale: float) -> void

Sets the `weight_scale` for the point with the given `id`. The `weight_scale` is multiplied by the result of `_compute_cost` when determining the overall cost of traveling across a segment from a neighboring point to this point.

## Tutorials
- [Grid-based Navigation with AStarGrid2D Demo](https://godotengine.org/asset-library/asset/2723)
