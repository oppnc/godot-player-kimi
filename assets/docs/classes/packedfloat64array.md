# PackedFloat64Array

> class PackedFloat64Array

## Brief

A packed array of 64-bit floating-point values.

## Description

An array specifically designed to hold 64-bit floating-point values (double). Packs data tightly, so it saves memory for large array sizes.
If you only need to pack 32-bit floats tightly, see `PackedFloat32Array` for a more memory-friendly alternative.
**Differences between packed arrays, typed arrays, and untyped arrays:** Packed arrays are generally faster to iterate on and modify compared to a typed array of the same type (e.g. `PackedFloat64Array` versus `Array[float]`). Also, packed arrays consume less memory. As a downside, packed arrays are less flexible as they don't offer as many convenience methods such as `Array.map`. Typed arrays are in turn faster to iterate on and modify than untyped arrays.
**Note:** Packed arrays are always passed by reference. To get a copy of an array that can be modified independently of the original array, use `duplicate`. This is *not* the case for built-in properties and methods. In these cases the returned packed array is a copy, and changing it will *not* affect the original value. To update a built-in property of this type, modify the returned array and then assign it to the property again.
**Note:** In a boolean context, a packed array will evaluate to `false` if it's empty. Otherwise, a packed array will always evaluate to `true`.

## Constructors

> constructor PackedFloat64Array()

Constructs an empty `PackedFloat64Array`.

> constructor PackedFloat64Array(from: PackedFloat64Array)

Constructs a `PackedFloat64Array` as a copy of the given `PackedFloat64Array`.

> constructor PackedFloat64Array(from: Array)

Constructs a new `PackedFloat64Array`. Optionally, you can pass in a generic `Array` that will be converted.

## Methods

> method append(value: float) -> bool

Appends an element at the end of the array (alias of `push_back`).

> method append_array(array: PackedFloat64Array) -> void

Appends a `PackedFloat64Array` at the end of this array.

> method bsearch(value: float, before: bool = true) -> int ; qualifiers=const

Finds the index of an existing value (or the insertion index that maintains sorting order, if the value is not yet present in the array) using binary search. Optionally, a `before` specifier can be passed. If `false`, the returned index comes after all existing entries of the value in the array.
**Note:** Calling `bsearch` on an unsorted array results in unexpected behavior.
**Note:** `@GDScript.NAN` doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included.

> method clear() -> void

Clears the array. This is equivalent to using `resize` with a size of `0`.

> method count(value: float) -> int ; qualifiers=const

Returns the number of times an element is in the array.
**Note:** `@GDScript.NAN` doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included.

> method duplicate() -> PackedFloat64Array ; qualifiers=const

Creates a copy of the array, and returns it.

> method erase(value: float) -> bool

Removes the first occurrence of a value from the array and returns `true`. If the value does not exist in the array, nothing happens and `false` is returned. To remove an element by index, use `remove_at` instead.
**Note:** `@GDScript.NAN` doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included.

> method fill(value: float) -> void

Assigns the given value to all elements in the array. This can typically be used together with `resize` to create an array with a given size and initialized elements.

> method find(value: float, from: int = 0) -> int ; qualifiers=const

Searches the array for a value and returns its index or `-1` if not found. Optionally, the initial search index can be passed.
**Note:** `@GDScript.NAN` doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included.

> method get(index: int) -> float ; qualifiers=const

Returns the 64-bit float at the given `index` in the array. If `index` is out-of-bounds or negative, this method fails and returns `0.0`.
This method is similar (but not identical) to the `[]` operator. Most notably, when this method fails, it doesn't pause project execution if run from the editor.

> method has(value: float) -> bool ; qualifiers=const

Returns `true` if the array contains `value`.
**Note:** `@GDScript.NAN` doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included.

> method insert(at_index: int, value: float) -> int

Inserts a new element at a given position in the array. The position must be valid, or at the end of the array (`idx == size()`).

> method is_empty() -> bool ; qualifiers=const

Returns `true` if the array is empty.

> method push_back(value: float) -> bool

Appends an element at the end of the array.

> method remove_at(index: int) -> void

Removes an element from the array by index.

> method resize(new_size: int) -> int

Sets the size of the array. If the array is grown, reserves elements at the end of the array. If the array is shrunk, truncates the array to the new size. Calling `resize` once and assigning the new values is faster than adding new elements one by one.
Returns `OK` on success, or one of the following `Error` constants if this method fails: `ERR_INVALID_PARAMETER` if the size is negative, or `ERR_OUT_OF_MEMORY` if allocations fail. Use `size` to find the actual size of the array after resize.

> method reverse() -> void

Reverses the order of the elements in the array.

> method rfind(value: float, from: int = -1) -> int ; qualifiers=const

Searches the array in reverse order. Optionally, a start search index can be passed. If negative, the start index is considered relative to the end of the array.
**Note:** `@GDScript.NAN` doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included.

> method set(index: int, value: float) -> void

Changes the float at the given index.

> method size() -> int ; qualifiers=const

Returns the number of elements in the array.

> method slice(begin: int, end: int = 2147483647) -> PackedFloat64Array ; qualifiers=const

Returns the slice of the `PackedFloat64Array`, from `begin` (inclusive) to `end` (exclusive), as a new `PackedFloat64Array`.
The absolute value of `begin` and `end` will be clamped to the array size, so the default value for `end` makes it slice to the size of the array by default (i.e. `arr.slice(1)` is a shorthand for `arr.slice(1, arr.size())`).
If either `begin` or `end` are negative, they will be relative to the end of the array (i.e. `arr.slice(0, -2)` is a shorthand for `arr.slice(0, arr.size() - 2)`).

> method sort() -> void

Sorts the elements of the array in ascending order.
**Note:** `@GDScript.NAN` doesn't behave the same as other numbers. Therefore, the results from this method may not be accurate if NaNs are included.

> method to_byte_array() -> PackedByteArray ; qualifiers=const

Returns a copy of the data converted to a `PackedByteArray`, where each element has been encoded as 8 bytes.
The size of the new array will be `float64_array.size() * 8`.

## Operators

> operator !=(right: PackedFloat64Array) -> bool

Returns `true` if contents of the arrays differ.

> operator +(right: PackedFloat64Array) -> PackedFloat64Array

Returns a new `PackedFloat64Array` with contents of `right` added at the end of this array. For better performance, consider using `append_array` instead.

> operator ==(right: PackedFloat64Array) -> bool

Returns `true` if contents of both arrays are the same, i.e. they have all equal doubles at the corresponding indices.

> operator [](index: int) -> float

Returns the `float` at index `index`. Negative indices can be used to access the elements starting from the end. Using index out of array's bounds will result in an error.
