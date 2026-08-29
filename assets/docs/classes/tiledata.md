# TileData

> class TileData
> inherits TileData Object

## Brief

Settings for a single tile in a `TileSet`.

## Description

`TileData` object represents a single tile in a `TileSet`. It is usually edited using the tileset editor, but it can be modified at runtime using `TileMapLayer._tile_data_runtime_update`.

## Properties

> property flip_h : bool ; default=false ; setter=set_flip_h ; getter=get_flip_h

If `true`, the tile will have its texture flipped horizontally.

> property flip_v : bool ; default=false ; setter=set_flip_v ; getter=get_flip_v

If `true`, the tile will have its texture flipped vertically.

> property material : Material ; setter=set_material ; getter=get_material

The `Material` to use for this `TileData`. This can be a `CanvasItemMaterial` to use the default shader, or a `ShaderMaterial` to use a custom shader.

> property modulate : Color ; default=Color(1, 1, 1, 1) ; setter=set_modulate ; getter=get_modulate

Color modulation of the tile.

> property probability : float ; default=1.0 ; setter=set_probability ; getter=get_probability

Relative probability of this tile being selected when drawing a pattern of random tiles.

> property terrain : int ; default=-1 ; setter=set_terrain ; getter=get_terrain

ID of the terrain from the terrain set that the tile uses.

> property terrain_set : int ; default=-1 ; setter=set_terrain_set ; getter=get_terrain_set

ID of the terrain set that the tile uses.

> property texture_origin : Vector2i ; default=Vector2i(0, 0) ; setter=set_texture_origin ; getter=get_texture_origin

Offsets the position of where the tile is drawn.

> property transpose : bool ; default=false ; setter=set_transpose ; getter=get_transpose

If `true`, the tile will display transposed, i.e. with horizontal and vertical texture UVs swapped.

> property y_sort_origin : int ; default=0 ; setter=set_y_sort_origin ; getter=get_y_sort_origin

Vertical point of the tile used for determining y-sorted order.

> property z_index : int ; default=0 ; setter=set_z_index ; getter=get_z_index

Ordering index of this tile, relative to `TileMapLayer`.

## Methods

> method add_collision_polygon(layer_id: int) -> void

Adds a collision polygon to the tile on the given TileSet physics layer.

> method add_occluder_polygon(layer_id: int) -> void

Adds an occlusion polygon to the tile on the TileSet occlusion layer with index `layer_id`.

> method get_collision_polygon_one_way_margin(layer_id: int, polygon_index: int) -> float ; qualifiers=const

Returns the one-way margin (for one-way platforms) of the polygon at index `polygon_index` for TileSet physics layer with index `layer_id`.

> method get_collision_polygon_points(layer_id: int, polygon_index: int) -> PackedVector2Array ; qualifiers=const

Returns the points of the polygon at index `polygon_index` for TileSet physics layer with index `layer_id`.

> method get_collision_polygons_count(layer_id: int) -> int ; qualifiers=const

Returns how many polygons the tile has for TileSet physics layer with index `layer_id`.

> method get_constant_angular_velocity(layer_id: int) -> float ; qualifiers=const

Returns the constant angular velocity applied to objects colliding with this tile.

> method get_constant_linear_velocity(layer_id: int) -> Vector2 ; qualifiers=const

Returns the constant linear velocity applied to objects colliding with this tile.

> method get_custom_data(layer_name: String) -> Variant ; qualifiers=const

Returns the custom data value for custom data layer named `layer_name`. To check if a custom data layer exists, use `has_custom_data`.

> method get_custom_data_by_layer_id(layer_id: int) -> Variant ; qualifiers=const

Returns the custom data value for custom data layer with index `layer_id`.

> method get_navigation_polygon(layer_id: int, flip_h: bool = false, flip_v: bool = false, transpose: bool = false) -> NavigationPolygon ; qualifiers=const

Returns the navigation polygon of the tile for the TileSet navigation layer with index `layer_id`.
`flip_h`, `flip_v`, and `transpose` allow transforming the returned polygon.

> method get_occluder(layer_id: int, flip_h: bool = false, flip_v: bool = false, transpose: bool = false) -> OccluderPolygon2D ; qualifiers=const ; deprecated=Use `get_occluder_polygon` instead.

Returns the occluder polygon of the tile for the TileSet occlusion layer with index `layer_id`.
`flip_h`, `flip_v`, and `transpose` allow transforming the returned polygon.

