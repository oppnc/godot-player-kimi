# Skeleton3D

> class Skeleton3D
> inherits Skeleton3D Node3D

## Brief

A node containing a bone hierarchy, used to create a 3D skeletal animation.

## Description

`Skeleton3D` provides an interface for managing a hierarchy of bones, including pose, rest and animation (see `Animation`). It can also use ragdoll physics.
The overall transform of a bone with respect to the skeleton is determined by bone pose. Bone rest defines the initial transform of the bone pose.
Note that "global pose" below refers to the overall transform of the bone with respect to skeleton, so it is not the actual global/world transform of the bone.

## Properties

> property animate_physical_bones : bool ; default=true ; setter=set_animate_physical_bones ; getter=get_animate_physical_bones ; deprecated=This property is deprecated.

If you follow the recommended workflow and explicitly have `PhysicalBoneSimulator3D` as a child of `Skeleton3D`, you can control whether it is affected by raycasting without running `physical_bones_start_simulation`, by its `SkeletonModifier3D.active`.
However, for old (deprecated) configurations, `Skeleton3D` has an internal virtual `PhysicalBoneSimulator3D` for compatibility. This property controls the internal virtual `PhysicalBoneSimulator3D`'s `SkeletonModifier3D.active`.

> property modifier_callback_mode_process : ModifierCallbackModeProcess ; default=1 ; setter=set_modifier_callback_mode_process ; getter=get_modifier_callback_mode_process

Sets the processing timing for the Modifier.

> property motion_scale : float ; default=1.0 ; setter=set_motion_scale ; getter=get_motion_scale

Multiplies the 3D position track animation.
**Note:** Unless this value is `1.0`, the key value in animation will not match the actual position value.

> property show_rest_only : bool ; default=false ; setter=set_show_rest_only ; getter=is_show_rest_only

If `true`, forces the bones in their default rest pose, regardless of their values. In the editor, this also prevents the bones from being edited.

## Methods

> method add_bone(name: String) -> int

Adds a new bone with the given name. Returns the new bone's index, or `-1` if this method fails.
**Note:** Bone names should be unique, non empty, and cannot include the `:` and `/` characters.

> method advance(delta: float) -> void

Manually advance the child `SkeletonModifier3D`s by the specified time (in seconds).
**Note:** The `delta` is temporarily accumulated in the `Skeleton3D`, and the deferred process uses the accumulated value to process the modification.

> method clear_bones() -> void

Clear all the bones in this skeleton.

> method clear_bones_global_pose_override() -> void ; deprecated=This method is deprecated.

Removes the global pose override on all bones in the skeleton.

> method create_skin_from_rest_transforms() -> Skin

> method find_bone(name: String) -> int ; qualifiers=const

Returns the bone index that matches `name` as its name. Returns `-1` if no bone with this name exists.

> method force_update_all_bone_transforms() -> void ; deprecated=This method should only be called internally.

Force updates the bone transforms/poses for all bones in the skeleton.

> method force_update_bone_child_transform(bone_idx: int) -> void

Force updates the bone transform for the bone at `bone_idx` and all of its children.

> method get_bone_children(bone_idx: int) -> PackedInt32Array ; qualifiers=const

Returns an array containing the bone indexes of all the child node of the passed in bone, `bone_idx`.

> method get_bone_count() -> int ; qualifiers=const

Returns the number of bones in the skeleton.

> method get_bone_global_pose(bone_idx: int) -> Transform3D ; qualifiers=const

Returns the overall transform of the specified bone, with respect to the skeleton. Being relative to the skeleton frame, this is not the actual "global" transform of the bone.
**Note:** This is the global pose you set to the skeleton in the process, the final global pose can get overridden by modifiers in the deferred process, if you want to access the final global pose, use `SkeletonModifier3D.modification_processed`.

> method get_bone_global_pose_no_override(bone_idx: int) -> Transform3D ; qualifiers=const ; deprecated=This method is deprecated.

Returns the overall transform of the specified bone, with respect to the skeleton, but without any global pose overrides. Being relative to the skeleton frame, this is not the actual "global" transform of the bone.

> method get_bone_global_pose_override(bone_idx: int) -> Transform3D ; qualifiers=const ; deprecated=This method is deprecated.

Returns the global pose override transform for `bone_idx`.

> method get_bone_global_rest(bone_idx: int) -> Transform3D ; qualifiers=const

