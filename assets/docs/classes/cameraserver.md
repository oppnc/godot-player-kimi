# CameraServer

> class CameraServer
> inherits CameraServer Object

## Brief

Server keeping track of different cameras accessible in Godot.

## Description

The `CameraServer` keeps track of different cameras accessible in Godot. These are external cameras such as webcams or the cameras on your phone.
It is notably used to provide AR modules with a video feed from the camera.
**Note:** This class is currently only implemented on Linux, Android, macOS, and iOS. On other platforms no `CameraFeed`s will be available. To get a `CameraFeed` on iOS, enable `EditorExportPlatformIOS.modules/camera`.

## Properties

> property monitoring_feeds : bool ; default=false ; setter=set_monitoring_feeds ; getter=is_monitoring_feeds

If `true`, the server is actively monitoring available camera feeds.
This has a performance cost, so only set it to `true` when you're actively accessing the camera.
**Note:** After setting it to `true`, you can receive updated camera feeds through the `camera_feeds_updated` signal.

```gdscript
            func _ready():
                CameraServer.camera_feeds_updated.connect(_on_camera_feeds_updated)
                CameraServer.monitoring_feeds = true

            func _on_camera_feeds_updated():
                var feeds = CameraServer.feeds()

```

```csharp
            public override void _Ready()
            {
                CameraServer.CameraFeedsUpdated += OnCameraFeedsUpdated;
                CameraServer.MonitoringFeeds = true;
            }

            void OnCameraFeedsUpdated()
            {
                var feeds = CameraServer.Feeds();
            }

```

## Methods

> method add_feed(feed: CameraFeed) -> void

Adds the camera `feed` to the camera server.

> method feeds() -> Array[CameraFeed]

Returns an array of `CameraFeed`s.

> method get_feed(index: int) -> CameraFeed

Returns the `CameraFeed` corresponding to the camera with the given `index`.

> method get_feed_count() -> int

Returns the number of `CameraFeed`s registered.

> method remove_feed(feed: CameraFeed) -> void

Removes the specified camera `feed`.

## Signals

> signal camera_feed_added(id: int)

Emitted when a `CameraFeed` is added (e.g. a webcam is plugged in).

> signal camera_feed_removed(id: int)

Emitted when a `CameraFeed` is removed (e.g. a webcam is unplugged).

> signal camera_feeds_updated()

Emitted when camera feeds are updated.

## Enumerations

> enum FeedImage

> enum_value FeedImage.FEED_RGBA_IMAGE = 0

The RGBA camera image.

> enum_value FeedImage.FEED_YCBCR_IMAGE = 0

The [YCbCr](https://en.wikipedia.org/wiki/YCbCr) camera image.

> enum_value FeedImage.FEED_Y_IMAGE = 0

The Y component camera image.

> enum_value FeedImage.FEED_CBCR_IMAGE = 1

The CbCr component camera image.
