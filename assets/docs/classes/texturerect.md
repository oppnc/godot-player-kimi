# TextureRect

> class TextureRect
> inherits TextureRect Control

## Brief

A control that displays a texture.

## Description

A control that displays a texture, for example an icon inside a GUI. The texture's placement can be controlled with the `stretch_mode` property. It can scale, tile, or stay centered inside its bounding rectangle.

## Properties

> property expand_mode : ExpandMode ; default=0 ; setter=set_expand_mode ; getter=get_expand_mode ; experimental=Using `EXPAND_FIT_WIDTH`, `EXPAND_FIT_WIDTH_PROPORTIONAL`, `EXPAND_FIT_HEIGHT`, or `EXPAND_FIT_HEIGHT_PROPORTIONAL` may result in unstable behavior in some `Container` controls. This behavior may be re-evaluated and changed in the future.

Defines how minimum size is determined based on the texture's size.

> property flip_h : bool ; default=false ; setter=set_flip_h ; getter=is_flipped_h

If `true`, texture is flipped horizontally.

> property flip_v : bool ; default=false ; setter=set_flip_v ; getter=is_flipped_v

If `true`, texture is flipped vertically.

> property mouse_filter : Control.MouseFilter ; default=1 ; setter=set_mouse_filter ; getter=get_mouse_filter ; overrides=Control

> property stretch_mode : StretchMode ; default=0 ; setter=set_stretch_mode ; getter=get_stretch_mode

Controls the texture's behavior when resizing the node's bounding rectangle.

> property texture : Texture2D ; setter=set_texture ; getter=get_texture

The node's `Texture2D` resource.

## Enumerations

> enum ExpandMode

> enum_value ExpandMode.EXPAND_KEEP_SIZE = 0

The minimum size will be equal to texture size, i.e. `TextureRect` can't be smaller than the texture.

> enum_value ExpandMode.EXPAND_IGNORE_SIZE = 1

The size of the texture won't be considered for minimum size calculation, so the `TextureRect` can be shrunk down past the texture size.

> enum_value ExpandMode.EXPAND_FIT_WIDTH = 2

The height of the texture will be ignored. Minimum width will be equal to the current height. Useful for horizontal layouts, e.g. inside `HBoxContainer`.

> enum_value ExpandMode.EXPAND_FIT_WIDTH_PROPORTIONAL = 3

Same as `EXPAND_FIT_WIDTH`, but keeps texture's aspect ratio.

> enum_value ExpandMode.EXPAND_FIT_HEIGHT = 4

The width of the texture will be ignored. Minimum height will be equal to the current width. Useful for vertical layouts, e.g. inside `VBoxContainer`.

> enum_value ExpandMode.EXPAND_FIT_HEIGHT_PROPORTIONAL = 5

Same as `EXPAND_FIT_HEIGHT`, but keeps texture's aspect ratio.

> enum StretchMode

> enum_value StretchMode.STRETCH_SCALE = 0

Scale to fit the node's bounding rectangle.

> enum_value StretchMode.STRETCH_TILE = 1

Tile inside the node's bounding rectangle.
**Note:** `STRETCH_TILE` mode is not supported for `texture` set to an `AtlasTexture` with non-zero `AtlasTexture.margin`.

> enum_value StretchMode.STRETCH_KEEP = 2

The texture keeps its original size and stays in the bounding rectangle's top-left corner.

> enum_value StretchMode.STRETCH_KEEP_CENTERED = 3

The texture keeps its original size and stays centered in the node's bounding rectangle.

> enum_value StretchMode.STRETCH_KEEP_ASPECT = 4

Scale the texture to fit the node's bounding rectangle, but maintain the texture's aspect ratio.

> enum_value StretchMode.STRETCH_KEEP_ASPECT_CENTERED = 5

Scale the texture to fit the node's bounding rectangle, center it and maintain its aspect ratio.

> enum_value StretchMode.STRETCH_KEEP_ASPECT_COVERED = 6

Scale the texture so that the shorter side fits the bounding rectangle. The other side clips to the node's limits.

## Tutorials
- [3D Voxel Demo](https://godotengine.org/asset-library/asset/2755)
