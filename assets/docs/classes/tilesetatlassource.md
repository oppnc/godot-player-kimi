# TileSetAtlasSource

> class TileSetAtlasSource
> inherits TileSetAtlasSource TileSetSource

## Brief

Exposes a 2D atlas texture as a set of tiles for a `TileSet` resource.

## Description

An atlas is a grid of tiles laid out on a texture. Each tile in the grid must be exposed using `create_tile`. Those tiles are then indexed using their coordinates in the grid.
Each tile can also have a size in the grid coordinates, making it more or less cells in the atlas.
Alternatives version of a tile can be created using `create_alternative_tile`, which are then indexed using an alternative ID. The main tile (the one in the grid), is accessed with an alternative ID equal to 0.
Each tile alternate has a set of properties that is defined by the source's `TileSet` layers. Those properties are stored in a TileData object that can be accessed and modified using `get_tile_data`.
As TileData properties are stored directly in the TileSetAtlasSource resource, their properties might also be set using `TileSetAtlasSource.set("<coords_x>:<coords_y>/<alternative_id>/<tile_data_property>")`.

## Properties

> property margins : Vector2i ; default=Vector2i(0, 0) ; setter=set_margins ; getter=get_margins

Margins, in pixels, to offset the origin of the grid in the texture.

> property separation : Vector2i ; default=Vector2i(0, 0) ; setter=set_separation ; getter=get_separation

Separation, in pixels, between each tile texture region of the grid.

> property texture : Texture2D ; setter=set_texture ; getter=get_texture

The atlas texture.

> property texture_region_size : Vector2i ; default=Vector2i(16, 16) ; setter=set_texture_region_size ; getter=get_texture_region_size

The base tile size in the texture (in pixel). This size must be bigger than or equal to the TileSet's `tile_size` value.

> property use_texture_padding : bool ; default=true ; setter=set_use_texture_padding ; getter=get_use_texture_padding

If `true`, generates an internal texture with an additional one pixel padding around each tile. Texture padding avoids a common artifact where lines appear between tiles.
Disabling this setting might lead a small performance improvement, as generating the internal texture requires both memory and processing time when the TileSetAtlasSource resource is modified.

## Methods

> method clear_tiles_outside_texture() -> void

Removes all tiles that don't fit the available texture area. This method iterates over all the source's tiles, so it's advised to use `has_tiles_outside_texture` beforehand.

> method create_alternative_tile(atlas_coords: Vector2i, alternative_id_override: int = -1) -> int

Creates an alternative tile for the tile at coordinates `atlas_coords`. If `alternative_id_override` is -1, give it an automatically generated unique ID, or assigns it the given ID otherwise.
Returns the new alternative identifier, or -1 if the alternative could not be created with a provided `alternative_id_override`.

> method create_tile(atlas_coords: Vector2i, size: Vector2i = Vector2i(1, 1)) -> void

Creates a new tile at coordinates `atlas_coords` with the given `size`.

> method get_atlas_grid_size() -> Vector2i ; qualifiers=const

Returns the atlas grid size, which depends on how many tiles can fit in the texture. It thus depends on the `texture`'s size, the atlas `margins`, and the tiles' `texture_region_size`.

> method get_next_alternative_tile_id(atlas_coords: Vector2i) -> int ; qualifiers=const

Returns the alternative ID a following call to `create_alternative_tile` would return.

> method get_runtime_texture() -> Texture2D ; qualifiers=const

If `use_texture_padding` is `false`, returns `texture`. Otherwise, returns an internal `ImageTexture` created that includes the padding.

> method get_runtime_tile_texture_region(atlas_coords: Vector2i, frame: int) -> Rect2i ; qualifiers=const

Returns the region of the tile at coordinates `atlas_coords` for the given `frame` inside the texture returned by `get_runtime_texture`.
**Note:** If `use_texture_padding` is `false`, returns the same as `get_tile_texture_region`.

