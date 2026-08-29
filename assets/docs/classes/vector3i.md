# Vector3i

> class Vector3i

## Brief

A 3D vector using integer coordinates.

## Description

A 3-element structure that can be used to represent 3D grid coordinates or any other triplet of integers.
It uses integer coordinates and is therefore preferable to `Vector3` when exact precision is required. Note that the values are limited to 32 bits, and unlike `Vector3` this cannot be configured with an engine build option. Use `int` or `PackedInt64Array` if 64-bit values are needed.
**Note:** In a boolean context, a Vector3i will evaluate to `false` if it's equal to `Vector3i(0, 0, 0)`. Otherwise, a Vector3i will always evaluate to `true`.

## Properties

> property x : int ; default=0

The vector's X component. Also accessible by using the index position `[0]`.

> property y : int ; default=0

The vector's Y component. Also accessible by using the index position `[1]`.

> property z : int ; default=0

The vector's Z component. Also accessible by using the index position `[2]`.

## Constructors

> constructor Vector3i()

Constructs a default-initialized `Vector3i` with all components set to `0`.

> constructor Vector3i(from: Vector3i)

Constructs a `Vector3i` as a copy of the given `Vector3i`.

> constructor Vector3i(from: Vector3)

Constructs a new `Vector3i` from the given `Vector3` by truncating components' fractional parts (rounding towards zero). For a different behavior consider passing the result of `Vector3.ceil`, `Vector3.floor` or `Vector3.round` to this constructor instead.

> constructor Vector3i(x: int, y: int, z: int)

Returns a `Vector3i` with the given components.

## Methods

> method abs() -> Vector3i ; qualifiers=const

Returns a new vector with all components in absolute values (i.e. positive).

> method clamp(min: Vector3i, max: Vector3i) -> Vector3i ; qualifiers=const

Returns a new vector with all components clamped between the components of `min` and `max`, by running `@GlobalScope.clamp` on each component.

> method clampi(min: int, max: int) -> Vector3i ; qualifiers=const

Returns a new vector with all components clamped between `min` and `max`, by running `@GlobalScope.clamp` on each component.

> method distance_squared_to(to: Vector3i) -> int ; qualifiers=const

