# Rect2

> class Rect2

## Brief

A 2D axis-aligned bounding box using floating-point coordinates.

## Description

The `Rect2` built-in `Variant` type represents an axis-aligned rectangle in a 2D space. It is defined by its `position` and `size`, which are `Vector2`. It is frequently used for fast overlap tests (see `intersects`). Although `Rect2` itself is axis-aligned, it can be combined with `Transform2D` to represent a rotated or skewed rectangle.
For integer coordinates, use `Rect2i`. The 3D equivalent to `Rect2` is `AABB`.
**Note:** Negative values for `size` are not supported. With negative size, most `Rect2` methods do not work correctly. Use `abs` to get an equivalent `Rect2` with a non-negative size.
**Note:** In a boolean context, a `Rect2` evaluates to `false` if both `position` and `size` are zero (equal to `Vector2.ZERO`). Otherwise, it always evaluates to `true`.

## Properties

> property end : Vector2 ; default=Vector2(0, 0)

The ending point. This is usually the bottom-right corner of the rectangle, and is equivalent to `position + size`. Setting this point affects the `size`.

> property position : Vector2 ; default=Vector2(0, 0)

The origin point. This is usually the top-left corner of the rectangle.

> property size : Vector2 ; default=Vector2(0, 0)

The rectangle's width and height, starting from `position`. Setting this value also affects the `end` point.
**Note:** It's recommended setting the width and height to non-negative values, as most methods in Godot assume that the `position` is the top-left corner, and the `end` is the bottom-right corner. To get an equivalent rectangle with non-negative size, use `abs`.

## Constructors

> constructor Rect2()

Constructs a `Rect2` with its `position` and `size` set to `Vector2.ZERO`.

> constructor Rect2(from: Rect2)

Constructs a `Rect2` as a copy of the given `Rect2`.

> constructor Rect2(from: Rect2i)

Constructs a `Rect2` from a `Rect2i`.

> constructor Rect2(position: Vector2, size: Vector2)

Constructs a `Rect2` by `position` and `size`.

> constructor Rect2(x: float, y: float, width: float, height: float)

Constructs a `Rect2` by setting its `position` to (`x`, `y`), and its `size` to (`width`, `height`).

## Methods

> method abs() -> Rect2 ; qualifiers=const

Returns a `Rect2` equivalent to this rectangle, with its width and height modified to be non-negative values, and with its `position` being the top-left corner of the rectangle.

```gdscript
                var rect = Rect2(25, 25, -100, -50)
                var absolute = rect.abs() # absolute is Rect2(-75, -25, 100, 50)

```

```csharp
                var rect = new Rect2(25, 25, -100, -50);
                var absolute = rect.Abs(); // absolute is Rect2(-75, -25, 100, 50)

```

**Note:** It's recommended to use this method when `size` is negative, as most other methods in Godot assume that the `position` is the top-left corner, and the `end` is the bottom-right corner.

> method encloses(b: Rect2) -> bool ; qualifiers=const

Returns `true` if this rectangle *completely* encloses the `b` rectangle.

> method expand(to: Vector2) -> Rect2 ; qualifiers=const

Returns a copy of this rectangle expanded to align the edges with the given `to` point, if necessary.

```gdscript
                var rect = Rect2(0, 0, 5, 2)

                rect = rect.expand(Vector2(10, 0)) # rect is Rect2(0, 0, 10, 2)
                rect = rect.expand(Vector2(-5, 5)) # rect is Rect2(-5, 0, 15, 5)

```

```csharp
                var rect = new Rect2(0, 0, 5, 2);

                rect = rect.Expand(new Vector2(10, 0)); // rect is Rect2(0, 0, 10, 2)
                rect = rect.Expand(new Vector2(-5, 5)); // rect is Rect2(-5, 0, 15, 5)

```

> method get_area() -> float ; qualifiers=const

Returns the rectangle's area. This is equivalent to `size.x * size.y`. See also `has_area`.

> method get_center() -> Vector2 ; qualifiers=const

Returns the center point of the rectangle. This is the same as `position + (size / 2.0)`.

> method get_support(direction: Vector2) -> Vector2 ; qualifiers=const

Returns the vertex's position of this rect that's the farthest in the given direction. This point is commonly known as the support point in collision detection algorithms.

> method grow(amount: float) -> Rect2 ; qualifiers=const

