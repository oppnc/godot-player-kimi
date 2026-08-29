# MeshTexture

> class MeshTexture
> inherits MeshTexture Texture2D

## Brief

Simple texture that uses a mesh to draw itself.

## Description

Simple texture that uses a mesh to draw itself. It's limited because flags can't be changed and region drawing is not supported.

## Properties

> property base_texture : Texture2D ; setter=set_base_texture ; getter=get_base_texture

Sets the base texture that the Mesh will use to draw.

> property image_size : Vector2 ; default=Vector2(0, 0) ; setter=set_image_size ; getter=get_image_size

Sets the size of the image, needed for reference.

> property mesh : Mesh ; setter=set_mesh ; getter=get_mesh

Sets the mesh used to draw. It must be a mesh using 2D vertices.

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource
