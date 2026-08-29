# VideoStreamPlayer

> class VideoStreamPlayer
> inherits VideoStreamPlayer Control

## Brief

A control used for video playback.

## Description

A control used for playback of `VideoStream` resources.
Supported video formats are [Ogg Theora](https://www.theora.org/) (`.ogv`, `VideoStreamTheora`) and any format exposed via a GDExtension plugin.
**Warning:** On Web, video playback *will* perform poorly due to missing architecture-specific assembly optimizations.

## Properties

> property audio_track : int ; default=0 ; setter=set_audio_track ; getter=get_audio_track

The embedded audio track to play.

> property autoplay : bool ; default=false ; setter=set_autoplay ; getter=has_autoplay

If `true`, playback starts when the scene loads.

> property buffering_msec : int ; default=500 ; setter=set_buffering_msec ; getter=get_buffering_msec

Amount of time in milliseconds to store in buffer while playing.

> property bus : StringName ; default=&"Master" ; setter=set_bus ; getter=get_bus

Audio bus to use for sound playback.

> property expand : bool ; default=false ; setter=set_expand ; getter=has_expand

If `true`, the video scales to the control size. Otherwise, the control minimum size will be automatically adjusted to match the video stream's dimensions.

> property loop : bool ; default=false ; setter=set_loop ; getter=has_loop

If `true`, the video restarts when it reaches its end.

> property paused : bool ; default=false ; setter=set_paused ; getter=is_paused

If `true`, the video is paused.

> property speed_scale : float ; default=1.0 ; setter=set_speed_scale ; getter=get_speed_scale

The stream's current speed scale. `1.0` is the normal speed, while `2.0` is double speed and `0.5` is half speed. A speed scale of `0.0` pauses the video, similar to setting `paused` to `true`.

> property stream : VideoStream ; setter=set_stream ; getter=get_stream

The assigned video stream. See description for supported formats.

> property stream_position : float ; setter=set_stream_position ; getter=get_stream_position

The current position of the stream, in seconds.

> property volume : float ; setter=set_volume ; getter=get_volume

Audio volume as a linear value.

> property volume_db : float ; default=0.0 ; setter=set_volume_db ; getter=get_volume_db

Audio volume in dB.

## Methods

> method get_stream_length() -> float ; qualifiers=const

The length of the current stream, in seconds.

> method get_stream_name() -> String ; qualifiers=const

Returns the video stream's name, or `"<No Stream>"` if no video stream is assigned.

> method get_video_texture() -> Texture2D ; qualifiers=const

Returns the current frame as a `Texture2D`.

> method is_playing() -> bool ; qualifiers=const

Returns `true` if the video is playing.
**Note:** The video is still considered playing if paused during playback.

> method play() -> void

Starts the video playback from the beginning. If the video is paused, this will not unpause the video.

> method stop() -> void

Stops the video playback and sets the stream position to 0.
**Note:** Although the stream position will be set to 0, the first frame of the video stream won't become the current frame.

## Signals

> signal finished()

Emitted when playback is finished.

## Tutorials
- [Playing videos]($DOCS_URL/tutorials/animation/playing_videos.html)
