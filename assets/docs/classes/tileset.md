# TileSet

> class TileSet
> inherits TileSet Resource

## Brief

Tile library for tilemaps.

## Description

A TileSet is a library of tiles for a `TileMapLayer`. A TileSet handles a list of `TileSetSource`, each of them storing a set of tiles.
Tiles can either be from a `TileSetAtlasSource`, which renders tiles out of a texture with support for physics, navigation, etc., or from a `TileSetScenesCollectionSource`, which exposes scene-based tiles.
Tiles are referenced by using three IDs: their source ID, their atlas coordinates ID, and their alternative tile ID.
A TileSet can be configured so that its tiles expose more or fewer properties. To do so, the TileSet resources use property layers, which you can add or remove depending on your needs.
For example, adding a physics layer allows giving collision shapes to your tiles. Each layer has dedicated properties (physics layer and mask), so you may add several TileSet physics layers for each type of collision you need.
See the functions to add new layers for more information.

## Properties

> property tile_layout : TileLayout ; default=0 ; setter=set_tile_layout ; getter=get_tile_layout

For all half-offset shapes (Isometric, Hexagonal and Half-Offset square), changes the way tiles are indexed in the `TileMapLayer` grid.

> property tile_offset_axis : TileOffsetAxis ; default=0 ; setter=set_tile_offset_axis ; getter=get_tile_offset_axis

For all half-offset shapes (Isometric, Hexagonal and Half-Offset square), determines the offset axis.

> property tile_shape : TileShape ; default=0 ; setter=set_tile_shape ; getter=get_tile_shape

The tile shape.

> property tile_size : Vector2i ; default=Vector2i(16, 16) ; setter=set_tile_size ; getter=get_tile_size

The tile size, in pixels. For all tile shapes, this size corresponds to the encompassing rectangle of the tile shape. This is thus the minimal cell size required in an atlas.

> property uv_clipping : bool ; default=false ; setter=set_uv_clipping ; getter=is_uv_clipping

Enables/Disable uv clipping when rendering the tiles.

## Methods

> method add_custom_data_layer(to_position: int = -1) -> void

Adds a custom data layer to the TileSet at the given position `to_position` in the array. If `to_position` is -1, adds it at the end of the array.
Custom data layers allow assigning custom properties to atlas tiles.

> method add_navigation_layer(to_position: int = -1) -> void

Adds a navigation layer to the TileSet at the given position `to_position` in the array. If `to_position` is -1, adds it at the end of the array.
Navigation layers allow assigning a navigable area to atlas tiles.

> method add_occlusion_layer(to_position: int = -1) -> void

Adds an occlusion layer to the TileSet at the given position `to_position` in the array. If `to_position` is -1, adds it at the end of the array.
Occlusion layers allow assigning occlusion polygons to atlas tiles.

> method add_pattern(pattern: TileMapPattern, index: int = -1) -> int

Adds a `TileMapPattern` to be stored in the TileSet resource. If provided, insert it at the given `index`.

> method add_physics_layer(to_position: int = -1) -> void

Adds a physics layer to the TileSet at the given position `to_position` in the array. If `to_position` is -1, adds it at the end of the array.
Physics layers allow assigning collision polygons to atlas tiles.

> method add_source(source: TileSetSource, atlas_source_id_override: int = -1) -> int

Adds a `TileSetSource` to the TileSet. If `atlas_source_id_override` is not -1, also set its source ID. Otherwise, a unique identifier is automatically generated.
The function returns the added source ID or -1 if the source could not be added.
**Warning:** A source cannot belong to two TileSets at the same time. If the added source was attached to another `TileSet`, it will be removed from that one.

> method add_terrain(terrain_set: int, to_position: int = -1) -> void

Adds a new terrain to the given terrain set `terrain_set` at the given position `to_position` in the array. If `to_position` is -1, adds it at the end of the array.

> method add_terrain_set(to_position: int = -1) -> void

Adds a new terrain set at the given position `to_position` in the array. If `to_position` is -1, adds it at the end of the array.

> method cleanup_invalid_tile_proxies() -> void

Clears tile proxies pointing to invalid tiles.

> method clear_terrains(terrain_set: int) -> void

Clears all terrain properties for the given terrain set.

> method clear_tile_proxies() -> void

Clears all tile proxies.

