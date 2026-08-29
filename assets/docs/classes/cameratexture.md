# CameraTexture

> class CameraTexture
> inherits CameraTexture Texture2D

## Brief

Texture provided by a `CameraFeed`.

## Description

This texture gives access to the camera texture provided by a `CameraFeed`.
**Note:** Many cameras supply YCbCr images which need to be converted in a shader.

## Properties

> property camera_feed_id : int ; default=0 ; setter=set_camera_feed_id ; getter=get_camera_feed_id

The ID of the `CameraFeed` for which we want to display the image.

> property camera_is_active : bool ; default=false ; setter=set_camera_active ; getter=get_camera_active

Convenience property that gives access to the active property of the `CameraFeed`.

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

> property which_feed : CameraServer.FeedImage ; default=0 ; setter=set_which_feed ; getter=get_which_feed

Which image within the `CameraFeed` we want access to, important if the camera image is split in a Y and CbCr component.
