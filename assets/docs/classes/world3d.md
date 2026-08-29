# World3D

> class World3D
> inherits World3D Resource

## Brief

A resource that holds all components of a 3D world, such as a visual scenario and a physics space.

## Description

Class that has everything pertaining to a world: A physics space, a visual scenario, and a sound space. 3D nodes register their resources into the current 3D world.

## Properties

> property camera_attributes : CameraAttributes ; setter=set_camera_attributes ; getter=get_camera_attributes

The default `CameraAttributes` resource to use if none set on the `Camera3D`.

> property direct_space_state : PhysicsDirectSpaceState3D ; getter=get_direct_space_state

Direct access to the world's physics 3D space state. Used for querying current and potential collisions. When using multi-threaded physics, access is limited to `Node._physics_process` in the main thread.

> property environment : Environment ; setter=set_environment ; getter=get_environment

The World3D's `Environment`.

> property fallback_environment : Environment ; setter=set_fallback_environment ; getter=get_fallback_environment

The World3D's fallback environment will be used if `environment` fails or is missing.

> property navigation_map : RID ; getter=get_navigation_map

The `RID` of this world's navigation map. Used by the `NavigationServer3D`.

> property scenario : RID ; getter=get_scenario

The World3D's visual scenario.

> property space : RID ; getter=get_space

The World3D's physics space.

## Tutorials
- [Ray-casting]($DOCS_URL/tutorials/physics/ray-casting.html)
