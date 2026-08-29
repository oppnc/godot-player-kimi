# CollisionPolygon2D

> class CollisionPolygon2D
> inherits CollisionPolygon2D Node2D

## Brief

A node that provides a polygon shape to a `CollisionObject2D` parent.

## Description

A node that provides a polygon shape to a `CollisionObject2D` parent and allows it to be edited. The polygon can be concave or convex. This can give a detection shape to an `Area2D`, turn a `PhysicsBody2D` into a solid object, or give a hollow shape to a `StaticBody2D`.
**Warning:** A non-uniformly scaled `CollisionPolygon2D` will likely not behave as expected. Make sure to keep its scale the same on all axes and adjust its polygon instead.

## Properties

> property build_mode : BuildMode ; default=0 ; setter=set_build_mode ; getter=get_build_mode

Collision build mode.

> property disabled : bool ; default=false ; setter=set_disabled ; getter=is_disabled

If `true`, no collisions will be detected. This property should be changed with `Object.set_deferred`.

> property one_way_collision : bool ; default=false ; setter=set_one_way_collision ; getter=is_one_way_collision_enabled

If `true`, only edges that face up, relative to `CollisionPolygon2D`'s rotation, will collide with other objects.
**Note:** This property has no effect if this `CollisionPolygon2D` is a child of an `Area2D` node.
**Note:** The one way collision direction can be configured by setting `one_way_collision_direction`.

> property one_way_collision_direction : Vector2 ; default=Vector2(0, 1) ; setter=set_one_way_collision_direction ; getter=get_one_way_collision_direction

The direction used for one-way collision.

> property one_way_collision_margin : float ; default=1.0 ; setter=set_one_way_collision_margin ; getter=get_one_way_collision_margin

The margin used for one-way collision (in pixels). Higher values will make the shape thicker, and work better for colliders that enter the polygon at a high velocity.

> property polygon : PackedVector2Array ; default=PackedVector2Array() ; setter=set_polygon ; getter=get_polygon

The polygon's list of vertices. Each point will be connected to the next, and the final point will be connected to the first.
**Note:** The returned vertices are in the local coordinate space of the given `CollisionPolygon2D`.

## Enumerations

> enum BuildMode

> enum_value BuildMode.BUILD_SOLIDS = 0

Collisions will include the polygon and its contained area. In this mode the node has the same effect as several `ConvexPolygonShape2D` nodes, one for each convex shape in the convex decomposition of the polygon (but without the overhead of multiple nodes).

> enum_value BuildMode.BUILD_SEGMENTS = 1

Collisions will only include the polygon edges. In this mode the node has the same effect as a single `ConcavePolygonShape2D` made of segments, with the restriction that each segment (after the first one) starts where the previous one ends, and the last one ends where the first one starts (forming a closed but hollow polygon).
