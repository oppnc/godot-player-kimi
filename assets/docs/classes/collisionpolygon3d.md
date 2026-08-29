# CollisionPolygon3D

> class CollisionPolygon3D
> inherits CollisionPolygon3D Node3D

## Brief

A node that provides a thickened polygon shape (a prism) to a `CollisionObject3D` parent.

## Description

A node that provides a thickened polygon shape (a prism) to a `CollisionObject3D` parent and allows it to be edited. The polygon can be concave or convex. This can give a detection shape to an `Area3D` or turn a `PhysicsBody3D` into a solid object.
**Warning:** A non-uniformly scaled `CollisionShape3D` will likely not behave as expected. Make sure to keep its scale the same on all axes and adjust its shape resource instead.

## Properties

> property debug_color : Color ; default=Color(0, 0, 0, 0) ; setter=set_debug_color ; getter=get_debug_color

The collision shape color that is displayed in the editor, or in the running project if **Debug > Visible Collision Shapes** is checked at the top of the editor.
**Note:** The default value is `ProjectSettings.debug/shapes/collision/shape_color`. The `Color(0, 0, 0, 0)` value documented here is a placeholder, and not the actual default debug color.

> property debug_fill : bool ; default=true ; setter=set_enable_debug_fill ; getter=get_enable_debug_fill

If `true`, when the shape is displayed, it will show a solid fill color in addition to its wireframe.

> property depth : float ; default=1.0 ; setter=set_depth ; getter=get_depth

Length that the resulting collision extends in either direction perpendicular to its 2D polygon.

> property disabled : bool ; default=false ; setter=set_disabled ; getter=is_disabled

If `true`, no collision will be produced. This property should be changed with `Object.set_deferred`.

> property margin : float ; default=0.04 ; setter=set_margin ; getter=get_margin

The collision margin for the generated `Shape3D`. See `Shape3D.margin` for more details.

> property polygon : PackedVector2Array ; default=PackedVector2Array() ; setter=set_polygon ; getter=get_polygon

Array of vertices which define the 2D polygon in the local XY plane.
