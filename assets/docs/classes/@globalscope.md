# @GlobalScope

> class @GlobalScope

## Brief

Global scope constants and functions.

## Description

A list of global scope enumerated constants and built-in functions. This is all that resides in the globals, constants regarding error codes, keycodes, property hints, etc.
Singletons are also documented here, since they can be accessed from anywhere.
For the entries that can only be accessed from scripts written in GDScript, see `@GDScript`.

## Properties

> property AccessibilityServer : AccessibilityServer

The `AccessibilityServer` singleton.

> property AudioServer : AudioServer

The `AudioServer` singleton.

> property CameraServer : CameraServer

The `CameraServer` singleton.

> property ClassDB : ClassDB

The `ClassDB` singleton.

> property DisplayServer : DisplayServer

The `DisplayServer` singleton.

> property EditorInterface : EditorInterface

The `EditorInterface` singleton.
**Note:** Only available in editor builds.

> property Engine : Engine

The `Engine` singleton.

> property EngineDebugger : EngineDebugger

The `EngineDebugger` singleton.

> property GDExtensionManager : GDExtensionManager

The `GDExtensionManager` singleton.

> property GDScriptLanguageProtocol : GDScriptLanguageProtocol

The `GDScriptLanguageProtocol` singleton.
**Note:** Only available in editor builds.

> property Geometry2D : Geometry2D

The `Geometry2D` singleton.

> property Geometry3D : Geometry3D

The `Geometry3D` singleton.

> property IP : IP

The `IP` singleton.

> property Input : Input

The `Input` singleton.

> property InputMap : InputMap

The `InputMap` singleton.

> property JavaClassWrapper : JavaClassWrapper

The `JavaClassWrapper` singleton.
**Note:** Only implemented on Android.

> property JavaScriptBridge : JavaScriptBridge

The `JavaScriptBridge` singleton.
**Note:** Only implemented on the Web platform.

> property Marshalls : Marshalls

The `Marshalls` singleton.

> property NativeMenu : NativeMenu

The `NativeMenu` singleton.
**Note:** Only implemented on macOS.

> property NavigationMeshGenerator : NavigationMeshGenerator

The `NavigationMeshGenerator` singleton.

> property NavigationServer2D : NavigationServer2D

The `NavigationServer2D` singleton.

> property NavigationServer2DManager : NavigationServer2DManager

The `NavigationServer2DManager` singleton.

> property NavigationServer3D : NavigationServer3D

The `NavigationServer3D` singleton.

> property NavigationServer3DManager : NavigationServer3DManager

The `NavigationServer3DManager` singleton.

> property OS : OS

The `OS` singleton.

> property Performance : Performance

The `Performance` singleton.

> property PhysicsServer2D : PhysicsServer2D

The `PhysicsServer2D` singleton.

> property PhysicsServer2DManager : PhysicsServer2DManager

The `PhysicsServer2DManager` singleton.

> property PhysicsServer3D : PhysicsServer3D

The `PhysicsServer3D` singleton.

> property PhysicsServer3DManager : PhysicsServer3DManager

The `PhysicsServer3DManager` singleton.

> property ProjectSettings : ProjectSettings

The `ProjectSettings` singleton.

> property RenderingServer : RenderingServer

The `RenderingServer` singleton.

> property ResourceLoader : ResourceLoader

The `ResourceLoader` singleton.

> property ResourceSaver : ResourceSaver

The `ResourceSaver` singleton.

> property ResourceUID : ResourceUID

The `ResourceUID` singleton.

> property TextServerManager : TextServerManager

The `TextServerManager` singleton.

> property ThemeDB : ThemeDB

The `ThemeDB` singleton.

> property Time : Time

The `Time` singleton.

> property TranslationServer : TranslationServer

The `TranslationServer` singleton.

> property WorkerThreadPool : WorkerThreadPool

The `WorkerThreadPool` singleton.

> property XRServer : XRServer

The `XRServer` singleton.

## Methods

> method abs(x: Variant) -> Variant

Returns the absolute value of a `Variant` parameter `x` (i.e. non-negative value). Supported types: `int`, `float`, `Vector2`, `Vector2i`, `Vector3`, `Vector3i`, `Vector4`, `Vector4i`.

```text
                var a = abs(-1)
                # a is 1

                var b = abs(-1.2)
                # b is 1.2

                var c = abs(Vector2(-3.5, -4))
                # c is (3.5, 4)

                var d = abs(Vector2i(-5, -6))
                # d is (5, 6)

                var e = abs(Vector3(-7, 8.5, -3.8))
                # e is (7, 8.5, 3.8)

                var f = abs(Vector3i(-7, -8, -9))
                # f is (7, 8, 9)

```

**Note:** For better type safety, use `absf`, `absi`, `Vector2.abs`, `Vector2i.abs`, `Vector3.abs`, `Vector3i.abs`, `Vector4.abs`, or `Vector4i.abs`.

> method absf(x: float) -> float

Returns the absolute value of float parameter `x` (i.e. positive value).

```text
                # a is 1.2
                var a = absf(-1.2)

```

> method absi(x: int) -> int

Returns the absolute value of int parameter `x` (i.e. positive value).

```text
                # a is 1
                var a = absi(-1)

```

> method acos(x: float) -> float

Returns the arc cosine of `x` in radians. Use to get the angle of cosine `x`. `x` will be clamped between `-1.0` and `1.0` (inclusive), in order to prevent `acos` from returning `@GDScript.NAN`.

```text
                # c is 0.523599 or 30 degrees if converted with rad_to_deg(c)
                var c = acos(0.866025)

```

> method acosh(x: float) -> float

Returns the hyperbolic arc (also called inverse) cosine of `x`, returning a value in radians. Use it to get the angle from an angle's cosine in hyperbolic space if `x` is larger or equal to 1. For values of `x` lower than 1, it will return 0, in order to prevent `acosh` from returning `@GDScript.NAN`.

```text
                var a = acosh(2) # Returns 1.31695789692482
                cosh(a) # Returns 2

                var b = acosh(-1) # Returns 0

```

> method angle_difference(from: float, to: float) -> float

Returns the difference between the two angles (in radians), in the range of `[-PI, +PI]`. When `from` and `to` are opposite, returns `-PI` if `from` is smaller than `to`, or `PI` otherwise.

> method asin(x: float) -> float

Returns the arc sine of `x` in radians. Use to get the angle of sine `x`. `x` will be clamped between `-1.0` and `1.0` (inclusive), in order to prevent `asin` from returning `@GDScript.NAN`.

```text
                # s is 0.523599 or 30 degrees if converted with rad_to_deg(s)
                var s = asin(0.5)

```

> method asinh(x: float) -> float

Returns the hyperbolic arc (also called inverse) sine of `x`, returning a value in radians. Use it to get the angle from an angle's sine in hyperbolic space.

```text
                var a = asinh(0.9) # Returns 0.8088669356527824
                sinh(a) # Returns 0.9

```

> method atan(x: float) -> float

Returns the arc tangent of `x` in radians. Use it to get the angle from an angle's tangent in trigonometry.
The method cannot know in which quadrant the angle should fall. See `atan2` if you have both `y` and `x`.

```text
                var a = atan(0.5) # a is 0.463648

```

If `x` is between `-PI / 2` and `PI / 2` (inclusive), `atan(tan(x))` is equal to `x`.

> method atan2(y: float, x: float) -> float

Returns the arc tangent of `y/x` in radians. Use to get the angle of tangent `y/x`. To compute the value, the method takes into account the sign of both arguments in order to determine the quadrant.
Important note: The Y coordinate comes first, by convention.

```text
                var a = atan2(0, -1) # a is 3.141593

```

> method atanh(x: float) -> float

Returns the hyperbolic arc (also called inverse) tangent of `x`, returning a value in radians. Use it to get the angle from an angle's tangent in hyperbolic space if `x` is between -1 and 1 (non-inclusive).
In mathematics, the inverse hyperbolic tangent is only defined for -1 < `x` < 1 in the real set, so values equal or lower to -1 for `x` return negative `@GDScript.INF` and values equal or higher than 1 return positive `@GDScript.INF` in order to prevent `atanh` from returning `@GDScript.NAN`.

```text
                var a = atanh(0.9) # Returns 1.47221948958322
                tanh(a) # Returns 0.9

                var b = atanh(-2) # Returns -inf
                tanh(b) # Returns -1

```

> method bezier_derivative(start: float, control_1: float, control_2: float, end: float, t: float) -> float

Returns the derivative at the given `t` on a one-dimensional [Bézier curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) defined by the given `control_1`, `control_2`, and `end` points.

> method bezier_interpolate(start: float, control_1: float, control_2: float, end: float, t: float) -> float

Returns the point at the given `t` on a one-dimensional [Bézier curve](https://en.wikipedia.org/wiki/B%C3%A9zier_curve) defined by the given `control_1`, `control_2`, and `end` points.

> method bytes_to_var(bytes: PackedByteArray) -> Variant

Decodes a byte array back to a `Variant` value, without decoding objects.
**Note:** If you need object deserialization, see `bytes_to_var_with_objects`.

> method bytes_to_var_with_objects(bytes: PackedByteArray) -> Variant

Decodes a byte array back to a `Variant` value. Decoding objects is allowed.
**Warning:** Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).

> method ceil(x: Variant) -> Variant

Rounds `x` upward (towards positive infinity), returning the smallest whole number that is not less than `x`. Supported types: `int`, `float`, `Vector2`, `Vector2i`, `Vector3`, `Vector3i`, `Vector4`, `Vector4i`.

```text
                var i = ceil(1.45) # i is 2.0
                i = ceil(1.001)    # i is 2.0

```

See also `floor`, `round`, and `snapped`.
**Note:** For better type safety, use `ceilf`, `ceili`, `Vector2.ceil`, `Vector3.ceil`, or `Vector4.ceil`.

> method ceilf(x: float) -> float

Rounds `x` upward (towards positive infinity), returning the smallest whole number that is not less than `x`.
A type-safe version of `ceil`, returning a `float`.

> method ceili(x: float) -> int

Rounds `x` upward (towards positive infinity), returning the smallest whole number that is not less than `x`.
A type-safe version of `ceil`, returning an `int`.

> method clamp(value: Variant, min: Variant, max: Variant) -> Variant

Clamps the `value`, returning a `Variant` not less than `min` and not more than `max`. Any values that can be compared with the less than and greater than operators will work.

```text
                var a = clamp(-10, -1, 5)
                # a is -1

                var b = clamp(8.1, 0.9, 5.5)
                # b is 5.5

```

**Note:** For better type safety, use `clampf`, `clampi`, `Vector2.clamp`, `Vector2i.clamp`, `Vector3.clamp`, `Vector3i.clamp`, `Vector4.clamp`, `Vector4i.clamp`, or `Color.clamp` (not currently supported by this method).
**Note:** When using this on vectors it will *not* perform component-wise clamping, and will pick `min` if `value < min` or `max` if `value > max`. To perform component-wise clamping use the methods listed above.

> method clampf(value: float, min: float, max: float) -> float

Clamps the `value`, returning a `float` not less than `min` and not more than `max`.

```text
                var speed = 42.1
                var a = clampf(speed, 1.0, 20.5) # a is 20.5

                speed = -10.0
                var b = clampf(speed, -1.0, 1.0) # b is -1.0

```

> method clampi(value: int, min: int, max: int) -> int

Clamps the `value`, returning an `int` not less than `min` and not more than `max`.

```text
                var speed = 42
                var a = clampi(speed, 1, 20) # a is 20

                speed = -10
                var b = clampi(speed, -1, 1) # b is -1

```

> method cos(angle_rad: float) -> float

Returns the cosine of angle `angle_rad` in radians.

```text
                cos(PI * 2)         # Returns 1.0
                cos(PI)             # Returns -1.0
                cos(deg_to_rad(90)) # Returns 0.0

```

> method cosh(x: float) -> float

Returns the hyperbolic cosine of `x` in radians.

```text
                print(cosh(1)) # Prints 1.543081

```

> method cubic_interpolate(from: float, to: float, pre: float, post: float, weight: float) -> float

Cubic interpolates between two values by the factor defined in `weight` with `pre` and `post` values.

> method cubic_interpolate_angle(from: float, to: float, pre: float, post: float, weight: float) -> float

Cubic interpolates between two rotation values with shortest path by the factor defined in `weight` with `pre` and `post` values. See also `lerp_angle`.

> method cubic_interpolate_angle_in_time(from: float, to: float, pre: float, post: float, weight: float, to_t: float, pre_t: float, post_t: float) -> float

Cubic interpolates between two rotation values with shortest path by the factor defined in `weight` with `pre` and `post` values. See also `lerp_angle`.
It can perform smoother interpolation than `cubic_interpolate` by the time values.

> method cubic_interpolate_in_time(from: float, to: float, pre: float, post: float, weight: float, to_t: float, pre_t: float, post_t: float) -> float

Cubic interpolates between two values by the factor defined in `weight` with `pre` and `post` values.
It can perform smoother interpolation than `cubic_interpolate` by the time values.

> method db_to_linear(db: float) -> float

Converts from decibels to linear energy (audio).

> method deg_to_rad(deg: float) -> float

Converts an angle expressed in degrees to radians.

```text
                var r = deg_to_rad(180) # r is 3.141593

```

> method ease(x: float, curve: float) -> float

Returns an "eased" value of `x` based on an easing function defined with `curve`. This easing function is based on an exponent. The `curve` can be any floating-point number, with specific values leading to the following behaviors:

```text
                - Lower than -1.0 (exclusive): Ease in-out
                - -1.0: Linear
                - Between -1.0 and 0.0 (exclusive): Ease out-in
                - 0.0: Constant
                - Between 0.0 to 1.0 (exclusive): Ease out
                - 1.0: Linear
                - Greater than 1.0 (exclusive): Ease in

```

