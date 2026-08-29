# Area3D

> class Area3D ; keywords=trigger
> inherits Area3D CollisionObject3D

## Brief

A region of 3D space that detects other `CollisionObject3D`s entering or exiting it.

## Description

`Area3D` is a region of 3D space defined by one or multiple `CollisionShape3D` or `CollisionPolygon3D` child nodes. It detects when other `CollisionObject3D`s enter or exit it, and it also keeps track of which collision objects haven't exited it yet (i.e. which one are overlapping it).
This node can also locally alter or override physics parameters (gravity, damping) and route audio to custom audio buses.
**Note:** Areas and bodies created with `PhysicsServer3D` might not interact as expected with `Area3D`s, and might not emit signals or track objects correctly.
**Warning:** Using a `ConcavePolygonShape3D` inside a `CollisionShape3D` child of this node (created e.g. by using the **Create Trimesh Collision Sibling** option in the **Mesh** menu that appears when selecting a `MeshInstance3D` node) may give unexpected results, since this collision shape is hollow. If this is not desired, it has to be split into multiple `ConvexPolygonShape3D`s or primitive shapes like `BoxShape3D`, or in some cases it may be replaceable by a `CollisionPolygon3D`.

## Properties

> property angular_damp : float ; default=0.1 ; setter=set_angular_damp ; getter=get_angular_damp

The rate at which objects stop spinning in this area. Represents the angular velocity lost per second.
See `ProjectSettings.physics/3d/default_angular_damp` for more details about damping.

> property angular_damp_space_override : SpaceOverride ; default=0 ; setter=set_angular_damp_space_override_mode ; getter=get_angular_damp_space_override_mode

Override mode for angular damping calculations within this area.

> property audio_bus_name : StringName ; default=&"Master" ; setter=set_audio_bus_name ; getter=get_audio_bus_name

The name of the area's audio bus.

> property audio_bus_override : bool ; default=false ; setter=set_audio_bus_override ; getter=is_overriding_audio_bus

If `true`, the area's audio bus overrides the default audio bus.

> property gravity : float ; default=9.8 ; setter=set_gravity ; getter=get_gravity

The area's gravity intensity (in meters per second squared). This value multiplies the gravity direction. This is useful to alter the force of gravity without altering its direction.

> property gravity_direction : Vector3 ; default=Vector3(0, -1, 0) ; setter=set_gravity_direction ; getter=get_gravity_direction

The area's gravity vector (not normalized).

> property gravity_point : bool ; default=false ; setter=set_gravity_is_point ; getter=is_gravity_a_point

If `true`, gravity is calculated from a point (set via `gravity_point_center`). See also `gravity_space_override`.

> property gravity_point_center : Vector3 ; default=Vector3(0, -1, 0) ; setter=set_gravity_point_center ; getter=get_gravity_point_center

If gravity is a point (see `gravity_point`), this will be the point of attraction.

> property gravity_point_unit_distance : float ; default=0.0 ; setter=set_gravity_point_unit_distance ; getter=get_gravity_point_unit_distance

The distance at which the gravity strength is equal to `gravity`. For example, on a planet 100 meters in radius with a surface gravity of 4.0 m/s², set the `gravity` to 4.0 and the unit distance to 100.0. The gravity will have falloff according to the inverse square law, so in the example, at 200 meters from the center the gravity will be 1.0 m/s² (twice the distance, 1/4th the gravity), at 50 meters it will be 16.0 m/s² (half the distance, 4x the gravity), and so on.
The above is true only when the unit distance is a positive number. When this is set to 0.0, the gravity will be constant regardless of distance.

> property gravity_space_override : SpaceOverride ; default=0 ; setter=set_gravity_space_override_mode ; getter=get_gravity_space_override_mode

Override mode for gravity calculations within this area.

> property linear_damp : float ; default=0.1 ; setter=set_linear_damp ; getter=get_linear_damp

The rate at which objects stop moving in this area. Represents the linear velocity lost per second.
See `ProjectSettings.physics/3d/default_linear_damp` for more details about damping.

> property linear_damp_space_override : SpaceOverride ; default=0 ; setter=set_linear_damp_space_override_mode ; getter=get_linear_damp_space_override_mode

Override mode for linear damping calculations within this area.

> property monitorable : bool ; default=true ; setter=set_monitorable ; getter=is_monitorable

If `true`, other monitoring areas can detect this area.

> property monitoring : bool ; default=true ; setter=set_monitoring ; getter=is_monitoring

