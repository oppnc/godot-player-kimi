# ResourcePreloader

> class ResourcePreloader
> inherits ResourcePreloader Node

## Brief

A node used to preload sub-resources inside a scene.

## Description

This node is used to preload sub-resources inside a scene, so when the scene is loaded, all the resources are ready to use and can be retrieved from the preloader. You can add the resources using the ResourcePreloader tab when the node is selected.
GDScript has a simplified `@GDScript.preload` built-in method which can be used in most situations, leaving the use of `ResourcePreloader` for more advanced scenarios.

## Methods

> method add_resource(name: StringName, resource: Resource) -> void

Adds a resource to the preloader with the given `name`. If a resource with the given `name` already exists, the new resource will be renamed to "`name` N" where N is an incrementing number starting from 2.

> method get_resource(name: StringName) -> Resource ; qualifiers=const

Returns the resource associated to `name`.

> method get_resource_list() -> PackedStringArray ; qualifiers=const

Returns the list of resources inside the preloader.

> method has_resource(name: StringName) -> bool ; qualifiers=const

Returns `true` if the preloader contains a resource associated to `name`.

> method remove_resource(name: StringName) -> void

Removes the resource associated to `name` from the preloader.

> method rename_resource(name: StringName, newname: StringName) -> void

Renames a resource inside the preloader from `name` to `newname`.
