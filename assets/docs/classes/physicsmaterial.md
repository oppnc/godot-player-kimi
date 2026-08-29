# PhysicsMaterial

> class PhysicsMaterial
> inherits PhysicsMaterial Resource

## Brief

Holds physics-related properties of a surface, namely its roughness and bounciness.

## Description

Holds physics-related properties of a surface, namely its roughness and bounciness. This class is used to apply these properties to a physics body.

## Properties

> property absorbent : bool ; default=false ; setter=set_absorbent ; getter=is_absorbent

If `true`, subtracts the bounciness from the colliding object's bounciness instead of adding it.

> property bounce : float ; default=0.0 ; setter=set_bounce ; getter=get_bounce

The body's bounciness. Values range from `0` (no bounce) to `1` (full bounciness).
**Note:** Even with `bounce` set to `1.0`, some energy will be lost over time due to linear and angular damping. To have a physics body that preserves all its energy over time, set `bounce` to `1.0`, the body's linear damp mode to **Replace** (if applicable), its linear damp to `0.0`, its angular damp mode to **Replace** (if applicable), and its angular damp to `0.0`.

> property friction : float ; default=1.0 ; setter=set_friction ; getter=get_friction

The body's friction. Values range from `0` (frictionless) to `1` (maximum friction).

> property rough : bool ; default=false ; setter=set_rough ; getter=is_rough

If `true`, the physics engine will use the friction of the object marked as "rough" when two objects collide. If `false`, the physics engine will use the lowest friction of all colliding objects instead. If `true` for both colliding objects, the physics engine will use the highest friction.
