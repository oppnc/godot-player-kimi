# MeshInstance2D

> class MeshInstance2D
> inherits MeshInstance2D Node2D

## Brief

Node used for displaying a `Mesh` in 2D.

## Description

Node used for displaying a `Mesh` in 2D. This can be faster to render compared to displaying a `Sprite2D` node with large transparent areas, especially if the node takes up a lot of space on screen at high viewport resolutions. This is because using a mesh designed to fit the sprite's opaque areas will reduce GPU fill rate utilization (at the cost of increased vertex processing utilization).
When a `Mesh` has to be instantiated more than thousands of times close to each other, consider using a `MultiMesh` in a `MultiMeshInstance2D` instead.
A `MeshInstance2D` can be created from an existing `Sprite2D` via a tool in the editor toolbar. Select the `Sprite2D` node, then choose **Sprite2D > Convert to MeshInstance2D** at the top of the 2D editor viewport.

## Properties

> property mesh : Mesh ; setter=set_mesh ; getter=get_mesh

The `Mesh` that will be drawn by the `MeshInstance2D`.

> property texture : Texture2D ; setter=set_texture ; getter=get_texture

The `Texture2D` that will be used if using the default `CanvasItemMaterial`. Can be accessed as `TEXTURE` in CanvasItem shader.

## Signals

> signal texture_changed()

Emitted when the `texture` is changed.

## Tutorials
- [2D meshes]($DOCS_URL/tutorials/2d/2d_meshes.html)
