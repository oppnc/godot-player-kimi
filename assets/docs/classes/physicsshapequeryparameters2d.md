# PhysicsShapeQueryParameters2D

> class PhysicsShapeQueryParameters2D
> inherits PhysicsShapeQueryParameters2D RefCounted

## Brief

Provides parameters for `PhysicsDirectSpaceState2D`'s methods.

## Description

By changing various properties of this object, such as the shape, you can configure the parameters for `PhysicsDirectSpaceState2D`'s methods.

## Properties

> property collide_with_areas : bool ; default=false ; setter=set_collide_with_areas ; getter=is_collide_with_areas_enabled

If `true`, the query will take `Area2D`s into account.

> property collide_with_bodies : bool ; default=true ; setter=set_collide_with_bodies ; getter=is_collide_with_bodies_enabled

If `true`, the query will take `PhysicsBody2D`s into account.

> property collision_mask : int ; default=4294967295 ; setter=set_collision_mask ; getter=get_collision_mask

The physics layers the query will detect (as a bitmask). By default, all collision layers are detected. See [Collision layers and masks]($DOCS_URL/tutorials/physics/physics_introduction.html#collision-layers-and-masks) in the documentation for more information.

> property exclude : Array[RID] ; default=[] ; setter=set_exclude ; getter=get_exclude

The list of object `RID`s that will be excluded from collisions. Use `CollisionObject2D.get_rid` to get the `RID` associated with a `CollisionObject2D`-derived node.
**Note:** The returned array is copied and any changes to it will not update the original property value. To update the value you need to modify the returned array, and then assign it to the property again.

> property margin : float ; default=0.0 ; setter=set_margin ; getter=get_margin

The collision margin for the shape.

> property motion : Vector2 ; default=Vector2(0, 0) ; setter=set_motion ; getter=get_motion

The motion of the shape being queried for.

> property shape : Resource ; setter=set_shape ; getter=get_shape

The `Shape2D` that will be used for collision/intersection queries. This stores the actual reference which avoids the shape to be released while being used for queries, so always prefer using this over `shape_rid`.

> property shape_rid : RID ; default=RID() ; setter=set_shape_rid ; getter=get_shape_rid

The queried shape's `RID` that will be used for collision/intersection queries. Use this over `shape` if you want to optimize for performance using the Servers API:

```gdscript
            var shape_rid = PhysicsServer2D.circle_shape_create()
            var radius = 64
            PhysicsServer2D.shape_set_data(shape_rid, radius)

            var params = PhysicsShapeQueryParameters2D.new()
            params.shape_rid = shape_rid

            # Execute physics queries here...

            # Release the shape when done with physics queries.
            PhysicsServer2D.free_rid(shape_rid)

```

```csharp
            RID shapeRid = PhysicsServer2D.CircleShapeCreate();
            int radius = 64;
            PhysicsServer2D.ShapeSetData(shapeRid, radius);

            var params = new PhysicsShapeQueryParameters2D();
            params.ShapeRid = shapeRid;

            // Execute physics queries here...

            // Release the shape when done with physics queries.
            PhysicsServer2D.FreeRid(shapeRid);

```

> property transform : Transform2D ; default=Transform2D(1, 0, 0, 1, 0, 0) ; setter=set_transform ; getter=get_transform

The queried shape's transform matrix.
