# ExternalTexture

> class ExternalTexture
> inherits ExternalTexture Texture2D

## Brief

Texture which displays the content of an external buffer.

## Description

Displays the content of an external buffer provided by the platform.
Requires the [OES_EGL_image_external](https://registry.khronos.org/OpenGL/extensions/OES/OES_EGL_image_external.txt) extension (OpenGL) or [VK_ANDROID_external_memory_android_hardware_buffer](https://registry.khronos.org/vulkan/specs/1.1-extensions/html/vkspec.html#VK_ANDROID_external_memory_android_hardware_buffer) extension (Vulkan).
**Note:** This is currently only supported in Android builds.

## Properties

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

> property size : Vector2 ; default=Vector2(256, 256) ; setter=set_size ; getter=get_size

External texture size.

## Methods

> method get_external_texture_id() -> int ; qualifiers=const

Returns the external texture ID.
Depending on your use case, you may need to pass this to platform APIs, for example, when creating an `android.graphics.SurfaceTexture` on Android.

> method set_external_buffer_id(external_buffer_id: int) -> void

Sets the external buffer ID.
Depending on your use case, you may need to call this with data received from a platform API, for example, `SurfaceTexture.getHardwareBuffer()` on Android.
