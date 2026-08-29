# SkeletonProfileHumanoid

> class SkeletonProfileHumanoid
> inherits SkeletonProfileHumanoid SkeletonProfile

## Brief

A humanoid `SkeletonProfile` preset.

## Description

A `SkeletonProfile` as a preset that is optimized for the human form. This exists for standardization, so all parameters are read-only.
A humanoid skeleton profile contains 56 bones divided into 4 groups: `"Body"`, `"Face"`, `"LeftHand"`, and `"RightHand"`. It is structured as follows:

```text
        Root
        └─ Hips
            ├─ LeftUpperLeg
            │  └─ LeftLowerLeg
            │     └─ LeftFoot
            │        └─ LeftToes
            ├─ RightUpperLeg
            │  └─ RightLowerLeg
            │     └─ RightFoot
            │        └─ RightToes
            └─ Spine
                └─ Chest
                    └─ UpperChest
                        ├─ Neck
                        │   └─ Head
                        │       ├─ Jaw
                        │       ├─ LeftEye
                        │       └─ RightEye
                        ├─ LeftShoulder
                        │  └─ LeftUpperArm
                        │     └─ LeftLowerArm
                        │        └─ LeftHand
                        │           ├─ LeftThumbMetacarpal
                        │           │  └─ LeftThumbProximal
                        │           │    └─ LeftThumbDistal
                        │           ├─ LeftIndexProximal
                        │           │  └─ LeftIndexIntermediate
                        │           │    └─ LeftIndexDistal
                        │           ├─ LeftMiddleProximal
                        │           │  └─ LeftMiddleIntermediate
                        │           │    └─ LeftMiddleDistal
                        │           ├─ LeftRingProximal
                        │           │  └─ LeftRingIntermediate
                        │           │    └─ LeftRingDistal
                        │           └─ LeftLittleProximal
                        │              └─ LeftLittleIntermediate
                        │                └─ LeftLittleDistal
                        └─ RightShoulder
                           └─ RightUpperArm
                              └─ RightLowerArm
                                 └─ RightHand
                                    ├─ RightThumbMetacarpal
                                    │  └─ RightThumbProximal
                                    │     └─ RightThumbDistal
                                    ├─ RightIndexProximal
                                    │  └─ RightIndexIntermediate
                                    │     └─ RightIndexDistal
                                    ├─ RightMiddleProximal
                                    │  └─ RightMiddleIntermediate
                                    │     └─ RightMiddleDistal
                                    ├─ RightRingProximal
                                    │  └─ RightRingIntermediate
                                    │     └─ RightRingDistal
                                    └─ RightLittleProximal
                                       └─ RightLittleIntermediate
                                         └─ RightLittleDistal

```

## Properties

> property bone_size : int ; default=56 ; setter=set_bone_size ; getter=get_bone_size ; overrides=SkeletonProfile

> property group_size : int ; default=4 ; setter=set_group_size ; getter=get_group_size ; overrides=SkeletonProfile

> property root_bone : StringName ; default=&"Root" ; setter=set_root_bone ; getter=get_root_bone ; overrides=SkeletonProfile

> property scale_base_bone : StringName ; default=&"Hips" ; setter=set_scale_base_bone ; getter=get_scale_base_bone ; overrides=SkeletonProfile

## Tutorials
- [Retargeting 3D Skeletons]($DOCS_URL/tutorials/assets_pipeline/retargeting_3d_skeletons.html)
