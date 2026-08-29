# TextureButton

> class TextureButton
> inherits TextureButton BaseButton

## Brief

Texture-based button. Supports Pressed, Hover, Disabled and Focused states.

## Description

`TextureButton` has the same functionality as `Button`, except it uses sprites instead of Godot's `Theme` resource. It is faster to create, but it doesn't support localization like more complex `Control`s.
See also `BaseButton` which contains common properties and methods associated with this node.
**Note:** Setting a texture for the "normal" state (`texture_normal`) is recommended. If `texture_normal` is not set, the `TextureButton` will still receive input events and be clickable, but the user will not be able to see it unless they activate another one of its states with a texture assigned (e.g., hover over it to show `texture_hover`).

## Properties

> property flip_h : bool ; default=false ; setter=set_flip_h ; getter=is_flipped_h

If `true`, texture is flipped horizontally.

> property flip_v : bool ; default=false ; setter=set_flip_v ; getter=is_flipped_v

If `true`, texture is flipped vertically.

> property ignore_texture_size : bool ; default=false ; setter=set_ignore_texture_size ; getter=get_ignore_texture_size

If `true`, the size of the texture won't be considered for minimum size calculation, so the `TextureButton` can be shrunk down past the texture size.

> property stretch_mode : StretchMode ; default=2 ; setter=set_stretch_mode ; getter=get_stretch_mode

Controls the texture's behavior when you resize the node's bounding rectangle. See the `StretchMode` constants for available options.

> property texture_click_mask : BitMap ; setter=set_click_mask ; getter=get_click_mask

Pure black and white `BitMap` image to use for click detection. On the mask, white pixels represent the button's clickable area. Use it to create buttons with curved shapes.

> property texture_disabled : Texture2D ; setter=set_texture_disabled ; getter=get_texture_disabled

Texture to display when the node is disabled. See `BaseButton.disabled`. If not assigned, the `TextureButton` displays `texture_normal` instead.

> property texture_focused : Texture2D ; setter=set_texture_focused ; getter=get_texture_focused

Texture to *overlay on the base texture* when the node has mouse or keyboard focus. Because `texture_focused` is displayed on top of the base texture, a partially transparent texture should be used to ensure the base texture remains visible. A texture that represents an outline or an underline works well for this purpose. To disable the focus visual effect, assign a fully transparent texture of any size. Note that disabling the focus visual effect will harm keyboard/controller navigation usability, so this is not recommended for accessibility reasons.

> property texture_hover : Texture2D ; setter=set_texture_hover ; getter=get_texture_hover

Texture to display when the mouse hovers over the node. If not assigned, the `TextureButton` displays `texture_normal` instead when hovered over.

> property texture_normal : Texture2D ; setter=set_texture_normal ; getter=get_texture_normal

Texture to display by default, when the node is **not** in the disabled, hover or pressed state. This texture is still displayed in the focused state, with `texture_focused` drawn on top.

> property texture_pressed : Texture2D ; setter=set_texture_pressed ; getter=get_texture_pressed

Texture to display on mouse down over the node, if the node has keyboard focus and the player presses the Enter key or if the player presses the `BaseButton.shortcut` key. If not assigned, the `TextureButton` displays `texture_hover` instead when pressed.

## Enumerations

> enum StretchMode

> enum_value StretchMode.STRETCH_SCALE = 0

Scale to fit the node's bounding rectangle.

> enum_value StretchMode.STRETCH_TILE = 1

Tile inside the node's bounding rectangle.

> enum_value StretchMode.STRETCH_KEEP = 2

The texture keeps its original size and stays in the bounding rectangle's top-left corner.

> enum_value StretchMode.STRETCH_KEEP_CENTERED = 3

The texture keeps its original size and stays centered in the node's bounding rectangle.

> enum_value StretchMode.STRETCH_KEEP_ASPECT = 4

Scale the texture to fit the node's bounding rectangle, but maintain the texture's aspect ratio.

> enum_value StretchMode.STRETCH_KEEP_ASPECT_CENTERED = 5

Scale the texture to fit the node's bounding rectangle, center it, and maintain its aspect ratio.

> enum_value StretchMode.STRETCH_KEEP_ASPECT_COVERED = 6

Scale the texture so that the shorter side fits the bounding rectangle. The other side clips to the node's limits.

## Tutorials
- [3D Voxel Demo](https://godotengine.org/asset-library/asset/2755)
