# RemoteTransform3D

> class RemoteTransform3D
> inherits RemoteTransform3D Node3D

## Brief

RemoteTransform3D pushes its own `Transform3D` to another `Node3D` derived Node in the scene.

## Description

RemoteTransform3D pushes its own `Transform3D` to another `Node3D` derived Node (called the remote node) in the scene.
It can be set to update another Node's position, rotation and/or scale. It can use either global or local coordinates.

## Properties

> property remote_path : NodePath ; default=NodePath("") ; setter=set_remote_node ; getter=get_remote_node

The `NodePath` to the remote node, relative to the RemoteTransform3D's position in the scene.

> property update_position : bool ; default=true ; setter=set_update_position ; getter=get_update_position

If `true`, the remote node's position is updated.

> property update_rotation : bool ; default=true ; setter=set_update_rotation ; getter=get_update_rotation

If `true`, the remote node's rotation is updated.

> property update_scale : bool ; default=true ; setter=set_update_scale ; getter=get_update_scale

If `true`, the remote node's scale is updated.

> property use_global_coordinates : bool ; default=true ; setter=set_use_global_coordinates ; getter=get_use_global_coordinates

If `true`, global coordinates are used. If `false`, local coordinates are used.

## Methods

> method force_update_cache() -> void

`RemoteTransform3D` caches the remote node. It may not notice if the remote node disappears; `force_update_cache` forces it to update the cache again.