> method get_alternative_level_tile_proxy(source_from: int, coords_from: Vector2i, alternative_from: int) -> Array

Returns the alternative-level proxy for the given identifiers. The returned array contains the three proxie's target identifiers (source ID, atlas coords ID and alternative tile ID).
If the TileSet has no proxy for the given identifiers, returns an empty Array.

> method get_coords_level_tile_proxy(source_from: int, coords_from: Vector2i) -> Array

Returns the coordinate-level proxy for the given identifiers. The returned array contains the two target identifiers of the proxy (source ID and atlas coordinates ID).
If the TileSet has no proxy for the given identifiers, returns an empty Array.

> method get_custom_data_layer_by_name(layer_name: String) -> int ; qualifiers=const

Returns the index of the custom data layer identified by the given name.

> method get_custom_data_layer_name(layer_index: int) -> String ; qualifiers=const

Returns the name of the custom data layer identified by the given index.

> method get_custom_data_layer_type(layer_index: int) -> Variant.Type ; qualifiers=const

Returns the type of the custom data layer identified by the given index.

> method get_custom_data_layers_count() -> int ; qualifiers=const

Returns the custom data layers count.

> method get_navigation_layer_layer_value(layer_index: int, layer_number: int) -> bool ; qualifiers=const

Returns whether or not the specified navigation layer of the TileSet navigation data layer identified by the given `layer_index` is enabled, given a navigation_layers `layer_number` between 1 and 32.

> method get_navigation_layer_layers(layer_index: int) -> int ; qualifiers=const

Returns the navigation layers (as in the Navigation server) of the given TileSet navigation layer.

> method get_navigation_layers_count() -> int ; qualifiers=const

Returns the navigation layers count.

> method get_next_source_id() -> int ; qualifiers=const

Returns a new unused source ID. This generated ID is the same that a call to `add_source` would return.

> method get_occlusion_layer_light_mask(layer_index: int) -> int ; qualifiers=const

Returns the light mask of the occlusion layer.

> method get_occlusion_layer_sdf_collision(layer_index: int) -> bool ; qualifiers=const

Returns if the occluders from this layer use `sdf_collision`.

> method get_occlusion_layers_count() -> int ; qualifiers=const

Returns the occlusion layers count.

> method get_pattern(index: int = -1) -> TileMapPattern

Returns the `TileMapPattern` at the given `index`.

> method get_patterns_count() -> int

Returns the number of `TileMapPattern` this tile set handles.

> method get_physics_layer_collision_layer(layer_index: int) -> int ; qualifiers=const

Returns the collision layer (as in the physics server) bodies on the given TileSet's physics layer are in.

> method get_physics_layer_collision_mask(layer_index: int) -> int ; qualifiers=const

Returns the collision mask of bodies on the given TileSet's physics layer.

> method get_physics_layer_collision_priority(layer_index: int) -> float ; qualifiers=const

Returns the collision priority of bodies on the given TileSet's physics layer.

> method get_physics_layer_physics_material(layer_index: int) -> PhysicsMaterial ; qualifiers=const

Returns the physics material of bodies on the given TileSet's physics layer.

> method get_physics_layers_count() -> int ; qualifiers=const

Returns the physics layers count.

> method get_source(source_id: int) -> TileSetSource ; qualifiers=const

Returns the `TileSetSource` with ID `source_id`.

> method get_source_count() -> int ; qualifiers=const

Returns the number of `TileSetSource` in this TileSet.

> method get_source_id(index: int) -> int ; qualifiers=const

Returns the source ID for source with index `index`.

> method get_source_level_tile_proxy(source_from: int) -> int

Returns the source-level proxy for the given source identifier.
If the TileSet has no proxy for the given identifier, returns -1.

> method get_terrain_color(terrain_set: int, terrain_index: int) -> Color ; qualifiers=const

Returns a terrain's color.

> method get_terrain_name(terrain_set: int, terrain_index: int) -> String ; qualifiers=const

Returns a terrain's name.

> method get_terrain_set_mode(terrain_set: int) -> TerrainMode ; qualifiers=const

Returns a terrain set mode.

> method get_terrain_sets_count() -> int ; qualifiers=const

Returns the terrain sets count.

> method get_terrains_count(terrain_set: int) -> int ; qualifiers=const

