# World2D

> class World2D
> inherits World2D Resource

## Brief

A resource that holds all components of a 2D world, such as a canvas and a physics space.

## Description

Class that has everything pertaining to a 2D world: A physics space, a canvas, and a sound space. 2D nodes register their resources into the current 2D world.

## Properties

> property canvas : RID ; getter=get_canvas

The `RID` of this world's canvas resource. Used by the `RenderingServer` for 2D drawing.

> property direct_space_state : PhysicsDirectSpaceState2D ; getter=get_direct_space_state

Direct access to the world's physics 2D space state. Used for querying current and potential collisions. When using multi-threaded physics, access is limited to `Node._physics_process` in the main thread.

> property navigation_map : RID ; getter=get_navigation_map

The `RID` of this world's navigation map. Used by the `NavigationServer2D`.

> property space : RID ; getter=get_space

The `RID` of this world's physics space resource. Used by the `PhysicsServer2D` for 2D physics, treating it as both a space and an area.

## Tutorials
- [Ray-casting]($DOCS_URL/tutorials/physics/ray-casting.html)