Returns the global rest transform for `bone_idx`.

> method get_bone_meta(bone_idx: int, key: StringName) -> Variant ; qualifiers=const

Returns the metadata with the given `key` for the bone at index `bone_idx`.

> method get_bone_meta_list(bone_idx: int) -> Array[StringName] ; qualifiers=const

Returns the list of all metadata keys for the bone at index `bone_idx`.

> method get_bone_name(bone_idx: int) -> String ; qualifiers=const

Returns the name of the bone at index `bone_idx`.

> method get_bone_parent(bone_idx: int) -> int ; qualifiers=const

Returns the bone index which is the parent of the bone at `bone_idx`. If -1, then bone has no parent.
**Note:** The parent bone returned will always be less than `bone_idx`.

> method get_bone_pose(bone_idx: int) -> Transform3D ; qualifiers=const

Returns the pose transform of the specified bone.
**Note:** This is the pose you set to the skeleton in the process, the final pose can get overridden by modifiers in the deferred process, if you want to access the final pose, use `SkeletonModifier3D.modification_processed`.

> method get_bone_pose_position(bone_idx: int) -> Vector3 ; qualifiers=const

Returns the pose position of the bone at `bone_idx`. The returned `Vector3` is in the local coordinate space of the `Skeleton3D` node.

> method get_bone_pose_rotation(bone_idx: int) -> Quaternion ; qualifiers=const

Returns the pose rotation of the bone at `bone_idx`. The returned `Quaternion` is local to the bone with respect to the rotation of any parent bones.

> method get_bone_pose_scale(bone_idx: int) -> Vector3 ; qualifiers=const

Returns the pose scale of the bone at `bone_idx`.

> method get_bone_rest(bone_idx: int) -> Transform3D ; qualifiers=const

Returns the rest transform for a bone `bone_idx`.

> method get_concatenated_bone_names() -> StringName ; qualifiers=const

Returns all bone names concatenated with commas (`,`) as a single `StringName`.
It is useful to set it as a hint for the enum property.

> method get_parentless_bones() -> PackedInt32Array ; qualifiers=const

Returns an array with all of the bones that are parentless. Another way to look at this is that it returns the indexes of all the bones that are not dependent or modified by other bones in the Skeleton.

> method get_version() -> int ; qualifiers=const

Returns the number of times the bone hierarchy has changed within this skeleton, including renames.
The Skeleton version is not serialized: only use within a single instance of Skeleton3D.
Use for invalidating caches in IK solvers and other nodes which process bones.

> method has_bone_meta(bone_idx: int, key: StringName) -> bool ; qualifiers=const

Returns `true` if the bone at index `bone_idx` has metadata with the given `key`.

> method is_bone_enabled(bone_idx: int) -> bool ; qualifiers=const

Returns whether the bone pose for the bone at `bone_idx` is enabled.

> method localize_rests() -> void

Returns all bones in the skeleton to their rest poses.

> method physical_bones_add_collision_exception(exception: RID) -> void ; deprecated=This method is deprecated.

Adds a collision exception to the physical bone.
Works just like the `RigidBody3D` node.

> method physical_bones_remove_collision_exception(exception: RID) -> void ; deprecated=This method is deprecated.

Removes a collision exception to the physical bone.
Works just like the `RigidBody3D` node.

> method physical_bones_start_simulation(bones: Array[StringName] = []) -> void ; deprecated=This method is deprecated.

Tells the `PhysicalBone3D` nodes in the Skeleton to start simulating and reacting to the physics world.
Optionally, a list of bone names can be passed-in, allowing only the passed-in bones to be simulated.

> method physical_bones_stop_simulation() -> void ; deprecated=This method is deprecated.

Tells the `PhysicalBone3D` nodes in the Skeleton to stop simulating.

> method register_skin(skin: Skin) -> SkinReference

Binds the given Skin to the Skeleton.

> method reset_bone_pose(bone_idx: int) -> void

Sets the bone pose to rest for `bone_idx`.

> method reset_bone_poses() -> void

Sets all bone poses to rests.

> method set_bone_enabled(bone_idx: int, enabled: bool = true) -> void

Disables the pose for the bone at `bone_idx` if `false`, enables the bone pose if `true`.

> method set_bone_global_pose(bone_idx: int, pose: Transform3D) -> void

