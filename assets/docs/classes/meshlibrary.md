# MeshLibrary

> class MeshLibrary
> inherits MeshLibrary Resource

## Brief

Library of meshes.

## Description

A library of meshes. Contains a list of `Mesh` resources, each with a name and ID. Each item can also include collision and navigation shapes. This resource is used in `GridMap`.

## Methods

> method clear() -> void

Clears the library.

> method create_item(id: int) -> void

Creates a new item in the library with the given ID.
You can get an unused ID from `get_last_unused_item_id`.

> method find_item_by_name(name: String) -> int ; qualifiers=const

Returns the first item with the given name, or `-1` if no item is found.

> method get_item_count() -> int ; qualifiers=const

Returns the number of items present in the library.

> method get_item_list() -> PackedInt32Array ; qualifiers=const

Returns the list of item IDs in use.

> method get_item_mesh(id: int) -> Mesh ; qualifiers=const

Returns the item's mesh.

> method get_item_mesh_cast_shadow(id: int) -> RenderingServer.ShadowCastingSetting ; qualifiers=const

Returns the item's shadow casting mode.

> method get_item_mesh_transform(id: int) -> Transform3D ; qualifiers=const

Returns the transform applied to the item's mesh.

> method get_item_name(id: int) -> String ; qualifiers=const

Returns the item's name.

> method get_item_navigation_layers(id: int) -> int ; qualifiers=const

Returns the item's navigation layers bitmask.

> method get_item_navigation_mesh(id: int) -> NavigationMesh ; qualifiers=const

Returns the item's navigation mesh.

> method get_item_navigation_mesh_transform(id: int) -> Transform3D ; qualifiers=const

Returns the transform applied to the item's navigation mesh.

> method get_item_preview(id: int) -> Texture2D ; qualifiers=const

When running in the editor, returns a generated item preview (a 3D rendering in isometric perspective). When used in a running project, returns the manually-defined item preview which can be set using `set_item_preview`. Returns an empty `Texture2D` if no preview was manually set in a running project.

> method get_item_shapes(id: int) -> Array ; qualifiers=const

Returns an item's collision shapes.
The array consists of each `Shape3D` followed by its `Transform3D`.

> method get_last_unused_item_id() -> int ; qualifiers=const

Gets an unused ID for a new item.

> method remove_item(id: int) -> void

Removes the item.

> method set_item_mesh(id: int, mesh: Mesh) -> void

Sets the item's mesh.

> method set_item_mesh_cast_shadow(id: int, shadow_casting_setting: RenderingServer.ShadowCastingSetting) -> void

Sets the item's shadow casting mode to `shadow_casting_setting`.

> method set_item_mesh_transform(id: int, mesh_transform: Transform3D) -> void

Sets the transform to apply to the item's mesh.

> method set_item_name(id: int, name: String) -> void

Sets the item's name.
This name is shown in the editor. It can also be used to look up the item later using `find_item_by_name`.

> method set_item_navigation_layers(id: int, navigation_layers: int) -> void

Sets the item's navigation layers bitmask.

> method set_item_navigation_mesh(id: int, navigation_mesh: NavigationMesh) -> void

Sets the item's navigation mesh.

> method set_item_navigation_mesh_transform(id: int, navigation_mesh: Transform3D) -> void

Sets the transform to apply to the item's navigation mesh.

> method set_item_preview(id: int, texture: Texture2D) -> void

Sets a texture to use as the item's preview icon in the editor.

> method set_item_shapes(id: int, shapes: Array) -> void

Sets an item's collision shapes.
The array should consist of `Shape3D` objects, each followed by a `Transform3D` that will be applied to it. For shapes that should not have a transform, use `Transform3D.IDENTITY`.

## Tutorials
- [3D Kinematic Character Demo](https://godotengine.org/asset-library/asset/2739)
- [3D Platformer Demo](https://godotengine.org/asset-library/asset/2748)
