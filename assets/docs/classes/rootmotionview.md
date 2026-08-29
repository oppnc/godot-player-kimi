# RootMotionView

> class RootMotionView
> inherits RootMotionView VisualInstance3D

## Brief

Editor-only helper for setting up root motion in `AnimationMixer`.

## Description

*Root motion* refers to an animation technique where a mesh's skeleton is used to give impulse to a character. When working with 3D animations, a popular technique is for animators to use the root skeleton bone to give motion to the rest of the skeleton. This allows animating characters in a way where steps actually match the floor below. It also allows precise interaction with objects during cinematics. See also `AnimationMixer`.
**Note:** `RootMotionView` is only visible in the editor. It will be hidden automatically in the running project.

## Properties

> property animation_path : NodePath ; default=NodePath("") ; setter=set_animation_path ; getter=get_animation_path

Path to an `AnimationMixer` node to use as a basis for root motion.

> property cell_size : float ; default=1.0 ; setter=set_cell_size ; getter=get_cell_size

The grid's cell size in 3D units.

> property color : Color ; default=Color(0.5, 0.5, 1, 1) ; setter=set_color ; getter=get_color

The grid's color.

> property radius : float ; default=10.0 ; setter=set_radius ; getter=get_radius

The grid's radius in 3D units. The grid's opacity will fade gradually as the distance from the origin increases until this `radius` is reached.

> property zero_y : bool ; default=true ; setter=set_zero_y ; getter=get_zero_y

If `true`, the grid's points will all be on the same Y coordinate (*local* Y = 0). If `false`, the points' original Y coordinate is preserved.

## Tutorials
- [Using AnimationTree - Root motion]($DOCS_URL/tutorials/animation/animation_tree.html#root-motion)