> method get_occluder_polygon(layer_id: int, polygon_index: int, flip_h: bool = false, flip_v: bool = false, transpose: bool = false) -> OccluderPolygon2D ; qualifiers=const

Returns the occluder polygon at index `polygon_index` from the TileSet occlusion layer with index `layer_id`.
The `flip_h`, `flip_v`, and `transpose` parameters can be `true` to transform the returned polygon.

> method get_occluder_polygons_count(layer_id: int) -> int ; qualifiers=const

Returns the number of occluder polygons of the tile in the TileSet occlusion layer with index `layer_id`.

> method get_terrain_peering_bit(peering_bit: TileSet.CellNeighbor) -> int ; qualifiers=const

Returns the tile's terrain bit for the given `peering_bit` direction. To check that a direction is valid, use `is_valid_terrain_peering_bit`.

> method has_custom_data(layer_name: String) -> bool ; qualifiers=const

Returns whether there exists a custom data layer named `layer_name`.

> method is_collision_polygon_one_way(layer_id: int, polygon_index: int) -> bool ; qualifiers=const

Returns whether one-way collisions are enabled for the polygon at index `polygon_index` for TileSet physics layer with index `layer_id`.

> method is_valid_terrain_peering_bit(peering_bit: TileSet.CellNeighbor) -> bool ; qualifiers=const

Returns whether the given `peering_bit` direction is valid for this tile.

> method remove_collision_polygon(layer_id: int, polygon_index: int) -> void

Removes the polygon at index `polygon_index` for TileSet physics layer with index `layer_id`.

> method remove_occluder_polygon(layer_id: int, polygon_index: int) -> void

Removes the polygon at index `polygon_index` for TileSet occlusion layer with index `layer_id`.

> method set_collision_polygon_one_way(layer_id: int, polygon_index: int, one_way: bool) -> void

Enables/disables one-way collisions on the polygon at index `polygon_index` for TileSet physics layer with index `layer_id`.

> method set_collision_polygon_one_way_margin(layer_id: int, polygon_index: int, one_way_margin: float) -> void

Sets the one-way margin (for one-way platforms) of the polygon at index `polygon_index` for TileSet physics layer with index `layer_id`.

> method set_collision_polygon_points(layer_id: int, polygon_index: int, polygon: PackedVector2Array) -> void

Sets the points of the polygon at index `polygon_index` for TileSet physics layer with index `layer_id`.

> method set_collision_polygons_count(layer_id: int, polygons_count: int) -> void

Sets the polygons count for TileSet physics layer with index `layer_id`.

> method set_constant_angular_velocity(layer_id: int, velocity: float) -> void

Sets the constant angular velocity. This does not rotate the tile. This angular velocity is applied to objects colliding with this tile.

> method set_constant_linear_velocity(layer_id: int, velocity: Vector2) -> void

Sets the constant linear velocity. This does not move the tile. This linear velocity is applied to objects colliding with this tile. This is useful to create conveyor belts.

> method set_custom_data(layer_name: String, value: Variant) -> void

Sets the tile's custom data value for the TileSet custom data layer with name `layer_name`.

> method set_custom_data_by_layer_id(layer_id: int, value: Variant) -> void

Sets the tile's custom data value for the TileSet custom data layer with index `layer_id`.

> method set_navigation_polygon(layer_id: int, navigation_polygon: NavigationPolygon) -> void

Sets the navigation polygon for the TileSet navigation layer with index `layer_id`.

> method set_occluder(layer_id: int, occluder_polygon: OccluderPolygon2D) -> void ; deprecated=Use `set_occluder_polygon` instead.

Sets the occluder for the TileSet occlusion layer with index `layer_id`.

> method set_occluder_polygon(layer_id: int, polygon_index: int, polygon: OccluderPolygon2D) -> void

Sets the occluder for polygon with index `polygon_index` in the TileSet occlusion layer with index `layer_id`.

> method set_occluder_polygons_count(layer_id: int, polygons_count: int) -> void

Sets the occluder polygon count in the TileSet occlusion layer with index `layer_id`.

> method set_terrain_peering_bit(peering_bit: TileSet.CellNeighbor, terrain: int) -> void

Sets the tile's terrain bit for the given `peering_bit` direction. To check that a direction is valid, use `is_valid_terrain_peering_bit`.

## Signals

> signal changed()

Emitted when any of the properties are changed.
