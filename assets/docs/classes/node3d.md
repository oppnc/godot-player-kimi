# Node3D

> class Node3D ; keywords=spatial
> inherits Node3D Node

## Brief

Base object in 3D space, inherited by all 3D nodes.

## Description

The `Node3D` node is the base representation of a node in 3D space. All other 3D nodes inherit from this class.
Affine operations (translation, rotation, scale) are calculated in the coordinate system relative to the parent, unless the `Node3D`'s `top_level` is `true`. In this coordinate system, affine operations correspond to direct affine operations on the `Node3D`'s `transform`. The term *parent space* refers to this coordinate system. The coordinate system that is attached to the `Node3D` itself is referred to as object-local coordinate system, or *local space*.
**Note:** Unless otherwise specified, all methods that need angle parameters must receive angles in *radians*. To convert degrees to radians, use `@GlobalScope.deg_to_rad`.
**Note:** In Godot 3 and older, `Node3D` was named *Spatial*.

## Properties

> property basis : Basis ; setter=set_basis ; getter=get_basis

Basis of the `transform` property. Represents the rotation, scale, and shear of this node in parent space (relative to the parent node).

> property global_basis : Basis ; setter=set_global_basis ; getter=get_global_basis

Basis of the `global_transform` property. Represents the rotation, scale, and shear of this node in global space (relative to the world).
**Note:** If the node is not inside the tree, getting this property fails and returns `Basis.IDENTITY`.

> property global_position : Vector3 ; setter=set_global_position ; getter=get_global_position

Global position (translation) of this node in global space (relative to the world). This is equivalent to the `global_transform`'s `Transform3D.origin`.
**Note:** If the node is not inside the tree, getting this property fails and returns `Vector3.ZERO`.

> property global_rotation : Vector3 ; setter=set_global_rotation ; getter=get_global_rotation