Returns the number of terrains in the given terrain set.

> method has_alternative_level_tile_proxy(source_from: int, coords_from: Vector2i, alternative_from: int) -> bool

Returns if there is an alternative-level proxy for the given identifiers.

> method has_coords_level_tile_proxy(source_from: int, coords_from: Vector2i) -> bool

Returns if there is a coodinates-level proxy for the given identifiers.

> method has_custom_data_layer_by_name(layer_name: String) -> bool ; qualifiers=const

Returns if there is a custom data layer named `layer_name`.

> method has_source(source_id: int) -> bool ; qualifiers=const

Returns if this TileSet has a source for the given source ID.

> method has_source_level_tile_proxy(source_from: int) -> bool

Returns if there is a source-level proxy for the given source ID.

> method map_tile_proxy(source_from: int, coords_from: Vector2i, alternative_from: int) -> Array ; qualifiers=const

According to the configured proxies, maps the provided identifiers to a new set of identifiers. The source ID, atlas coordinates ID and alternative tile ID are returned as a 3 elements Array.
This function first look for matching alternative-level proxies, then coordinates-level proxies, then source-level proxies.
If no proxy corresponding to provided identifiers are found, returns the same values the ones used as arguments.

> method move_custom_data_layer(layer_index: int, to_position: int) -> void

Moves the custom data layer at index `layer_index` to the given position `to_position` in the array. Also updates the atlas tiles accordingly.

> method move_navigation_layer(layer_index: int, to_position: int) -> void

Moves the navigation layer at index `layer_index` to the given position `to_position` in the array. Also updates the atlas tiles accordingly.

> method move_occlusion_layer(layer_index: int, to_position: int) -> void

Moves the occlusion layer at index `layer_index` to the given position `to_position` in the array. Also updates the atlas tiles accordingly.

> method move_physics_layer(layer_index: int, to_position: int) -> void

Moves the physics layer at index `layer_index` to the given position `to_position` in the array. Also updates the atlas tiles accordingly.

> method move_terrain(terrain_set: int, terrain_index: int, to_position: int) -> void

Moves the terrain at index `terrain_index` for terrain set `terrain_set` to the given position `to_position` in the array. Also updates the atlas tiles accordingly.

> method move_terrain_set(terrain_set: int, to_position: int) -> void

Moves the terrain set at index `terrain_set` to the given position `to_position` in the array. Also updates the atlas tiles accordingly.

> method remove_alternative_level_tile_proxy(source_from: int, coords_from: Vector2i, alternative_from: int) -> void

Removes an alternative-level proxy for the given identifiers.

> method remove_coords_level_tile_proxy(source_from: int, coords_from: Vector2i) -> void

Removes a coordinates-level proxy for the given identifiers.

> method remove_custom_data_layer(layer_index: int) -> void

Removes the custom data layer at index `layer_index`. Also updates the atlas tiles accordingly.

> method remove_navigation_layer(layer_index: int) -> void

Removes the navigation layer at index `layer_index`. Also updates the atlas tiles accordingly.

> method remove_occlusion_layer(layer_index: int) -> void

Removes the occlusion layer at index `layer_index`. Also updates the atlas tiles accordingly.

> method remove_pattern(index: int) -> void

Remove the `TileMapPattern` at the given index.

> method remove_physics_layer(layer_index: int) -> void

Removes the physics layer at index `layer_index`. Also updates the atlas tiles accordingly.

> method remove_source(source_id: int) -> void

Removes the source with the given source ID.

> method remove_source_level_tile_proxy(source_from: int) -> void

Removes a source-level tile proxy.

> method remove_terrain(terrain_set: int, terrain_index: int) -> void

Removes the terrain at index `terrain_index` in the given terrain set `terrain_set`. Also updates the atlas tiles accordingly.

> method remove_terrain_set(terrain_set: int) -> void

Removes the terrain set at index `terrain_set`. Also updates the atlas tiles accordingly.

> method set_alternative_level_tile_proxy(source_from: int, coords_from: Vector2i, alternative_from: int, source_to: int, coords_to: Vector2i, alternative_to: int) -> void

Create an alternative-level proxy for the given identifiers. A proxy will map set of tile identifiers to another set of identifiers.
Proxied tiles can be automatically replaced in TileMapLayer nodes using the editor.

