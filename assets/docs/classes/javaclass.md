# JavaClass

> class JavaClass
> inherits JavaClass RefCounted

## Brief

Represents a class from the Java Native Interface.

## Description

Represents a class from the Java Native Interface. It is returned from `JavaClassWrapper.wrap`.
**Note:** This class only works on Android. On any other platform, this class does nothing.
**Note:** This class is not to be confused with `JavaScriptObject`.

## Methods

> method get_java_class_name() -> String ; qualifiers=const

Returns the Java class name.

> method get_java_method_list() -> Array[Dictionary] ; qualifiers=const

Returns the object's Java methods and their signatures as an `Array` of dictionaries, in the same format as `Object.get_method_list`.

> method get_java_parent_class() -> JavaClass ; qualifiers=const

Returns a `JavaClass` representing the Java parent class of this class.

> method has_java_method(method: StringName) -> bool ; qualifiers=const

Returns `true` if the given `method` name exists in the object's Java methods.
