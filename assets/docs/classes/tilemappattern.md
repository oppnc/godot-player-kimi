# TileMapPattern

> class TileMapPattern
> inherits TileMapPattern Resource

## Brief

Holds a pattern to be copied from or pasted into `TileMap`s.

## Description

This resource holds a set of cells to help bulk manipulations of `TileMap`.
A pattern always starts at the `(0, 0)` coordinates and cannot have cells with negative coordinates.

## Methods

> method get_cell_alternative_tile(coords: Vector2i) -> int ; qualifiers=const

Returns the tile alternative ID of the cell at `coords`.

> method get_cell_atlas_coords(coords: Vector2i) -> Vector2i ; qualifiers=const

Returns the tile atlas coordinates ID of the cell at `coords`.

> method get_cell_source_id(coords: Vector2i) -> int ; qualifiers=const

Returns the tile source ID of the cell at `coords`.

> method get_size() -> Vector2i ; qualifiers=const

Returns the size, in cells, of the pattern.

> method get_used_cells() -> Array[Vector2i] ; qualifiers=const

Returns the list of used cell coordinates in the pattern.

> method has_cell(coords: Vector2i) -> bool ; qualifiers=const

Returns whether the pattern has a tile at the given coordinates.

> method is_empty() -> bool ; qualifiers=const

Returns whether the pattern is empty or not.

> method remove_cell(coords: Vector2i, update_size: bool) -> void

Remove the cell at the given coordinates.

> method set_cell(coords: Vector2i, source_id: int = -1, atlas_coords: Vector2i = Vector2i(-1, -1), alternative_tile: int = -1) -> void

Sets the tile identifiers for the cell at coordinates `coords`. See `TileMap.set_cell`.

> method set_size(size: Vector2i) -> void

Sets the size of the pattern.