If `true`, the area detects bodies or areas entering and exiting it.

> property priority : int ; default=0 ; setter=set_priority ; getter=get_priority

The area's priority. Higher priority areas are processed first. The `World3D`'s physics is always processed last, after all areas.

> property reverb_bus_amount : float ; default=0.0 ; setter=set_reverb_amount ; getter=get_reverb_amount

The degree to which this area applies reverb to its associated audio. Ranges from `0` to `1` with `0.1` precision.

> property reverb_bus_enabled : bool ; default=false ; setter=set_use_reverb_bus ; getter=is_using_reverb_bus

If `true`, the area applies reverb to its associated audio.

> property reverb_bus_name : StringName ; default=&"Master" ; setter=set_reverb_bus_name ; getter=get_reverb_bus_name

The name of the reverb bus to use for this area's associated audio.

> property reverb_bus_uniformity : float ; default=0.0 ; setter=set_reverb_uniformity ; getter=get_reverb_uniformity

The degree to which this area's reverb is a uniform effect. Ranges from `0` to `1` with `0.1` precision.

> property wind_attenuation_factor : float ; default=0.0 ; setter=set_wind_attenuation_factor ; getter=get_wind_attenuation_factor

The exponential rate at which wind force decreases with distance from its origin.
**Note:** This wind force only applies to `SoftBody3D` nodes. Other physics bodies are currently not affected by wind.

> property wind_force_magnitude : float ; default=0.0 ; setter=set_wind_force_magnitude ; getter=get_wind_force_magnitude

The magnitude of area-specific wind force.
**Note:** This wind force only applies to `SoftBody3D` nodes. Other physics bodies are currently not affected by wind.

> property wind_source_path : NodePath ; default=NodePath("") ; setter=set_wind_source_path ; getter=get_wind_source_path

The `Node3D` which is used to specify the direction and origin of an area-specific wind force. The direction is opposite to the z-axis of the `Node3D`'s local transform, and its origin is the origin of the `Node3D`'s local transform.
**Note:** This wind force only applies to `SoftBody3D` nodes. Other physics bodies are currently not affected by wind.

## Methods

> method get_overlapping_areas() -> Array[Area3D] ; qualifiers=const

Returns a list of intersecting `Area3D`s. The overlapping area's `CollisionObject3D.collision_layer` must be part of this area's `CollisionObject3D.collision_mask` in order to be detected.
For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.

> method get_overlapping_bodies() -> Array[Node3D] ; qualifiers=const

Returns a list of intersecting `PhysicsBody3D`s, `SoftBody3D`s, and `GridMap`s. The overlapping body's `CollisionObject3D.collision_layer` must be part of this area's `CollisionObject3D.collision_mask` in order to be detected.
For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
**Note:** Godot Physics does not support reporting overlaps with `SoftBody3D`, so will not return any such bodies.

> method has_overlapping_areas() -> bool ; qualifiers=const

Returns `true` if intersecting any `Area3D`s, otherwise returns `false`. The overlapping area's `CollisionObject3D.collision_layer` must be part of this area's `CollisionObject3D.collision_mask` in order to be detected.
For performance reasons (collisions are all processed at the same time) the list of overlapping areas is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.

> method has_overlapping_bodies() -> bool ; qualifiers=const

Returns `true` if intersecting any `PhysicsBody3D`s, `SoftBody3D`s, or `GridMap`s, otherwise returns `false`. The overlapping body's `CollisionObject3D.collision_layer` must be part of this area's `CollisionObject3D.collision_mask` in order to be detected.
For performance reasons (collisions are all processed at the same time) the list of overlapping bodies is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
**Note:** Godot Physics does not support reporting overlaps with `SoftBody3D`, so will not consider such bodies.

> method overlaps_area(area: Node) -> bool ; qualifiers=const

Returns `true` if the given `Area3D` intersects or overlaps this `Area3D`, `false` otherwise.
**Note:** The result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.

> method overlaps_body(body: Node) -> bool ; qualifiers=const

Returns `true` if the given physics body intersects or overlaps this `Area3D`, `false` otherwise.
`body` argument can either be a `PhysicsBody3D`, `SoftBody3D`, or a `GridMap` instance. While GridMaps are not physics body themselves, they register their tiles with collision shapes as a virtual physics body.
**Note:** The result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
**Note:** Godot Physics does not support reporting overlaps with `SoftBody3D`, so will return `false` in such cases.

## Signals

> signal area_entered(area: Area3D)

Emitted when the received `area` enters this area. Requires `monitoring` to be set to `true`.

