# SkeletonIK3D

> class SkeletonIK3D ; deprecated=This class may be changed or removed in future versions.
> inherits SkeletonIK3D SkeletonModifier3D

## Brief

A node used to rotate all bones of a `Skeleton3D` bone chain a way that places the end bone at a desired 3D position.

## Description

SkeletonIK3D is used to rotate all bones of a `Skeleton3D` bone chain a way that places the end bone at a desired 3D position. A typical scenario for IK in games is to place a character's feet on the ground or a character's hands on a currently held object. SkeletonIK uses FabrikInverseKinematic internally to solve the bone chain and applies the results to the `Skeleton3D` `bones_global_pose_override` property for all affected bones in the chain. If fully applied, this overwrites any bone transform from `Animation`s or bone custom poses set by users. The applied amount can be controlled with the `SkeletonModifier3D.influence` property.

```text
        # Apply IK effect automatically on every new frame (not the current)
        skeleton_ik_node.start()

        # Apply IK effect only on the current frame
        skeleton_ik_node.start(true)

        # Stop IK effect and reset bones_global_pose_override on Skeleton
        skeleton_ik_node.stop()

        # Apply full IK effect
        skeleton_ik_node.set_influence(1.0)

        # Apply half IK effect
        skeleton_ik_node.set_influence(0.5)

        # Apply zero IK effect (a value at or below 0.01 also removes bones_global_pose_override on Skeleton)
        skeleton_ik_node.set_influence(0.0)

```

## Properties

> property interpolation : float ; setter=set_interpolation ; getter=get_interpolation ; deprecated=Use `SkeletonModifier3D.influence` instead.

Interpolation value for how much the IK results are applied to the current skeleton bone chain. A value of `1.0` will overwrite all skeleton bone transforms completely while a value of `0.0` will visually disable the SkeletonIK.

> property magnet : Vector3 ; default=Vector3(0, 0, 0) ; setter=set_magnet_position ; getter=get_magnet_position

Secondary target position (first is `target` property or `target_node`) for the IK chain. Use magnet position (pole target) to control the bending of the IK chain. Only works if the bone chain has more than 2 bones. The middle chain bone position will be linearly interpolated with the magnet position.

> property max_iterations : int ; default=10 ; setter=set_max_iterations ; getter=get_max_iterations

Number of iteration loops used by the IK solver to produce more accurate (and elegant) bone chain results.

> property min_distance : float ; default=0.01 ; setter=set_min_distance ; getter=get_min_distance

The minimum distance between bone and goal target. If the distance is below this value, the IK solver stops further iterations.

> property override_tip_basis : bool ; default=true ; setter=set_override_tip_basis ; getter=is_override_tip_basis

If `true` overwrites the rotation of the tip bone with the rotation of the `target` (or `target_node` if defined).

> property root_bone : StringName ; default=&"" ; setter=set_root_bone ; getter=get_root_bone

The name of the current root bone, the first bone in the IK chain.

> property target : Transform3D ; default=Transform3D(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0) ; setter=set_target_transform ; getter=get_target_transform

First target of the IK chain where the tip bone is placed and, if `override_tip_basis` is `true`, how the tip bone is rotated. If a `target_node` path is available the nodes transform is used instead and this property is ignored.

> property target_node : NodePath ; default=NodePath("") ; setter=set_target_node ; getter=get_target_node

Target node `NodePath` for the IK chain. If available, the node's current `Transform3D` is used instead of the `target` property.

> property tip_bone : StringName ; default=&"" ; setter=set_tip_bone ; getter=get_tip_bone

The name of the current tip bone, the last bone in the IK chain placed at the `target` transform (or `target_node` if defined).

> property use_magnet : bool ; default=false ; setter=set_use_magnet ; getter=is_using_magnet

If `true`, instructs the IK solver to consider the secondary magnet target (pole target) when calculating the bone chain. Use the magnet position (pole target) to control the bending of the IK chain.

## Methods

> method get_parent_skeleton() -> Skeleton3D ; qualifiers=const

Returns the parent `Skeleton3D` node that was present when SkeletonIK entered the scene tree. Returns `null` if the parent node was not a `Skeleton3D` node when SkeletonIK3D entered the scene tree.

> method is_running() -> bool

Returns `true` if SkeletonIK is applying IK effects on continues frames to the `Skeleton3D` bones. Returns `false` if SkeletonIK is stopped or `start` was used with the `one_time` parameter set to `true`.

> method start(one_time: bool = false) -> void

Starts applying IK effects on each frame to the `Skeleton3D` bones but will only take effect starting on the next frame. If `one_time` is `true`, this will take effect immediately but also reset on the next frame.

> method stop() -> void

Stops applying IK effects on each frame to the `Skeleton3D` bones and also calls `Skeleton3D.clear_bones_global_pose_override` to remove existing overrides on all bones.
