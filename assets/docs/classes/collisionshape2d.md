# CollisionShape2D

> class CollisionShape2D
> inherits CollisionShape2D Node2D

## Brief

A node that provides a `Shape2D` to a `CollisionObject2D` parent.

## Description

A node that provides a `Shape2D` to a `CollisionObject2D` parent and allows it to be edited. This can give a detection shape to an `Area2D` or turn a `PhysicsBody2D` into a solid object.

## Properties

> property debug_color : Color ; default=Color(0, 0, 0, 0) ; setter=set_debug_color ; getter=get_debug_color

The collision shape color that is displayed in the editor, or in the running project if **Debug > Visible Collision Shapes** is checked at the top of the editor.
**Note:** The default value is `ProjectSettings.debug/shapes/collision/shape_color`. The `Color(0, 0, 0, 0)` value documented here is a placeholder, and not the actual default debug color.

> property disabled : bool ; default=false ; setter=set_disabled ; getter=is_disabled

A disabled collision shape has no effect in the world. This property should be changed with `Object.set_deferred`.

> property one_way_collision : bool ; default=false ; setter=set_one_way_collision ; getter=is_one_way_collision_enabled

Sets whether this collision shape should only detect collision on one side (top or bottom).
**Note:** This property has no effect if this `CollisionShape2D` is a child of an `Area2D` node.
**Note:** The one way collision direction can be configured by setting `one_way_collision_direction`.

> property one_way_collision_direction : Vector2 ; default=Vector2(0, 1) ; setter=set_one_way_collision_direction ; getter=get_one_way_collision_direction

The direction used for one-way collision.

> property one_way_collision_margin : float ; default=1.0 ; setter=set_one_way_collision_margin ; getter=get_one_way_collision_margin

The margin used for one-way collision (in pixels). Higher values will make the shape thicker, and work better for colliders that enter the shape at a high velocity.

> property shape : Shape2D ; setter=set_shape ; getter=get_shape

The actual shape owned by this collision shape.

## Tutorials
- [Physics introduction]($DOCS_URL/tutorials/physics/physics_introduction.html)
- [2D Dodge The Creeps Demo](https://godotengine.org/asset-library/asset/2712)
- [2D Pong Demo](https://godotengine.org/asset-library/asset/2728)
- [2D Kinematic Character Demo](https://godotengine.org/asset-library/asset/2719)