[ease() curve values cheatsheet](https://raw.githubusercontent.com/godotengine/godot-docs/master/img/ease_cheatsheet.png)
See also `smoothstep`. If you need to perform more advanced transitions, use `Tween.interpolate_value`.

> method error_string(error: int) -> String

Returns a human-readable name for the given `Error` code.

```text
                print(OK)                              # Prints 0
                print(error_string(OK))                # Prints "OK"
                print(error_string(ERR_BUSY))          # Prints "Busy"
                print(error_string(ERR_OUT_OF_MEMORY)) # Prints "Out of memory"

```

> method exp(x: float) -> float

The natural exponential function. It raises the mathematical constant *e* to the power of `x` and returns it.
*e* has an approximate value of 2.71828, and can be obtained with `exp(1)`.
For exponents to other bases use the method `pow`.

```text
                var a = exp(2) # Approximately 7.39

```

> method floor(x: Variant) -> Variant

Rounds `x` downward (towards negative infinity), returning the largest whole number that is not more than `x`. Supported types: `int`, `float`, `Vector2`, `Vector2i`, `Vector3`, `Vector3i`, `Vector4`, `Vector4i`.

```text
                var a = floor(2.99) # a is 2.0
                a = floor(-2.99)    # a is -3.0

```

See also `ceil`, `round`, and `snapped`.
**Note:** For better type safety, use `floorf`, `floori`, `Vector2.floor`, `Vector3.floor`, or `Vector4.floor`.

> method floorf(x: float) -> float

Rounds `x` downward (towards negative infinity), returning the largest whole number that is not more than `x`.
A type-safe version of `floor`, returning a `float`.

> method floori(x: float) -> int

Rounds `x` downward (towards negative infinity), returning the largest whole number that is not more than `x`.
A type-safe version of `floor`, returning an `int`.
**Note:** This function is *not* the same as `int(x)`, which rounds towards 0.

> method fmod(x: float, y: float) -> float

Returns the floating-point remainder of `x` divided by `y`, keeping the sign of `x`.

```text
                var remainder = fmod(7, 5.5) # remainder is 1.5

```

For the integer remainder operation, use the `%` operator.

> method fposmod(x: float, y: float) -> float

Returns the floating-point modulus of `x` divided by `y`, wrapping equally in positive and negative.

```text
                print(" (x)  (fmod(x, 1.5))   (fposmod(x, 1.5))")
                for i in 7:
                    var x = i * 0.5 - 1.5
                    print("%4.1f           %4.1f  | %4.1f" % [x, fmod(x, 1.5), fposmod(x, 1.5)])

```

Prints:

```text
                 (x)  (fmod(x, 1.5))   (fposmod(x, 1.5))
                -1.5           -0.0  |  0.0
                -1.0           -1.0  |  0.5
                -0.5           -0.5  |  1.0
                 0.0            0.0  |  0.0
                 0.5            0.5  |  0.5
                 1.0            1.0  |  1.0
                 1.5            0.0  |  0.0

```

> method hash(variable: Variant) -> int

Returns the integer hash of the passed `variable`.

```gdscript
                print(hash("a")) # Prints 177670

```

```csharp
                GD.Print(GD.Hash("a")); // Prints 177670

```

> method instance_from_id(instance_id: int) -> Object

Returns the `Object` that corresponds to `instance_id`. All Objects have a unique instance ID. See also `Object.get_instance_id`.

```gdscript
                var drink = "water"

                func _ready():
                    var id = get_instance_id()
                    var instance = instance_from_id(id)
                    print(instance.drink) # Prints "water"

```

```csharp
                public partial class MyNode : Node
                {
                    public string Drink { get; set; } = "water";

                    public override void _Ready()
                    {
                        ulong id = GetInstanceId();
                        var instance = (MyNode)InstanceFromId(Id);
                        GD.Print(instance.Drink); // Prints "water"
                    }
                }

```

> method inverse_lerp(from: float, to: float, weight: float) -> float

Returns an interpolation or extrapolation factor considering the range specified in `from` and `to`, and the interpolated value specified in `weight`. The returned value will be between `0.0` and `1.0` if `weight` is between `from` and `to` (inclusive). If `weight` is located outside this range, then an extrapolation factor will be returned (return value lower than `0.0` or greater than `1.0`). Use `clamp` on the result of `inverse_lerp` if this is not desired.

```text
                # The interpolation ratio in the `lerp()` call below is 0.75.
                var middle = lerp(20, 30, 0.75)
                # middle is now 27.5.

                # Now, we pretend to have forgotten the original ratio and want to get it back.
                var ratio = inverse_lerp(20, 30, 27.5)
                # ratio is now 0.75.

```

See also `lerp`, which performs the reverse of this operation, and `remap` to map a continuous series of values to another.

> method is_equal_approx(a: float, b: float) -> bool

Returns `true` if `a` and `b` are approximately equal to each other.
Here, "approximately equal" means that `a` and `b` are within a small internal epsilon of each other, which scales with the magnitude of the numbers.
Infinity values of the same sign are considered equal.

> method is_finite(x: float) -> bool

Returns whether `x` is a finite value, i.e. it is not `@GDScript.NAN`, positive infinity, or negative infinity. See also `is_inf` and `is_nan`.

> method is_inf(x: float) -> bool

Returns `true` if `x` is either positive infinity or negative infinity. See also `is_finite` and `is_nan`.

> method is_instance_id_valid(id: int) -> bool

Returns `true` if the Object that corresponds to `id` is a valid object (e.g. has not been deleted from memory). All Objects have a unique instance ID.

> method is_instance_valid(instance: Variant) -> bool

Returns `true` if `instance` is a valid Object (e.g. has not been deleted from memory).

> method is_nan(x: float) -> bool

Returns `true` if `x` is a NaN ("Not a Number" or invalid) value. This method is needed as `@GDScript.NAN` is not equal to itself, which means `x == NAN` can't be used to check whether a value is a NaN.

> method is_same(a: Variant, b: Variant) -> bool

Returns `true`, for value types, if `a` and `b` share the same value. Returns `true`, for reference types, if the references of `a` and `b` are the same.

```text
                # Vector2 is a value type
                var vec2_a = Vector2(0, 0)
                var vec2_b = Vector2(0, 0)
                var vec2_c = Vector2(1, 1)
                is_same(vec2_a, vec2_a)  # true
                is_same(vec2_a, vec2_b)  # true
                is_same(vec2_a, vec2_c)  # false

                # Array is a reference type
                var arr_a = []
                var arr_b = []
                is_same(arr_a, arr_a)  # true
                is_same(arr_a, arr_b)  # false

```

These are `Variant` value types: `null`, `bool`, `int`, `float`, `String`, `StringName`, `Vector2`, `Vector2i`, `Vector3`, `Vector3i`, `Vector4`, `Vector4i`, `Rect2`, `Rect2i`, `Transform2D`, `Transform3D`, `Plane`, `Quaternion`, `AABB`, `Basis`, `Projection`, `Color`, `NodePath`, `RID`, `Callable` and `Signal`.
These are `Variant` reference types: `Object`, `Dictionary`, `Array`, `PackedByteArray`, `PackedInt32Array`, `PackedInt64Array`, `PackedFloat32Array`, `PackedFloat64Array`, `PackedStringArray`, `PackedVector2Array`, `PackedVector3Array`, `PackedVector4Array`, and `PackedColorArray`.

> method is_zero_approx(x: float) -> bool

Returns `true` if `x` is zero or almost zero. The comparison is done using a tolerance calculation with a small internal epsilon.
This function is faster than using `is_equal_approx` with one value as zero.

> method lerp(from: Variant, to: Variant, weight: Variant) -> Variant

Linearly interpolates between two values by the factor defined in `weight`. To perform interpolation, `weight` should be between `0.0` and `1.0` (inclusive). However, values outside this range are allowed and can be used to perform *extrapolation*. If this is not desired, use `clampf` to limit `weight`.
Both `from` and `to` must be the same type. Supported types: `int`, `float`, `Vector2`, `Vector3`, `Vector4`, `Color`, `Quaternion`, `Basis`, `Transform2D`, `Transform3D`.

```text
                lerp(0, 4, 0.75) # Returns 3.0

```

See also `inverse_lerp` which performs the reverse of this operation. To perform eased interpolation with `lerp`, combine it with `ease` or `smoothstep`. See also `remap` to map a continuous series of values to another.
**Note:** For better type safety, use `lerpf`, `Vector2.lerp`, `Vector3.lerp`, `Vector4.lerp`, `Color.lerp`, `Quaternion.slerp`, `Basis.slerp`, `Transform2D.interpolate_with`, or `Transform3D.interpolate_with`.

> method lerp_angle(from: float, to: float, weight: float) -> float

Linearly interpolates between two angles (in radians) by a `weight` value between 0.0 and 1.0.
Similar to `lerp`, but interpolates correctly when the angles wrap around `@GDScript.TAU`. To perform eased interpolation with `lerp_angle`, combine it with `ease` or `smoothstep`.

```text
                extends Sprite
                var elapsed = 0.0
                func _process(delta):
                    var min_angle = deg_to_rad(0.0)
                    var max_angle = deg_to_rad(90.0)
                    rotation = lerp_angle(min_angle, max_angle, elapsed)
                    elapsed += delta

```

**Note:** This function lerps through the shortest path between `from` and `to`. However, when these two angles are approximately `PI + k * TAU` apart for any integer `k`, it's not obvious which way they lerp due to floating-point precision errors. For example, `lerp_angle(0, PI, weight)` lerps counter-clockwise, while `lerp_angle(0, PI + 5 * TAU, weight)` lerps clockwise.

> method lerpf(from: float, to: float, weight: float) -> float

Linearly interpolates between two values by the factor defined in `weight`. To perform interpolation, `weight` should be between `0.0` and `1.0` (inclusive). However, values outside this range are allowed and can be used to perform *extrapolation*. If this is not desired, use `clampf` on the result of this function.

```text
                lerpf(0, 4, 0.75) # Returns 3.0

```

See also `inverse_lerp` which performs the reverse of this operation. To perform eased interpolation with `lerp`, combine it with `ease` or `smoothstep`.

> method linear_to_db(lin: float) -> float

Converts from linear energy to decibels (audio). Since volume is not normally linear, this can be used to implement volume sliders that behave as expected.
**Example:** Change the Master bus's volume through a `Slider` node, which ranges from `0.0` to `1.0`:

```text
                AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db($Slider.value))

```

> method log(x: float) -> float

Returns the [natural logarithm](https://en.wikipedia.org/wiki/Natural_logarithm) of `x` (base [e](https://en.wikipedia.org/wiki/E_(mathematical_constant)), with *e* being approximately 2.71828). This is the amount of time needed to reach a certain level of continuous growth.
**Note:** This is not the same as the "log" function on most calculators, which uses a base 10 logarithm. To use base 10 logarithm, use `log(x) / log(10)`.

```text
                log(10) # Returns 2.302585

```

**Note:** The logarithm of `0` returns `-inf`, while negative values return `-nan`.

> method max() -> Variant ; qualifiers=vararg

Returns the maximum of the given numeric values. This function can take any number of arguments.

```text
                max(1, 7, 3, -6, 5) # Returns 7

```

**Note:** When using this on vectors it will *not* perform component-wise maximum, and will pick the largest value when compared using `x < y`. To perform component-wise maximum, use `Vector2.max`, `Vector2i.max`, `Vector3.max`, `Vector3i.max`, `Vector4.max`, and `Vector4i.max`.

> method maxf(a: float, b: float) -> float

Returns the maximum of two `float` values.

```text
                maxf(3.6, 24)   # Returns 24.0
                maxf(-3.99, -4) # Returns -3.99

```

> method maxi(a: int, b: int) -> int

Returns the maximum of two `int` values.

```text
                maxi(1, 2)   # Returns 2
                maxi(-3, -4) # Returns -3

```

> method min() -> Variant ; qualifiers=vararg

Returns the minimum of the given numeric values. This function can take any number of arguments.

```text
                min(1, 7, 3, -6, 5) # Returns -6

```

**Note:** When using this on vectors it will *not* perform component-wise minimum, and will pick the smallest value when compared using `x < y`. To perform component-wise minimum, use `Vector2.min`, `Vector2i.min`, `Vector3.min`, `Vector3i.min`, `Vector4.min`, and `Vector4i.min`.

> method minf(a: float, b: float) -> float

Returns the minimum of two `float` values.

```text
                minf(3.6, 24)   # Returns 3.6
                minf(-3.99, -4) # Returns -4.0

```

> method mini(a: int, b: int) -> int

Returns the minimum of two `int` values.

```text
                mini(1, 2)   # Returns 1
                mini(-3, -4) # Returns -4

```

> method move_toward(from: float, to: float, delta: float) -> float

Moves `from` toward `to` by the `delta` amount. Will not go past `to`.
Use a negative `delta` value to move away.

```text
                move_toward(5, 10, 4)    # Returns 9
                move_toward(10, 5, 4)    # Returns 6
                move_toward(5, 10, 9)    # Returns 10
                move_toward(10, 5, -1.5) # Returns 11.5

```

> method nearest_po2(value: int) -> int

Returns the smallest integer power of 2 that is greater than or equal to `value`.

```text
                nearest_po2(3) # Returns 4
                nearest_po2(4) # Returns 4
                nearest_po2(5) # Returns 8

                nearest_po2(0)  # Returns 0 (this may not be expected)
                nearest_po2(-1) # Returns 0 (this may not be expected)

```

**Warning:** Due to its implementation, this method returns `0` rather than `1` for values less than or equal to `0`, with an exception for `value` being the smallest negative 64-bit integer (`-9223372036854775808`) in which case the `value` is returned unchanged.

> method pingpong(value: float, length: float) -> float

Wraps `value` between `0` and the `length`. If the limit is reached, the next value the function returns is decreased to the `0` side or increased to the `length` side (like a triangle wave). If `length` is less than zero, it becomes positive.

```text
                pingpong(-3.0, 3.0) # Returns 3.0
                pingpong(-2.0, 3.0) # Returns 2.0
                pingpong(-1.0, 3.0) # Returns 1.0
                pingpong(0.0, 3.0)  # Returns 0.0
                pingpong(1.0, 3.0)  # Returns 1.0
                pingpong(2.0, 3.0)  # Returns 2.0
                pingpong(3.0, 3.0)  # Returns 3.0
                pingpong(4.0, 3.0)  # Returns 2.0
                pingpong(5.0, 3.0)  # Returns 1.0
                pingpong(6.0, 3.0)  # Returns 0.0

```

> method posmod(x: int, y: int) -> int

Returns the integer modulus of `x` divided by `y` that wraps equally in positive and negative.

```text
                print("#(i)  (i % 3)   (posmod(i, 3))")
                for i in range(-3, 4):
                    print("%2d       %2d  | %2d" % [i, i % 3, posmod(i, 3)])

```

Prints:

```text
                (i)  (i % 3)   (posmod(i, 3))
                -3        0  |  0
                -2       -2  |  1
                -1       -1  |  2
                 0        0  |  0
                 1        1  |  1
                 2        2  |  2
                 3        0  |  0

```

> method pow(base: float, exp: float) -> float

Returns the result of `base` raised to the power of `exp`.
In GDScript, this is the equivalent of the `**` operator.

```text
                pow(2, 5)   # Returns 32.0
                pow(4, 1.5) # Returns 8.0

```

> method print() -> void ; qualifiers=vararg

Converts one or more arguments of any type to string in the best way possible and prints them to the console.

```gdscript
                var a = [1, 2, 3]
                print("a", "b", a) # Prints "ab[1, 2, 3]"

```

```csharp
                Godot.Collections.Array a = [1, 2, 3];
                GD.Print("a", "b", a); // Prints "ab[1, 2, 3]"

```

**Note:** Consider using `push_error` and `push_warning` to print error and warning messages instead of `print` or `print_rich`. This distinguishes them from print messages used for debugging purposes, while also displaying a stack trace when an error or warning is printed. See also `Engine.print_to_stdout` and `ProjectSettings.application/run/disable_stdout`.

> method print_rich() -> void ; qualifiers=vararg

Converts one or more arguments of any type to string in the best way possible and prints them to the console.
The following BBCode tags are supported: `b`, `i`, `u`, `s`, `indent`, `code`, `url`, `center`, `right`, `color`, `bgcolor`, `fgcolor`.
URL tags only support URLs wrapped by a URL tag, not URLs with a different title.
When printing to standard output, the supported subset of BBCode is converted to ANSI escape codes for the terminal emulator to display. Support for ANSI escape codes varies across terminal emulators, especially for italic and strikethrough. In standard output, `code` is represented with faint text but without any font change. Unsupported tags are left as-is in standard output.

```gdscript
                print_rich("[color=green][b]Hello world![/b][/color]") # Prints "Hello world!", in green with a bold font.

```

```csharp
                GD.PrintRich("[color=green][b]Hello world![/b][/color]"); // Prints "Hello world!", in green with a bold font.

```

**Note:** Consider using `push_error` and `push_warning` to print error and warning messages instead of `print` or `print_rich`. This distinguishes them from print messages used for debugging purposes, while also displaying a stack trace when an error or warning is printed.
**Note:** Output displayed in the editor supports clickable `[url=address]text[/url]` tags. The `[url]` tag's `address` value is handled by `OS.shell_open` when clicked.

> method print_verbose() -> void ; qualifiers=vararg

If verbose mode is enabled (`OS.is_stdout_verbose` returning `true`), converts one or more arguments of any type to string in the best way possible and prints them to the console.

> method printerr() -> void ; qualifiers=vararg

Prints one or more arguments to strings in the best way possible to standard error line.

```gdscript
                printerr("prints to stderr")

```

```csharp
                GD.PrintErr("prints to stderr");

```

> method printraw() -> void ; qualifiers=vararg

Prints one or more arguments to strings in the best way possible to the OS terminal. Unlike `print`, no newline is automatically added at the end.
**Note:** The OS terminal is *not* the same as the editor's Output dock. The output sent to the OS terminal can be seen when running Godot from a terminal. On Windows, this requires using the `console.exe` executable.

```gdscript
                # Prints "ABC" to terminal.
                printraw("A")
                printraw("B")
                printraw("C")

```

```csharp
                // Prints "ABC" to terminal.
                GD.PrintRaw("A");
                GD.PrintRaw("B");
                GD.PrintRaw("C");

```

> method prints() -> void ; qualifiers=vararg

Prints one or more arguments to the console with a space between each argument.

```gdscript
                prints("A", "B", "C") # Prints "A B C"

```

```csharp
                GD.PrintS("A", "B", "C"); // Prints "A B C"

```

> method printt() -> void ; qualifiers=vararg

Prints one or more arguments to the console with a tab between each argument.

```gdscript
                printt("A", "B", "C") # Prints "A       B       C"

```

```csharp
                GD.PrintT("A", "B", "C"); // Prints "A       B       C"

```

> method push_error() -> void ; qualifiers=vararg

Pushes an error message to Godot's built-in debugger and to the OS terminal.

```gdscript
                push_error("test error") # Prints "test error" to debugger and terminal as an error.

```

```csharp
                GD.PushError("test error"); // Prints "test error" to debugger and terminal as an error.

```

**Note:** This function does not pause project execution. To print an error message and pause project execution in debug builds, use `assert(false, "test error")` instead.

> method push_warning() -> void ; qualifiers=vararg

Pushes a warning message to Godot's built-in debugger and to the OS terminal.

```gdscript
                push_warning("test warning") # Prints "test warning" to debugger and terminal as a warning.

```

```csharp
                GD.PushWarning("test warning"); // Prints "test warning" to debugger and terminal as a warning.

```

> method rad_to_deg(rad: float) -> float

Converts an angle expressed in radians to degrees.

```text
                rad_to_deg(0.523599) # Returns 30
                rad_to_deg(PI)       # Returns 180
                rad_to_deg(PI * 2)   # Returns 360

```

> method rand_from_seed(seed: int) -> PackedInt64Array

Given a `seed`, returns a `PackedInt64Array` of size `2`, where its first element is the randomized `int` value, and the second element is the same as `seed`. Passing the same `seed` consistently returns the same array.
**Note:** "Seed" here refers to the internal state of the pseudo random number generator, currently implemented as a 64 bit integer.

```text
                var a = rand_from_seed(4)

                print(a[0]) # Prints 2879024997
                print(a[1]) # Prints 4

```

> method randf() -> float

Returns a random floating-point value between `0.0` and `1.0` (inclusive).

```gdscript
                randf() # Returns e.g. 0.375671

```

```csharp
                GD.Randf(); // Returns e.g. 0.375671

```

> method randf_range(from: float, to: float) -> float

Returns a random floating-point value between `from` and `to` (inclusive).

```gdscript
                randf_range(0, 20.5) # Returns e.g. 7.45315
                randf_range(-10, 10) # Returns e.g. -3.844535

```

```csharp
                GD.RandRange(0.0, 20.5);   // Returns e.g. 7.45315
                GD.RandRange(-10.0, 10.0); // Returns e.g. -3.844535

```

> method randfn(mean: float, deviation: float) -> float

Returns a [normally-distributed](https://en.wikipedia.org/wiki/Normal_distribution), pseudo-random floating-point value from the specified `mean` and a standard `deviation`. This is also known as a Gaussian distribution.
**Note:** This method uses the [Box-Muller transform](https://en.wikipedia.org/wiki/Box%E2%80%93Muller_transform) algorithm.

> method randi() -> int

Returns a random unsigned 32-bit integer. Use remainder to obtain a random value in the interval `[0, N - 1]` (where N is smaller than 2^32).

```gdscript
                randi()           # Returns random integer between 0 and 2^32 - 1
                randi() % 20      # Returns random integer between 0 and 19
                randi() % 100     # Returns random integer between 0 and 99
                randi() % 100 + 1 # Returns random integer between 1 and 100

```

```csharp
                GD.Randi();           // Returns random integer between 0 and 2^32 - 1
                GD.Randi() % 20;      // Returns random integer between 0 and 19
                GD.Randi() % 100;     // Returns random integer between 0 and 99
                GD.Randi() % 100 + 1; // Returns random integer between 1 and 100

```

> method randi_range(from: int, to: int) -> int

Returns a random signed 32-bit integer between `from` and `to` (inclusive). If `to` is lesser than `from`, they are swapped.

```gdscript
                randi_range(0, 1)      # Returns either 0 or 1
                randi_range(-10, 1000) # Returns random integer between -10 and 1000

```

```csharp
                GD.RandRange(0, 1);      // Returns either 0 or 1
                GD.RandRange(-10, 1000); // Returns random integer between -10 and 1000

```

> method randomize() -> void

Randomizes the seed (or the internal state) of the random number generator. The current implementation uses a number based on the device's time.
**Note:** This function is called automatically when the project is run. If you need to fix the seed to have consistent, reproducible results, use `seed` to initialize the random number generator.

> method remap(value: float, istart: float, istop: float, ostart: float, ostop: float) -> float

Maps a `value` from range `[istart, istop]` to `[ostart, ostop]`. See also `lerp` and `inverse_lerp`. If `value` is outside `[istart, istop]`, then the resulting value will also be outside `[ostart, ostop]`. If this is not desired, use `clamp` on the result of this function.

```text
                remap(75, 0, 100, -1, 1) # Returns 0.5

```

For complex use cases where multiple ranges are needed, consider using `Curve` or `Gradient` instead.
**Note:** If `istart == istop`, the return value is undefined (most likely NaN, INF, or -INF).

> method rid_allocate_id() -> int

Allocates a unique ID which can be used by the implementation to construct an RID. This is used mainly from native extensions to implement servers.

> method rid_from_int64(base: int) -> RID

Creates an RID from a `base`. This is used mainly from native extensions to build servers.

> method rotate_toward(from: float, to: float, delta: float) -> float

Rotates `from` toward `to` by the `delta` amount. Will not go past `to`.
Similar to `move_toward`, but interpolates correctly when the angles wrap around `@GDScript.TAU`.
If `delta` is negative, this function will rotate away from `to`, toward the opposite angle, and will not go past the opposite angle.

> method round(x: Variant) -> Variant

Rounds `x` to the nearest whole number, with halfway cases rounded away from 0. Supported types: `int`, `float`, `Vector2`, `Vector2i`, `Vector3`, `Vector3i`, `Vector4`, `Vector4i`.

```text
                round(2.4) # Returns 2
                round(2.5) # Returns 3
                round(2.6) # Returns 3

```

See also `floor`, `ceil`, and `snapped`.
**Note:** For better type safety, use `roundf`, `roundi`, `Vector2.round`, `Vector3.round`, or `Vector4.round`.

> method roundf(x: float) -> float

Rounds `x` to the nearest whole number, with halfway cases rounded away from 0.
A type-safe version of `round`, returning a `float`.

> method roundi(x: float) -> int

Rounds `x` to the nearest whole number, with halfway cases rounded away from 0.
A type-safe version of `round`, returning an `int`.

> method seed(base: int) -> void

Sets the seed for the random number generator to `base`. Setting the seed manually can ensure consistent, repeatable results for most random functions.

```gdscript
                var my_seed = "Godot Rocks".hash()
                seed(my_seed)
                var a = randf() + randi()
                seed(my_seed)
                var b = randf() + randi()
                # a and b are now identical

```

```csharp
                ulong mySeed = (ulong)GD.Hash("Godot Rocks");
                GD.Seed(mySeed);
                var a = GD.Randf() + GD.Randi();
                GD.Seed(mySeed);
                var b = GD.Randf() + GD.Randi();
                // a and b are now identical

```

> method sign(x: Variant) -> Variant

Returns the same type of `Variant` as `x`, with `-1` for negative values, `1` for positive values, and `0` for zeros. For `nan` values it returns 0.
Supported types: `int`, `float`, `Vector2`, `Vector2i`, `Vector3`, `Vector3i`, `Vector4`, `Vector4i`.

```text
                sign(-6.0) # Returns -1
                sign(0.0)  # Returns 0
                sign(6.0)  # Returns 1
                sign(NAN)  # Returns 0

                sign(Vector3(-6.0, 0.0, 6.0)) # Returns (-1, 0, 1)

```

**Note:** For better type safety, use `signf`, `signi`, `Vector2.sign`, `Vector2i.sign`, `Vector3.sign`, `Vector3i.sign`, `Vector4.sign`, or `Vector4i.sign`.

> method signf(x: float) -> float

Returns `-1.0` if `x` is negative, `1.0` if `x` is positive, and `0.0` if `x` is zero. For `nan` values of `x` it returns 0.0.

```text
                signf(-6.5) # Returns -1.0
                signf(0.0)  # Returns 0.0
                signf(6.5)  # Returns 1.0
                signf(NAN)  # Returns 0.0

```

> method signi(x: int) -> int

Returns `-1` if `x` is negative, `1` if `x` is positive, and `0` if `x` is zero.

```text
                signi(-6) # Returns -1
                signi(0)  # Returns 0
                signi(6)  # Returns 1

```

> method sin(angle_rad: float) -> float

Returns the sine of angle `angle_rad` in radians.

```text
                sin(0.523599)       # Returns 0.5
                sin(deg_to_rad(90)) # Returns 1.0

```

> method sinh(x: float) -> float

Returns the hyperbolic sine of `x`.

```text
                var a = log(2.0) # Returns 0.693147
                sinh(a) # Returns 0.75

```

> method smoothstep(from: float, to: float, x: float) -> float

Returns a smooth cubic Hermite interpolation between `0` and `1`.
For positive ranges (when `from <= to`) the return value is `0` when `x <= from`, and `1` when `x >= to`. If `x` lies between `from` and `to`, the return value follows an S-shaped curve that smoothly transitions from `0` to `1`.
For negative ranges (when `from > to`) the function is mirrored and returns `1` when `x <= to` and `0` when `x >= from`.
This S-shaped curve is the cubic Hermite interpolator, given by `f(y) = 3*y^2 - 2*y^3` where `y = (x-from) / (to-from)`.

```text
                smoothstep(0, 2, -5.0) # Returns 0.0
                smoothstep(0, 2, 0.5) # Returns 0.15625
                smoothstep(0, 2, 1.0) # Returns 0.5
                smoothstep(0, 2, 2.0) # Returns 1.0

```

Compared to `ease` with a curve value of `-1.6521`, `smoothstep` returns the smoothest possible curve with no sudden changes in the derivative. If you need to perform more advanced transitions, use `Tween` or `AnimationPlayer`.
[Comparison between smoothstep() and ease(x, -1.6521) return values](https://raw.githubusercontent.com/godotengine/godot-docs/master/img/smoothstep_ease_comparison.png)
[Smoothstep() return values with positive, zero, and negative ranges](https://raw.githubusercontent.com/godotengine/godot-docs/master/img/smoothstep_range.webp)

> method snapped(x: Variant, step: Variant) -> Variant

Returns the multiple of `step` that is the closest to `x`. This can also be used to round a floating-point number to an arbitrary number of decimals.
The returned value is the same type of `Variant` as `step`. Supported types: `int`, `float`, `Vector2`, `Vector2i`, `Vector3`, `Vector3i`, `Vector4`, `Vector4i`.

```text
                snapped(100, 32)  # Returns 96
                snapped(3.14159, 0.01)  # Returns 3.14

                snapped(Vector2(34, 70), Vector2(8, 8))  # Returns (32, 72)

```

See also `ceil`, `floor`, and `round`.
**Note:** For better type safety, use `snappedf`, `snappedi`, `Vector2.snapped`, `Vector2i.snapped`, `Vector3.snapped`, `Vector3i.snapped`, `Vector4.snapped`, or `Vector4i.snapped`.

> method snappedf(x: float, step: float) -> float

Returns the multiple of `step` that is the closest to `x`. This can also be used to round a floating-point number to an arbitrary number of decimals.
A type-safe version of `snapped`, returning a `float`.

```text
                snappedf(32.0, 2.5)  # Returns 32.5
                snappedf(3.14159, 0.01)  # Returns 3.14

```

> method snappedi(x: float, step: int) -> int

Returns the multiple of `step` that is the closest to `x`.
A type-safe version of `snapped`, returning an `int`.

```text
                snappedi(53, 16)  # Returns 48
                snappedi(4096, 100)  # Returns 4100

```

> method sqrt(x: float) -> float

Returns the square root of `x`, where `x` is a non-negative number.

```text
                sqrt(9)     # Returns 3
                sqrt(10.24) # Returns 3.2
                sqrt(-1)    # Returns NaN

```

**Note:** Negative values of `x` return NaN ("Not a Number"). In C#, if you need negative inputs, use `System.Numerics.Complex`.

> method step_decimals(x: float) -> int

Returns the position of the first non-zero digit, after the decimal point. Note that the maximum return value is 10, which is a design decision in the implementation.

```text
                var n = step_decimals(5)       # n is 0
                n = step_decimals(1.0005)      # n is 4
                n = step_decimals(0.000000005) # n is 9

```

> method str() -> String ; qualifiers=vararg

Converts one or more arguments of any `Variant` type to a `String` in the best way possible.

```text
                var a = [10, 20, 30]
                var b = str(a)
                print(len(a)) # Prints 3 (the number of elements in the array).
                print(len(b)) # Prints 12 (the length of the string "[10, 20, 30]").

```

> method str_to_var(string: String) -> Variant

Converts a formatted `string` that was returned by `var_to_str` to the original `Variant`.

```gdscript
                var data = '{ "a": 1, "b": 2 }' # data is a String
                var dict = str_to_var(data)     # dict is a Dictionary
                print(dict["a"])                # Prints 1

```

```csharp
                string data = "{ \"a\": 1, \"b\": 2 }";           // data is a string
                var dict = GD.StrToVar(data).AsGodotDictionary(); // dict is a Dictionary
                GD.Print(dict["a"]);                              // Prints 1

```

> method tan(angle_rad: float) -> float

Returns the tangent of angle `angle_rad` in radians.

```text
                tan(deg_to_rad(45)) # Returns 1

```

> method tanh(x: float) -> float

Returns the hyperbolic tangent of `x`.

```text
                var a = log(2.0) # Returns 0.693147
                tanh(a)          # Returns 0.6

```

> method type_convert(variant: Variant, type: int) -> Variant

Converts the given `variant` to the given `type`, using the `Variant.Type` values. This method is generous with how it handles types, it can automatically convert between array types, convert numeric `String`s to `int`, and converting most things to `String`.
If the type conversion cannot be done, this method will return the default value for that type, for example converting `Rect2` to `Vector2` will always return `Vector2.ZERO`. This method will never show error messages as long as `type` is a valid Variant type.
The returned value is a `Variant`, but the data inside and its type will be the same as the requested type.

```text
                type_convert("Hi!", TYPE_INT) # Returns 0
                type_convert("123", TYPE_INT) # Returns 123
                type_convert(123.4, TYPE_INT) # Returns 123
                type_convert(5, TYPE_VECTOR2) # Returns (0, 0)
                type_convert("Hi!", TYPE_NIL) # Returns null

```

> method type_string(type: int) -> String

Returns a human-readable name of the given `type`, using the `Variant.Type` values.

```text
                print(TYPE_INT) # Prints 2
                print(type_string(TYPE_INT)) # Prints "int"
                print(type_string(TYPE_STRING)) # Prints "String"

```

See also `typeof`.

> method typeof(variable: Variant) -> int

Returns the internal type of the given `variable`, using the `Variant.Type` values.

```text
                var json = JSON.new()
                json.parse('["a", "b", "c"]')
                var result = json.get_data()
                if typeof(result) == TYPE_ARRAY:
                    print(result[0]) # Prints "a"
                else:
                    print("Unexpected result!")

```

See also `type_string`.

> method var_to_bytes(variable: Variant) -> PackedByteArray

Encodes a `Variant` value to a byte array, without encoding objects. Deserialization can be done with `bytes_to_var`.
**Note:** If you need object serialization, see `var_to_bytes_with_objects`.
**Note:** Encoding `Callable` is not supported and will result in an empty value, regardless of the data.

> method var_to_bytes_with_objects(variable: Variant) -> PackedByteArray

Encodes a `Variant` value to a byte array. Encoding objects is allowed (and can potentially include executable code). Deserialization can be done with `bytes_to_var_with_objects`.
**Note:** Encoding `Callable` is not supported and will result in an empty value, regardless of the data.

> method var_to_str(variable: Variant) -> String

Converts a `Variant` `variable` to a formatted `String` that can then be parsed using `str_to_var`.

```gdscript
                var a = { "a": 1, "b": 2 }
                print(var_to_str(a))

```

```csharp
                var a = new Godot.Collections.Dictionary { ["a"] = 1, ["b"] = 2 };
                GD.Print(GD.VarToStr(a));

```

Prints:

```text
                {
                    "a": 1,
                    "b": 2
                }

```

**Note:** Converting `Signal` or `Callable` is not supported and will result in an empty value for these types, regardless of their data.

> method weakref(obj: Variant) -> Variant

Returns a `WeakRef` instance holding a weak reference to `obj`. Returns an empty `WeakRef` instance if `obj` is `null`. Prints an error and returns `null` if `obj` is neither `Object`-derived nor `null`.
A weak reference to an object is not enough to keep the object alive: when the only remaining references to a referent are weak references, garbage collection is free to destroy the referent and reuse its memory for something else. However, until the object is actually destroyed the weak reference may return the object even if there are no strong references to it.

> method wrap(value: Variant, min: Variant, max: Variant) -> Variant

Wraps the `Variant` `value` between `min` and `max`. `min` is *inclusive* while `max` is *exclusive*. This can be used for creating loop-like behavior or infinite surfaces.
Variant types `int` and `float` are supported. If any of the arguments is `float`, this function returns a `float`, otherwise it returns an `int`.

```text
                var a = wrap(4, 5, 10)
                # a is 9 (int)

                var a = wrap(7, 5, 10)
                # a is 7 (int)

                var a = wrap(10.5, 5, 10)
                # a is 5.5 (float)

```

> method wrapf(value: float, min: float, max: float) -> float

Wraps the float `value` between `min` and `max`. `min` is *inclusive* while `max` is *exclusive*. This can be used for creating loop-like behavior or infinite surfaces.

```text
                # Infinite loop between 5.0 and 9.9
                value = wrapf(value + 0.1, 5.0, 10.0)

```

```text
                # Infinite rotation (in radians)
                angle = wrapf(angle + 0.1, 0.0, TAU)

```

```text
                # Infinite rotation (in radians)
                angle = wrapf(angle + 0.1, -PI, PI)

```

**Note:** If `min` is `0`, this is equivalent to `fposmod`, so prefer using that instead. `wrapf` is more flexible than using the `fposmod` approach by giving the user control over the minimum value.

> method wrapi(value: int, min: int, max: int) -> int

Wraps the integer `value` between `min` and `max`. `min` is *inclusive* while `max` is *exclusive*. This can be used for creating loop-like behavior or infinite surfaces.

```text
                # Infinite loop between 5 and 9
                frame = wrapi(frame + 1, 5, 10)

```

```text
                # result is -2
                var result = wrapi(-6, -5, -1)

```

## Enumerations

> enum ClockDirection

> enum_value ClockDirection.CLOCKWISE = 0

Clockwise rotation. Used by some methods (e.g. `Image.rotate_90`).

> enum_value ClockDirection.COUNTERCLOCKWISE = 1

Counter-clockwise rotation. Used by some methods (e.g. `Image.rotate_90`).

> enum Corner

> enum_value Corner.CORNER_TOP_LEFT = 0

Top-left corner.

> enum_value Corner.CORNER_TOP_RIGHT = 1

Top-right corner.

> enum_value Corner.CORNER_BOTTOM_RIGHT = 2

Bottom-right corner.

> enum_value Corner.CORNER_BOTTOM_LEFT = 3

Bottom-left corner.

> enum Error

> enum_value Error.OK = 0

Methods that return `Error` return `OK` when no error occurred.
Since `OK` has value `0`, and all other error constants are positive integers, it can also be used in boolean checks.

```text
            var error = method_that_returns_error()
            if error != OK:
                printerr("Failure!")

            # Or, alternatively:
            if error:
                printerr("Still failing!")

```

**Note:** Many functions do not return an error code, but will print error messages to standard output.

> enum_value Error.FAILED = 1

Generic error.

> enum_value Error.ERR_UNAVAILABLE = 2

Unavailable error.

> enum_value Error.ERR_UNCONFIGURED = 3

Unconfigured error.

> enum_value Error.ERR_UNAUTHORIZED = 4

Unauthorized error.

> enum_value Error.ERR_PARAMETER_RANGE_ERROR = 5

Parameter range error.

> enum_value Error.ERR_OUT_OF_MEMORY = 6

Out of memory (OOM) error.

> enum_value Error.ERR_FILE_NOT_FOUND = 7

File: Not found error.

> enum_value Error.ERR_FILE_BAD_DRIVE = 8

File: Bad drive error.

> enum_value Error.ERR_FILE_BAD_PATH = 9

File: Bad path error.

> enum_value Error.ERR_FILE_NO_PERMISSION = 10

File: No permission error.

> enum_value Error.ERR_FILE_ALREADY_IN_USE = 11

File: Already in use error.

> enum_value Error.ERR_FILE_CANT_OPEN = 12

File: Can't open error.

> enum_value Error.ERR_FILE_CANT_WRITE = 13

File: Can't write error.

> enum_value Error.ERR_FILE_CANT_READ = 14

File: Can't read error.

> enum_value Error.ERR_FILE_UNRECOGNIZED = 15

File: Unrecognized error.

> enum_value Error.ERR_FILE_CORRUPT = 16

File: Corrupt error.

> enum_value Error.ERR_FILE_MISSING_DEPENDENCIES = 17

File: Missing dependencies error.

> enum_value Error.ERR_FILE_EOF = 18

File: End of file (EOF) error.

> enum_value Error.ERR_CANT_OPEN = 19

Can't open error.

> enum_value Error.ERR_CANT_CREATE = 20

Can't create error.

> enum_value Error.ERR_QUERY_FAILED = 21

Query failed error.

> enum_value Error.ERR_ALREADY_IN_USE = 22

Already in use error.

> enum_value Error.ERR_LOCKED = 23

Locked error.

> enum_value Error.ERR_TIMEOUT = 24

Timeout error.

> enum_value Error.ERR_CANT_CONNECT = 25

Can't connect error.

> enum_value Error.ERR_CANT_RESOLVE = 26

Can't resolve error.

> enum_value Error.ERR_CONNECTION_ERROR = 27

Connection error.

> enum_value Error.ERR_CANT_ACQUIRE_RESOURCE = 28

Can't acquire resource error.

> enum_value Error.ERR_CANT_FORK = 29

Can't fork process error.

> enum_value Error.ERR_INVALID_DATA = 30

Invalid data error.

> enum_value Error.ERR_INVALID_PARAMETER = 31

Invalid parameter error.

> enum_value Error.ERR_ALREADY_EXISTS = 32

Already exists error.

> enum_value Error.ERR_DOES_NOT_EXIST = 33

Does not exist error.

> enum_value Error.ERR_DATABASE_CANT_READ = 34

Database: Read error.

> enum_value Error.ERR_DATABASE_CANT_WRITE = 35

Database: Write error.

> enum_value Error.ERR_COMPILATION_FAILED = 36

Compilation failed error.

> enum_value Error.ERR_METHOD_NOT_FOUND = 37

Method not found error.

> enum_value Error.ERR_LINK_FAILED = 38

Linking failed error.

> enum_value Error.ERR_SCRIPT_FAILED = 39

Script failed error.

> enum_value Error.ERR_CYCLIC_LINK = 40

Cycling link (import cycle) error.

> enum_value Error.ERR_INVALID_DECLARATION = 41

Invalid declaration error.

> enum_value Error.ERR_DUPLICATE_SYMBOL = 42

Duplicate symbol error.

> enum_value Error.ERR_PARSE_ERROR = 43

Parse error.

> enum_value Error.ERR_BUSY = 44

Busy error.

> enum_value Error.ERR_SKIP = 45

Skip error.

> enum_value Error.ERR_HELP = 46

Help error. Used internally when passing `--version` or `--help` as executable options.

> enum_value Error.ERR_BUG = 47

Bug error, caused by an implementation issue in the method.
**Note:** If a built-in method returns this code, please open an issue on [the GitHub Issue Tracker](https://github.com/godotengine/godot/issues).

> enum_value Error.ERR_PRINTER_ON_FIRE = 48

Printer on fire error (this is an easter egg, no built-in methods return this error code).

> enum EulerOrder

> enum_value EulerOrder.EULER_ORDER_XYZ = 0

Specifies that Euler angles should be in intrinsic XYZ order. When composing, the rotations happen around the local X, Y, and Z axes, in that order. When decomposing, the order is reversed, first Z, then Y, and X last.

> enum_value EulerOrder.EULER_ORDER_XZY = 1

Specifies that Euler angles should be in intrinsic XZY order. When composing, the rotations happen around the local X, Z, and Y axes, in that order. When decomposing, the order is reversed, first Y, then Z, and X last.

> enum_value EulerOrder.EULER_ORDER_YXZ = 2

Specifies that Euler angles should be in intrinsic YXZ order. When composing, the rotations happen around the local Y, X, and Z axes, in that order. When decomposing, the order is reversed, first Z, then X, and Y last.

> enum_value EulerOrder.EULER_ORDER_YZX = 3

Specifies that Euler angles should be in intrinsic YZX order. When composing, the rotations happen around the local Y, Z, and X axes, in that order. When decomposing, the order is reversed, first X, then Z, and Y last.

> enum_value EulerOrder.EULER_ORDER_ZXY = 4

Specifies that Euler angles should be in intrinsic ZXY order. When composing, the rotations happen around the local Z, X, and Y axes, in that order. When decomposing, the order is reversed, first Y, then X, and Z last.

> enum_value EulerOrder.EULER_ORDER_ZYX = 5

Specifies that Euler angles should be in intrinsic ZYX order. When composing, the rotations happen around the local Z, Y, and X axes, in that order. When decomposing, the order is reversed, first X, then Y, and Z last.

> enum HorizontalAlignment

> enum_value HorizontalAlignment.HORIZONTAL_ALIGNMENT_LEFT = 0

Horizontal left alignment, usually for text-derived classes.

> enum_value HorizontalAlignment.HORIZONTAL_ALIGNMENT_CENTER = 1

Horizontal center alignment, usually for text-derived classes.

> enum_value HorizontalAlignment.HORIZONTAL_ALIGNMENT_RIGHT = 2

Horizontal right alignment, usually for text-derived classes.

> enum_value HorizontalAlignment.HORIZONTAL_ALIGNMENT_FILL = 3

Expand row to fit width, usually for text-derived classes.

> enum InlineAlignment

> enum_value InlineAlignment.INLINE_ALIGNMENT_TOP_TO = 0

Aligns the top of the inline object (e.g. image, table) to the position of the text specified by `INLINE_ALIGNMENT_TO_*` constant.

> enum_value InlineAlignment.INLINE_ALIGNMENT_CENTER_TO = 1

Aligns the center of the inline object (e.g. image, table) to the position of the text specified by `INLINE_ALIGNMENT_TO_*` constant.

> enum_value InlineAlignment.INLINE_ALIGNMENT_BASELINE_TO = 3

Aligns the baseline (user defined) of the inline object (e.g. image, table) to the position of the text specified by `INLINE_ALIGNMENT_TO_*` constant.

> enum_value InlineAlignment.INLINE_ALIGNMENT_BOTTOM_TO = 2

Aligns the bottom of the inline object (e.g. image, table) to the position of the text specified by `INLINE_ALIGNMENT_TO_*` constant.

> enum_value InlineAlignment.INLINE_ALIGNMENT_TO_TOP = 0

Aligns the position of the inline object (e.g. image, table) specified by `INLINE_ALIGNMENT_*_TO` constant to the top of the text.

> enum_value InlineAlignment.INLINE_ALIGNMENT_TO_CENTER = 4

Aligns the position of the inline object (e.g. image, table) specified by `INLINE_ALIGNMENT_*_TO` constant to the center of the text.

> enum_value InlineAlignment.INLINE_ALIGNMENT_TO_BASELINE = 8

Aligns the position of the inline object (e.g. image, table) specified by `INLINE_ALIGNMENT_*_TO` constant to the baseline of the text.

> enum_value InlineAlignment.INLINE_ALIGNMENT_TO_BOTTOM = 12

Aligns inline object (e.g. image, table) to the bottom of the text.

> enum_value InlineAlignment.INLINE_ALIGNMENT_TOP = 0

Aligns top of the inline object (e.g. image, table) to the top of the text. Equivalent to `INLINE_ALIGNMENT_TOP_TO | INLINE_ALIGNMENT_TO_TOP`.

> enum_value InlineAlignment.INLINE_ALIGNMENT_CENTER = 5

Aligns center of the inline object (e.g. image, table) to the center of the text. Equivalent to `INLINE_ALIGNMENT_CENTER_TO | INLINE_ALIGNMENT_TO_CENTER`.

> enum_value InlineAlignment.INLINE_ALIGNMENT_BOTTOM = 14

Aligns bottom of the inline object (e.g. image, table) to the bottom of the text. Equivalent to `INLINE_ALIGNMENT_BOTTOM_TO | INLINE_ALIGNMENT_TO_BOTTOM`.

> enum_value InlineAlignment.INLINE_ALIGNMENT_IMAGE_MASK = 3

A bit mask for `INLINE_ALIGNMENT_*_TO` alignment constants.

> enum_value InlineAlignment.INLINE_ALIGNMENT_TEXT_MASK = 12

A bit mask for `INLINE_ALIGNMENT_TO_*` alignment constants.

> enum JoyAxis

> enum_value JoyAxis.JOY_AXIS_INVALID = -1

An invalid game controller axis.

> enum_value JoyAxis.JOY_AXIS_LEFT_X = 0

Game controller left joystick x-axis.

> enum_value JoyAxis.JOY_AXIS_LEFT_Y = 1

Game controller left joystick y-axis.

> enum_value JoyAxis.JOY_AXIS_RIGHT_X = 2

Game controller right joystick x-axis.

> enum_value JoyAxis.JOY_AXIS_RIGHT_Y = 3

Game controller right joystick y-axis.

> enum_value JoyAxis.JOY_AXIS_TRIGGER_LEFT = 4

Game controller left trigger axis.

> enum_value JoyAxis.JOY_AXIS_TRIGGER_RIGHT = 5

Game controller right trigger axis.

> enum_value JoyAxis.JOY_AXIS_SDL_MAX = 6

The number of SDL game controller axes.

> enum_value JoyAxis.JOY_AXIS_MAX = 10

The maximum number of game controller axes: OpenVR supports up to 5 Joysticks making a total of 10 axes.

> enum JoyButton

> enum_value JoyButton.JOY_BUTTON_INVALID = -1

An invalid game controller button.

> enum_value JoyButton.JOY_BUTTON_A = 0

Game controller SDL button A. Corresponds to the bottom action button: Sony Cross, Xbox A, Nintendo B.

> enum_value JoyButton.JOY_BUTTON_B = 1

Game controller SDL button B. Corresponds to the right action button: Sony Circle, Xbox B, Nintendo A.

> enum_value JoyButton.JOY_BUTTON_X = 2

Game controller SDL button X. Corresponds to the left action button: Sony Square, Xbox X, Nintendo Y.

> enum_value JoyButton.JOY_BUTTON_Y = 3

Game controller SDL button Y. Corresponds to the top action button: Sony Triangle, Xbox Y, Nintendo X.

> enum_value JoyButton.JOY_BUTTON_BACK = 4

Game controller SDL back button. Corresponds to the Sony Select, Xbox Back, Nintendo - button.

> enum_value JoyButton.JOY_BUTTON_GUIDE = 5

Game controller SDL guide button. Corresponds to the Sony PS, Xbox Home button.

> enum_value JoyButton.JOY_BUTTON_START = 6

Game controller SDL start button. Corresponds to the Sony Options, Xbox Menu, Nintendo + button.

> enum_value JoyButton.JOY_BUTTON_LEFT_STICK = 7

Game controller SDL left stick button. Corresponds to the Sony L3, Xbox L/LS button.

> enum_value JoyButton.JOY_BUTTON_RIGHT_STICK = 8

Game controller SDL right stick button. Corresponds to the Sony R3, Xbox R/RS button.

> enum_value JoyButton.JOY_BUTTON_LEFT_SHOULDER = 9

Game controller SDL left shoulder button. Corresponds to the Sony L1, Xbox LB button.

> enum_value JoyButton.JOY_BUTTON_RIGHT_SHOULDER = 10

Game controller SDL right shoulder button. Corresponds to the Sony R1, Xbox RB button.

> enum_value JoyButton.JOY_BUTTON_DPAD_UP = 11

Game controller D-pad up button.

> enum_value JoyButton.JOY_BUTTON_DPAD_DOWN = 12

Game controller D-pad down button.

> enum_value JoyButton.JOY_BUTTON_DPAD_LEFT = 13

Game controller D-pad left button.

> enum_value JoyButton.JOY_BUTTON_DPAD_RIGHT = 14

Game controller D-pad right button.

> enum_value JoyButton.JOY_BUTTON_MISC1 = 15

Game controller SDL miscellaneous button. Corresponds to Xbox share button, PS5 microphone button, Nintendo Switch capture button.

> enum_value JoyButton.JOY_BUTTON_PADDLE1 = 16

Game controller SDL paddle 1 button.

> enum_value JoyButton.JOY_BUTTON_PADDLE2 = 17

Game controller SDL paddle 2 button.

> enum_value JoyButton.JOY_BUTTON_PADDLE3 = 18

Game controller SDL paddle 3 button.

> enum_value JoyButton.JOY_BUTTON_PADDLE4 = 19

Game controller SDL paddle 4 button.

> enum_value JoyButton.JOY_BUTTON_TOUCHPAD = 20

Game controller SDL touchpad button.

> enum_value JoyButton.JOY_BUTTON_MISC2 = 21

Game controller SDL miscellaneous button. Used by Nintendo Switch 2 Pro Controller and Horipad Steam controllers.

> enum_value JoyButton.JOY_BUTTON_MISC3 = 22

Game controller SDL miscellaneous button.

> enum_value JoyButton.JOY_BUTTON_MISC4 = 23

Game controller SDL miscellaneous button.

> enum_value JoyButton.JOY_BUTTON_MISC5 = 24

Game controller SDL miscellaneous button.

> enum_value JoyButton.JOY_BUTTON_MISC6 = 25

Game controller SDL miscellaneous button.

> enum_value JoyButton.JOY_BUTTON_SDL_MAX = 26

The number of SDL game controller buttons.

> enum_value JoyButton.JOY_BUTTON_MAX = 128

The maximum number of game controller buttons supported by the engine. The actual limit may be lower on specific platforms:
- **Android:** Up to 36 buttons.
- **Linux:** Up to 80 buttons.
- **Windows** and **macOS:** Up to 128 buttons.

> enum Key

> enum_value Key.KEY_NONE = 0

Enum value which doesn't correspond to any key. This is used to initialize `Key` properties with a generic state.

> enum_value Key.KEY_SPECIAL = 4194304

Keycodes with this bit applied are non-printable.

> enum_value Key.KEY_ESCAPE = 4194305

Escape key.

> enum_value Key.KEY_TAB = 4194306

Tab key.

> enum_value Key.KEY_BACKTAB = 4194307

Shift + Tab key.

> enum_value Key.KEY_BACKSPACE = 4194308

Backspace key.

> enum_value Key.KEY_ENTER = 4194309

Return key (on the main keyboard).

> enum_value Key.KEY_KP_ENTER = 4194310

Enter key on the numeric keypad.

> enum_value Key.KEY_INSERT = 4194311

Insert key.

> enum_value Key.KEY_DELETE = 4194312

Delete key.

> enum_value Key.KEY_PAUSE = 4194313

Pause key.

> enum_value Key.KEY_PRINT = 4194314

Print Screen key.

> enum_value Key.KEY_SYSREQ = 4194315

System Request key.

> enum_value Key.KEY_CLEAR = 4194316

Clear key.

> enum_value Key.KEY_HOME = 4194317

Home key.

> enum_value Key.KEY_END = 4194318

End key.

> enum_value Key.KEY_LEFT = 4194319

Left arrow key.

> enum_value Key.KEY_UP = 4194320

Up arrow key.

> enum_value Key.KEY_RIGHT = 4194321

Right arrow key.

> enum_value Key.KEY_DOWN = 4194322

Down arrow key.

> enum_value Key.KEY_PAGEUP = 4194323

Page Up key.

> enum_value Key.KEY_PAGEDOWN = 4194324

Page Down key.

> enum_value Key.KEY_SHIFT = 4194325

Shift key.

> enum_value Key.KEY_CTRL = 4194326

Control key.

> enum_value Key.KEY_META = 4194327

Meta key.

> enum_value Key.KEY_ALT = 4194328

Alt key.

> enum_value Key.KEY_CAPSLOCK = 4194329

Caps Lock key.

> enum_value Key.KEY_NUMLOCK = 4194330

Num Lock key.

> enum_value Key.KEY_SCROLLLOCK = 4194331

Scroll Lock key.

> enum_value Key.KEY_F1 = 4194332

F1 key.

> enum_value Key.KEY_F2 = 4194333

F2 key.

> enum_value Key.KEY_F3 = 4194334

F3 key.

> enum_value Key.KEY_F4 = 4194335

F4 key.

> enum_value Key.KEY_F5 = 4194336

F5 key.

> enum_value Key.KEY_F6 = 4194337

F6 key.

> enum_value Key.KEY_F7 = 4194338

F7 key.

> enum_value Key.KEY_F8 = 4194339

F8 key.

> enum_value Key.KEY_F9 = 4194340

F9 key.

> enum_value Key.KEY_F10 = 4194341

F10 key.

> enum_value Key.KEY_F11 = 4194342

F11 key.

> enum_value Key.KEY_F12 = 4194343

F12 key.

> enum_value Key.KEY_F13 = 4194344

F13 key.

> enum_value Key.KEY_F14 = 4194345

F14 key.

> enum_value Key.KEY_F15 = 4194346

F15 key.

> enum_value Key.KEY_F16 = 4194347

F16 key.

> enum_value Key.KEY_F17 = 4194348

F17 key.

> enum_value Key.KEY_F18 = 4194349

F18 key.

> enum_value Key.KEY_F19 = 4194350

F19 key.

> enum_value Key.KEY_F20 = 4194351

F20 key.

> enum_value Key.KEY_F21 = 4194352

F21 key.

> enum_value Key.KEY_F22 = 4194353

F22 key.

> enum_value Key.KEY_F23 = 4194354

F23 key.

> enum_value Key.KEY_F24 = 4194355

F24 key.

> enum_value Key.KEY_F25 = 4194356

F25 key. Only supported on macOS and Linux due to a Windows limitation.

> enum_value Key.KEY_F26 = 4194357

F26 key. Only supported on macOS and Linux due to a Windows limitation.

> enum_value Key.KEY_F27 = 4194358

F27 key. Only supported on macOS and Linux due to a Windows limitation.

> enum_value Key.KEY_F28 = 4194359

F28 key. Only supported on macOS and Linux due to a Windows limitation.

> enum_value Key.KEY_F29 = 4194360

F29 key. Only supported on macOS and Linux due to a Windows limitation.

> enum_value Key.KEY_F30 = 4194361

F30 key. Only supported on macOS and Linux due to a Windows limitation.

> enum_value Key.KEY_F31 = 4194362

F31 key. Only supported on macOS and Linux due to a Windows limitation.

> enum_value Key.KEY_F32 = 4194363

F32 key. Only supported on macOS and Linux due to a Windows limitation.

> enum_value Key.KEY_F33 = 4194364

F33 key. Only supported on macOS and Linux due to a Windows limitation.

> enum_value Key.KEY_F34 = 4194365

F34 key. Only supported on macOS and Linux due to a Windows limitation.

> enum_value Key.KEY_F35 = 4194366

F35 key. Only supported on macOS and Linux due to a Windows limitation.

> enum_value Key.KEY_KP_MULTIPLY = 4194433

Multiply (*) key on the numeric keypad.

> enum_value Key.KEY_KP_DIVIDE = 4194434

Divide (/) key on the numeric keypad.

> enum_value Key.KEY_KP_SUBTRACT = 4194435

Subtract (-) key on the numeric keypad.

> enum_value Key.KEY_KP_PERIOD = 4194436

Period (.) key on the numeric keypad.

> enum_value Key.KEY_KP_ADD = 4194437

Add (+) key on the numeric keypad.

> enum_value Key.KEY_KP_0 = 4194438

Number 0 on the numeric keypad.

> enum_value Key.KEY_KP_1 = 4194439

Number 1 on the numeric keypad.

> enum_value Key.KEY_KP_2 = 4194440

Number 2 on the numeric keypad.

> enum_value Key.KEY_KP_3 = 4194441

Number 3 on the numeric keypad.

> enum_value Key.KEY_KP_4 = 4194442

Number 4 on the numeric keypad.

> enum_value Key.KEY_KP_5 = 4194443

Number 5 on the numeric keypad.

> enum_value Key.KEY_KP_6 = 4194444

Number 6 on the numeric keypad.

> enum_value Key.KEY_KP_7 = 4194445

Number 7 on the numeric keypad.

> enum_value Key.KEY_KP_8 = 4194446

Number 8 on the numeric keypad.

> enum_value Key.KEY_KP_9 = 4194447

Number 9 on the numeric keypad.

> enum_value Key.KEY_MENU = 4194370

Context menu key.

> enum_value Key.KEY_HYPER = 4194371

Hyper key. (On Linux/X11 only).

> enum_value Key.KEY_HELP = 4194373

Help key.

> enum_value Key.KEY_BACK = 4194376

Back key.

> enum_value Key.KEY_FORWARD = 4194377

Forward key.

> enum_value Key.KEY_STOP = 4194378

Media stop key.

> enum_value Key.KEY_REFRESH = 4194379

Refresh key.

> enum_value Key.KEY_VOLUMEDOWN = 4194380

Volume down key.

> enum_value Key.KEY_VOLUMEMUTE = 4194381

Mute volume key.

> enum_value Key.KEY_VOLUMEUP = 4194382

Volume up key.

> enum_value Key.KEY_MEDIAPLAY = 4194388

Media play key.

> enum_value Key.KEY_MEDIASTOP = 4194389

Media stop key.

> enum_value Key.KEY_MEDIAPREVIOUS = 4194390

Previous song key.

> enum_value Key.KEY_MEDIANEXT = 4194391

Next song key.

> enum_value Key.KEY_MEDIARECORD = 4194392

Media record key.

> enum_value Key.KEY_HOMEPAGE = 4194393

Home page key.

> enum_value Key.KEY_FAVORITES = 4194394

Favorites key.

> enum_value Key.KEY_SEARCH = 4194395

Search key.

> enum_value Key.KEY_STANDBY = 4194396

Standby key.

> enum_value Key.KEY_OPENURL = 4194397

Open URL / Launch Browser key.

> enum_value Key.KEY_LAUNCHMAIL = 4194398

Launch Mail key.

> enum_value Key.KEY_LAUNCHMEDIA = 4194399

Launch Media key.

> enum_value Key.KEY_LAUNCH0 = 4194400

Launch Shortcut 0 key.

> enum_value Key.KEY_LAUNCH1 = 4194401

Launch Shortcut 1 key.

> enum_value Key.KEY_LAUNCH2 = 4194402

Launch Shortcut 2 key.

> enum_value Key.KEY_LAUNCH3 = 4194403

Launch Shortcut 3 key.

> enum_value Key.KEY_LAUNCH4 = 4194404

Launch Shortcut 4 key.

> enum_value Key.KEY_LAUNCH5 = 4194405

Launch Shortcut 5 key.

> enum_value Key.KEY_LAUNCH6 = 4194406

Launch Shortcut 6 key.

> enum_value Key.KEY_LAUNCH7 = 4194407

Launch Shortcut 7 key.

> enum_value Key.KEY_LAUNCH8 = 4194408

Launch Shortcut 8 key.

> enum_value Key.KEY_LAUNCH9 = 4194409

Launch Shortcut 9 key.

> enum_value Key.KEY_LAUNCHA = 4194410

Launch Shortcut A key.

> enum_value Key.KEY_LAUNCHB = 4194411

Launch Shortcut B key.

> enum_value Key.KEY_LAUNCHC = 4194412

Launch Shortcut C key.

> enum_value Key.KEY_LAUNCHD = 4194413

Launch Shortcut D key.

> enum_value Key.KEY_LAUNCHE = 4194414

Launch Shortcut E key.

> enum_value Key.KEY_LAUNCHF = 4194415

Launch Shortcut F key.

> enum_value Key.KEY_GLOBE = 4194416

"Globe" key on Mac / iPad keyboard.

> enum_value Key.KEY_KEYBOARD = 4194417

"On-screen keyboard" key on iPad keyboard.

> enum_value Key.KEY_JIS_EISU = 4194418

英数 key on Mac keyboard.

> enum_value Key.KEY_JIS_KANA = 4194419

かな key on Mac keyboard.

> enum_value Key.KEY_UNKNOWN = 8388607

Unknown key.

> enum_value Key.KEY_SPACE = 32

Space key.

> enum_value Key.KEY_EXCLAM = 33

Exclamation mark (`!`) key.

> enum_value Key.KEY_QUOTEDBL = 34

Double quotation mark (`"`) key.

> enum_value Key.KEY_NUMBERSIGN = 35

Number sign or *hash* (`#`) key.

> enum_value Key.KEY_DOLLAR = 36

Dollar sign (`$`) key.

> enum_value Key.KEY_PERCENT = 37

Percent sign (`%`) key.

> enum_value Key.KEY_AMPERSAND = 38

Ampersand (`&`) key.

> enum_value Key.KEY_APOSTROPHE = 39

Apostrophe (`'`) key.

> enum_value Key.KEY_PARENLEFT = 40

Left parenthesis (`(`) key.

> enum_value Key.KEY_PARENRIGHT = 41

Right parenthesis (`)`) key.

> enum_value Key.KEY_ASTERISK = 42

Asterisk (`*`) key.

> enum_value Key.KEY_PLUS = 43

Plus (`+`) key.

> enum_value Key.KEY_COMMA = 44

Comma (`,`) key.

> enum_value Key.KEY_MINUS = 45

Minus (`-`) key.

> enum_value Key.KEY_PERIOD = 46

Period (`.`) key.

> enum_value Key.KEY_SLASH = 47

Slash (`/`) key.

> enum_value Key.KEY_0 = 48

Number 0 key.

> enum_value Key.KEY_1 = 49

Number 1 key.

> enum_value Key.KEY_2 = 50

Number 2 key.

> enum_value Key.KEY_3 = 51

Number 3 key.

> enum_value Key.KEY_4 = 52

Number 4 key.

> enum_value Key.KEY_5 = 53

Number 5 key.

> enum_value Key.KEY_6 = 54

Number 6 key.

> enum_value Key.KEY_7 = 55

Number 7 key.

> enum_value Key.KEY_8 = 56

Number 8 key.

> enum_value Key.KEY_9 = 57

Number 9 key.

> enum_value Key.KEY_COLON = 58

Colon (`:`) key.

> enum_value Key.KEY_SEMICOLON = 59

Semicolon (`;`) key.

> enum_value Key.KEY_LESS = 60

Less-than sign (`<`) key.

> enum_value Key.KEY_EQUAL = 61

Equal sign (`=`) key.

> enum_value Key.KEY_GREATER = 62

Greater-than sign (`>`) key.

> enum_value Key.KEY_QUESTION = 63

Question mark (`?`) key.

> enum_value Key.KEY_AT = 64

At sign (`@`) key.

> enum_value Key.KEY_A = 65

A key.

> enum_value Key.KEY_B = 66

B key.

> enum_value Key.KEY_C = 67

C key.

> enum_value Key.KEY_D = 68

D key.

> enum_value Key.KEY_E = 69

E key.

> enum_value Key.KEY_F = 70

F key.

> enum_value Key.KEY_G = 71

G key.

> enum_value Key.KEY_H = 72

H key.

> enum_value Key.KEY_I = 73

I key.

> enum_value Key.KEY_J = 74

J key.

> enum_value Key.KEY_K = 75

K key.

> enum_value Key.KEY_L = 76

L key.

> enum_value Key.KEY_M = 77

M key.

> enum_value Key.KEY_N = 78

N key.

> enum_value Key.KEY_O = 79

O key.

> enum_value Key.KEY_P = 80

P key.

> enum_value Key.KEY_Q = 81

Q key.

> enum_value Key.KEY_R = 82

R key.

> enum_value Key.KEY_S = 83

S key.

> enum_value Key.KEY_T = 84

T key.

> enum_value Key.KEY_U = 85

U key.

> enum_value Key.KEY_V = 86

V key.

> enum_value Key.KEY_W = 87

W key.

> enum_value Key.KEY_X = 88

X key.

> enum_value Key.KEY_Y = 89

Y key.

> enum_value Key.KEY_Z = 90

Z key.

> enum_value Key.KEY_BRACKETLEFT = 91

Left bracket (`[lb]`) key.

> enum_value Key.KEY_BACKSLASH = 92

Backslash (`\`) key.

> enum_value Key.KEY_BRACKETRIGHT = 93

Right bracket (`[rb]`) key.

> enum_value Key.KEY_ASCIICIRCUM = 94

Caret (`^`) key.

> enum_value Key.KEY_UNDERSCORE = 95

Underscore (`_`) key.

> enum_value Key.KEY_QUOTELEFT = 96

Backtick (`\``) key.

> enum_value Key.KEY_BRACELEFT = 123

Left brace (`{`) key.

> enum_value Key.KEY_BAR = 124

Vertical bar or *pipe* (`|`) key.

> enum_value Key.KEY_BRACERIGHT = 125

Right brace (`}`) key.

> enum_value Key.KEY_ASCIITILDE = 126

Tilde (`~`) key.

> enum_value Key.KEY_YEN = 165

Yen symbol (`¥`) key.

> enum_value Key.KEY_SECTION = 167

Section sign (`§`) key.

> enum KeyLocation

> enum_value KeyLocation.KEY_LOCATION_UNSPECIFIED = 0

Used for keys which only appear once, or when a comparison doesn't need to differentiate the `LEFT` and `RIGHT` versions.
For example, when using `InputEvent.is_match`, an event which has `KEY_LOCATION_UNSPECIFIED` will match any `KeyLocation` on the passed event.

> enum_value KeyLocation.KEY_LOCATION_LEFT = 1

A key which is to the left of its twin.

> enum_value KeyLocation.KEY_LOCATION_RIGHT = 2

A key which is to the right of its twin.

> enum KeyModifierMask ; bitfield=true

> enum_value KeyModifierMask.KEY_CODE_MASK = 8388607

Bit mask with all bits enabled except for modifier keys. Apply it to remove modifiers.

```text
            var keycode = KEY_A | KEY_MASK_SHIFT
            keycode = keycode & KEY_CODE_MASK
            print(keycode) # KEY_A

```

> enum_value KeyModifierMask.KEY_MODIFIER_MASK = 2130706432

Bit mask with all modifier bits enabled. Apply it to isolate modifiers.

```text
            var keycode = KEY_A | KEY_MASK_SHIFT
            keycode = keycode & KEY_MODIFIER_MASK
            print(keycode) # KEY_MASK_SHIFT

```

> enum_value KeyModifierMask.KEY_MASK_CMD_OR_CTRL = 16777216

Automatically remapped to `KEY_META` on macOS and `KEY_CTRL` on other platforms, this mask is never set in the actual events, and should be used for key mapping only.

> enum_value KeyModifierMask.KEY_MASK_SHIFT = 33554432

Shift key mask.

> enum_value KeyModifierMask.KEY_MASK_ALT = 67108864

Alt or Option (on macOS) key mask.

> enum_value KeyModifierMask.KEY_MASK_META = 134217728

Command (on macOS) or Meta/Windows key mask.

> enum_value KeyModifierMask.KEY_MASK_CTRL = 268435456

Control key mask.

> enum_value KeyModifierMask.KEY_MASK_KPAD = 536870912

Keypad key mask.

> enum_value KeyModifierMask.KEY_MASK_GROUP_SWITCH = 1073741824

Group Switch key mask.

> enum MIDIMessage

> enum_value MIDIMessage.MIDI_MESSAGE_NONE = 0

Does not correspond to any MIDI message. This is the default value of `InputEventMIDI.message`.

> enum_value MIDIMessage.MIDI_MESSAGE_NOTE_OFF = 8

MIDI message sent when a note is released.
**Note:** Not all MIDI devices send this message; some may send `MIDI_MESSAGE_NOTE_ON` with `InputEventMIDI.velocity` set to `0`.

> enum_value MIDIMessage.MIDI_MESSAGE_NOTE_ON = 9

MIDI message sent when a note is pressed.

> enum_value MIDIMessage.MIDI_MESSAGE_AFTERTOUCH = 10

MIDI message sent to indicate a change in pressure while a note is being pressed down, also called aftertouch.

> enum_value MIDIMessage.MIDI_MESSAGE_CONTROL_CHANGE = 11

MIDI message sent when a controller value changes. In a MIDI device, a controller is any input that doesn't play notes. These may include sliders for volume, balance, and panning, as well as switches and pedals. See the [General MIDI specification](https://en.wikipedia.org/wiki/General_MIDI#Controller_events) for a small list.

> enum_value MIDIMessage.MIDI_MESSAGE_PROGRAM_CHANGE = 12

MIDI message sent when the MIDI device changes its current instrument (also called *program* or *preset*).

> enum_value MIDIMessage.MIDI_MESSAGE_CHANNEL_PRESSURE = 13

MIDI message sent to indicate a change in pressure for the whole channel. Some MIDI devices may send this instead of `MIDI_MESSAGE_AFTERTOUCH`.

> enum_value MIDIMessage.MIDI_MESSAGE_PITCH_BEND = 14

MIDI message sent when the value of the pitch bender changes, usually a wheel on the MIDI device.

> enum_value MIDIMessage.MIDI_MESSAGE_SYSTEM_EXCLUSIVE = 240

MIDI system exclusive (SysEx) message. This type of message is not standardized and it's highly dependent on the MIDI device sending it.
**Note:** Getting this message's data from `InputEventMIDI` is not implemented.

> enum_value MIDIMessage.MIDI_MESSAGE_QUARTER_FRAME = 241

MIDI message sent every quarter frame to keep connected MIDI devices synchronized. Related to `MIDI_MESSAGE_TIMING_CLOCK`.
**Note:** Getting this message's data from `InputEventMIDI` is not implemented.

> enum_value MIDIMessage.MIDI_MESSAGE_SONG_POSITION_POINTER = 242

MIDI message sent to jump onto a new position in the current sequence or song.
**Note:** Getting this message's data from `InputEventMIDI` is not implemented.

> enum_value MIDIMessage.MIDI_MESSAGE_SONG_SELECT = 243

MIDI message sent to select a sequence or song to play.
**Note:** Getting this message's data from `InputEventMIDI` is not implemented.

> enum_value MIDIMessage.MIDI_MESSAGE_TUNE_REQUEST = 246

MIDI message sent to request a tuning calibration. Used on analog synthesizers. Most modern MIDI devices do not need this message.

> enum_value MIDIMessage.MIDI_MESSAGE_TIMING_CLOCK = 248

MIDI message sent 24 times after `MIDI_MESSAGE_QUARTER_FRAME`, to keep connected MIDI devices synchronized.

> enum_value MIDIMessage.MIDI_MESSAGE_START = 250

MIDI message sent to start the current sequence or song from the beginning.

> enum_value MIDIMessage.MIDI_MESSAGE_CONTINUE = 251

MIDI message sent to resume from the point the current sequence or song was paused.

> enum_value MIDIMessage.MIDI_MESSAGE_STOP = 252

MIDI message sent to pause the current sequence or song.

> enum_value MIDIMessage.MIDI_MESSAGE_ACTIVE_SENSING = 254

MIDI message sent repeatedly while the MIDI device is idle, to tell the receiver that the connection is alive. Most MIDI devices do not send this message.

> enum_value MIDIMessage.MIDI_MESSAGE_SYSTEM_RESET = 255

MIDI message sent to reset a MIDI device to its default state, as if it was just turned on. It should not be sent when the MIDI device is being turned on.

> enum MethodFlags ; bitfield=true

> enum_value MethodFlags.METHOD_FLAG_NORMAL = 1

Flag for a normal method.

> enum_value MethodFlags.METHOD_FLAG_EDITOR = 2

Flag for an editor method.

> enum_value MethodFlags.METHOD_FLAG_CONST = 4

Flag for a constant method.

> enum_value MethodFlags.METHOD_FLAG_VIRTUAL = 8

Flag for a virtual method.

> enum_value MethodFlags.METHOD_FLAG_VARARG = 16

Flag for a method with a variable number of arguments.

> enum_value MethodFlags.METHOD_FLAG_STATIC = 32

Flag for a static method.

> enum_value MethodFlags.METHOD_FLAG_OBJECT_CORE = 64

Used internally. Allows to not dump core virtual methods (such as `Object._notification`) to the JSON API.

> enum_value MethodFlags.METHOD_FLAG_VIRTUAL_REQUIRED = 128

Flag for a virtual method that is required. In GDScript, this flag is set for abstract functions.

> enum_value MethodFlags.METHOD_FLAGS_DEFAULT = 1

Default method flags (normal).

> enum MouseButton

> enum_value MouseButton.MOUSE_BUTTON_NONE = 0

Enum value which doesn't correspond to any mouse button. This is used to initialize `MouseButton` properties with a generic state.

> enum_value MouseButton.MOUSE_BUTTON_LEFT = 1

Primary mouse button, usually assigned to the left button.

> enum_value MouseButton.MOUSE_BUTTON_RIGHT = 2

Secondary mouse button, usually assigned to the right button.

> enum_value MouseButton.MOUSE_BUTTON_MIDDLE = 3

Middle mouse button.

> enum_value MouseButton.MOUSE_BUTTON_WHEEL_UP = 4

Mouse wheel scrolling up.

> enum_value MouseButton.MOUSE_BUTTON_WHEEL_DOWN = 5

Mouse wheel scrolling down.

> enum_value MouseButton.MOUSE_BUTTON_WHEEL_LEFT = 6

Mouse wheel left button (only present on some mice).

> enum_value MouseButton.MOUSE_BUTTON_WHEEL_RIGHT = 7

Mouse wheel right button (only present on some mice).

> enum_value MouseButton.MOUSE_BUTTON_XBUTTON1 = 8

Extra mouse button 1. This is sometimes present, usually to the sides of the mouse.

> enum_value MouseButton.MOUSE_BUTTON_XBUTTON2 = 9

Extra mouse button 2. This is sometimes present, usually to the sides of the mouse.

> enum MouseButtonMask ; bitfield=true

> enum_value MouseButtonMask.MOUSE_BUTTON_MASK_LEFT = 1

Primary mouse button mask, usually for the left button.

> enum_value MouseButtonMask.MOUSE_BUTTON_MASK_RIGHT = 2

Secondary mouse button mask, usually for the right button.

> enum_value MouseButtonMask.MOUSE_BUTTON_MASK_MIDDLE = 4

Middle mouse button mask.

> enum_value MouseButtonMask.MOUSE_BUTTON_MASK_MB_XBUTTON1 = 128

Extra mouse button 1 mask.

> enum_value MouseButtonMask.MOUSE_BUTTON_MASK_MB_XBUTTON2 = 256

Extra mouse button 2 mask.

> enum Orientation

> enum_value Orientation.VERTICAL = 1

General vertical alignment, usually used for `Separator`, `ScrollBar`, `Slider`, etc.

> enum_value Orientation.HORIZONTAL = 0

General horizontal alignment, usually used for `Separator`, `ScrollBar`, `Slider`, etc.

> enum PropertyHint

> enum_value PropertyHint.PROPERTY_HINT_NONE = 0

The property has no hint for the editor. However, the hint string is still read, which can be used to specify a suffix for a property that has no range limit (see `PROPERTY_HINT_RANGE`'s description).

> enum_value PropertyHint.PROPERTY_HINT_RANGE = 1

Hints that an `int`, `float`, or packed/typed `Array` property containing `int` or `float` types should be within a range specified via the hint string `"min,max"` or `"min,max,step"`. The hint string can optionally include `"or_greater"` and/or `"or_less"` to allow manual input going respectively above the max or below the min values.
**Example:** `"-360,360,1,or_greater,or_less"`.
Additionally, other keywords can be included: `"exp"` for exponential range editing, `"radians_as_degrees"` for editing radian angles in degrees (the range values are also in degrees), `"degrees"` to hint at an angle, `"prefer_slider"` to show the slider for integers, `"hide_control"` to hide the slider or up-down arrows, and `"suffix:px/s"` to display a suffix indicating the value's unit (e.g. `px/s` for pixels per second).

> enum_value PropertyHint.PROPERTY_HINT_ENUM = 2

Hints that an `int`, `String`, or `StringName` property is an enumerated value to pick in a list specified via a hint string.
The hint string is a comma separated list of names such as `"Hello,Something,Else"`. Whitespace is **not** removed from either end of a name. For integer properties, the first name in the list has value 0, the next 1, and so on. Explicit values can also be specified by appending `:integer` to the name, e.g. `"Zero,One,Three:3,Four,Six:6"`.

> enum_value PropertyHint.PROPERTY_HINT_ENUM_SUGGESTION = 3

Hints that a `String` or `StringName` property can be an enumerated value to pick in a list specified via a hint string such as `"Hello,Something,Else"`. See `PROPERTY_HINT_ENUM` for details.
Unlike `PROPERTY_HINT_ENUM`, a property with this hint still accepts arbitrary values and can be empty. The list of values serves to suggest possible values.

> enum_value PropertyHint.PROPERTY_HINT_EXP_EASING = 4

Hints that a `float` property should be edited using a curve editor showing an exponential easing function. The hint string can include `"attenuation"` to flip the curve horizontally and/or `"positive_only"` to exclude in/out easing and limit values to be greater than or equal to zero. This displays differently to a property that uses `PROPERTY_HINT_RANGE` with the `"exp"` keyword, as it's edited with a slider instead of a curve editor.

> enum_value PropertyHint.PROPERTY_HINT_LINK = 5

Hints that a vector property should allow its components to be linked. For example, this allows `Vector2.x` and `Vector2.y` to be edited together. This hint is supported on `Vector2`, `Vector2i`, `Vector3`, `Vector3i`, `Vector4`, and `Vector4i`. The hint string can be used to specify a suffix indicating each value's unit with the `"suffix:px/s"` syntax.

> enum_value PropertyHint.PROPERTY_HINT_FLAGS = 6

Hints that an `int` property is a bitmask with named bit flags.
The hint string is a comma separated list of names such as `"Bit0,Bit1,Bit2,Bit3"`. Whitespace is **not** removed from either end of a name. The first name in the list has value 1, the next 2, then 4, 8, 16 and so on. Explicit values can also be specified by appending `:integer` to the name, e.g. `"A:4,B:8,C:16"`. You can also combine several flags (`"A:4,B:8,AB:12,C:16"`).
**Note:** A flag value must be at least `1` and at most `2 ** 32 - 1`.
**Note:** Unlike `PROPERTY_HINT_ENUM`, the previous explicit value is not taken into account. For the hint `"A:16,B,C"`, A is 16, B is 2, C is 4.

> enum_value PropertyHint.PROPERTY_HINT_LAYERS_2D_RENDER = 7

Hints that an `int` property is a bitmask using the optionally named 2D render layers.

> enum_value PropertyHint.PROPERTY_HINT_LAYERS_2D_PHYSICS = 8

Hints that an `int` property is a bitmask using the optionally named 2D physics layers.

> enum_value PropertyHint.PROPERTY_HINT_LAYERS_2D_NAVIGATION = 9

Hints that an `int` property is a bitmask using the optionally named 2D navigation layers.

> enum_value PropertyHint.PROPERTY_HINT_LAYERS_3D_RENDER = 10

Hints that an `int` property is a bitmask using the optionally named 3D render layers.

> enum_value PropertyHint.PROPERTY_HINT_LAYERS_3D_PHYSICS = 11

Hints that an `int` property is a bitmask using the optionally named 3D physics layers.

> enum_value PropertyHint.PROPERTY_HINT_LAYERS_3D_NAVIGATION = 12

Hints that an `int` property is a bitmask using the optionally named 3D navigation layers.

> enum_value PropertyHint.PROPERTY_HINT_LAYERS_AVOIDANCE = 37

Hints that an integer property is a bitmask using the optionally named avoidance layers.

> enum_value PropertyHint.PROPERTY_HINT_FILE = 13

Hints that a `String` property is a path to a file. Editing it will show a file dialog for picking the path. The hint string can be a set of filters with wildcards like `"*.png,*.jpg"`. By default the file will be stored as UID whenever available. You can use `ResourceUID` methods to convert it back to path. For storing a raw path, use `PROPERTY_HINT_FILE_PATH`.

> enum_value PropertyHint.PROPERTY_HINT_DIR = 14

Hints that a `String` property is a path to a directory. Editing it will show a file dialog for picking the path.

> enum_value PropertyHint.PROPERTY_HINT_GLOBAL_FILE = 15

Hints that a `String` property is an absolute path to a file outside the project folder. Editing it will show a file dialog for picking the path. The hint string can be a set of filters with wildcards, like `"*.png,*.jpg"`.

> enum_value PropertyHint.PROPERTY_HINT_GLOBAL_DIR = 16

Hints that a `String` property is an absolute path to a directory outside the project folder. Editing it will show a file dialog for picking the path.

> enum_value PropertyHint.PROPERTY_HINT_RESOURCE_TYPE = 17

Hints that a property is an instance of a `Resource`-derived type, optionally specified via the hint string (e.g. `"Texture2D"`). Editing it will show a popup menu of valid resource types to instantiate.

> enum_value PropertyHint.PROPERTY_HINT_MULTILINE_TEXT = 18

Hints that a `String` property is text with line breaks. Editing it will show a text input field where line breaks can be typed.
The hint string can be set to `"monospace"` to force the input field to use a monospaced font.
If the hint string `"no_wrap"` is set, the input field will not wrap lines at boundaries, instead resorting to making the area scrollable.

> enum_value PropertyHint.PROPERTY_HINT_EXPRESSION = 19

Hints that a `String` property is an `Expression`.

> enum_value PropertyHint.PROPERTY_HINT_PLACEHOLDER_TEXT = 20

Hints that a `String` property should show a placeholder text on its input field, if empty. The hint string is the placeholder text to use.

> enum_value PropertyHint.PROPERTY_HINT_COLOR_NO_ALPHA = 21

Hints that a `Color` property should be edited without affecting its transparency (`Color.a` is not editable).

> enum_value PropertyHint.PROPERTY_HINT_OBJECT_ID = 22

Hints that the property's value is an object encoded as object ID, with its type specified in the hint string. Used by the debugger.

> enum_value PropertyHint.PROPERTY_HINT_TYPE_STRING = 23

If a property is `String`, hints that the property represents a particular type (class). This allows to select a type from the create dialog. The property will store the selected type as a string.
If a property is `Array`, hints the editor how to show elements. The `hint_string` must encode nested types using `":"` and `"/"`.
If a property is `Dictionary`, hints the editor how to show elements. The `hint_string` is the same as `Array`, with a `";"` separating the key and value.

```gdscript
            # Array of elem_type.
            hint_string = "%d:" % [elem_type]
            hint_string = "%d/%d:%s" % [elem_type, elem_hint, elem_hint_string]
            # Two-dimensional array of elem_type (array of arrays of elem_type).
            hint_string = "%d:%d:" % [TYPE_ARRAY, elem_type]
            hint_string = "%d:%d/%d:%s" % [TYPE_ARRAY, elem_type, elem_hint, elem_hint_string]
            # Three-dimensional array of elem_type (array of arrays of arrays of elem_type).
            hint_string = "%d:%d:%d:" % [TYPE_ARRAY, TYPE_ARRAY, elem_type]
            hint_string = "%d:%d:%d/%d:%s" % [TYPE_ARRAY, TYPE_ARRAY, elem_type, elem_hint, elem_hint_string]

```

```csharp
            // Array of elemType.
            hintString = $"{elemType:D}:";
            hintString = $"{elemType:D}/{elemHint:D}:{elemHintString}";
            // Two-dimensional array of elemType (array of arrays of elemType).
            hintString = $"{Variant.Type.Array:D}:{elemType:D}:";
            hintString = $"{Variant.Type.Array:D}:{elemType:D}/{elemHint:D}:{elemHintString}";
            // Three-dimensional array of elemType (array of arrays of arrays of elemType).
            hintString = $"{Variant.Type.Array:D}:{Variant.Type.Array:D}:{elemType:D}:";
            hintString = $"{Variant.Type.Array:D}:{Variant.Type.Array:D}:{elemType:D}/{elemHint:D}:{elemHintString}";

```

**Examples:**

```gdscript
            hint_string = "%d:" % [TYPE_INT] # Array of integers.
            hint_string = "%d/%d:1,10,1" % [TYPE_INT, PROPERTY_HINT_RANGE] # Array of integers (in range from 1 to 10).
            hint_string = "%d/%d:Zero,One,Two" % [TYPE_INT, PROPERTY_HINT_ENUM] # Array of integers (an enum).
            hint_string = "%d/%d:Zero,One,Three:3,Six:6" % [TYPE_INT, PROPERTY_HINT_ENUM] # Array of integers (an enum).
            hint_string = "%d/%d:*.png" % [TYPE_STRING, PROPERTY_HINT_FILE] # Array of strings (file paths).
            hint_string = "%d/%d:Texture2D" % [TYPE_OBJECT, PROPERTY_HINT_RESOURCE_TYPE] # Array of textures.

            hint_string = "%d:%d:" % [TYPE_ARRAY, TYPE_FLOAT] # Two-dimensional array of floats.
            hint_string = "%d:%d/%d:" % [TYPE_ARRAY, TYPE_STRING, PROPERTY_HINT_MULTILINE_TEXT] # Two-dimensional array of multiline strings.
            hint_string = "%d:%d/%d:-1,1,0.1" % [TYPE_ARRAY, TYPE_FLOAT, PROPERTY_HINT_RANGE] # Two-dimensional array of floats (in range from -1 to 1).
            hint_string = "%d:%d/%d:Texture2D" % [TYPE_ARRAY, TYPE_OBJECT, PROPERTY_HINT_RESOURCE_TYPE] # Two-dimensional array of textures.

```

```csharp
            hintString = $"{Variant.Type.Int:D}/{PropertyHint.Range:D}:1,10,1"; // Array of integers (in range from 1 to 10).
            hintString = $"{Variant.Type.Int:D}/{PropertyHint.Enum:D}:Zero,One,Two"; // Array of integers (an enum).
            hintString = $"{Variant.Type.Int:D}/{PropertyHint.Enum:D}:Zero,One,Three:3,Six:6"; // Array of integers (an enum).
            hintString = $"{Variant.Type.String:D}/{PropertyHint.File:D}:*.png"; // Array of strings (file paths).
            hintString = $"{Variant.Type.Object:D}/{PropertyHint.ResourceType:D}:Texture2D"; // Array of textures.

            hintString = $"{Variant.Type.Array:D}:{Variant.Type.Float:D}:"; // Two-dimensional array of floats.
            hintString = $"{Variant.Type.Array:D}:{Variant.Type.String:D}/{PropertyHint.MultilineText:D}:"; // Two-dimensional array of multiline strings.
            hintString = $"{Variant.Type.Array:D}:{Variant.Type.Float:D}/{PropertyHint.Range:D}:-1,1,0.1"; // Two-dimensional array of floats (in range from -1 to 1).
            hintString = $"{Variant.Type.Array:D}:{Variant.Type.Object:D}/{PropertyHint.ResourceType:D}:Texture2D"; // Two-dimensional array of textures.

```

**Note:** The trailing colon is required for properly detecting built-in types.

> enum_value PropertyHint.PROPERTY_HINT_NODE_PATH_TO_EDITED_NODE = 24 ; deprecated=This hint is not used by the engine.

> enum_value PropertyHint.PROPERTY_HINT_OBJECT_TOO_BIG = 25

Hints that an object is too big to be sent via the debugger.

> enum_value PropertyHint.PROPERTY_HINT_NODE_PATH_VALID_TYPES = 26

Hints that the hint string specifies valid node types for property of type `NodePath`.

> enum_value PropertyHint.PROPERTY_HINT_SAVE_FILE = 27

Hints that a `String` property is a path to a file. Editing it will show a file dialog for picking the path for the file to be saved at. The dialog has access to the project's directory. The hint string can be a set of filters with wildcards like `"*.png,*.jpg"`. See also `FileDialog.filters`.

> enum_value PropertyHint.PROPERTY_HINT_GLOBAL_SAVE_FILE = 28

Hints that a `String` property is a path to a file. Editing it will show a file dialog for picking the path for the file to be saved at. The dialog has access to the entire filesystem. The hint string can be a set of filters with wildcards like `"*.png,*.jpg"`. See also `FileDialog.filters`.

> enum_value PropertyHint.PROPERTY_HINT_INT_IS_OBJECTID = 29 ; deprecated=This hint is not used by the engine.

> enum_value PropertyHint.PROPERTY_HINT_INT_IS_POINTER = 30

Hints that an `int` property is a pointer. Used by GDExtension.

> enum_value PropertyHint.PROPERTY_HINT_ARRAY_TYPE = 31

Hints that a property is an `Array` with the stored type specified in the hint string. The hint string contains the type of the array (e.g. `"String"`).
Use the hint string format from `PROPERTY_HINT_TYPE_STRING` for more control over the stored type.

> enum_value PropertyHint.PROPERTY_HINT_DICTIONARY_TYPE = 38

Hints that a property is a `Dictionary` with the stored types specified in the hint string. The hint string contains the key and value types separated by a semicolon (e.g. `"int;String"`).
Use the hint string format from `PROPERTY_HINT_TYPE_STRING` for more control over the stored types.

> enum_value PropertyHint.PROPERTY_HINT_LOCALE_ID = 32

Hints that a string property is a locale code. Editing it will show a locale dialog for picking language and country.

> enum_value PropertyHint.PROPERTY_HINT_LOCALIZABLE_STRING = 33

Hints that a dictionary property is string translation map. Dictionary keys are locale codes and, values are translated strings.

> enum_value PropertyHint.PROPERTY_HINT_NODE_TYPE = 34

Hints that a property is an instance of a `Node`-derived type, optionally specified via the hint string (e.g. `"Node2D"`). Editing it will show a dialog for picking a node from the scene.

> enum_value PropertyHint.PROPERTY_HINT_HIDE_QUATERNION_EDIT = 35

Hints that a quaternion property should disable the temporary euler editor.

> enum_value PropertyHint.PROPERTY_HINT_PASSWORD = 36

Hints that a string property is a password, and every character is replaced with the secret character.

> enum_value PropertyHint.PROPERTY_HINT_TOOL_BUTTON = 39

Hints that a `Callable` property should be displayed as a clickable button. When the button is pressed, the callable is called. The hint string specifies the button text and optionally an icon from the `"EditorIcons"` theme type.

```text
            "Click me!" - A button with the text "Click me!" and the default "Callable" icon.
            "Click me!,ColorRect" - A button with the text "Click me!" and the "ColorRect" icon.

```

**Note:** A `Callable` cannot be properly serialized and stored in a file, so it is recommended to use `PROPERTY_USAGE_EDITOR` instead of `PROPERTY_USAGE_DEFAULT`.

> enum_value PropertyHint.PROPERTY_HINT_ONESHOT = 40

Hints that a property will be changed on its own after setting, such as `AudioStreamPlayer.playing` or `GPUParticles3D.emitting`.

> enum_value PropertyHint.PROPERTY_HINT_GROUP_ENABLE = 42

Hints that a boolean property will enable the feature associated with the group that it occurs in. The property will be displayed as a checkbox on the group header. Only works within a group or subgroup.
By default, disabling the property hides all properties in the group. Use the optional hint string `"checkbox_only"` to disable this behavior.

> enum_value PropertyHint.PROPERTY_HINT_INPUT_NAME = 43

Hints that a `String` or `StringName` property is the name of an input action. This allows the selection of any action name from the Input Map in the Project Settings. The hint string may contain two options separated by commas:
- If it contains `"show_builtin"`, built-in input actions are included in the selection.
- If it contains `"loose_mode"`, loose mode is enabled. This allows inserting any action name even if it's not present in the input map.

> enum_value PropertyHint.PROPERTY_HINT_FILE_PATH = 44

Like `PROPERTY_HINT_FILE`, but the property is stored as a raw path, not UID. That means the reference will be broken if you move the file. Consider using `PROPERTY_HINT_FILE` when possible.

> enum_value PropertyHint.PROPERTY_HINT_MAX = 45

Represents the size of the `PropertyHint` enum.

> enum PropertyUsageFlags ; bitfield=true

> enum_value PropertyUsageFlags.PROPERTY_USAGE_NONE = 0

The property is not stored, and does not display in the editor. This is the default for non-exported properties.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_STORAGE = 2

The property is serialized and saved in the scene file (default for exported properties).

> enum_value PropertyUsageFlags.PROPERTY_USAGE_EDITOR = 4

The property is shown in the `EditorInspector` (default for exported properties).

> enum_value PropertyUsageFlags.PROPERTY_USAGE_INTERNAL = 8

The property is excluded from the class reference.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_CHECKABLE = 16

The property can be checked in the `EditorInspector`.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_CHECKED = 32

The property is checked in the `EditorInspector`.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_GROUP = 64

Used to group properties together in the editor. See `EditorInspector`.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_CATEGORY = 128

Used to categorize properties together in the editor.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_SUBGROUP = 256

Used to group properties together in the editor in a subgroup (under a group). See `EditorInspector`.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_CLASS_IS_BITFIELD = 512

The property is a bitfield, i.e. it contains multiple flags represented as bits.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_NO_INSTANCE_STATE = 1024

The property does not save its state in `PackedScene`.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_RESTART_IF_CHANGED = 2048

Editing the property prompts the user for restarting the editor.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_SCRIPT_VARIABLE = 4096

The property is a script variable. `PROPERTY_USAGE_SCRIPT_VARIABLE` can be used to distinguish between exported script variables from built-in variables (which don't have this usage flag). By default, `PROPERTY_USAGE_SCRIPT_VARIABLE` is **not** applied to variables that are created by overriding `Object._get_property_list` in a script.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_STORE_IF_NULL = 8192

The property value of type `Object` will be stored even if its value is `null`.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_UPDATE_ALL_IF_MODIFIED = 16384

If this property is modified, all inspector fields will be refreshed.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_SCRIPT_DEFAULT_VALUE = 32768 ; deprecated=This flag is not used by the engine.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_CLASS_IS_ENUM = 65536

The property is a variable of enum type, i.e. it only takes named integer constants from its associated enumeration.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_NIL_IS_VARIANT = 131072

If property has `nil` as default value, its type will be `Variant`.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_ARRAY = 262144

The property is the element count of a property array, i.e. a list of groups of related properties. Properties defined with this usage also need a specific `class_name` field in the form of `label,prefix`. The field may also include additional comma-separated options:
- `page_size=N`: Overrides `EditorSettings.interface/inspector/max_array_dictionary_items_per_page` for this array.
- `add_button_text=text`: The text displayed by the "Add Element" button.
- `static`: The elements can't be re-arranged.
- `const`: New elements can't be added.
- `numbered`: An index will appear next to each element.
- `unfoldable`: The array can't be folded.
- `swap_method=method_name`: The method that will be called when two elements switch places. The method should take 2 `int` parameters, which will be indices of the elements being swapped.
Note that making a full-fledged property array requires boilerplate code involving `Object._get_property_list`.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_ALWAYS_DUPLICATE = 524288

When duplicating a resource with `Resource.duplicate`, and this flag is set on a property of that resource, the property should always be duplicated, regardless of the `subresources` bool parameter.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_NEVER_DUPLICATE = 1048576

When duplicating a resource with `Resource.duplicate`, and this flag is set on a property of that resource, the property should never be duplicated, regardless of the `subresources` bool parameter.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_HIGH_END_GFX = 2097152

The property is only shown in the editor if modern renderers are supported (the Compatibility rendering method is excluded).

> enum_value PropertyUsageFlags.PROPERTY_USAGE_NODE_PATH_FROM_SCENE_ROOT = 4194304

The `NodePath` property will always be relative to the scene's root. Mostly useful for local resources.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_RESOURCE_NOT_PERSISTENT = 8388608

Use when a resource is created on the fly, i.e. the getter will always return a different instance. `ResourceSaver` needs this information to properly save such resources.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_KEYING_INCREMENTS = 16777216

Inserting an animation key frame of this property will automatically increment the value, allowing to easily keyframe multiple values in a row.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_DEFERRED_SET_RESOURCE = 33554432 ; deprecated=This flag is not used by the engine.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_EDITOR_INSTANTIATE_OBJECT = 67108864

When this property is a `Resource` and base object is a `Node`, a resource instance will be automatically created whenever the node is created in the editor.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_EDITOR_BASIC_SETTING = 134217728

The property is considered a basic setting and will appear even when advanced mode is disabled. Used for project settings.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_READ_ONLY = 268435456

The property is read-only in the `EditorInspector`.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_SECRET = 536870912

An export preset property with this flag contains confidential information and is stored separately from the rest of the export preset configuration.

> enum_value PropertyUsageFlags.PROPERTY_USAGE_DEFAULT = 6

Default usage (storage and editor).

> enum_value PropertyUsageFlags.PROPERTY_USAGE_NO_EDITOR = 2

Default usage but without showing the property in the editor (storage).

> enum Side

> enum_value Side.SIDE_LEFT = 0

Left side, usually used for `Control` or `StyleBox`-derived classes.

> enum_value Side.SIDE_TOP = 1

Top side, usually used for `Control` or `StyleBox`-derived classes.

> enum_value Side.SIDE_RIGHT = 2

Right side, usually used for `Control` or `StyleBox`-derived classes.

> enum_value Side.SIDE_BOTTOM = 3

Bottom side, usually used for `Control` or `StyleBox`-derived classes.

> enum Variant.Operator

> enum_value Variant.Operator.OP_EQUAL = 0

Equality operator (`==`).

> enum_value Variant.Operator.OP_NOT_EQUAL = 1

Inequality operator (`!=`).

> enum_value Variant.Operator.OP_LESS = 2

Less than operator (`<`).

> enum_value Variant.Operator.OP_LESS_EQUAL = 3

Less than or equal operator (`<=`).

> enum_value Variant.Operator.OP_GREATER = 4

Greater than operator (`>`).

> enum_value Variant.Operator.OP_GREATER_EQUAL = 5

Greater than or equal operator (`>=`).

> enum_value Variant.Operator.OP_ADD = 6

Addition operator (`+`).

> enum_value Variant.Operator.OP_SUBTRACT = 7

Subtraction operator (`-`).

> enum_value Variant.Operator.OP_MULTIPLY = 8

Multiplication operator (`*`).

> enum_value Variant.Operator.OP_DIVIDE = 9

Division operator (`/`).

> enum_value Variant.Operator.OP_NEGATE = 10

Unary negation operator (`-`).

> enum_value Variant.Operator.OP_POSITIVE = 11

Unary plus operator (`+`).

> enum_value Variant.Operator.OP_MODULE = 12

Remainder/modulo operator (`%`).

> enum_value Variant.Operator.OP_POWER = 13

Power operator (`**`).

> enum_value Variant.Operator.OP_SHIFT_LEFT = 14

Left shift operator (`<<`).

> enum_value Variant.Operator.OP_SHIFT_RIGHT = 15

Right shift operator (`>>`).

> enum_value Variant.Operator.OP_BIT_AND = 16

Bitwise AND operator (`&`).

> enum_value Variant.Operator.OP_BIT_OR = 17

Bitwise OR operator (`|`).

> enum_value Variant.Operator.OP_BIT_XOR = 18

Bitwise XOR operator (`^`).

> enum_value Variant.Operator.OP_BIT_NEGATE = 19

Bitwise NOT operator (`~`).

> enum_value Variant.Operator.OP_AND = 20

Logical AND operator (`and` or `&&`).

> enum_value Variant.Operator.OP_OR = 21

Logical OR operator (`or` or `||`).

> enum_value Variant.Operator.OP_XOR = 22

Logical XOR operator (not implemented in GDScript).

> enum_value Variant.Operator.OP_NOT = 23

Logical NOT operator (`not` or `!`).

> enum_value Variant.Operator.OP_IN = 24

Logical IN operator (`in`).

> enum_value Variant.Operator.OP_MAX = 25

Represents the size of the `Variant.Operator` enum.

> enum Variant.Type

> enum_value Variant.Type.TYPE_NIL = 0

Variable is `null`.

> enum_value Variant.Type.TYPE_BOOL = 1

Variable is of type `bool`.

> enum_value Variant.Type.TYPE_INT = 2

Variable is of type `int`.

> enum_value Variant.Type.TYPE_FLOAT = 3

Variable is of type `float`.

> enum_value Variant.Type.TYPE_STRING = 4

Variable is of type `String`.

> enum_value Variant.Type.TYPE_VECTOR2 = 5

Variable is of type `Vector2`.

> enum_value Variant.Type.TYPE_VECTOR2I = 6

Variable is of type `Vector2i`.

> enum_value Variant.Type.TYPE_RECT2 = 7

Variable is of type `Rect2`.

> enum_value Variant.Type.TYPE_RECT2I = 8

Variable is of type `Rect2i`.

> enum_value Variant.Type.TYPE_VECTOR3 = 9

Variable is of type `Vector3`.

> enum_value Variant.Type.TYPE_VECTOR3I = 10

Variable is of type `Vector3i`.

> enum_value Variant.Type.TYPE_TRANSFORM2D = 11

Variable is of type `Transform2D`.

> enum_value Variant.Type.TYPE_VECTOR4 = 12

Variable is of type `Vector4`.

> enum_value Variant.Type.TYPE_VECTOR4I = 13

Variable is of type `Vector4i`.

> enum_value Variant.Type.TYPE_PLANE = 14

Variable is of type `Plane`.

> enum_value Variant.Type.TYPE_QUATERNION = 15

Variable is of type `Quaternion`.

> enum_value Variant.Type.TYPE_AABB = 16

Variable is of type `AABB`.

> enum_value Variant.Type.TYPE_BASIS = 17

Variable is of type `Basis`.

> enum_value Variant.Type.TYPE_TRANSFORM3D = 18

Variable is of type `Transform3D`.

> enum_value Variant.Type.TYPE_PROJECTION = 19

Variable is of type `Projection`.

> enum_value Variant.Type.TYPE_COLOR = 20

Variable is of type `Color`.

> enum_value Variant.Type.TYPE_STRING_NAME = 21

Variable is of type `StringName`.

> enum_value Variant.Type.TYPE_NODE_PATH = 22

Variable is of type `NodePath`.

> enum_value Variant.Type.TYPE_RID = 23

Variable is of type `RID`.

> enum_value Variant.Type.TYPE_OBJECT = 24

Variable is of type `Object`.

> enum_value Variant.Type.TYPE_CALLABLE = 25

Variable is of type `Callable`.

> enum_value Variant.Type.TYPE_SIGNAL = 26

Variable is of type `Signal`.

> enum_value Variant.Type.TYPE_DICTIONARY = 27

Variable is of type `Dictionary`.

> enum_value Variant.Type.TYPE_ARRAY = 28

Variable is of type `Array`.

> enum_value Variant.Type.TYPE_PACKED_BYTE_ARRAY = 29

Variable is of type `PackedByteArray`.

> enum_value Variant.Type.TYPE_PACKED_INT32_ARRAY = 30

Variable is of type `PackedInt32Array`.

> enum_value Variant.Type.TYPE_PACKED_INT64_ARRAY = 31

Variable is of type `PackedInt64Array`.

> enum_value Variant.Type.TYPE_PACKED_FLOAT32_ARRAY = 32

Variable is of type `PackedFloat32Array`.

> enum_value Variant.Type.TYPE_PACKED_FLOAT64_ARRAY = 33

Variable is of type `PackedFloat64Array`.

> enum_value Variant.Type.TYPE_PACKED_STRING_ARRAY = 34

Variable is of type `PackedStringArray`.

> enum_value Variant.Type.TYPE_PACKED_VECTOR2_ARRAY = 35

Variable is of type `PackedVector2Array`.

> enum_value Variant.Type.TYPE_PACKED_VECTOR3_ARRAY = 36

Variable is of type `PackedVector3Array`.

> enum_value Variant.Type.TYPE_PACKED_COLOR_ARRAY = 37

Variable is of type `PackedColorArray`.

> enum_value Variant.Type.TYPE_PACKED_VECTOR4_ARRAY = 38

Variable is of type `PackedVector4Array`.

> enum_value Variant.Type.TYPE_MAX = 39

Represents the size of the `Variant.Type` enum.

> enum VerticalAlignment

> enum_value VerticalAlignment.VERTICAL_ALIGNMENT_TOP = 0

Vertical top alignment, usually for text-derived classes.

> enum_value VerticalAlignment.VERTICAL_ALIGNMENT_CENTER = 1

Vertical center alignment, usually for text-derived classes.

> enum_value VerticalAlignment.VERTICAL_ALIGNMENT_BOTTOM = 2

Vertical bottom alignment, usually for text-derived classes.

> enum_value VerticalAlignment.VERTICAL_ALIGNMENT_FILL = 3

Expand rows to fit height, usually for text-derived classes.

## Constants

> constant UINT8_MAX = 255

Maximum value of an 8-bit unsigned integer.

> constant UINT16_MAX = 65535

Maximum value of a 16-bit unsigned integer.

> constant UINT32_MAX = 4294967295

Maximum value of a 32-bit unsigned integer.

> constant INT8_MIN = -128

Minimum value of an 8-bit signed integer.

> constant INT8_MAX = 127

Maximum value of an 8-bit signed integer.

> constant INT16_MIN = -32768

Minimum value of a 16-bit signed integer.

> constant INT16_MAX = 32767

Maximum value of a 16-bit signed integer.

> constant INT32_MIN = -2147483648

Minimum value of a 32-bit signed integer.

> constant INT32_MAX = 2147483647

Maximum value of a 32-bit signed integer.

> constant INT64_MIN = -9223372036854775808

Minimum value of a 64-bit signed integer.

> constant INT64_MAX = 9223372036854775807

Maximum value of a 64-bit signed integer.

## Tutorials
- [Random number generation]($DOCS_URL/tutorials/math/random_number_generation.html)
