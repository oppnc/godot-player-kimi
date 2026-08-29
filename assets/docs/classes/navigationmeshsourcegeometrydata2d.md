# NavigationMeshSourceGeometryData2D

> class NavigationMeshSourceGeometryData2D ; experimental=This class may be changed or removed in future versions.
> inherits NavigationMeshSourceGeometryData2D Resource

## Brief

Container for parsed source geometry data used in navigation mesh baking.

## Description

Container for parsed source geometry data used in navigation mesh baking.

## Methods

> method add_obstruction_outline(shape_outline: PackedVector2Array) -> void

Adds the outline points of a shape as obstructed area.

> method add_projected_obstruction(vertices: PackedVector2Array, carve: bool) -> void

Adds a projected obstruction shape to the source geometry. If `carve` is `true` the carved shape will not be affected by additional offsets (e.g. agent radius) of the navigation mesh baking process.

> method add_traversable_outline(shape_outline: PackedVector2Array) -> void

Adds the outline points of a shape as traversable area.

> method append_obstruction_outlines(obstruction_outlines: Array[PackedVector2Array]) -> void

Appends another array of `obstruction_outlines` at the end of the existing obstruction outlines array.

> method append_traversable_outlines(traversable_outlines: Array[PackedVector2Array]) -> void

Appends another array of `traversable_outlines` at the end of the existing traversable outlines array.

> method clear() -> void

Clears the internal data.

> method clear_projected_obstructions() -> void

Clears all projected obstructions.

> method get_bounds() -> Rect2

Returns an axis-aligned bounding box that covers all the stored geometry data. The bounds are calculated when calling this function with the result cached until further geometry changes are made.

> method get_obstruction_outlines() -> Array[PackedVector2Array] ; qualifiers=const

Returns all the obstructed area outlines arrays.

> method get_projected_obstructions() -> Array ; qualifiers=const

Returns the projected obstructions as an `Array` of dictionaries. Each `Dictionary` contains the following entries:
- `vertices` - A `PackedFloat32Array` that defines the outline points of the projected shape.
- `carve` - A `bool` that defines how the projected shape affects the navigation mesh baking. If `true` the projected shape will not be affected by addition offsets, e.g. agent radius.

> method get_traversable_outlines() -> Array[PackedVector2Array] ; qualifiers=const

Returns all the traversable area outlines arrays.

> method has_data() -> bool

Returns `true` when parsed source geometry data exists.

> method merge(other_geometry: NavigationMeshSourceGeometryData2D) -> void

Adds the geometry data of another `NavigationMeshSourceGeometryData2D` to the navigation mesh baking data.

> method set_obstruction_outlines(obstruction_outlines: Array[PackedVector2Array]) -> void

Sets all the obstructed area outlines arrays.

> method set_projected_obstructions(projected_obstructions: Array) -> void

Sets the projected obstructions with an Array of Dictionaries with the following key value pairs:

```gdscript
                "vertices" : PackedFloat32Array
                "carve" : bool

```

> method set_traversable_outlines(traversable_outlines: Array[PackedVector2Array]) -> void

Sets all the traversable area outlines arrays.