> signal area_exited(area: Area3D)

Emitted when the received `area` exits this area. Requires `monitoring` to be set to `true`.

> signal area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int)

Emitted when a `Shape3D` of the received `area` enters a shape of this area. Requires `monitoring` to be set to `true`.
`local_shape_index` and `area_shape_index` contain indices of the interacting shapes from this area and the other area, respectively. `area_rid` contains the `RID` of the other area. These values can be used with the `PhysicsServer3D`.
**Example:** Get the `CollisionShape3D` node from the shape index:

```gdscript
                var other_shape_owner = area.shape_find_owner(area_shape_index)
                var other_shape_node = area.shape_owner_get_owner(other_shape_owner)

                var local_shape_owner = shape_find_owner(local_shape_index)
                var local_shape_node = shape_owner_get_owner(local_shape_owner)

```

> signal area_shape_exited(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int)

Emitted when a `Shape3D` of the received `area` exits a shape of this area. Requires `monitoring` to be set to `true`.
See also `area_shape_entered`.

> signal body_entered(body: Node3D)

Emitted when the received `body` enters this area. `body` can be a `PhysicsBody3D`, `SoftBody3D` or `GridMap`. `GridMap`s are detected if their `MeshLibrary` has collision shapes configured. Requires `monitoring` to be set to `true`.
**Note:** Godot Physics does not support reporting overlaps with `SoftBody3D`, so will not emit this signal in such cases.

> signal body_exited(body: Node3D)

Emitted when the received `body` exits this area. `body` can be a `PhysicsBody3D`, `SoftBody3D` or `GridMap`. `GridMap`s are detected if their `MeshLibrary` has collision shapes configured. Requires `monitoring` to be set to `true`.
**Note:** Godot Physics does not support reporting overlaps with `SoftBody3D`, so will not emit this signal in such cases.

> signal body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int)

Emitted when a `Shape3D` of the received `body` enters a shape of this area. `body` can be a `PhysicsBody3D`, `SoftBody3D` or `GridMap`. `GridMap`s are detected if their `MeshLibrary` has collision shapes configured. Requires `monitoring` to be set to `true`.
`local_shape_index` and `body_shape_index` contain indices of the interacting shapes from this area and the interacting body, respectively. `body_rid` contains the `RID` of the body. These values can be used with the `PhysicsServer3D`.
**Note:** Godot Physics does not support reporting overlaps with `SoftBody3D`, so will not emit this signal in such cases.
**Example:** Get the `CollisionShape3D` node from the shape index:

```gdscript
                var body_shape_owner = body.shape_find_owner(body_shape_index)
                var body_shape_node = body.shape_owner_get_owner(body_shape_owner)

                var local_shape_owner = shape_find_owner(local_shape_index)
                var local_shape_node = shape_owner_get_owner(local_shape_owner)

```

> signal body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int)

Emitted when a `Shape3D` of the received `body` exits a shape of this area. `body` can be a `PhysicsBody3D`, `SoftBody3D` or `GridMap`. `GridMap`s are detected if their `MeshLibrary` has collision shapes configured. Requires `monitoring` to be set to `true`.
See also `body_shape_entered`.
**Note:** Godot Physics does not support reporting overlaps with `SoftBody3D`, so will not emit this signal in such cases.

## Enumerations

> enum SpaceOverride

> enum_value SpaceOverride.SPACE_OVERRIDE_DISABLED = 0

This area does not affect gravity/damping.

> enum_value SpaceOverride.SPACE_OVERRIDE_COMBINE = 1

This area adds its gravity/damping values to whatever has been calculated so far (in `priority` order).

> enum_value SpaceOverride.SPACE_OVERRIDE_COMBINE_REPLACE = 2

This area adds its gravity/damping values to whatever has been calculated so far (in `priority` order), ignoring any lower priority areas.

> enum_value SpaceOverride.SPACE_OVERRIDE_REPLACE = 3

This area replaces any gravity/damping, even the defaults, ignoring any lower priority areas.

> enum_value SpaceOverride.SPACE_OVERRIDE_REPLACE_COMBINE = 4

This area replaces any gravity/damping calculated so far (in `priority` order), but keeps calculating the rest of the areas.

## Tutorials
- [Using Area2D]($DOCS_URL/tutorials/physics/using_area_2d.html)
- [3D Platformer Demo](https://godotengine.org/asset-library/asset/2748)
- [GUI in 3D Viewport Demo](https://godotengine.org/asset-library/asset/2807)