Returns a copy of this rectangle extended on all sides by the given `amount`. A negative `amount` shrinks the rectangle instead. See also `grow_individual` and `grow_side`.

```gdscript
                var a = Rect2(4, 4, 8, 8).grow(4) # a is Rect2(0, 0, 16, 16)
                var b = Rect2(0, 0, 8, 4).grow(2) # b is Rect2(-2, -2, 12, 8)

```

```csharp
                var a = new Rect2(4, 4, 8, 8).Grow(4); // a is Rect2(0, 0, 16, 16)
                var b = new Rect2(0, 0, 8, 4).Grow(2); // b is Rect2(-2, -2, 12, 8)

```

> method grow_individual(left: float, top: float, right: float, bottom: float) -> Rect2 ; qualifiers=const

Returns a copy of this rectangle with its `left`, `top`, `right`, and `bottom` sides extended by the given amounts. Negative values shrink the sides, instead. See also `grow` and `grow_side`.

> method grow_side(side: int, amount: float) -> Rect2 ; qualifiers=const

Returns a copy of this rectangle with its `side` extended by the given `amount` (see `Side` constants). A negative `amount` shrinks the rectangle, instead. See also `grow` and `grow_individual`.

> method has_area() -> bool ; qualifiers=const

Returns `true` if this rectangle has positive width and height. See also `get_area`.

> method has_point(point: Vector2) -> bool ; qualifiers=const

Returns `true` if the rectangle contains the given `point`. By convention, points on the right and bottom edges are **not** included.
**Note:** This method is not reliable for `Rect2` with a *negative* `size`. Use `abs` first to get a valid rectangle.

> method intersection(b: Rect2) -> Rect2 ; qualifiers=const

Returns the intersection between this rectangle and `b`. If the rectangles do not intersect, returns an empty `Rect2`.

```gdscript
                var rect1 = Rect2(0, 0, 5, 10)
                var rect2 = Rect2(2, 0, 8, 4)

                var a = rect1.intersection(rect2) # a is Rect2(2, 0, 3, 4)

```

```csharp
                var rect1 = new Rect2(0, 0, 5, 10);
                var rect2 = new Rect2(2, 0, 8, 4);

                var a = rect1.Intersection(rect2); // a is Rect2(2, 0, 3, 4)

```

**Note:** If you only need to know whether two rectangles are overlapping, use `intersects`, instead.

> method intersects(b: Rect2, include_borders: bool = false) -> bool ; qualifiers=const

Returns `true` if this rectangle overlaps with the `b` rectangle. The edges of both rectangles are excluded, unless `include_borders` is `true`.

> method is_equal_approx(rect: Rect2) -> bool ; qualifiers=const

Returns `true` if this rectangle and `rect` are approximately equal, by calling `Vector2.is_equal_approx` on the `position` and the `size`.

> method is_finite() -> bool ; qualifiers=const

Returns `true` if this rectangle's values are finite, by calling `Vector2.is_finite` on the `position` and the `size`.

> method merge(b: Rect2) -> Rect2 ; qualifiers=const

Returns a `Rect2` that encloses both this rectangle and `b` around the edges. See also `encloses`.

## Operators

> operator !=(right: Rect2) -> bool

Returns `true` if the `position` or `size` of both rectangles are not equal.
**Note:** Due to floating-point precision errors, consider using `is_equal_approx` instead, which is more reliable.

> operator *(right: Transform2D) -> Rect2

Inversely transforms (multiplies) the `Rect2` by the given `Transform2D` transformation matrix, under the assumption that the transformation basis is orthonormal (i.e. rotation/reflection is fine, scaling/skew is not).
`rect * transform` is equivalent to `transform.inverse() * rect`. See `Transform2D.inverse`.
For transforming by inverse of an affine transformation (e.g. with scaling) `transform.affine_inverse() * rect` can be used instead. See `Transform2D.affine_inverse`.

> operator ==(right: Rect2) -> bool

Returns `true` if both `position` and `size` of the rectangles are exactly equal, respectively.
**Note:** Due to floating-point precision errors, consider using `is_equal_approx` instead, which is more reliable.

## Tutorials
- [Math documentation index]($DOCS_URL/tutorials/math/index.html)
- [Vector math]($DOCS_URL/tutorials/math/vector_math.html)
- [Advanced vector math]($DOCS_URL/tutorials/math/vectors_advanced.html)
