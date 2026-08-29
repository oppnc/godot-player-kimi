# ClassDB

> class ClassDB
> inherits ClassDB Object

## Brief

A class information repository.

## Description

Provides access to metadata stored for every available engine class.
**Note:** Script-defined classes with `class_name` are not part of `ClassDB`, so they will not return reflection data such as a method or property list. However, `GDExtension`-defined classes *are* part of `ClassDB`, so they will return reflection data.

## Methods

> method can_instantiate(class: StringName) -> bool ; qualifiers=const

Returns `true` if objects can be instantiated from the specified `class`, otherwise returns `false`.

> method class_call_static(class: StringName, method: StringName) -> Variant ; qualifiers=vararg

Calls a static method on a class.

> method class_exists(class: StringName) -> bool ; qualifiers=const

Returns whether the specified `class` is available or not.

> method class_get_api_type(class: StringName) -> APIType ; qualifiers=const

Returns the API type of the specified `class`.

> method class_get_enum_constants(class: StringName, enum: StringName, no_inheritance: bool = false) -> PackedStringArray ; qualifiers=const

Returns an array with all the keys in `enum` of `class` or its ancestry.

> method class_get_enum_list(class: StringName, no_inheritance: bool = false) -> PackedStringArray ; qualifiers=const

Returns an array with all the enums of `class` or its ancestry.

> method class_get_integer_constant(class: StringName, name: StringName) -> int ; qualifiers=const

Returns the value of the integer constant `name` of `class` or its ancestry. Always returns 0 when the constant could not be found.

> method class_get_integer_constant_enum(class: StringName, name: StringName, no_inheritance: bool = false) -> StringName ; qualifiers=const

Returns which enum the integer constant `name` of `class` or its ancestry belongs to.

> method class_get_integer_constant_list(class: StringName, no_inheritance: bool = false) -> PackedStringArray ; qualifiers=const

Returns an array with the names all the integer constants of `class` or its ancestry.

> method class_get_method_argument_count(class: StringName, method: StringName, no_inheritance: bool = false) -> int ; qualifiers=const

Returns the number of arguments of the method `method` of `class` or its ancestry if `no_inheritance` is `false`.

> method class_get_method_list(class: StringName, no_inheritance: bool = false) -> Array[Dictionary] ; qualifiers=const

Returns an array with all the methods of `class` or its ancestry if `no_inheritance` is `false`. Every element of the array is a `Dictionary` with the following keys: `args`, `default_args`, `flags`, `id`, `name`, `return: (class_name, hint, hint_string, name, type, usage)`.
**Note:** In exported release builds the debug info is not available, so the returned dictionaries will contain only method names.

> method class_get_property(object: Object, property: StringName) -> Variant ; qualifiers=const

Returns the value of `property` of `object` or its ancestry.

> method class_get_property_default_value(class: StringName, property: StringName) -> Variant ; qualifiers=const

Returns the default value of `property` of `class` or its ancestor classes.

> method class_get_property_getter(class: StringName, property: StringName) -> StringName

Returns the getter method name of `property` of `class`.

> method class_get_property_list(class: StringName, no_inheritance: bool = false) -> Array[Dictionary] ; qualifiers=const

Returns an array with all the properties of `class` or its ancestry if `no_inheritance` is `false`.

> method class_get_property_setter(class: StringName, property: StringName) -> StringName

Returns the setter method name of `property` of `class`.

> method class_get_signal(class: StringName, signal: StringName) -> Dictionary ; qualifiers=const

Returns the `signal` data of `class` or its ancestry. The returned value is a `Dictionary` with the following keys: `args`, `default_args`, `flags`, `id`, `name`, `return: (class_name, hint, hint_string, name, type, usage)`.

> method class_get_signal_list(class: StringName, no_inheritance: bool = false) -> Array[Dictionary] ; qualifiers=const

Returns an array with all the signals of `class` or its ancestry if `no_inheritance` is `false`. Every element of the array is a `Dictionary` as described in `class_get_signal`.

> method class_has_enum(class: StringName, name: StringName, no_inheritance: bool = false) -> bool ; qualifiers=const

Returns whether `class` or its ancestry has an enum called `name` or not.

> method class_has_integer_constant(class: StringName, name: StringName) -> bool ; qualifiers=const

Returns whether `class` or its ancestry has an integer constant called `name` or not.

> method class_has_method(class: StringName, method: StringName, no_inheritance: bool = false) -> bool ; qualifiers=const

Returns whether `class` (or its ancestry if `no_inheritance` is `false`) has a method called `method` or not.

> method class_has_signal(class: StringName, signal: StringName) -> bool ; qualifiers=const

Returns whether `class` or its ancestry has a signal called `signal` or not.

> method class_set_property(object: Object, property: StringName, value: Variant) -> Error ; qualifiers=const

Sets `property` value of `object` to `value`.

> method get_class_list() -> PackedStringArray ; qualifiers=const

Returns the names of all engine classes available.
**Note:** Script-defined classes with `class_name` are not included in this list. Use `ProjectSettings.get_global_class_list` to get a list of script-defined classes instead.

> method get_inheriters_from_class(class: StringName) -> PackedStringArray ; qualifiers=const

Returns the names of all engine classes that directly or indirectly inherit from `class`.

> method get_parent_class(class: StringName) -> StringName ; qualifiers=const

Returns the parent class of `class`.

> method instantiate(class: StringName) -> Variant ; qualifiers=const

Creates an instance of `class`.

> method is_class_enabled(class: StringName) -> bool ; qualifiers=const

Returns whether this `class` is enabled or not.

> method is_class_enum_bitfield(class: StringName, enum: StringName, no_inheritance: bool = false) -> bool ; qualifiers=const

Returns whether `class` (or its ancestor classes if `no_inheritance` is `false`) has an enum called `enum` that is a bitfield.

> method is_parent_class(class: StringName, inherits: StringName) -> bool ; qualifiers=const

Returns whether `inherits` is an ancestor of `class` or not.

## Enumerations

> enum APIType

> enum_value APIType.API_CORE = 0

Native Core class type.

> enum_value APIType.API_EDITOR = 1

Native Editor class type.

> enum_value APIType.API_EXTENSION = 2

GDExtension class type.

> enum_value APIType.API_EDITOR_EXTENSION = 3

GDExtension Editor class type.

> enum_value APIType.API_NONE = 4

Unknown class type.
