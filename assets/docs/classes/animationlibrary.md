# AnimationLibrary

> class AnimationLibrary
> inherits AnimationLibrary Resource

## Brief

Container for `Animation` resources.

## Description

An animation library stores a set of animations accessible through `StringName` keys, for use with `AnimationPlayer` nodes.

## Methods

> method add_animation(name: StringName, animation: Animation) -> Error

Adds the `animation` to the library, accessible by the key `name`.

> method get_animation(name: StringName) -> Animation ; qualifiers=const

Returns the `Animation` with the key `name`. If the animation does not exist, `null` is returned and an error is logged.

> method get_animation_list() -> Array[StringName] ; qualifiers=const

Returns the keys for the `Animation`s stored in the library.

> method get_animation_list_size() -> int ; qualifiers=const

Returns the key count for the `Animation`s stored in the library.

> method has_animation(name: StringName) -> bool ; qualifiers=const

Returns `true` if the library stores an `Animation` with `name` as the key.

> method remove_animation(name: StringName) -> void

Removes the `Animation` with the key `name`.

> method rename_animation(name: StringName, newname: StringName) -> void

Changes the key of the `Animation` associated with the key `name` to `newname`.

## Signals

> signal animation_added(anim_name: StringName)

Emitted when an `Animation` is added, under the key `anim_name`.

> signal animation_changed(anim_name: StringName)

Emitted when there's a change in one of the animations, e.g. tracks are added, moved or have changed paths. `anim_name` is the key of the animation that was changed.
See also `Resource.changed`, which this acts as a relay for.

> signal animation_removed(anim_name: StringName)

Emitted when an `Animation` stored with the key `anim_name` is removed.

> signal animation_renamed(old_name: StringName, new_name: StringName)

Emitted when the key for an `Animation` is changed, from `old_name` to `new_name`.

## Tutorials
- [Animation tutorial index]($DOCS_URL/tutorials/animation/index.html)