Global rotation of this node as [Euler angles](https://en.wikipedia.org/wiki/Euler_angles), in radians and in global space (relative to the world). This value is obtained from `global_basis`'s rotation.
- The `Vector3.x` is the angle around the global X axis (pitch);
- The `Vector3.y` is the angle around the global Y axis (yaw);
- The `Vector3.z` is the angle around the global Z axis (roll).
**Note:** Unlike `rotation`, this property always follows the YXZ convention (`EULER_ORDER_YXZ`).
**Note:** If the node is not inside the tree, getting this property fails and returns `Vector3.ZERO`.

> property global_rotation_degrees : Vector3 ; setter=set_global_rotation_degrees ; getter=get_global_rotation_degrees

The `global_rotation` of this node, in degrees instead of radians.
**Note:** If the node is not inside the tree, getting this property fails and returns `Vector3.ZERO`.

> property global_transform : Transform3D ; setter=set_global_transform ; getter=get_global_transform

The transformation of this node, in global space (relative to the world). Contains and represents this node's `global_position`, `global_rotation`, and global scale.
**Note:** If the node is not inside the tree, getting this property fails and returns `Transform3D.IDENTITY`.

> property position : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_position ; getter=get_position

Position (translation) of this node in parent space (relative to the parent node). This is equivalent to the `transform`'s `Transform3D.origin`.

> property quaternion : Quaternion ; setter=set_quaternion ; getter=get_quaternion

Rotation of this node represented as a `Quaternion` in parent space (relative to the parent node). This value is obtained from `basis`'s rotation.
**Note:** Quaternions are much more suitable for 3D math but are less intuitive. Setting this property can be useful for interpolation (see `Quaternion.slerp`).

> property rotation : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_rotation ; getter=get_rotation

Rotation of this node as [Euler angles](https://en.wikipedia.org/wiki/Euler_angles), in radians and in parent space (relative to the parent node). This value is obtained from `basis`'s rotation.
- The `Vector3.x` is the angle around the local X axis (pitch);
- The `Vector3.y` is the angle around the local Y axis (yaw);
- The `Vector3.z` is the angle around the local Z axis (roll).
The order of each consecutive rotation can be changed with `rotation_order` (see `EulerOrder` constants). In Godot, Euler angles always use intrinsic order. By default, the intrinsic YXZ convention is used (`EULER_ORDER_YXZ`).
**Note:** This property is edited in degrees in the inspector. If you want to use degrees in a script, use `rotation_degrees`.

> property rotation_degrees : Vector3 ; setter=set_rotation_degrees ; getter=get_rotation_degrees

The `rotation` of this node, in degrees instead of radians.
**Note:** This is **not** the property available in the Inspector dock.

> property rotation_edit_mode : RotationEditMode ; default=0 ; setter=set_rotation_edit_mode ; getter=get_rotation_edit_mode

How this node's rotation and scale are displayed in the Inspector dock.

> property rotation_order : EulerOrder ; default=2 ; setter=set_rotation_order ; getter=get_rotation_order

The axis rotation order of the `rotation` property. In Godot, Euler angles always use intrinsic order, meaning that the final orientation is calculated by rotating around the local axes in this order.

> property scale : Vector3 ; default=Vector3(1, 1, 1) ; setter=set_scale ; getter=get_scale

Scale of this node in local space (relative to this node). This value is obtained from `basis`'s scale.
**Note:** The behavior of some 3D node types is not affected by this property. These include `Light3D`, `Camera3D`, `AudioStreamPlayer3D`, and more.
**Warning:** The scale's components must either be all positive or all negative, and **not** exactly `0.0`. Otherwise, it won't be possible to obtain the scale from the `basis`. This may cause the intended scale to be lost when reloaded from disk, and potentially other unstable behavior.

> property top_level : bool ; default=false ; setter=set_as_top_level ; getter=is_set_as_top_level

If `true`, the node does not inherit its transformations from its parent. As such, node transformations will only be in global space, which also means that `global_transform` and `transform` will be identical.

> property transform : Transform3D ; default=Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0) ; setter=set_transform ; getter=get_transform

The local transformation of this node, in parent space (relative to the parent node). Contains and represents this node's `position`, `rotation`, and `scale`.

> property visibility_parent : NodePath ; default=NodePath("") ; setter=set_visibility_parent ; getter=get_visibility_parent

Path to the visibility range parent for this node and its descendants. The visibility parent must be a `GeometryInstance3D`.
Any visual instance will only be visible if the visibility parent (and all of its visibility ancestors) is hidden by being closer to the camera than its own `GeometryInstance3D.visibility_range_begin`. Nodes hidden via the `Node3D.visible` property are essentially removed from the visibility dependency tree, so dependent instances will not take the hidden node or its descendants into account.

> property visible : bool ; default=true ; setter=set_visible ; getter=is_visible

If `true`, this node can be visible. The node is only rendered when all of its ancestors are visible, as well. That means `is_visible_in_tree` must return `true`.

## Methods

> method add_gizmo(gizmo: Node3DGizmo) -> void

Attaches the given `gizmo` to this node. Only works in the editor.
**Note:** `gizmo` should be an `EditorNode3DGizmo`. The argument type is `Node3DGizmo` to avoid depending on editor classes in `Node3D`.

> method clear_gizmos() -> void

Clears all `EditorNode3DGizmo` objects attached to this node. Only works in the editor.

> method clear_subgizmo_selection() -> void

Deselects all subgizmos for this node. Useful to call when the selected subgizmo may no longer exist after a property change. Only works in the editor.

> method force_update_transform() -> void

Forces the node's `global_transform` to update, by sending `NOTIFICATION_TRANSFORM_CHANGED`. Fails if the node is not inside the tree.
**Note:** For performance reasons, transform changes are usually accumulated and applied *once* at the end of the frame. The update propagates through `Node3D` children, as well. Therefore, use this method only when you need an up-to-date transform (such as during physics operations).

> method get_gizmos() -> Array[Node3DGizmo] ; qualifiers=const

Returns all the `EditorNode3DGizmo` objects attached to this node. Only works in the editor.

> method get_global_transform_interpolated() -> Transform3D

When using physics interpolation, there will be circumstances in which you want to know the interpolated (displayed) transform of a node rather than the standard transform (which may only be accurate to the most recent physics tick).
This is particularly important for frame-based operations that take place in `Node._process`, rather than `Node._physics_process`. Examples include `Camera3D`s focusing on a node, or finding where to fire lasers from on a frame rather than physics tick.
**Note:** This function creates an interpolation pump on the `Node3D` the first time it is called, which can respond to physics interpolation resets. If you get problems with "streaking" when initially following a `Node3D`, be sure to call `get_global_transform_interpolated` at least once *before* resetting the `Node3D` physics interpolation.

> method get_parent_node_3d() -> Node3D ; qualifiers=const

Returns the parent `Node3D` that directly affects this node's `global_transform`. Returns `null` if no parent exists, the parent is not a `Node3D`, or `top_level` is `true`.
**Note:** This method is not always equivalent to `Node.get_parent`, which does not take `top_level` into account.

> method get_world_3d() -> World3D ; qualifiers=const

Returns the `World3D` this node is registered to.
Usually, this is the same as the world used by this node's viewport (see `Node.get_viewport` and `Viewport.find_world_3d`).

> method global_rotate(axis: Vector3, angle: float) -> void

Rotates this node's `global_basis` around the global `axis` by the given `angle`, in radians. This operation is calculated in global space (relative to the world) and preserves the `global_position`.

> method global_scale(scale: Vector3) -> void

Scales this node's `global_basis` by the given `scale` factor. This operation is calculated in global space (relative to the world) and preserves the `global_position`.
**Note:** This method is not to be confused with the `scale` property.

> method global_translate(offset: Vector3) -> void

Adds the given translation `offset` to the node's `global_position` in global space (relative to the world).

> method hide() -> void

Prevents this node from being rendered. Equivalent to setting `visible` to `false`. This is the opposite of `show`.

> method is_local_transform_notification_enabled() -> bool ; qualifiers=const

Returns `true` if the node receives `NOTIFICATION_LOCAL_TRANSFORM_CHANGED` whenever `transform` changes. This is enabled with `set_notify_local_transform`.

> method is_scale_disabled() -> bool ; qualifiers=const

Returns `true` if this node's `global_transform` is automatically orthonormalized. This results in this node not appearing distorted, as if its global scale were set to `Vector3.ONE` (or its negative counterpart). See also `set_disable_scale` and `orthonormalize`.
**Note:** `transform` is not affected by this setting.

> method is_transform_notification_enabled() -> bool ; qualifiers=const

Returns `true` if the node receives `NOTIFICATION_TRANSFORM_CHANGED` whenever `global_transform` changes. This is enabled with `set_notify_transform`.

> method is_visible_in_tree() -> bool ; qualifiers=const

Returns `true` if this node is inside the scene tree and the `visible` property is `true` for this node and all of its `Node3D` ancestors *in sequence*. An ancestor of any other type (such as `Node` or `Node2D`) breaks the sequence. See also `Node.get_parent`.
**Note:** This method cannot take `VisualInstance3D.layers` into account, so even if this method returns `true`, the node may not be rendered.

> method look_at(target: Vector3, up: Vector3 = Vector3(0, 1, 0), use_model_front: bool = false) -> void

Rotates the node so that the local forward axis (-Z, `Vector3.FORWARD`) points toward the `target` position. This operation is calculated in global space (relative to the world).
The local up axis (+Y) points as close to the `up` vector as possible while staying perpendicular to the local forward axis. The resulting transform is orthogonal, and the scale is preserved. Non-uniform scaling may not work correctly.
The `target` position cannot be the same as the node's position, the `up` vector cannot be `Vector3.ZERO`. Furthermore, the direction from the node's position to the `target` position cannot be parallel to the `up` vector, to avoid an unintended rotation around the local Z axis.
If `use_model_front` is `true`, the +Z axis (asset front) is treated as forward (implies +X is left) and points toward the `target` position. By default, the -Z axis (camera forward) is treated as forward (implies +X is right).
**Note:** This method fails if the node is not in the scene tree. If necessary, use `look_at_from_position` instead.

> method look_at_from_position(position: Vector3, target: Vector3, up: Vector3 = Vector3(0, 1, 0), use_model_front: bool = false) -> void

Moves the node to the specified `position`, then rotates the node to point toward the `target` position, similar to `look_at`. This operation is calculated in global space (relative to the world).

> method orthonormalize() -> void

Orthonormalizes this node's `basis`. This method sets this node's `scale` to `Vector3.ONE` (or its negative counterpart), but preserves the `position` and `rotation`. See also `Transform3D.orthonormalized`.

> method rotate(axis: Vector3, angle: float) -> void

Rotates this node's `basis` around the `axis` by the given `angle`, in radians. This operation is calculated in parent space (relative to the parent) and preserves the `position`.

> method rotate_object_local(axis: Vector3, angle: float) -> void

Rotates this node's `basis` around the `axis` by the given `angle`, in radians. This operation is calculated in local space (relative to this node) and preserves the `position`.

> method rotate_x(angle: float) -> void

Rotates this node's `basis` around the X axis by the given `angle`, in radians. This operation is calculated in parent space (relative to the parent) and preserves the `position`.

> method rotate_y(angle: float) -> void

Rotates this node's `basis` around the Y axis by the given `angle`, in radians. This operation is calculated in parent space (relative to the parent) and preserves the `position`.

> method rotate_z(angle: float) -> void

Rotates this node's `basis` around the Z axis by the given `angle`, in radians. This operation is calculated in parent space (relative to the parent) and preserves the `position`.

> method scale_object_local(scale: Vector3) -> void

Scales this node's `basis` by the given `scale` factor. This operation is calculated in local space (relative to this node) and preserves the `position`.

> method set_disable_scale(disable: bool) -> void

If `true`, this node's `global_transform` is automatically orthonormalized. This results in this node not appearing distorted, as if its global scale were set to `Vector3.ONE` (or its negative counterpart). See also `is_scale_disabled` and `orthonormalize`.
**Note:** `transform` is not affected by this setting.

> method set_identity() -> void

Sets this node's `transform` to `Transform3D.IDENTITY`, which resets all transformations in parent space (`position`, `rotation`, and `scale`).

> method set_ignore_transform_notification(enabled: bool) -> void

If `true`, the node will not receive `NOTIFICATION_TRANSFORM_CHANGED` or `NOTIFICATION_LOCAL_TRANSFORM_CHANGED`.
It may useful to call this method when handling these notifications to prevent infinite recursion.

> method set_notify_local_transform(enable: bool) -> void

If `true`, the node will receive `NOTIFICATION_LOCAL_TRANSFORM_CHANGED` whenever `transform` changes.
**Note:** Some 3D nodes such as `CSGShape3D` or `CollisionShape3D` automatically enable this to function correctly.

> method set_notify_transform(enable: bool) -> void

If `true`, the node will receive `NOTIFICATION_TRANSFORM_CHANGED` whenever `global_transform` changes.
**Note:** Most 3D nodes such as `VisualInstance3D` or `CollisionObject3D` automatically enable this to function correctly.
**Note:** In the editor, nodes will propagate this notification to their children if a gizmo is attached (see `add_gizmo`).

> method set_subgizmo_selection(gizmo: Node3DGizmo, id: int, transform: Transform3D) -> void

Selects the `gizmo`'s subgizmo with the given `id` and sets its transform. Only works in the editor.
**Note:** The gizmo object would typically be an instance of `EditorNode3DGizmo`, but the argument type is kept generic to avoid creating a dependency on editor classes in `Node3D`.

> method show() -> void

Allows this node to be rendered. Equivalent to setting `visible` to `true`. This is the opposite of `hide`.

> method to_global(local_point: Vector3) -> Vector3 ; qualifiers=const

Returns the `local_point` converted from this node's local space to global space. This is the opposite of `to_local`.

> method to_local(global_point: Vector3) -> Vector3 ; qualifiers=const

Returns the `global_point` converted from global space to this node's local space. This is the opposite of `to_global`.

> method translate(offset: Vector3) -> void

Adds the given translation `offset` to the node's position, in local space (relative to this node).
**Note:** Prefer using `translate_object_local`, instead, as this method may be changed in a future release.
**Note:** Despite the naming convention, this operation is **not** calculated in parent space for compatibility reasons. To translate in parent space, add `offset` to the `position` (`node_3d.position += offset`).

> method translate_object_local(offset: Vector3) -> void

Adds the given translation `offset` to the node's position, in local space (relative to this node).

> method update_gizmos() -> void

Updates all the `EditorNode3DGizmo` objects attached to this node. Only works in the editor.

## Signals

> signal visibility_changed()

Emitted when this node's visibility changes (see `visible` and `is_visible_in_tree`).
This signal is emitted *after* the related `NOTIFICATION_VISIBILITY_CHANGED` notification.

## Enumerations

> enum RotationEditMode

> enum_value RotationEditMode.ROTATION_EDIT_MODE_EULER = 0

The rotation is edited using a `Vector3` in [Euler angles](https://en.wikipedia.org/wiki/Euler_angles). In Godot, Euler angles always use intrinsic order, meaning that rotation happens around the local axes of the object.

> enum_value RotationEditMode.ROTATION_EDIT_MODE_QUATERNION = 1

The rotation is edited using a `Quaternion`. Quaternions avoid [gimbal lock]($DOCS_URL/tutorials/3d/using_transforms.html) and having to choose an order of rotation, but are less intuitive. Quaternion rotation is mostly the same as rotors in 3D geometric algebra, except that the numbers are labeled differently.

> enum_value RotationEditMode.ROTATION_EDIT_MODE_BASIS = 2

The rotation is edited using a `Basis`. In this mode, the raw `basis`'s axes can be freely modified, but the `scale` property is not available.

## Constants

> constant NOTIFICATION_TRANSFORM_CHANGED = 2000

Notification received when this node's `global_transform` changes, if `is_transform_notification_enabled` is `true`. See also `set_notify_transform`.
**Note:** Most 3D nodes such as `VisualInstance3D` or `CollisionObject3D` automatically enable this to function correctly.
**Note:** In the editor, nodes will propagate this notification to their children if a gizmo is attached (see `add_gizmo`).

> constant NOTIFICATION_ENTER_WORLD = 41

Notification received when this node is registered to a new `World3D` (see `get_world_3d`).

> constant NOTIFICATION_EXIT_WORLD = 42

Notification received when this node is unregistered from the current `World3D` (see `get_world_3d`).
This notification is sent in reversed order.

> constant NOTIFICATION_VISIBILITY_CHANGED = 43

Notification received when this node's visibility changes (see `visible` and `is_visible_in_tree`).
This notification is received *before* the related `visibility_changed` signal.

> constant NOTIFICATION_LOCAL_TRANSFORM_CHANGED = 44

Notification received when this node's `transform` changes, if `is_local_transform_notification_enabled` is `true`. This is not received when a parent `Node3D`'s `transform` changes. See also `set_notify_local_transform`.
**Note:** Some 3D nodes such as `CSGShape3D` or `CollisionShape3D` automatically enable this to function correctly.

## Tutorials
- [Introduction to 3D]($DOCS_URL/tutorials/3d/introduction_to_3d.html)
- [All 3D Demos](https://github.com/godotengine/godot-demo-projects/tree/master/3d)
