# EditorResourcePreview

> class EditorResourcePreview
> inherits EditorResourcePreview Node

## Brief

A node used to generate previews of resources or files.

## Description

This node is used to generate previews for resources or files.
**Note:** This class shouldn't be instantiated directly. Instead, access the singleton using `EditorInterface.get_resource_previewer`.

## Methods

> method add_preview_generator(generator: EditorResourcePreviewGenerator) -> void

Create an own, custom preview generator.

> method check_for_invalidation(path: String) -> void

Check if the resource changed, if so, it will be invalidated and the corresponding signal emitted.

> method queue_edited_resource_preview(resource: Resource, receiver: Object, receiver_func: StringName, userdata: Variant) -> void

Queue the `resource` being edited for preview. Once the preview is ready, the `receiver`'s `receiver_func` will be called. The `receiver_func` must take the following four arguments: `String` path, `Texture2D` preview, `Texture2D` thumbnail_preview, `Variant` userdata. `userdata` can be anything, and will be returned when `receiver_func` is called.
**Note:** If it was not possible to create the preview the `receiver_func` will still be called, but the preview will be `null`.

> method queue_resource_preview(path: String, receiver: Object, receiver_func: StringName, userdata: Variant) -> void

Queue a resource file located at `path` for preview. Once the preview is ready, the `receiver`'s `receiver_func` will be called. The `receiver_func` must take the following four arguments: `String` path, `Texture2D` preview, `Texture2D` thumbnail_preview, `Variant` userdata. `userdata` can be anything, and will be returned when `receiver_func` is called.
**Note:** If it was not possible to create the preview the `receiver_func` will still be called, but the preview will be `null`.

> method remove_preview_generator(generator: EditorResourcePreviewGenerator) -> void

Removes a custom preview generator.

## Signals

> signal preview_invalidated(path: String)

Emitted if a preview was invalidated (changed). `path` corresponds to the path of the preview.
