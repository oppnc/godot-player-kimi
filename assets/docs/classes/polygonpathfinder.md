# PolygonPathFinder

> class PolygonPathFinder
> inherits PolygonPathFinder Resource

## Methods

> method find_path(from: Vector2, to: Vector2) -> PackedVector2Array

> method get_bounds() -> Rect2 ; qualifiers=const

> method get_closest_point(point: Vector2) -> Vector2 ; qualifiers=const

> method get_intersections(from: Vector2, to: Vector2) -> PackedVector2Array ; qualifiers=const

> method get_point_penalty(idx: int) -> float ; qualifiers=const

> method is_point_inside(point: Vector2) -> bool ; qualifiers=const

Returns `true` if `point` falls inside the polygon area.

```gdscript
                var polygon_path_finder = PolygonPathFinder.new()
                var points = [Vector2(0.0, 0.0), Vector2(1.0, 0.0), Vector2(0.0, 1.0)]
                var connections = [0, 1, 1, 2, 2, 0]
                polygon_path_finder.setup(points, connections)
                print(polygon_path_finder.is_point_inside(Vector2(0.2, 0.2))) # Prints true
                print(polygon_path_finder.is_point_inside(Vector2(1.0, 1.0))) # Prints false

```

```csharp
                var polygonPathFinder = new PolygonPathFinder();
                Vector2[] points =
                [
                    new Vector2(0.0f, 0.0f),
                    new Vector2(1.0f, 0.0f),
                    new Vector2(0.0f, 1.0f)
                ];
                int[] connections = [0, 1, 1, 2, 2, 0];
                polygonPathFinder.Setup(points, connections);
                GD.Print(polygonPathFinder.IsPointInside(new Vector2(0.2f, 0.2f))); // Prints True
                GD.Print(polygonPathFinder.IsPointInside(new Vector2(1.0f, 1.0f))); // Prints False

```

> method set_point_penalty(idx: int, penalty: float) -> void

> method setup(points: PackedVector2Array, connections: PackedInt32Array) -> void

Sets up `PolygonPathFinder` with an array of points that define the vertices of the polygon, and an array of indices that determine the edges of the polygon.
The length of `connections` must be even, returns an error if odd.

```gdscript
                var polygon_path_finder = PolygonPathFinder.new()
                var points = [Vector2(0.0, 0.0), Vector2(1.0, 0.0), Vector2(0.0, 1.0)]
                var connections = [0, 1, 1, 2, 2, 0]
                polygon_path_finder.setup(points, connections)

```

```csharp
                var polygonPathFinder = new PolygonPathFinder();
                Vector2[] points =
                [
                    new Vector2(0.0f, 0.0f),
                    new Vector2(1.0f, 0.0f),
                    new Vector2(0.0f, 1.0f)
                ];
                int[] connections = [0, 1, 1, 2, 2, 0];
                polygonPathFinder.Setup(points, connections);

```
