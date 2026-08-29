# CollisionShape3D

> class CollisionShape3D
> inherits CollisionShape3D Node3D

## Brief

A node that provides a `Shape3D` to a `CollisionObject3D` parent.

## Description

A node that provides a `Shape3D` to a `CollisionObject3D` parent and allows it to be edited. This can give a detection shape to an `Area3D` or turn a `PhysicsBody3D` into a solid object.
**Warning:** A non-uniformly scaled `CollisionShape3D` will likely not behave as expected. Make sure to keep its scale the same on all axes and adjust its `shape` resource instead.

## Properties

> property debug_color : Color ; default=Color(0, 0, 0, 0) ; setter=set_debug_color ; getter=get_debug_color

The collision shape color that is displayed in the editor, or in the running project if **Debug > Visible Collision Shapes** is checked at the top of the editor.
**Note:** The default value is `ProjectSettings.debug/shapes/collision/shape_color`. The `Color(0, 0, 0, 0)` value documented here is a placeholder, and not the actual default debug color.

> property debug_fill : bool ; default=true ; setter=set_enable_debug_fill ; getter=get_enable_debug_fill

If `true`, when the shape is displayed, it will show a solid fill color in addition to its wireframe.

> property disabled : bool ; default=false ; setter=set_disabled ; getter=is_disabled

A disabled collision shape has no effect in the world. This property should be changed with `Object.set_deferred`.

> property shape : Shape3D ; setter=set_shape ; getter=get_shape

The actual shape owned by this collision shape.

## Methods

> method make_convex_from_siblings() -> void

Sets the collision shape's shape to the addition of all its convexed `MeshInstance3D` siblings geometry.

> method resource_changed(resource: Resource) -> void ; deprecated=Use `Resource.changed` instead.

This method does nothing.

## Tutorials
- [Physics introduction]($DOCS_URL/tutorials/physics/physics_introduction.html)
- [3D Kinematic Character Demo](https://godotengine.org/asset-library/asset/2739)
- [3D Platformer Demo](https://godotengine.org/asset-library/asset/2748)
- [Third Person Shooter (TPS) Demo](https://godotengine.org/asset-library/asset/2710)