> method set_coords_level_tile_proxy(source_from: int, coords_from: Vector2i, source_to: int, coords_to: Vector2i) -> void

Creates a coordinates-level proxy for the given identifiers. A proxy will map set of tile identifiers to another set of identifiers. The alternative tile ID is kept the same when using coordinates-level proxies.
Proxied tiles can be automatically replaced in TileMapLayer nodes using the editor.

> method set_custom_data_layer_name(layer_index: int, layer_name: String) -> void

Sets the name of the custom data layer identified by the given index. Names are identifiers of the layer therefore if the name is already taken it will fail and raise an error.

> method set_custom_data_layer_type(layer_index: int, layer_type: Variant.Type) -> void

Sets the type of the custom data layer identified by the given index.

> method set_navigation_layer_layer_value(layer_index: int, layer_number: int, value: bool) -> void

Based on `value`, enables or disables the specified navigation layer of the TileSet navigation data layer identified by the given `layer_index`, given a navigation_layers `layer_number` between 1 and 32.

> method set_navigation_layer_layers(layer_index: int, layers: int) -> void

Sets the navigation layers (as in the navigation server) for navigation regions in the given TileSet navigation layer.

> method set_occlusion_layer_light_mask(layer_index: int, light_mask: int) -> void

Sets the occlusion layer (as in the rendering server) for occluders in the given TileSet occlusion layer.

> method set_occlusion_layer_sdf_collision(layer_index: int, sdf_collision: bool) -> void

Enables or disables SDF collision for occluders in the given TileSet occlusion layer.

> method set_physics_layer_collision_layer(layer_index: int, layer: int) -> void

Sets the collision layer (as in the physics server) for bodies in the given TileSet physics layer.

> method set_physics_layer_collision_mask(layer_index: int, mask: int) -> void

Sets the collision mask for bodies in the given TileSet physics layer.

> method set_physics_layer_collision_priority(layer_index: int, priority: float) -> void

Sets the collision priority for bodies in the given TileSet physics layer.

> method set_physics_layer_physics_material(layer_index: int, physics_material: PhysicsMaterial) -> void

Sets the physics material for bodies in the given TileSet physics layer.

> method set_source_id(source_id: int, new_source_id: int) -> void

Changes a source's ID.

> method set_source_level_tile_proxy(source_from: int, source_to: int) -> void

Creates a source-level proxy for the given source ID. A proxy will map set of tile identifiers to another set of identifiers. Both the atlas coordinates ID and the alternative tile ID are kept the same when using source-level proxies.
Proxied tiles can be automatically replaced in TileMapLayer nodes using the editor.

> method set_terrain_color(terrain_set: int, terrain_index: int, color: Color) -> void

Sets a terrain's color. This color is used for identifying the different terrains in the TileSet editor.

> method set_terrain_name(terrain_set: int, terrain_index: int, name: String) -> void

Sets a terrain's name.

> method set_terrain_set_mode(terrain_set: int, mode: TerrainMode) -> void

Sets a terrain mode. Each mode determines which bits of a tile shape is used to match the neighboring tiles' terrains.

## Enumerations

> enum CellNeighbor

> enum_value CellNeighbor.CELL_NEIGHBOR_RIGHT_SIDE = 0

Neighbor on the right side.

> enum_value CellNeighbor.CELL_NEIGHBOR_RIGHT_CORNER = 1

Neighbor in the right corner.

> enum_value CellNeighbor.CELL_NEIGHBOR_BOTTOM_RIGHT_SIDE = 2

Neighbor on the bottom right side.

> enum_value CellNeighbor.CELL_NEIGHBOR_BOTTOM_RIGHT_CORNER = 3

Neighbor in the bottom right corner.

> enum_value CellNeighbor.CELL_NEIGHBOR_BOTTOM_SIDE = 4

Neighbor on the bottom side.

> enum_value CellNeighbor.CELL_NEIGHBOR_BOTTOM_CORNER = 5

Neighbor in the bottom corner.

> enum_value CellNeighbor.CELL_NEIGHBOR_BOTTOM_LEFT_SIDE = 6

Neighbor on the bottom left side.

> enum_value CellNeighbor.CELL_NEIGHBOR_BOTTOM_LEFT_CORNER = 7

Neighbor in the bottom left corner.

