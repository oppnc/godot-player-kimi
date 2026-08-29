# VideoStream

> class VideoStream
> inherits VideoStream Resource

## Brief

Base resource for video streams.

## Description

Base resource type for all video streams. Classes that derive from `VideoStream` can all be used as resource types to play back videos in `VideoStreamPlayer`.

## Properties

> property file : String ; default="" ; setter=set_file ; getter=get_file

The video file path or URI that this `VideoStream` resource handles.
For `VideoStreamTheora`, this filename should be an Ogg Theora video file with the `.ogv` extension.

## Methods

> method _instantiate_playback() -> VideoStreamPlayback ; qualifiers=virtual required

Called when the video starts playing, to initialize and return a subclass of `VideoStreamPlayback`.

## Tutorials
- [Playing videos]($DOCS_URL/tutorials/animation/playing_videos.html)
- [Runtime file loading and saving]($DOCS_URL/tutorials/io/runtime_file_loading_and_saving.html)
