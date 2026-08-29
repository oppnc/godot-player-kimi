# GPUParticlesAttractor3D

> class GPUParticlesAttractor3D
> inherits GPUParticlesAttractor3D VisualInstance3D

## Brief

Abstract base class for 3D particle attractors.

## Description

Particle attractors can be used to attract particles towards the attractor's origin, or to push them away from the attractor's origin.
Particle attractors work in real-time and can be moved, rotated and scaled during gameplay. Unlike collision shapes, non-uniform scaling of attractors is also supported.
Attractors can be temporarily disabled by hiding them, or by setting their `strength` to `0.0`.
**Note:** Particle attractors only affect `GPUParticles3D`, not `CPUParticles3D`.

## Properties

> property attenuation : float ; default=1.0 ; setter=set_attenuation ; getter=get_attenuation

The particle attractor's attenuation. Higher values result in more gradual pushing of particles as they come closer to the attractor's origin. Zero or negative values will cause particles to be pushed very fast as soon as the touch the attractor's edges.

> property cull_mask : int ; default=4294967295 ; setter=set_cull_mask ; getter=get_cull_mask

The particle rendering layers (`VisualInstance3D.layers`) that will be affected by the attractor. By default, all particles are affected by an attractor.
After configuring particle nodes accordingly, specific layers can be unchecked to prevent certain particles from being affected by attractors. For example, this can be used if you're using an attractor as part of a spell effect but don't want the attractor to affect unrelated weather particles at the same position.
Particle attraction can also be disabled on a per-process material basis by setting `ParticleProcessMaterial.attractor_interaction_enabled` on the `GPUParticles3D` node.

> property directionality : float ; default=0.0 ; setter=set_directionality ; getter=get_directionality

Adjusts how directional the attractor is. At `0.0`, the attractor is not directional at all: it will attract particles towards its center. At `1.0`, the attractor is fully directional: particles will always be pushed towards local -Z (or +Z if `strength` is negative).
**Note:** If `directionality` is greater than `0.0`, the direction in which particles are pushed can be changed by rotating the `GPUParticlesAttractor3D` node.

> property strength : float ; default=1.0 ; setter=set_strength ; getter=get_strength

Adjusts the strength of the attractor. If `strength` is negative, particles will be pushed in the opposite direction. Particles will be pushed *away* from the attractor's origin if `directionality` is `0.0`, or towards local +Z if `directionality` is greater than `0.0`.