> method get_tile_animation_columns(atlas_coords: Vector2i) -> int ; qualifiers=const

Returns how many columns the tile at `atlas_coords` has in its animation layout.

> method get_tile_animation_frame_duration(atlas_coords: Vector2i, frame_index: int) -> float ; qualifiers=const

Returns the animation frame duration of frame `frame_index` for the tile at coordinates `atlas_coords`.

> method get_tile_animation_frames_count(atlas_coords: Vector2i) -> int ; qualifiers=const

Returns how many animation frames has the tile at coordinates `atlas_coords`.

> method get_tile_animation_mode(atlas_coords: Vector2i) -> TileAnimationMode ; qualifiers=const

Returns the tile animation mode of the tile at `atlas_coords`. See also `set_tile_animation_mode`.

> method get_tile_animation_separation(atlas_coords: Vector2i) -> Vector2i ; qualifiers=const

Returns the separation (as in the atlas grid) between each frame of an animated tile at coordinates `atlas_coords`.

> method get_tile_animation_speed(atlas_coords: Vector2i) -> float ; qualifiers=const

Returns the animation speed of the tile at coordinates `atlas_coords`.

> method get_tile_animation_total_duration(atlas_coords: Vector2i) -> float ; qualifiers=const

Returns the sum of the sum of the frame durations of the tile at coordinates `atlas_coords`. This value needs to be divided by the animation speed to get the actual animation loop duration.

> method get_tile_at_coords(atlas_coords: Vector2i) -> Vector2i ; qualifiers=const

If there is a tile covering the `atlas_coords` coordinates, returns the top-left coordinates of the tile (thus its coordinate ID). Returns `Vector2i(-1, -1)` otherwise.

> method get_tile_data(atlas_coords: Vector2i, alternative_tile: int) -> TileData ; qualifiers=const

Returns the `TileData` object for the given atlas coordinates and alternative ID.

> method get_tile_size_in_atlas(atlas_coords: Vector2i) -> Vector2i ; qualifiers=const

Returns the size of the tile (in the grid coordinates system) at coordinates `atlas_coords`.

> method get_tile_texture_region(atlas_coords: Vector2i, frame: int = 0) -> Rect2i ; qualifiers=const

Returns a tile's texture region in the atlas texture. For animated tiles, a `frame` argument might be provided for the different frames of the animation.

> method get_tiles_to_be_removed_on_change(texture: Texture2D, margins: Vector2i, separation: Vector2i, texture_region_size: Vector2i) -> PackedVector2Array

Returns an array of tiles coordinates ID that will be automatically removed when modifying one or several of those properties: `texture`, `margins`, `separation` or `texture_region_size`. This can be used to undo changes that would have caused tiles data loss.

> method has_room_for_tile(atlas_coords: Vector2i, size: Vector2i, animation_columns: int, animation_separation: Vector2i, frames_count: int, ignored_tile: Vector2i = Vector2i(-1, -1)) -> bool ; qualifiers=const

Returns whether there is enough room in an atlas to create/modify a tile with the given properties. If `ignored_tile` is provided, act as is the given tile was not present in the atlas. This may be used when you want to modify a tile's properties.

> method has_tiles_outside_texture() -> bool ; qualifiers=const

Checks if the source has any tiles that don't fit the texture area (either partially or completely).

> method move_tile_in_atlas(atlas_coords: Vector2i, new_atlas_coords: Vector2i = Vector2i(-1, -1), new_size: Vector2i = Vector2i(-1, -1)) -> void

Move the tile and its alternatives at the `atlas_coords` coordinates to the `new_atlas_coords` coordinates with the `new_size` size. This functions will fail if a tile is already present in the given area.
If `new_atlas_coords` is `Vector2i(-1, -1)`, keeps the tile's coordinates. If `new_size` is `Vector2i(-1, -1)`, keeps the tile's size.
To avoid an error, first check if a move is possible using `has_room_for_tile`.

