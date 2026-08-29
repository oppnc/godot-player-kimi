# JavaObject

> class JavaObject
> inherits JavaObject RefCounted

## Brief

Represents an object from the Java Native Interface.

## Description

Represents an object from the Java Native Interface. It can be returned from Java methods called on `JavaClass` or other `JavaObject`s. See `JavaClassWrapper` for an example.
**Note:** This class only works on Android. On any other platform, this class does nothing.
**Note:** This class is not to be confused with `JavaScriptObject`.

## Methods

> method get_java_class() -> JavaClass ; qualifiers=const

Returns the `JavaClass` that this object is an instance of.

> method has_java_method(method: StringName) -> bool ; qualifiers=const

Returns `true` if the given `method` name exists in the object's Java methods.
