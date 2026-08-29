# JointLimitationCone3D

> class JointLimitationCone3D
> inherits JointLimitationCone3D JointLimitation3D

## Brief

A cone shape limitation that interacts with `ChainIK3D`.

## Description

A cone shape limitation that interacts with `ChainIK3D`.

## Properties

> property angle : float ; default=1.5707964 ; setter=set_angle ; getter=get_angle

The radius range of the hole made by the cone.
`0` degrees makes a sphere without hole, `180` degrees makes a hemisphere, and `360` degrees become empty (no limitation).
