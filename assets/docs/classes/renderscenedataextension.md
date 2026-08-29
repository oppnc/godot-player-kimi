# RenderSceneDataExtension

> class RenderSceneDataExtension
> inherits RenderSceneDataExtension RenderSceneData

## Brief

This class allows for a RenderSceneData implementation to be made in GDExtension.

## Description

This class allows for a RenderSceneData implementation to be made in GDExtension.

## Methods

> method _get_cam_projection() -> Projection ; qualifiers=virtual const

Implement this in GDExtension to return the camera `Projection`.

> method _get_cam_transform() -> Transform3D ; qualifiers=virtual const

Implement this in GDExtension to return the camera `Transform3D`.

> method _get_uniform_buffer() -> RID ; qualifiers=virtual const

Implement this in GDExtension to return the `RID` of the uniform buffer containing the scene data as a UBO.

> method _get_view_count() -> int ; qualifiers=virtual const

Implement this in GDExtension to return the view count.

> method _get_view_eye_offset(view: int) -> Vector3 ; qualifiers=virtual const

Implement this in GDExtension to return the eye offset for the given `view`.

> method _get_view_projection(view: int) -> Projection ; qualifiers=virtual const

Implement this in GDExtension to return the view `Projection` for the given `view`.
