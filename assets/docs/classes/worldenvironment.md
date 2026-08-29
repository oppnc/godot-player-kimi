# WorldEnvironment

> class WorldEnvironment ; keywords=background, sky
> inherits WorldEnvironment Node

## Brief

Default environment properties for the entire scene (post-processing effects, lighting and background settings).

## Description

The `WorldEnvironment` node is used to configure the default `Environment` for the scene.
The parameters defined in the `WorldEnvironment` can be overridden by an `Environment` node set on the current `Camera3D`. Additionally, only one `WorldEnvironment` may be instantiated in a given scene at a time.
The `WorldEnvironment` allows the user to specify default lighting parameters (e.g. ambient lighting), various post-processing effects (e.g. SSAO, DOF, Tonemapping), and how to draw the background (e.g. solid color, skybox). Usually, these are added in order to improve the realism/color balance of the scene.

## Properties

> property camera_attributes : CameraAttributes ; setter=set_camera_attributes ; getter=get_camera_attributes

The default `CameraAttributes` resource to use if none set on the `Camera3D`.

> property compositor : Compositor ; setter=set_compositor ; getter=get_compositor

The default `Compositor` resource to use if none set on the `Camera3D`.

> property environment : Environment ; setter=set_environment ; getter=get_environment

The `Environment` resource used by this `WorldEnvironment`, defining the default properties.

## Tutorials
- [Environment and post-processing]($DOCS_URL/tutorials/3d/environment_and_post_processing.html)
- [3D Material Testers Demo](https://godotengine.org/asset-library/asset/2742)
- [Third Person Shooter (TPS) Demo](https://godotengine.org/asset-library/asset/2710)
