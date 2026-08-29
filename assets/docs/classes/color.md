# Color

> class Color

## Brief

A color represented in RGBA format.

## Description

A color represented in RGBA format by a red (`r`), green (`g`), blue (`b`), and alpha (`a`) component. Each component is a 32-bit floating-point value, usually ranging from `0.0` to `1.0`. Some properties (such as `CanvasItem.modulate`) may support values greater than `1.0`, for overbright or HDR (High Dynamic Range) colors.
Colors can be created in a number of ways: By the various `Color` constructors, by static methods such as `from_hsv`, and by using a name from the set of standardized colors based on [X11 color names](https://en.wikipedia.org/wiki/X11_color_names) with the addition of `TRANSPARENT`.
[Color constants cheatsheet](https://raw.githubusercontent.com/godotengine/godot-docs/master/img/color_constants.png)
Although `Color` may be used to store values of any encoding, the red (`r`), green (`g`), and blue (`b`) properties of `Color` are expected by Godot to be encoded using the [nonlinear sRGB transfer function](https://en.wikipedia.org/wiki/SRGB#Transfer_function_(%22gamma%22)) unless otherwise stated. This color encoding is used by many traditional art and web tools, making it easy to match colors between Godot and these tools. Godot uses [Rec. ITU-R BT.709](https://en.wikipedia.org/wiki/Rec._709) color primaries, which are used by the sRGB standard.
All physical simulation, such as lighting calculations, and colorimetry transformations, such as `get_luminance`, must be performed on linearly encoded values to produce correct results. When performing these calculations, convert `Color` to and from linear encoding using `srgb_to_linear` and `linear_to_srgb`.
**Note:** In a boolean context, a Color will evaluate to `false` if it is equal to `Color(0, 0, 0, 1)` (opaque black). Otherwise, a Color will always evaluate to `true`.
**Note:** In C#, color constants are defined in the `Colors` static class instead of `Color`. Additionally, named colors use `PascalCase` syntax instead of `UPPER_SNAKE_CASE`. For example, `Color.ALICE_BLUE` in GDScript is `Colors.AliceBlue` in C#.

## Properties

> property a : float ; default=1.0

The color's alpha component, typically on the range of 0 to 1. A value of 0 means that the color is fully transparent. A value of 1 means that the color is fully opaque.
**Note:** The alpha channel is always stored with linear encoding, regardless of the encoding of the other color channels. The `linear_to_srgb` and `srgb_to_linear` methods do not affect the alpha channel.

> property a8 : int ; default=255

Wrapper for `a` that uses the range 0 to 255, instead of 0 to 1.

> property b : float ; default=0.0

The color's blue component, typically on the range of 0 to 1.

> property b8 : int ; default=0

Wrapper for `b` that uses the range 0 to 255, instead of 0 to 1.

> property g : float ; default=0.0

The color's green component, typically on the range of 0 to 1.

> property g8 : int ; default=0

Wrapper for `g` that uses the range 0 to 255, instead of 0 to 1.

> property h : float ; default=0.0

The HSV hue of this color, on the range 0 to 1.

> property ok_hsl_h : float ; default=0.0

The OKHSL hue of this color, on the range 0 to 1.

> property ok_hsl_l : float ; default=0.0

The OKHSL lightness of this color, on the range 0 to 1.

> property ok_hsl_s : float ; default=0.0

The OKHSL saturation of this color, on the range 0 to 1.

> property r : float ; default=0.0

The color's red component, typically on the range of 0 to 1.

> property r8 : int ; default=0

Wrapper for `r` that uses the range 0 to 255, instead of 0 to 1.

> property s : float ; default=0.0

The HSV saturation of this color, on the range 0 to 1.

> property v : float ; default=0.0

The HSV value (brightness) of this color, on the range 0 to 1.

## Constructors

> constructor Color()

Constructs a default `Color` from opaque black. This is the same as `BLACK`.
**Note:** In C#, this constructs a `Color` with all of its components set to `0.0` (transparent black).

> constructor Color(from: Color, alpha: float)

Constructs a `Color` from the existing color, with `a` set to the given `alpha` value.

```gdscript
                var red = Color(Color.RED, 0.2) # 20% opaque red.

```

```csharp
                var red = new Color(Colors.Red, 0.2f); // 20% opaque red.

```

> constructor Color(from: Color)

Constructs a `Color` as a copy of the given `Color`.

> constructor Color(code: String)

Constructs a `Color` either from an HTML color code or from a standardized color name. The supported color names are the same as the constants.

> constructor Color(code: String, alpha: float)

Constructs a `Color` either from an HTML color code or from a standardized color name, with `alpha` on the range of 0.0 to 1.0. The supported color names are the same as the constants.

> constructor Color(r: float, g: float, b: float)

Constructs a `Color` from RGB values, typically between 0.0 and 1.0. `a` is set to 1.0.

```gdscript
                var color = Color(0.2, 1.0, 0.7) # Similar to `Color.from_rgba8(51, 255, 178, 255)`

```

```csharp
                var color = new Color(0.2f, 1.0f, 0.7f); // Similar to `Color.Color8(51, 255, 178, 255)`

```

> constructor Color(r: float, g: float, b: float, a: float)

Constructs a `Color` from RGBA values, typically between 0.0 and 1.0.

```gdscript
                var color = Color(0.2, 1.0, 0.7, 0.8) # Similar to `Color.from_rgba8(51, 255, 178, 204)`

```

```csharp
                var color = new Color(0.2f, 1.0f, 0.7f, 0.8f); // Similar to `Color.Color8(51, 255, 178, 255, 204)`

```

## Methods

> method blend(over: Color) -> Color ; qualifiers=const

Returns a new color resulting from overlaying this color over the given color. In a painting program, you can imagine it as the `over` color painted over this color (including alpha).

```gdscript
                var bg = Color(0.0, 1.0, 0.0, 0.5) # Green with alpha of 50%
                var fg = Color(1.0, 0.0, 0.0, 0.5) # Red with alpha of 50%
                var blended_color = bg.blend(fg) # Brown with alpha of 75%

```

```csharp
                var bg = new Color(0.0f, 1.0f, 0.0f, 0.5f); // Green with alpha of 50%
                var fg = new Color(1.0f, 0.0f, 0.0f, 0.5f); // Red with alpha of 50%
                Color blendedColor = bg.Blend(fg); // Brown with alpha of 75%

```

> method clamp(min: Color = Color(0, 0, 0, 0), max: Color = Color(1, 1, 1, 1)) -> Color ; qualifiers=const

Returns a new color with all components clamped between the components of `min` and `max`, by running `@GlobalScope.clamp` on each component.

> method darkened(amount: float) -> Color ; qualifiers=const

Returns a new color resulting from making this color darker by the specified `amount` (ratio from 0.0 to 1.0). See also `lightened`.

```gdscript
                var green = Color(0.0, 1.0, 0.0)
                var darkgreen = green.darkened(0.2) # 20% darker than regular green

```

```csharp
                var green = new Color(0.0f, 1.0f, 0.0f);
                Color darkgreen = green.Darkened(0.2f); // 20% darker than regular green

```

> method from_hsv(h: float, s: float, v: float, alpha: float = 1.0) -> Color ; qualifiers=static

Constructs a color from an [HSV profile](https://en.wikipedia.org/wiki/HSL_and_HSV). The hue (`h`), saturation (`s`), and value (`v`) are typically between 0.0 and 1.0.

```gdscript
                var color = Color.from_hsv(0.58, 0.5, 0.79, 0.8)

```

```csharp
                var color = Color.FromHsv(0.58f, 0.5f, 0.79f, 0.8f);

```

> method from_ok_hsl(h: float, s: float, l: float, alpha: float = 1.0) -> Color ; qualifiers=static

Constructs a color from an [OK HSL profile](https://bottosson.github.io/posts/colorpicker/). The hue (`h`), saturation (`s`), and lightness (`l`) are typically between 0.0 and 1.0.

```gdscript
                var color = Color.from_ok_hsl(0.58, 0.5, 0.79, 0.8)

```

```csharp
                var color = Color.FromOkHsl(0.58f, 0.5f, 0.79f, 0.8f);

```

> method from_rgba8(r8: int, g8: int, b8: int, a8: int = 255) -> Color ; qualifiers=static

Returns a `Color` constructed from red (`r8`), green (`g8`), blue (`b8`), and optionally alpha (`a8`) integer channels, each divided by `255.0` for their final value.

```text
                var red = Color.from_rgba8(255, 0, 0)             # Same as Color(1, 0, 0).
                var dark_blue = Color.from_rgba8(0, 0, 51)        # Same as Color(0, 0, 0.2).
                var my_color = Color.from_rgba8(306, 255, 0, 102) # Same as Color(1.2, 1, 0, 0.4).

```

**Note:** Due to the lower precision of `from_rgba8` compared to the standard `Color` constructor, a color created with `from_rgba8` will generally not be equal to the same color created with the standard `Color` constructor. Use `is_equal_approx` for comparisons to avoid issues with floating-point precision error.

> method from_rgbe9995(rgbe: int) -> Color ; qualifiers=static

Decodes a `Color` from an RGBE9995 format integer. See `Image.FORMAT_RGBE9995`.

> method from_string(str: String, default: Color) -> Color ; qualifiers=static

Creates a `Color` from the given string, which can be either an HTML color code or a named color (case-insensitive). Returns `default` if the color cannot be inferred from the string.
If you want to create a color from String in a constant expression, use the equivalent constructor instead (i.e. `Color("color string")`).

> method get_luminance() -> float ; qualifiers=const

Returns the light intensity of the color, as a value between 0.0 and 1.0 (inclusive). This is useful when determining light or dark color. Colors with a luminance smaller than 0.5 can be generally considered dark.
**Note:** `get_luminance` relies on the color using linear encoding to return an accurate relative luminance value. If the color uses the default nonlinear sRGB encoding, use `srgb_to_linear` to convert it to linear encoding first.

> method hex(hex: int) -> Color ; qualifiers=static

Returns the `Color` associated with the provided `hex` integer in 32-bit RGBA format (8 bits per channel). This method is the inverse of `to_rgba32`.
In GDScript and C#, the `int` is best visualized with hexadecimal notation (`"0x"` prefix, making it `"0xRRGGBBAA"`).

```gdscript
                var red = Color.hex(0xff0000ff)
                var dark_cyan = Color.hex(0x008b8bff)
                var my_color = Color.hex(0xbbefd2a4)

```

```csharp
                var red = new Color(0xff0000ff);
                var dark_cyan = new Color(0x008b8bff);
                var my_color = new Color(0xbbefd2a4);

```

If you want to use hex notation in a constant expression, use the equivalent constructor instead (i.e. `Color(0xRRGGBBAA)`).

> method hex64(hex: int) -> Color ; qualifiers=static

Returns the `Color` associated with the provided `hex` integer in 64-bit RGBA format (16 bits per channel). This method is the inverse of `to_rgba64`.
In GDScript and C#, the `int` is best visualized with hexadecimal notation (`"0x"` prefix, making it `"0xRRRRGGGGBBBBAAAA"`).

> method html(rgba: String) -> Color ; qualifiers=static

Returns a new color from `rgba`, an HTML hexadecimal color string. `rgba` is not case-sensitive, and may be prefixed by a hash sign (`#`).
`rgba` must be a valid three-digit or six-digit hexadecimal color string, and may contain an alpha channel value. If `rgba` does not contain an alpha channel value, an alpha channel value of 1.0 is applied. If `rgba` is invalid, returns an empty color.

```gdscript
                var blue = Color.html("#0000ff") # blue is Color(0.0, 0.0, 1.0, 1.0)
                var green = Color.html("#0F0")   # green is Color(0.0, 1.0, 0.0, 1.0)
                var col = Color.html("663399cc") # col is Color(0.4, 0.2, 0.6, 0.8)

```

```csharp
                var blue = Color.FromHtml("#0000ff"); // blue is Color(0.0, 0.0, 1.0, 1.0)
                var green = Color.FromHtml("#0F0");   // green is Color(0.0, 1.0, 0.0, 1.0)
                var col = Color.FromHtml("663399cc"); // col is Color(0.4, 0.2, 0.6, 0.8)

```

> method html_is_valid(color: String) -> bool ; qualifiers=static

Returns `true` if `color` is a valid HTML hexadecimal color string. The string must be a hexadecimal value (case-insensitive) of either 3, 4, 6 or 8 digits, and may be prefixed by a hash sign (`#`). This method is identical to `String.is_valid_html_color`.

```gdscript
                Color.html_is_valid("#55aaFF")   # Returns true
                Color.html_is_valid("#55AAFF20") # Returns true
                Color.html_is_valid("55AAFF")    # Returns true
                Color.html_is_valid("#F2C")      # Returns true

                Color.html_is_valid("#AABBC")    # Returns false
                Color.html_is_valid("#55aaFF5")  # Returns false

```

```csharp
                Color.HtmlIsValid("#55AAFF");   // Returns true
                Color.HtmlIsValid("#55AAFF20"); // Returns true
                Color.HtmlIsValid("55AAFF");    // Returns true
                Color.HtmlIsValid("#F2C");      // Returns true

                Color.HtmlIsValid("#AABBC");    // Returns false
                Color.HtmlIsValid("#55aaFF5");  // Returns false

```

> method inverted() -> Color ; qualifiers=const

Returns the color with its `r`, `g`, and `b` components inverted (`(1 - r, 1 - g, 1 - b, a)`).

```gdscript
                var black = Color.WHITE.inverted()
                var color = Color(0.3, 0.4, 0.9)
                var inverted_color = color.inverted() # Equivalent to `Color(0.7, 0.6, 0.1)`

```

```csharp
                var black = Colors.White.Inverted();
                var color = new Color(0.3f, 0.4f, 0.9f);
                Color invertedColor = color.Inverted(); // Equivalent to `new Color(0.7f, 0.6f, 0.1f)`

```

> method is_equal_approx(to: Color) -> bool ; qualifiers=const

Returns `true` if this color and `to` are approximately equal, by running `@GlobalScope.is_equal_approx` on each component.

> method lerp(to: Color, weight: float) -> Color ; qualifiers=const

Returns the linear interpolation between this color's components and `to`'s components. The interpolation factor `weight` should be between 0.0 and 1.0 (inclusive). See also `@GlobalScope.lerp`.

```gdscript
                var red = Color(1.0, 0.0, 0.0)
                var aqua = Color(0.0, 1.0, 0.8)

                red.lerp(aqua, 0.2) # Returns Color(0.8, 0.2, 0.16)
                red.lerp(aqua, 0.5) # Returns Color(0.5, 0.5, 0.4)
                red.lerp(aqua, 1.0) # Returns Color(0.0, 1.0, 0.8)

```

```csharp
                var red = new Color(1.0f, 0.0f, 0.0f);
                var aqua = new Color(0.0f, 1.0f, 0.8f);

                red.Lerp(aqua, 0.2f); // Returns Color(0.8f, 0.2f, 0.16f)
                red.Lerp(aqua, 0.5f); // Returns Color(0.5f, 0.5f, 0.4f)
                red.Lerp(aqua, 1.0f); // Returns Color(0.0f, 1.0f, 0.8f)

```

> method lightened(amount: float) -> Color ; qualifiers=const

Returns a new color resulting from making this color lighter by the specified `amount`, which should be a ratio from 0.0 to 1.0. See also `darkened`.

```gdscript
                var green = Color(0.0, 1.0, 0.0)
                var light_green = green.lightened(0.2) # 20% lighter than regular green

```

```csharp
                var green = new Color(0.0f, 1.0f, 0.0f);
                Color lightGreen = green.Lightened(0.2f); // 20% lighter than regular green

```

> method linear_to_srgb() -> Color ; qualifiers=const

Returns a copy of the color that is encoded using the [nonlinear sRGB transfer function](https://en.wikipedia.org/wiki/SRGB). This method requires the original color to use linear encoding. See also `srgb_to_linear` which performs the opposite operation.
**Note:** The color's alpha channel (`a`) is not affected. The alpha channel is always stored with linear encoding, regardless of the color space of the other color channels.

> method srgb_to_linear() -> Color ; qualifiers=const

Returns a copy of the color that uses linear encoding. This method requires the original color to be encoded using the [nonlinear sRGB transfer function](https://en.wikipedia.org/wiki/SRGB). See also `linear_to_srgb` which performs the opposite operation.
**Note:** The color's alpha channel (`a`) is not affected. The alpha channel is always stored with linear encoding, regardless of the color space of the other color channels.

> method to_abgr32() -> int ; qualifiers=const

Returns the color converted to a 32-bit integer in ABGR format (each component is 8 bits). ABGR is the reversed version of the default RGBA format.

```gdscript
                var color = Color(1, 0.5, 0.2)
                print(color.to_abgr32()) # Prints 4281565439

```

```csharp
                var color = new Color(1.0f, 0.5f, 0.2f);
                GD.Print(color.ToAbgr32()); // Prints 4281565439

```

> method to_abgr64() -> int ; qualifiers=const

Returns the color converted to a 64-bit integer in ABGR format (each component is 16 bits). ABGR is the reversed version of the default RGBA format.

```gdscript
                var color = Color(1, 0.5, 0.2)
                print(color.to_abgr64()) # Prints -225178692812801

```

```csharp
                var color = new Color(1.0f, 0.5f, 0.2f);
                GD.Print(color.ToAbgr64()); // Prints -225178692812801

```

> method to_argb32() -> int ; qualifiers=const

Returns the color converted to a 32-bit integer in ARGB format (each component is 8 bits). ARGB is more compatible with DirectX.

```gdscript
                var color = Color(1, 0.5, 0.2)
                print(color.to_argb32()) # Prints 4294934323

```

```csharp
                var color = new Color(1.0f, 0.5f, 0.2f);
                GD.Print(color.ToArgb32()); // Prints 4294934323

```

> method to_argb64() -> int ; qualifiers=const

Returns the color converted to a 64-bit integer in ARGB format (each component is 16 bits). ARGB is more compatible with DirectX.

```gdscript
                var color = Color(1, 0.5, 0.2)
                print(color.to_argb64()) # Prints -2147470541

```

```csharp
                var color = new Color(1.0f, 0.5f, 0.2f);
                GD.Print(color.ToArgb64()); // Prints -2147470541

```

> method to_html(with_alpha: bool = true) -> String ; qualifiers=const

Returns the color converted to an HTML hexadecimal color `String` in RGBA format, without the hash (`#`) prefix.
Setting `with_alpha` to `false`, excludes alpha from the hexadecimal string, using RGB format instead of RGBA format.

```gdscript
                var white = Color(1, 1, 1, 0.5)
                var with_alpha = white.to_html() # Returns "ffffff7f"
                var without_alpha = white.to_html(false) # Returns "ffffff"

```

```csharp
                var white = new Color(1, 1, 1, 0.5f);
                string withAlpha = white.ToHtml(); // Returns "ffffff7f"
                string withoutAlpha = white.ToHtml(false); // Returns "ffffff"

```

> method to_rgba32() -> int ; qualifiers=const

Returns the color converted to a 32-bit integer in RGBA format (each component is 8 bits). RGBA is Godot's default format. This method is the inverse of `hex`.

```gdscript
                var color = Color(1, 0.5, 0.2)
                print(color.to_rgba32()) # Prints 4286526463

```

```csharp
                var color = new Color(1, 0.5f, 0.2f);
                GD.Print(color.ToRgba32()); // Prints 4286526463

```

> method to_rgba64() -> int ; qualifiers=const

Returns the color converted to a 64-bit integer in RGBA format (each component is 16 bits). RGBA is Godot's default format. This method is the inverse of `hex64`.

```gdscript
                var color = Color(1, 0.5, 0.2)
                print(color.to_rgba64()) # Prints -140736629309441

```

```csharp
                var color = new Color(1, 0.5f, 0.2f);
                GD.Print(color.ToRgba64()); // Prints -140736629309441

```

## Operators

> operator !=(right: Color) -> bool

Returns `true` if the colors are not exactly equal.
**Note:** Due to floating-point precision errors, consider using `is_equal_approx` instead, which is more reliable.

> operator *(right: Color) -> Color

Multiplies each component of the `Color` by the components of the given `Color`.

> operator *(right: float) -> Color

Multiplies each component of the `Color` by the given `float`.

> operator *(right: int) -> Color

Multiplies each component of the `Color` by the given `int`.

> operator +(right: Color) -> Color

Adds each component of the `Color` with the components of the given `Color`.

> operator -(right: Color) -> Color

Subtracts each component of the `Color` by the components of the given `Color`.

> operator /(right: Color) -> Color

Divides each component of the `Color` by the components of the given `Color`.

> operator /(right: float) -> Color

Divides each component of the `Color` by the given `float`.

> operator /(right: int) -> Color

Divides each component of the `Color` by the given `int`.

> operator ==(right: Color) -> bool

Returns `true` if the colors are exactly equal.
**Note:** Due to floating-point precision errors, consider using `is_equal_approx` instead, which is more reliable.

> operator [](index: int) -> float

Access color components using their index. `[0]` is equivalent to `r`, `[1]` is equivalent to `g`, `[2]` is equivalent to `b`, and `[3]` is equivalent to `a`.

> operator unary+() -> Color

Returns the same value as if the `+` was not there. Unary `+` does nothing, but sometimes it can make your code more readable.

> operator unary-() -> Color

Inverts the given color. This is equivalent to `Color.WHITE - c` or `Color(1 - c.r, 1 - c.g, 1 - c.b, 1 - c.a)`. Unlike with `inverted`, the `a` component is inverted, too.

## Constants

> constant ALICE_BLUE = Color(0.9411765, 0.972549, 1, 1)

Alice blue color.

> constant ANTIQUE_WHITE = Color(0.98039216, 0.92156863, 0.84313726, 1)

Antique white color.

> constant AQUA = Color(0, 1, 1, 1)

Aqua color.

> constant AQUAMARINE = Color(0.49803922, 1, 0.83137256, 1)

Aquamarine color.

> constant AZURE = Color(0.9411765, 1, 1, 1)

Azure color.

> constant BEIGE = Color(0.9607843, 0.9607843, 0.8627451, 1)

Beige color.

> constant BISQUE = Color(1, 0.89411765, 0.76862746, 1)

Bisque color.

> constant BLACK = Color(0, 0, 0, 1)

Black color. In GDScript, this is the default value of any color.

> constant BLANCHED_ALMOND = Color(1, 0.92156863, 0.8039216, 1)

Blanched almond color.

> constant BLUE = Color(0, 0, 1, 1)

Blue color.

> constant BLUE_VIOLET = Color(0.5411765, 0.16862746, 0.8862745, 1)

Blue violet color.

> constant BROWN = Color(0.64705884, 0.16470589, 0.16470589, 1)

Brown color.

> constant BURLYWOOD = Color(0.87058824, 0.72156864, 0.5294118, 1)

Burlywood color.

> constant CADET_BLUE = Color(0.37254903, 0.61960787, 0.627451, 1)

Cadet blue color.

> constant CHARTREUSE = Color(0.49803922, 1, 0, 1)

Chartreuse color.

> constant CHOCOLATE = Color(0.8235294, 0.4117647, 0.11764706, 1)

Chocolate color.

> constant CORAL = Color(1, 0.49803922, 0.3137255, 1)

Coral color.

> constant CORNFLOWER_BLUE = Color(0.39215687, 0.58431375, 0.92941177, 1)

Cornflower blue color.

> constant CORNSILK = Color(1, 0.972549, 0.8627451, 1)

Cornsilk color.

> constant CRIMSON = Color(0.8627451, 0.078431375, 0.23529412, 1)

Crimson color.

> constant CYAN = Color(0, 1, 1, 1)

Cyan color.

> constant DARK_BLUE = Color(0, 0, 0.54509807, 1)

Dark blue color.

> constant DARK_CYAN = Color(0, 0.54509807, 0.54509807, 1)

Dark cyan color.

> constant DARK_GOLDENROD = Color(0.72156864, 0.5254902, 0.043137256, 1)

Dark goldenrod color.

> constant DARK_GRAY = Color(0.6627451, 0.6627451, 0.6627451, 1)

Dark gray color.

> constant DARK_GREEN = Color(0, 0.39215687, 0, 1)

Dark green color.

> constant DARK_KHAKI = Color(0.7411765, 0.7176471, 0.41960785, 1)

Dark khaki color.

> constant DARK_MAGENTA = Color(0.54509807, 0, 0.54509807, 1)

Dark magenta color.

> constant DARK_OLIVE_GREEN = Color(0.33333334, 0.41960785, 0.18431373, 1)

Dark olive green color.

> constant DARK_ORANGE = Color(1, 0.54901963, 0, 1)

Dark orange color.

> constant DARK_ORCHID = Color(0.6, 0.19607843, 0.8, 1)

Dark orchid color.

> constant DARK_RED = Color(0.54509807, 0, 0, 1)

Dark red color.

> constant DARK_SALMON = Color(0.9137255, 0.5882353, 0.47843137, 1)

Dark salmon color.

> constant DARK_SEA_GREEN = Color(0.56078434, 0.7372549, 0.56078434, 1)

Dark sea green color.

> constant DARK_SLATE_BLUE = Color(0.28235295, 0.23921569, 0.54509807, 1)

Dark slate blue color.

> constant DARK_SLATE_GRAY = Color(0.18431373, 0.30980393, 0.30980393, 1)

Dark slate gray color.

> constant DARK_TURQUOISE = Color(0, 0.80784315, 0.81960785, 1)

Dark turquoise color.

> constant DARK_VIOLET = Color(0.5803922, 0, 0.827451, 1)

Dark violet color.

> constant DEEP_PINK = Color(1, 0.078431375, 0.5764706, 1)

Deep pink color.

> constant DEEP_SKY_BLUE = Color(0, 0.7490196, 1, 1)

Deep sky blue color.

> constant DIM_GRAY = Color(0.4117647, 0.4117647, 0.4117647, 1)

Dim gray color.

> constant DODGER_BLUE = Color(0.11764706, 0.5647059, 1, 1)

Dodger blue color.

> constant FIREBRICK = Color(0.69803923, 0.13333334, 0.13333334, 1)

Firebrick color.

> constant FLORAL_WHITE = Color(1, 0.98039216, 0.9411765, 1)

Floral white color.

> constant FOREST_GREEN = Color(0.13333334, 0.54509807, 0.13333334, 1)

Forest green color.

> constant FUCHSIA = Color(1, 0, 1, 1)

Fuchsia color.

> constant GAINSBORO = Color(0.8627451, 0.8627451, 0.8627451, 1)

Gainsboro color.

> constant GHOST_WHITE = Color(0.972549, 0.972549, 1, 1)

Ghost white color.

> constant GOLD = Color(1, 0.84313726, 0, 1)

Gold color.

> constant GOLDENROD = Color(0.85490197, 0.64705884, 0.1254902, 1)

Goldenrod color.

> constant GRAY = Color(0.74509805, 0.74509805, 0.74509805, 1)

Gray color.

> constant GREEN = Color(0, 1, 0, 1)

Green color.

> constant GREEN_YELLOW = Color(0.6784314, 1, 0.18431373, 1)

Green yellow color.

> constant HONEYDEW = Color(0.9411765, 1, 0.9411765, 1)

Honeydew color.

> constant HOT_PINK = Color(1, 0.4117647, 0.7058824, 1)

Hot pink color.

> constant INDIAN_RED = Color(0.8039216, 0.36078432, 0.36078432, 1)

Indian red color.

> constant INDIGO = Color(0.29411766, 0, 0.50980395, 1)

Indigo color.

> constant IVORY = Color(1, 1, 0.9411765, 1)

Ivory color.

> constant KHAKI = Color(0.9411765, 0.9019608, 0.54901963, 1)

Khaki color.

> constant LAVENDER = Color(0.9019608, 0.9019608, 0.98039216, 1)

Lavender color.

> constant LAVENDER_BLUSH = Color(1, 0.9411765, 0.9607843, 1)

Lavender blush color.

> constant LAWN_GREEN = Color(0.4862745, 0.9882353, 0, 1)

Lawn green color.

> constant LEMON_CHIFFON = Color(1, 0.98039216, 0.8039216, 1)

Lemon chiffon color.

> constant LIGHT_BLUE = Color(0.6784314, 0.84705883, 0.9019608, 1)

Light blue color.

> constant LIGHT_CORAL = Color(0.9411765, 0.5019608, 0.5019608, 1)

Light coral color.

> constant LIGHT_CYAN = Color(0.8784314, 1, 1, 1)

Light cyan color.

> constant LIGHT_GOLDENROD = Color(0.98039216, 0.98039216, 0.8235294, 1)

Light goldenrod color.

> constant LIGHT_GRAY = Color(0.827451, 0.827451, 0.827451, 1)

Light gray color.

> constant LIGHT_GREEN = Color(0.5647059, 0.93333334, 0.5647059, 1)

Light green color.

> constant LIGHT_PINK = Color(1, 0.7137255, 0.75686276, 1)

Light pink color.

> constant LIGHT_SALMON = Color(1, 0.627451, 0.47843137, 1)

Light salmon color.

> constant LIGHT_SEA_GREEN = Color(0.1254902, 0.69803923, 0.6666667, 1)

Light sea green color.

> constant LIGHT_SKY_BLUE = Color(0.5294118, 0.80784315, 0.98039216, 1)

Light sky blue color.

> constant LIGHT_SLATE_GRAY = Color(0.46666667, 0.53333336, 0.6, 1)

Light slate gray color.

> constant LIGHT_STEEL_BLUE = Color(0.6901961, 0.76862746, 0.87058824, 1)

Light steel blue color.

> constant LIGHT_YELLOW = Color(1, 1, 0.8784314, 1)

Light yellow color.

> constant LIME = Color(0, 1, 0, 1)

Lime color.

> constant LIME_GREEN = Color(0.19607843, 0.8039216, 0.19607843, 1)

Lime green color.

> constant LINEN = Color(0.98039216, 0.9411765, 0.9019608, 1)

Linen color.

> constant MAGENTA = Color(1, 0, 1, 1)

Magenta color.

> constant MAROON = Color(0.6901961, 0.1882353, 0.3764706, 1)

Maroon color.

> constant MEDIUM_AQUAMARINE = Color(0.4, 0.8039216, 0.6666667, 1)

Medium aquamarine color.

> constant MEDIUM_BLUE = Color(0, 0, 0.8039216, 1)

Medium blue color.

> constant MEDIUM_ORCHID = Color(0.7294118, 0.33333334, 0.827451, 1)

Medium orchid color.

> constant MEDIUM_PURPLE = Color(0.5764706, 0.4392157, 0.85882354, 1)

Medium purple color.

> constant MEDIUM_SEA_GREEN = Color(0.23529412, 0.7019608, 0.44313726, 1)

Medium sea green color.

> constant MEDIUM_SLATE_BLUE = Color(0.48235294, 0.40784314, 0.93333334, 1)

Medium slate blue color.

> constant MEDIUM_SPRING_GREEN = Color(0, 0.98039216, 0.6039216, 1)

Medium spring green color.

> constant MEDIUM_TURQUOISE = Color(0.28235295, 0.81960785, 0.8, 1)

Medium turquoise color.

> constant MEDIUM_VIOLET_RED = Color(0.78039217, 0.08235294, 0.52156866, 1)

Medium violet red color.

> constant MIDNIGHT_BLUE = Color(0.09803922, 0.09803922, 0.4392157, 1)

Midnight blue color.

> constant MINT_CREAM = Color(0.9607843, 1, 0.98039216, 1)

Mint cream color.

> constant MISTY_ROSE = Color(1, 0.89411765, 0.88235295, 1)

Misty rose color.

> constant MOCCASIN = Color(1, 0.89411765, 0.70980394, 1)

Moccasin color.

> constant NAVAJO_WHITE = Color(1, 0.87058824, 0.6784314, 1)

Navajo white color.

> constant NAVY_BLUE = Color(0, 0, 0.5019608, 1)

Navy blue color.

> constant OLD_LACE = Color(0.99215686, 0.9607843, 0.9019608, 1)

Old lace color.

> constant OLIVE = Color(0.5019608, 0.5019608, 0, 1)

Olive color.

> constant OLIVE_DRAB = Color(0.41960785, 0.5568628, 0.13725491, 1)

Olive drab color.

> constant ORANGE = Color(1, 0.64705884, 0, 1)

Orange color.

> constant ORANGE_RED = Color(1, 0.27058825, 0, 1)

Orange red color.

> constant ORCHID = Color(0.85490197, 0.4392157, 0.8392157, 1)

Orchid color.

> constant PALE_GOLDENROD = Color(0.93333334, 0.9098039, 0.6666667, 1)

Pale goldenrod color.

> constant PALE_GREEN = Color(0.59607846, 0.9843137, 0.59607846, 1)

Pale green color.

> constant PALE_TURQUOISE = Color(0.6862745, 0.93333334, 0.93333334, 1)

Pale turquoise color.

> constant PALE_VIOLET_RED = Color(0.85882354, 0.4392157, 0.5764706, 1)

Pale violet red color.

> constant PAPAYA_WHIP = Color(1, 0.9372549, 0.8352941, 1)

Papaya whip color.

> constant PEACH_PUFF = Color(1, 0.85490197, 0.7254902, 1)

Peach puff color.

> constant PERU = Color(0.8039216, 0.52156866, 0.24705882, 1)

Peru color.

> constant PINK = Color(1, 0.7529412, 0.79607844, 1)

Pink color.

> constant PLUM = Color(0.8666667, 0.627451, 0.8666667, 1)

Plum color.

> constant POWDER_BLUE = Color(0.6901961, 0.8784314, 0.9019608, 1)

Powder blue color.

> constant PURPLE = Color(0.627451, 0.1254902, 0.9411765, 1)

Purple color.

> constant REBECCA_PURPLE = Color(0.4, 0.2, 0.6, 1)

Rebecca purple color.

> constant RED = Color(1, 0, 0, 1)

Red color.

> constant ROSY_BROWN = Color(0.7372549, 0.56078434, 0.56078434, 1)

Rosy brown color.

> constant ROYAL_BLUE = Color(0.25490198, 0.4117647, 0.88235295, 1)

Royal blue color.

> constant SADDLE_BROWN = Color(0.54509807, 0.27058825, 0.07450981, 1)

Saddle brown color.

> constant SALMON = Color(0.98039216, 0.5019608, 0.44705883, 1)

Salmon color.

> constant SANDY_BROWN = Color(0.95686275, 0.6431373, 0.3764706, 1)

Sandy brown color.

> constant SEA_GREEN = Color(0.18039216, 0.54509807, 0.34117648, 1)

Sea green color.

> constant SEASHELL = Color(1, 0.9607843, 0.93333334, 1)

Seashell color.

> constant SIENNA = Color(0.627451, 0.32156864, 0.1764706, 1)

Sienna color.

> constant SILVER = Color(0.7529412, 0.7529412, 0.7529412, 1)

Silver color.

> constant SKY_BLUE = Color(0.5294118, 0.80784315, 0.92156863, 1)

Sky blue color.

> constant SLATE_BLUE = Color(0.41568628, 0.3529412, 0.8039216, 1)

Slate blue color.

> constant SLATE_GRAY = Color(0.4392157, 0.5019608, 0.5647059, 1)

Slate gray color.

> constant SNOW = Color(1, 0.98039216, 0.98039216, 1)

Snow color.

> constant SPRING_GREEN = Color(0, 1, 0.49803922, 1)

Spring green color.

> constant STEEL_BLUE = Color(0.27450982, 0.50980395, 0.7058824, 1)

Steel blue color.

> constant TAN = Color(0.8235294, 0.7058824, 0.54901963, 1)

Tan color.

> constant TEAL = Color(0, 0.5019608, 0.5019608, 1)

Teal color.

> constant THISTLE = Color(0.84705883, 0.7490196, 0.84705883, 1)

Thistle color.

> constant TOMATO = Color(1, 0.3882353, 0.2784314, 1)

Tomato color.

> constant TRANSPARENT = Color(1, 1, 1, 0)

Transparent color (white with zero alpha).

> constant TURQUOISE = Color(0.2509804, 0.8784314, 0.8156863, 1)

Turquoise color.

> constant VIOLET = Color(0.93333334, 0.50980395, 0.93333334, 1)

Violet color.

> constant WEB_GRAY = Color(0.5019608, 0.5019608, 0.5019608, 1)

Web gray color.

> constant WEB_GREEN = Color(0, 0.5019608, 0, 1)

Web green color.

> constant WEB_MAROON = Color(0.5019608, 0, 0, 1)

Web maroon color.

> constant WEB_PURPLE = Color(0.5019608, 0, 0.5019608, 1)

Web purple color.

> constant WHEAT = Color(0.9607843, 0.87058824, 0.7019608, 1)

Wheat color.

> constant WHITE = Color(1, 1, 1, 1)

White color.

> constant WHITE_SMOKE = Color(0.9607843, 0.9607843, 0.9607843, 1)

White smoke color.

> constant YELLOW = Color(1, 1, 0, 1)

Yellow color.

> constant YELLOW_GREEN = Color(0.6039216, 0.8039216, 0.19607843, 1)

Yellow green color.

## Tutorials
- [2D GD Paint Demo](https://godotengine.org/asset-library/asset/2768)
- [Tween Interpolation Demo](https://godotengine.org/asset-library/asset/2733)
- [GUI Drag And Drop Demo](https://godotengine.org/asset-library/asset/2767)