> enum_value CellNeighbor.CELL_NEIGHBOR_LEFT_SIDE = 8

Neighbor on the left side.

> enum_value CellNeighbor.CELL_NEIGHBOR_LEFT_CORNER = 9

Neighbor in the left corner.

> enum_value CellNeighbor.CELL_NEIGHBOR_TOP_LEFT_SIDE = 10

Neighbor on the top left side.

> enum_value CellNeighbor.CELL_NEIGHBOR_TOP_LEFT_CORNER = 11

Neighbor in the top left corner.

> enum_value CellNeighbor.CELL_NEIGHBOR_TOP_SIDE = 12

Neighbor on the top side.

> enum_value CellNeighbor.CELL_NEIGHBOR_TOP_CORNER = 13

Neighbor in the top corner.

> enum_value CellNeighbor.CELL_NEIGHBOR_TOP_RIGHT_SIDE = 14

Neighbor on the top right side.

> enum_value CellNeighbor.CELL_NEIGHBOR_TOP_RIGHT_CORNER = 15

Neighbor in the top right corner.

> enum TerrainMode

> enum_value TerrainMode.TERRAIN_MODE_MATCH_CORNERS_AND_SIDES = 0

Requires both corners and side to match with neighboring tiles' terrains.

> enum_value TerrainMode.TERRAIN_MODE_MATCH_CORNERS = 1

Requires corners to match with neighboring tiles' terrains.

> enum_value TerrainMode.TERRAIN_MODE_MATCH_SIDES = 2

Requires sides to match with neighboring tiles' terrains.

> enum TileLayout

> enum_value TileLayout.TILE_LAYOUT_STACKED = 0

Tile coordinates layout where both axis stay consistent with their respective local horizontal and vertical axis.

> enum_value TileLayout.TILE_LAYOUT_STACKED_OFFSET = 1

Same as `TILE_LAYOUT_STACKED`, but the first half-offset is negative instead of positive.

> enum_value TileLayout.TILE_LAYOUT_STAIRS_RIGHT = 2

Tile coordinates layout where the horizontal axis stay horizontal, and the vertical one goes down-right.

> enum_value TileLayout.TILE_LAYOUT_STAIRS_DOWN = 3

Tile coordinates layout where the vertical axis stay vertical, and the horizontal one goes down-right.

> enum_value TileLayout.TILE_LAYOUT_DIAMOND_RIGHT = 4

Tile coordinates layout where the horizontal axis goes up-right, and the vertical one goes down-right.

> enum_value TileLayout.TILE_LAYOUT_DIAMOND_DOWN = 5

Tile coordinates layout where the horizontal axis goes down-right, and the vertical one goes down-left.

> enum TileOffsetAxis

> enum_value TileOffsetAxis.TILE_OFFSET_AXIS_HORIZONTAL = 0

Horizontal half-offset.

> enum_value TileOffsetAxis.TILE_OFFSET_AXIS_VERTICAL = 1

Vertical half-offset.

> enum TileShape

> enum_value TileShape.TILE_SHAPE_SQUARE = 0

Rectangular tile shape.

> enum_value TileShape.TILE_SHAPE_ISOMETRIC = 1

Diamond tile shape (for isometric look).
**Note:** Isometric `TileSet` works best if all sibling `TileMapLayer`s and their parent inheriting from `Node2D` have Y-sort enabled.

> enum_value TileShape.TILE_SHAPE_HALF_OFFSET_SQUARE = 2

Rectangular tile shape with one row/column out of two offset by half a tile.

> enum_value TileShape.TILE_SHAPE_HEXAGON = 3

Hexagonal tile shape.

## Tutorials
- [Using Tilemaps]($DOCS_URL/tutorials/2d/using_tilemaps.html)
- [2D Platformer Demo](https://godotengine.org/asset-library/asset/2727)
- [2D Isometric Demo](https://godotengine.org/asset-library/asset/2718)
- [2D Hexagonal Demo](https://godotengine.org/asset-library/asset/2717)
- [2D Grid-based Navigation with AStarGrid2D Demo](https://godotengine.org/asset-library/asset/2723)
- [2D Role Playing Game (RPG) Demo](https://godotengine.org/asset-library/asset/2729)
- [2D Kinematic Character Demo](https://godotengine.org/asset-library/asset/2719)