Returns the squared [Euclidean distance](https://en.wikipedia.org/wiki/Euclidean_distance) between this vector and `to`.
This method runs faster than `distance_to`, so prefer it if you need to compare vectors or need the squared distance for some formula.

> method distance_to(to: Vector3i) -> float ; qualifiers=const

Returns the [Euclidean distance](https://en.wikipedia.org/wiki/Euclidean_distance) between this vector and `to`.

> method length() -> float ; qualifiers=const

Returns the length (magnitude) of this vector.

> method length_squared() -> int ; qualifiers=const

Returns the squared length (squared magnitude) of this vector.
This method runs faster than `length`, so prefer it if you need to compare vectors or need the squared distance for some formula.

> method max(with: Vector3i) -> Vector3i ; qualifiers=const

Returns the component-wise maximum of this and `with`, equivalent to `Vector3i(maxi(x, with.x), maxi(y, with.y), maxi(z, with.z))`.

> method max_axis_index() -> int ; qualifiers=const

Returns the axis of the vector's highest value. See `AXIS_*` constants. If all components are equal, this method returns `AXIS_X`.

> method maxi(with: int) -> Vector3i ; qualifiers=const

Returns the component-wise maximum of this and `with`, equivalent to `Vector3i(maxi(x, with), maxi(y, with), maxi(z, with))`.

> method min(with: Vector3i) -> Vector3i ; qualifiers=const

Returns the component-wise minimum of this and `with`, equivalent to `Vector3i(mini(x, with.x), mini(y, with.y), mini(z, with.z))`.

> method min_axis_index() -> int ; qualifiers=const

Returns the axis of the vector's lowest value. See `AXIS_*` constants. If all components are equal, this method returns `AXIS_Z`.

> method mini(with: int) -> Vector3i ; qualifiers=const

Returns the component-wise minimum of this and `with`, equivalent to `Vector3i(mini(x, with), mini(y, with), mini(z, with))`.

> method sign() -> Vector3i ; qualifiers=const

Returns a new vector with each component set to `1` if it's positive, `-1` if it's negative, and `0` if it's zero. The result is identical to calling `@GlobalScope.sign` on each component.

> method snapped(step: Vector3i) -> Vector3i ; qualifiers=const

Returns a new vector with each component snapped to the closest multiple of the corresponding component in `step`.

> method snappedi(step: int) -> Vector3i ; qualifiers=const

Returns a new vector with each component snapped to the closest multiple of `step`.

## Operators

> operator !=(right: Vector3i) -> bool

Returns `true` if the vectors are not equal.

> operator %(right: Vector3i) -> Vector3i

Gets the remainder of each component of the `Vector3i` with the components of the given `Vector3i`. This operation uses truncated division, which is often not desired as it does not work well with negative numbers. Consider using `@GlobalScope.posmod` instead if you want to handle negative numbers.

```text
                print(Vector3i(10, -20, 30) % Vector3i(7, 8, 9)) # Prints (3, -4, 3)

```

> operator %(right: int) -> Vector3i

Gets the remainder of each component of the `Vector3i` with the given `int`. This operation uses truncated division, which is often not desired as it does not work well with negative numbers. Consider using `@GlobalScope.posmod` instead if you want to handle negative numbers.

```text
                print(Vector3i(10, -20, 30) % 7) # Prints (3, -6, 2)

```

> operator *(right: Vector3i) -> Vector3i

Multiplies each component of the `Vector3i` by the components of the given `Vector3i`.

```text
                print(Vector3i(10, 20, 30) * Vector3i(3, 4, 5)) # Prints (30, 80, 150)

```

> operator *(right: float) -> Vector3

Multiplies each component of the `Vector3i` by the given `float`. Returns a `Vector3`.

```text
                print(Vector3i(10, 15, 20) * 0.9) # Prints (9.0, 13.5, 18.0)

```

> operator *(right: int) -> Vector3i

Multiplies each component of the `Vector3i` by the given `int`.

> operator +(right: Vector3i) -> Vector3i

Adds each component of the `Vector3i` by the components of the given `Vector3i`.

```text
                print(Vector3i(10, 20, 30) + Vector3i(3, 4, 5)) # Prints (13, 24, 35)

```

> operator -(right: Vector3i) -> Vector3i

Subtracts each component of the `Vector3i` by the components of the given `Vector3i`.

```text
                print(Vector3i(10, 20, 30) - Vector3i(3, 4, 5)) # Prints (7, 16, 25)

```

> operator /(right: Vector3i) -> Vector3i

Divides each component of the `Vector3i` by the components of the given `Vector3i`.

```text
                print(Vector3i(10, 20, 30) / Vector3i(2, 5, 3)) # Prints (5, 4, 10)

```

> operator /(right: float) -> Vector3

Divides each component of the `Vector3i` by the given `float`. Returns a `Vector3`.

```text
                print(Vector3i(1, 2, 3) / 2.5) # Prints (0.4, 0.8, 1.2)

```

> operator /(right: int) -> Vector3i

Divides each component of the `Vector3i` by the given `int`.

> operator <(right: Vector3i) -> bool

Compares two `Vector3i` vectors by first checking if the X value of the left vector is less than the X value of the `right` vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors.

> operator <=(right: Vector3i) -> bool

Compares two `Vector3i` vectors by first checking if the X value of the left vector is less than or equal to the X value of the `right` vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors.

> operator ==(right: Vector3i) -> bool

Returns `true` if the vectors are equal.

> operator >(right: Vector3i) -> bool

Compares two `Vector3i` vectors by first checking if the X value of the left vector is greater than the X value of the `right` vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors.

> operator >=(right: Vector3i) -> bool

Compares two `Vector3i` vectors by first checking if the X value of the left vector is greater than or equal to the X value of the `right` vector. If the X values are exactly equal, then it repeats this check with the Y values of the two vectors, and then with the Z values. This operator is useful for sorting vectors.

> operator [](index: int) -> int

Access vector components using their `index`. `v[0]` is equivalent to `v.x`, `v[1]` is equivalent to `v.y`, and `v[2]` is equivalent to `v.z`.

> operator unary+() -> Vector3i

Returns the same value as if the `+` was not there. Unary `+` does nothing, but sometimes it can make your code more readable.

> operator unary-() -> Vector3i

Returns the negative value of the `Vector3i`. This is the same as writing `Vector3i(-v.x, -v.y, -v.z)`. This operation flips the direction of the vector while keeping the same magnitude.

## Enumerations

> enum Axis

> enum_value Axis.AXIS_X = 0

Enumerated value for the X axis. Returned by `max_axis_index` and `min_axis_index`.

> enum_value Axis.AXIS_Y = 1

Enumerated value for the Y axis. Returned by `max_axis_index` and `min_axis_index`.

> enum_value Axis.AXIS_Z = 2

Enumerated value for the Z axis. Returned by `max_axis_index` and `min_axis_index`.

## Constants

> constant ZERO = Vector3i(0, 0, 0)

Zero vector, a vector with all components set to `0`.

> constant ONE = Vector3i(1, 1, 1)

One vector, a vector with all components set to `1`.

> constant MIN = Vector3i(-2147483648, -2147483648, -2147483648)

Min vector, a vector with all components equal to `INT32_MIN`. Can be used as a negative integer equivalent of `Vector3.INF`.

> constant MAX = Vector3i(2147483647, 2147483647, 2147483647)

Max vector, a vector with all components equal to `INT32_MAX`. Can be used as an integer equivalent of `Vector3.INF`.

> constant LEFT = Vector3i(-1, 0, 0)

Left unit vector. Represents the local direction of left, and the global direction of west.

> constant RIGHT = Vector3i(1, 0, 0)

Right unit vector. Represents the local direction of right, and the global direction of east.

> constant UP = Vector3i(0, 1, 0)

Up unit vector.

> constant DOWN = Vector3i(0, -1, 0)

Down unit vector.

> constant FORWARD = Vector3i(0, 0, -1)

Forward unit vector. Represents the local direction of forward, and the global direction of north.

> constant BACK = Vector3i(0, 0, 1)

Back unit vector. Represents the local direction of back, and the global direction of south.

## Tutorials
- [Math documentation index]($DOCS_URL/tutorials/math/index.html)
- [Vector math]($DOCS_URL/tutorials/math/vector_math.html)
- [3Blue1Brown Essence of Linear Algebra](https://www.youtube.com/playlist?list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab)
