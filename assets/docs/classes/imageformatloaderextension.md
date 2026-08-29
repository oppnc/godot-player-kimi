# ImageFormatLoaderExtension

> class ImageFormatLoaderExtension
> inherits ImageFormatLoaderExtension ImageFormatLoader

## Brief

Base class for creating `ImageFormatLoader` extensions (adding support for extra image formats).

## Description

The engine supports multiple image formats out of the box (PNG, SVG, JPEG, WebP to name a few), but you can choose to implement support for additional image formats by extending this class.
Be sure to respect the documented return types and values. You should create an instance of it, and call `add_format_loader` to register that loader during the initialization phase.

## Methods

> method _get_recognized_extensions() -> PackedStringArray ; qualifiers=virtual const

Returns the list of file extensions for this image format. Files with the given extensions will be treated as image file and loaded using this class.

> method _load_image(image: Image, fileaccess: FileAccess, flags: BitField[ImageFormatLoader.LoaderFlags], scale: float) -> Error ; qualifiers=virtual

Loads the content of `fileaccess` into the provided `image`.

> method add_format_loader() -> void

Add this format loader to the engine, allowing it to recognize the file extensions returned by `_get_recognized_extensions`.

> method remove_format_loader() -> void

Remove this format loader from the engine.