Sets the global pose transform, `pose`, for the bone at `bone_idx`.
**Note:** If other bone poses have been changed, this method executes a dirty poses recalculation and will cause performance to deteriorate. If you know that multiple global poses will be applied, consider using `set_bone_pose` with precalculation.

> method set_bone_global_pose_override(bone_idx: int, pose: Transform3D, amount: float, persistent: bool = false) -> void ; deprecated=This method is deprecated.

Sets the global pose transform, `pose`, for the bone at `bone_idx`.
`amount` is the interpolation strength that will be used when applying the pose, and `persistent` determines if the applied pose will remain.
**Note:** The pose transform needs to be a global pose! To convert a world transform from a `Node3D` to a global bone pose, multiply the `Transform3D.affine_inverse` of the node's `Node3D.global_transform` by the desired world transform.

> method set_bone_meta(bone_idx: int, key: StringName, value: Variant) -> void

Sets the metadata with the given `key` to `value` for the bone at index `bone_idx`.

> method set_bone_name(bone_idx: int, name: String) -> void

Sets the bone name, `name`, for the bone at `bone_idx`.

> method set_bone_parent(bone_idx: int, parent_idx: int) -> void

Sets the bone index `parent_idx` as the parent of the bone at `bone_idx`. If -1, then bone has no parent.
**Note:** `parent_idx` must be less than `bone_idx`.

> method set_bone_pose(bone_idx: int, pose: Transform3D) -> void

Sets the pose transform, `pose`, for the bone at `bone_idx`.

> method set_bone_pose_position(bone_idx: int, position: Vector3) -> void

Sets the pose position of the bone at `bone_idx` to `position`. `position` is a `Vector3` describing a position local to the `Skeleton3D` node.

> method set_bone_pose_rotation(bone_idx: int, rotation: Quaternion) -> void

Sets the pose rotation of the bone at `bone_idx` to `rotation`. `rotation` is a `Quaternion` describing a rotation in the bone's local coordinate space with respect to the rotation of any parent bones.

> method set_bone_pose_scale(bone_idx: int, scale: Vector3) -> void

Sets the pose scale of the bone at `bone_idx` to `scale`.

> method set_bone_rest(bone_idx: int, rest: Transform3D) -> void

Sets the rest transform for bone `bone_idx`.

> method unparent_bone_and_rest(bone_idx: int) -> void

Unparents the bone at `bone_idx` and sets its rest position to that of its parent prior to being reset.

## Signals

> signal bone_enabled_changed(bone_idx: int)

Emitted when the bone at `bone_idx` is toggled with `set_bone_enabled`. Use `is_bone_enabled` to check the new value.

> signal bone_list_changed()

Emitted when the list of bones changes, such as when calling `add_bone`, `set_bone_parent`, `unparent_bone_and_rest`, or `clear_bones`.

> signal pose_updated()

Emitted when the pose is updated.
**Note:** During the update process, this signal is not fired, so modification by `SkeletonModifier3D` is not detected.

> signal rest_updated()

Emitted when the rest is updated.

> signal show_rest_only_changed()

Emitted when the value of `show_rest_only` changes.

> signal skeleton_updated()

Emitted when the final pose has been calculated will be applied to the skin in the update process.
This means that all `SkeletonModifier3D` processing is complete. In order to detect the completion of the processing of each `SkeletonModifier3D`, use `SkeletonModifier3D.modification_processed`.

## Enumerations

> enum ModifierCallbackModeProcess

> enum_value ModifierCallbackModeProcess.MODIFIER_CALLBACK_MODE_PROCESS_PHYSICS = 0

Set a flag to process modification during physics frames (see `Node.NOTIFICATION_INTERNAL_PHYSICS_PROCESS`).

> enum_value ModifierCallbackModeProcess.MODIFIER_CALLBACK_MODE_PROCESS_IDLE = 1

Set a flag to process modification during process frames (see `Node.NOTIFICATION_INTERNAL_PROCESS`).

> enum_value ModifierCallbackModeProcess.MODIFIER_CALLBACK_MODE_PROCESS_MANUAL = 2

Do not process modification. Use `advance` to process the modification manually.

## Constants

> constant NOTIFICATION_UPDATE_SKELETON = 50

Notification received when this skeleton's pose needs to be updated. In that case, this is called only once per frame in a deferred process.

## Tutorials
- [Third Person Shooter (TPS) Demo](https://godotengine.org/asset-library/asset/2710)
