# CameraFeed

> class CameraFeed
> inherits CameraFeed RefCounted

## Brief

A camera feed gives you access to a single physical camera attached to your device.

## Description

A camera feed gives you access to a single physical camera attached to your device. When enabled, Godot will start capturing frames from the camera which can then be used. See also `CameraServer`.
**Note:** Many cameras will return YCbCr images which are split into two textures and need to be combined in a shader. Godot does this automatically for you if you set the environment to show the camera image in the background.
**Note:** This class is currently only implemented on Linux, Android, macOS, and iOS. On other platforms no `CameraFeed`s will be available. To get a `CameraFeed` on iOS, enable `EditorExportPlatformIOS.modules/camera`.

## Properties

> property feed_is_active : bool ; default=false ; setter=set_active ; getter=is_active

If `true`, the feed is active.

> property feed_transform : Transform2D ; default=Transform2D(1, 0, 0, -1, 0, 1) ; setter=set_transform ; getter=get_transform

The transform applied to the camera's image.

> property formats : Array ; default=[] ; getter=get_formats

Formats supported by the feed. Each entry is a `Dictionary` describing format parameters.

## Methods

> method _activate_feed() -> bool ; qualifiers=virtual

Called when the camera feed is activated.

> method _deactivate_feed() -> void ; qualifiers=virtual

Called when the camera feed is deactivated.

> method _get_formats() -> Array ; qualifiers=virtual const

Override this method to define supported formats of the camera feed.

> method _set_format(index: int, parameters: Dictionary) -> bool ; qualifiers=virtual

Override this method to set the format of the camera feed.

> method get_datatype() -> FeedDataType ; qualifiers=const

Returns feed image data type.

> method get_id() -> int ; qualifiers=const

Returns the unique ID for this feed.

> method get_name() -> String ; qualifiers=const

Returns the camera's name.

> method get_position() -> FeedPosition ; qualifiers=const

Returns the position of camera on the device.

> method get_texture_tex_id(feed_image_type: CameraServer.FeedImage) -> int

Returns the texture backend ID (usable by some external libraries that need a handle to a texture to write data).

> method set_external(width: int, height: int) -> void

Sets the feed as external feed provided by another library.

> method set_format(index: int, parameters: Dictionary) -> bool

Sets the feed format parameters for the given `index` in the `formats` array. Returns `true` on success. By default, the YUYV encoded stream is transformed to `FEED_RGB`. The YUYV encoded stream output format can be changed by setting `parameters`'s `output` entry to one of the following:
- `"separate"` will result in `FEED_YCBCR_SEP`;
- `"grayscale"` will result in desaturated `FEED_RGB`;
- `"copy"` will result in `FEED_YCBCR`.

> method set_name(name: String) -> void

Sets the camera's name.

> method set_position(position: FeedPosition) -> void

Sets the position of this camera.

> method set_rgb_image(rgb_image: Image) -> void

Sets RGB image for this feed.

> method set_ycbcr_image(ycbcr_image: Image) -> void

Sets YCbCr image for this feed.

> method set_ycbcr_images(y_image: Image, cbcr_image: Image) -> void

Sets Y and CbCr images for this feed.

## Signals

> signal format_changed()

Emitted when the format has changed.

> signal frame_changed()

Emitted when a new frame is available.

## Enumerations

> enum FeedDataType

> enum_value FeedDataType.FEED_NOIMAGE = 0

No image set for the feed.

> enum_value FeedDataType.FEED_RGB = 1

Feed supplies RGB images.

> enum_value FeedDataType.FEED_YCBCR = 2

Feed supplies YCbCr images that need to be converted to RGB.

> enum_value FeedDataType.FEED_YCBCR_SEP = 3

Feed supplies separate Y and CbCr images that need to be combined and converted to RGB.

> enum_value FeedDataType.FEED_EXTERNAL = 4

Feed supplies external image.

> enum FeedPosition

> enum_value FeedPosition.FEED_UNSPECIFIED = 0

Unspecified position.

> enum_value FeedPosition.FEED_FRONT = 1

Camera is mounted at the front of the device.

> enum_value FeedPosition.FEED_BACK = 2

Camera is mounted at the back of the device.