> method remove_alternative_tile(atlas_coords: Vector2i, alternative_tile: int) -> void

Remove a tile's alternative with alternative ID `alternative_tile`.
Calling this function with `alternative_tile` equals to 0 will fail, as the base tile alternative cannot be removed.

> method remove_tile(atlas_coords: Vector2i) -> void

Remove a tile and its alternative at coordinates `atlas_coords`.

> method set_alternative_tile_id(atlas_coords: Vector2i, alternative_tile: int, new_id: int) -> void

Change a tile's alternative ID from `alternative_tile` to `new_id`.
Calling this function with `new_id` of 0 will fail, as the base tile alternative cannot be moved.

> method set_tile_animation_columns(atlas_coords: Vector2i, frame_columns: int) -> void

Sets the number of columns in the animation layout of the tile at coordinates `atlas_coords`. If set to 0, then the different frames of the animation are laid out as a single horizontal line in the atlas.

> method set_tile_animation_frame_duration(atlas_coords: Vector2i, frame_index: int, duration: float) -> void

Sets the animation frame `duration` of frame `frame_index` for the tile at coordinates `atlas_coords`.

> method set_tile_animation_frames_count(atlas_coords: Vector2i, frames_count: int) -> void

Sets how many animation frames the tile at coordinates `atlas_coords` has.

> method set_tile_animation_mode(atlas_coords: Vector2i, mode: TileAnimationMode) -> void

Sets the tile animation mode of the tile at `atlas_coords` to `mode`. See also `get_tile_animation_mode`.

> method set_tile_animation_separation(atlas_coords: Vector2i, separation: Vector2i) -> void

Sets the margin (in grid tiles) between each tile in the animation layout of the tile at coordinates `atlas_coords` has.

> method set_tile_animation_speed(atlas_coords: Vector2i, speed: float) -> void

Sets the animation speed of the tile at coordinates `atlas_coords` has.

## Enumerations

> enum TileAnimationMode

> enum_value TileAnimationMode.TILE_ANIMATION_MODE_DEFAULT = 0

Tile animations start at same time, looking identical.

> enum_value TileAnimationMode.TILE_ANIMATION_MODE_RANDOM_START_TIMES = 1

Tile animations start at random times, looking varied.

> enum_value TileAnimationMode.TILE_ANIMATION_MODE_MAX = 2

Represents the size of the `TileAnimationMode` enum.

## Constants

> constant TRANSFORM_FLIP_H = 4096

Represents cell's horizontal flip flag. Should be used directly with `TileMapLayer` to flip placed tiles by altering their alternative IDs.

```text
            var alternate_id = $TileMapLayer.get_cell_alternative_tile(Vector2i(2, 2))
            if not alternate_id & TileSetAtlasSource.TRANSFORM_FLIP_H:
                # If tile is not already flipped, flip it.
                $TileMapLayer.set_cell(Vector2i(2, 2), source_id, atlas_coords, alternate_id | TileSetAtlasSource.TRANSFORM_FLIP_H)

```

**Note:** These transformations can be combined to do the equivalent of 0, 90, 180, and 270 degree rotations, as shown below:

```text
            enum TileTransform {
                ROTATE_0 = 0,
                ROTATE_90 = TileSetAtlasSource.TRANSFORM_TRANSPOSE | TileSetAtlasSource.TRANSFORM_FLIP_H,
                ROTATE_180 = TileSetAtlasSource.TRANSFORM_FLIP_H | TileSetAtlasSource.TRANSFORM_FLIP_V,
                ROTATE_270 = TileSetAtlasSource.TRANSFORM_TRANSPOSE | TileSetAtlasSource.TRANSFORM_FLIP_V,
            }

```

> constant TRANSFORM_FLIP_V = 8192

Represents cell's vertical flip flag. See `TRANSFORM_FLIP_H` for usage.

> constant TRANSFORM_TRANSPOSE = 16384

Represents cell's transposed flag. See `TRANSFORM_FLIP_H` for usage.
