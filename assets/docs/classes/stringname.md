# StringName

> class StringName

## Brief

A built-in type for unique strings.

## Description

`StringName`s are immutable strings designed for general-purpose representation of unique names (also called "string interning"). Two `StringName`s with the same value are the same object. Comparing them is extremely fast compared to regular `String`s.
You will usually pass a `String` to methods expecting a `StringName` and it will be automatically converted (often at compile time), but in rare cases you can construct a `StringName` ahead of time with the `StringName` constructor or, in GDScript, the literal syntax `&"example"`. Manually constructing a `StringName` allows you to control when the conversion from `String` occurs or to use the literal and prevent conversions entirely.
See also `NodePath`, which is a similar concept specifically designed to store pre-parsed scene tree paths.
All of `String`'s methods are available in this class too. They convert the `StringName` into a string, and they also return a string. This is highly inefficient and should only be used if the string is desired.
**Note:** In C#, an explicit conversion to `System.String` is required to use the methods listed on this page. Use the `ToString()` method to cast a `StringName` to a string, and then use the equivalent methods in `System.String` or `StringExtensions`.
**Note:** In a boolean context, a `StringName` will evaluate to `false` if it is empty (`StringName("")`). Otherwise, a `StringName` will always evaluate to `true`.

## Constructors

> constructor StringName()

Constructs an empty `StringName`.

> constructor StringName(from: StringName)

Constructs a `StringName` as a copy of the given `StringName`.

> constructor StringName(from: String)

Creates a new `StringName` from the given `String`. In GDScript, `StringName("example")` is equivalent to `&"example"`.

## Methods

> method begins_with(text: String) -> bool ; qualifiers=const

Returns `true` if the string begins with the given `text`. See also `ends_with`.

> method bigrams() -> PackedStringArray ; qualifiers=const

Returns an array containing the bigrams (pairs of consecutive characters) of this string.

```text
                print("Get up!".bigrams()) # Prints ["Ge", "et", "t ", " u", "up", "p!"]

```

> method bin_to_int() -> int ; qualifiers=const

Converts the string representing a binary number into an `int`. The string may optionally be prefixed with `"0b"`, and an additional `-` prefix for negative numbers.

```gdscript
                print("101".bin_to_int())   # Prints 5
                print("0b101".bin_to_int()) # Prints 5
                print("-0b10".bin_to_int()) # Prints -2

```

```csharp
                GD.Print("101".BinToInt());   // Prints 5
                GD.Print("0b101".BinToInt()); // Prints 5
                GD.Print("-0b10".BinToInt()); // Prints -2

```

> method c_escape() -> String ; qualifiers=const

Returns a copy of the string with special characters escaped using the C language standard.

> method c_unescape() -> String ; qualifiers=const

Returns a copy of the string with escaped characters replaced by their meanings. Supported escape sequences are `\'`, `\"`, `\\`, `\a`, `\b`, `\f`, `\n`, `\r`, `\t`, `\v`.
**Note:** Unlike the GDScript parser, this method doesn't support the `\uXXXX` escape sequence.

> method capitalize() -> String ; qualifiers=const

Changes the appearance of the string: replaces underscores (`_`) with spaces, adds spaces before uppercase letters in the middle of a word, converts all letters to lowercase, then converts the first one and each one following a space to uppercase.

```gdscript
                "move_local_x".capitalize()   # Returns "Move Local X"
                "sceneFile_path".capitalize() # Returns "Scene File Path"
                "2D, FPS, PNG".capitalize()   # Returns "2d, Fps, Png"

```

```csharp
                "move_local_x".Capitalize();   // Returns "Move Local X"
                "sceneFile_path".Capitalize(); // Returns "Scene File Path"
                "2D, FPS, PNG".Capitalize();   // Returns "2d, Fps, Png"

```

> method casecmp_to(to: String) -> int ; qualifiers=const

Performs a case-sensitive comparison to another string. Returns `-1` if less than, `1` if greater than, or `0` if equal. "Less than" and "greater than" are determined by the [Unicode code points](https://en.wikipedia.org/wiki/List_of_Unicode_characters) of each string, which roughly matches the alphabetical order.
With different string lengths, returns `1` if this string is longer than the `to` string, or `-1` if shorter. Note that the length of empty strings is *always* `0`.
To get a `bool` result from a string comparison, use the `==` operator instead. See also `nocasecmp_to`, `filecasecmp_to`, and `naturalcasecmp_to`.

> method contains(what: String) -> bool ; qualifiers=const

Returns `true` if the string contains `what`. In GDScript, this corresponds to the `in` operator.

```gdscript
                print("Node".contains("de")) # Prints true
                print("team".contains("I"))  # Prints false
                print("I" in "team")         # Prints false

```

```csharp
                GD.Print("Node".Contains("de")); // Prints True
                GD.Print("team".Contains("I"));  // Prints False

```

If you need to know where `what` is within the string, use `find`. See also `containsn`.

> method containsn(what: String) -> bool ; qualifiers=const

Returns `true` if the string contains `what`, **ignoring case**.
If you need to know where `what` is within the string, use `findn`. See also `contains`.

> method count(what: String, from: int = 0, to: int = 0) -> int ; qualifiers=const

Returns the number of occurrences of the substring `what` between `from` and `to` positions. If `to` is 0, the search continues until the end of the string.

> method countn(what: String, from: int = 0, to: int = 0) -> int ; qualifiers=const

Returns the number of occurrences of the substring `what` between `from` and `to` positions, **ignoring case**. If `to` is 0, the search continues until the end of the string.

> method dedent() -> String ; qualifiers=const

Returns a copy of the string with indentation (leading tabs and spaces) removed. See also `indent` to add indentation.

> method ends_with(text: String) -> bool ; qualifiers=const

Returns `true` if the string ends with the given `text`. See also `begins_with`.

> method erase(position: int, chars: int = 1) -> String ; qualifiers=const

Returns a string with `chars` characters erased starting from `position`. If `chars` goes beyond the string's length given the specified `position`, fewer characters will be erased from the returned string. Returns an empty string if either `position` or `chars` is negative. Returns the original string unmodified if `chars` is `0`.

> method filecasecmp_to(to: String) -> int ; qualifiers=const

Like `naturalcasecmp_to` but prioritizes strings that begin with periods (`.`) and underscores (`_`) before any other character. Useful when sorting folders or file names.
To get a `bool` result from a string comparison, use the `==` operator instead. See also `filenocasecmp_to`, `naturalcasecmp_to`, and `casecmp_to`.

> method filenocasecmp_to(to: String) -> int ; qualifiers=const

Like `naturalnocasecmp_to` but prioritizes strings that begin with periods (`.`) and underscores (`_`) before any other character. Useful when sorting folders or file names.
To get a `bool` result from a string comparison, use the `==` operator instead. See also `filecasecmp_to`, `naturalnocasecmp_to`, and `nocasecmp_to`.

> method find(what: String, from: int = 0) -> int ; qualifiers=const

Returns the index of the **first** occurrence of `what` in this string, or `-1` if there are none. The search's start can be specified with `from`, continuing to the end of the string.

```gdscript
                print("Team".find("I")) # Prints -1

                print("Potato".find("t"))    # Prints 2
                print("Potato".find("t", 3)) # Prints 4
                print("Potato".find("t", 5)) # Prints -1

```

```csharp
                GD.Print("Team".Find("I")); // Prints -1

                GD.Print("Potato".Find("t"));    // Prints 2
                GD.Print("Potato".Find("t", 3)); // Prints 4
                GD.Print("Potato".Find("t", 5)); // Prints -1

```

**Note:** If you just want to know whether the string contains `what`, use `contains`. In GDScript, you may also use the `in` operator.
**Note:** A negative value of `from` is converted to a starting index by counting back from the last possible index with enough space to find `what`.

> method findn(what: String, from: int = 0) -> int ; qualifiers=const

Returns the index of the **first** **case-insensitive** occurrence of `what` in this string, or `-1` if there are none. The starting search index can be specified with `from`, continuing to the end of the string.

> method format(values: Variant, placeholder: String = "{_}") -> String ; qualifiers=const

Formats the string by replacing all occurrences of `placeholder` with the elements of `values`.
`values` can be a `Dictionary`, an `Array`, or an `Object`. Any underscores in `placeholder` will be replaced with the corresponding keys in advance. Array elements use their index as keys.

```text
                # Prints "Waiting for Godot is a play by Samuel Beckett, and Godot Engine is named after it."
                var use_array_values = "Waiting for {0} is a play by {1}, and {0} Engine is named after it."
                print(use_array_values.format(["Godot", "Samuel Beckett"]))

                # Prints "User 42 is Godot."
                print("User {id} is {name}.".format({"id": 42, "name": "Godot"}))

```

Some additional handling is performed when `values` is an `Array`. If `placeholder` does not contain an underscore, the elements of the `values` array will be used to replace one occurrence of the placeholder in order; If an element of `values` is another 2-element array, it'll be interpreted as a key-value pair.

```text
                # Prints "User 42 is Godot."
                print("User {} is {}.".format([42, "Godot"], "{}"))
                print("User {id} is {name}.".format([["id", 42], ["name", "Godot"]]))

```

When passing an `Object`, the property names from `Object.get_property_list` are used as keys.

```text
                # Prints "Visible true, position (0, 0)"
                var node = Node2D.new()
                print("Visible {visible}, position {position}".format(node))

```

See also the [GDScript format string]($DOCS_URL/tutorials/scripting/gdscript/gdscript_format_string.html) tutorial.
**Note:** Each replacement is done sequentially for each element of `values`, **not** all at once. This means that if any element is inserted and it contains another placeholder, it may be changed by the next replacement. While this can be very useful, it often causes unexpected results. If not necessary, make sure `values`'s elements do not contain placeholders.

```text
                print("{0} {1}".format(["{1}", "x"]))           # Prints "x x"
                print("{0} {1}".format(["x", "{0}"]))           # Prints "x {0}"
                print("{a} {b}".format({"a": "{b}", "b": "c"})) # Prints "c c"
                print("{a} {b}".format({"b": "c", "a": "{b}"})) # Prints "{b} c"

```

**Note:** In C#, it's recommended to [interpolate strings with "$"](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/tokens/interpolated), instead.

> method get_base_dir() -> String ; qualifiers=const

If the string is a valid file path, returns the base directory name.

```text
                var dir_path = "/path/to/file.txt".get_base_dir() # dir_path is "/path/to"

```

> method get_basename() -> String ; qualifiers=const

If the string is a valid file path, returns the full file path, without the extension.

```text
                var base = "/path/to/file.txt".get_basename() # base is "/path/to/file"

```

> method get_extension() -> String ; qualifiers=const

If the string is a valid file name or path, returns the file extension without the leading period (`.`). Otherwise, returns an empty string.

```text
                var a = "/path/to/file.txt".get_extension() # a is "txt"
                var b = "cool.txt".get_extension()          # b is "txt"
                var c = "cool.font.tres".get_extension()    # c is "tres"
                var d = ".pack1".get_extension()            # d is "pack1"

                var e = "file.txt.".get_extension()  # e is ""
                var f = "file.txt..".get_extension() # f is ""
                var g = "txt".get_extension()        # g is ""
                var h = "".get_extension()           # h is ""

```

> method get_file() -> String ; qualifiers=const

If the string is a valid file path, returns the file name, including the extension.

```text
                var file = "/path/to/icon.png".get_file() # file is "icon.png"

```

> method get_slice(delimiter: String, slice: int) -> String ; qualifiers=const

Splits the string using a `delimiter` and returns the substring at index `slice`. Returns the original string if `delimiter` does not occur in the string. Returns an empty string if the `slice` does not exist.
This is faster than `split`, if you only need one substring.

```text
                print("i/am/example/hi".get_slice("/", 2)) # Prints "example"

```

> method get_slice_count(delimiter: String) -> int ; qualifiers=const

Returns the total number of slices when the string is split with the given `delimiter` (see `split`).

> method get_slicec(delimiter: int, slice: int) -> String ; qualifiers=const

Splits the string using a Unicode character with code `delimiter` and returns the substring at index `slice`. Returns an empty string if the `slice` does not exist.
This is faster than `split`, if you only need one substring.

> method hash() -> int ; qualifiers=const

Returns the 32-bit hash value representing the string's contents.
**Note:** Strings with equal hash values are *not* guaranteed to be the same, as a result of hash collisions. On the contrary, strings with different hash values are guaranteed to be different.

> method hex_decode() -> PackedByteArray ; qualifiers=const

Decodes a hexadecimal string as a `PackedByteArray`.

```gdscript
                var text = "hello world"
                var encoded = text.to_utf8_buffer().hex_encode() # outputs "68656c6c6f20776f726c64"
                print(encoded.hex_decode().get_string_from_utf8())

```

```csharp
                var text = "hello world";
                var encoded = text.ToUtf8Buffer().HexEncode(); // outputs "68656c6c6f20776f726c64"
                GD.Print(encoded.HexDecode().GetStringFromUtf8());

```

> method hex_to_int() -> int ; qualifiers=const

Converts the string representing a hexadecimal number into an `int`. The string may be optionally prefixed with `"0x"`, and an additional `-` prefix for negative numbers.

```gdscript
                print("0xff".hex_to_int()) # Prints 255
                print("ab".hex_to_int())   # Prints 171

```

```csharp
                GD.Print("0xff".HexToInt()); // Prints 255
                GD.Print("ab".HexToInt());   // Prints 171

```

> method indent(prefix: String) -> String ; qualifiers=const

Indents every line of the string with the given `prefix`. Empty lines are not indented. See also `dedent` to remove indentation.
For example, the string can be indented with two tabulations using `"\t\t"`, or four spaces using `"    "`.

> method insert(position: int, what: String) -> String ; qualifiers=const

Inserts `what` at the given `position` in the string.

> method is_absolute_path() -> bool ; qualifiers=const

Returns `true` if the string is a path to a file or directory, and its starting point is explicitly defined. This method is the opposite of `is_relative_path`.
This includes all paths starting with `"res://"`, `"user://"`, `"C:\"`, `"/"`, etc.

> method is_empty() -> bool ; qualifiers=const

Returns `true` if the string's length is `0` (`""`). See also `length`.

> method is_relative_path() -> bool ; qualifiers=const

Returns `true` if the string is a path, and its starting point is dependent on context. The path could begin from the current directory, or the current `Node` (if the string is derived from a `NodePath`), and may sometimes be prefixed with `"./"`. This method is the opposite of `is_absolute_path`.

> method is_subsequence_of(text: String) -> bool ; qualifiers=const

Returns `true` if all characters of this string can be found in `text` in their original order. This is not the same as `contains`.

```text
                var text = "Wow, incredible!"

                print("inedible".is_subsequence_of(text)) # Prints true
                print("Word!".is_subsequence_of(text))    # Prints true
                print("Window".is_subsequence_of(text))   # Prints false
                print("".is_subsequence_of(text))         # Prints true

```

> method is_subsequence_ofn(text: String) -> bool ; qualifiers=const

Returns `true` if all characters of this string can be found in `text` in their original order, **ignoring case**. This is not the same as `containsn`.

> method is_valid_ascii_identifier() -> bool ; qualifiers=const

Returns `true` if this string is a valid ASCII identifier. A valid ASCII identifier may contain only letters, digits, and underscores (`_`), and the first character may not be a digit.

```text
                print("node_2d".is_valid_ascii_identifier())    # Prints true
                print("TYPE_FLOAT".is_valid_ascii_identifier()) # Prints true
                print("1st_method".is_valid_ascii_identifier()) # Prints false
                print("MyMethod#2".is_valid_ascii_identifier()) # Prints false

```

See also `is_valid_unicode_identifier`.

> method is_valid_filename() -> bool ; qualifiers=const

Returns `true` if this string is a valid file name. A valid file name cannot be empty, begin or end with space characters, or contain characters that are not allowed (`:` `/` `\` `?` `*` `"` `|` `%` `<` `>`).

> method is_valid_float() -> bool ; qualifiers=const

Returns `true` if this string represents a valid floating-point number. A valid float may contain only digits, one decimal point (`.`), and the exponent letter (`e`). It may also be prefixed with a positive (`+`) or negative (`-`) sign. Any valid integer is also a valid float (see `is_valid_int`). See also `to_float`.

```text
                print("1.7".is_valid_float())   # Prints true
                print("24".is_valid_float())    # Prints true
                print("7e3".is_valid_float())   # Prints true
                print("Hello".is_valid_float()) # Prints false

```

> method is_valid_hex_number(with_prefix: bool = false) -> bool ; qualifiers=const

Returns `true` if this string is a valid hexadecimal number. A valid hexadecimal number only contains digits or letters `A` to `F` (either uppercase or lowercase), and may be prefixed with a positive (`+`) or negative (`-`) sign.
If `with_prefix` is `true`, the hexadecimal number needs to prefixed by `"0x"` to be considered valid.

```text
                print("A08E".is_valid_hex_number())    # Prints true
                print("-AbCdEf".is_valid_hex_number()) # Prints true
                print("2.5".is_valid_hex_number())     # Prints false

                print("0xDEADC0DE".is_valid_hex_number(true)) # Prints true

```

> method is_valid_html_color() -> bool ; qualifiers=const

Returns `true` if this string is a valid color in hexadecimal HTML notation. The string must be a hexadecimal value (see `is_valid_hex_number`) of either 3, 4, 6 or 8 digits, and may be prefixed by a hash sign (`#`). Other HTML notations for colors, such as names or `hsl()`, are not considered valid. See also `Color.html`.

> method is_valid_identifier() -> bool ; qualifiers=const ; deprecated=Use `is_valid_ascii_identifier` instead.

Returns `true` if this string is a valid identifier. A valid identifier may contain only letters, digits and underscores (`_`), and the first character may not be a digit.

```text
                print("node_2d".is_valid_identifier())    # Prints true
                print("TYPE_FLOAT".is_valid_identifier()) # Prints true
                print("1st_method".is_valid_identifier()) # Prints false
                print("MyMethod#2".is_valid_identifier()) # Prints false

```

> method is_valid_int() -> bool ; qualifiers=const

Returns `true` if this string represents a valid integer. A valid integer only contains digits, and may be prefixed with a positive (`+`) or negative (`-`) sign. See also `to_int`.

```text
                print("7".is_valid_int())    # Prints true
                print("1.65".is_valid_int()) # Prints false
                print("Hi".is_valid_int())   # Prints false
                print("+3".is_valid_int())   # Prints true
                print("-12".is_valid_int())  # Prints true

```

> method is_valid_ip_address() -> bool ; qualifiers=const

Returns `true` if this string represents a well-formatted IPv4 or IPv6 address. This method considers [reserved IP addresses](https://en.wikipedia.org/wiki/Reserved_IP_addresses) such as `"0.0.0.0"` and `"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"` as valid.

> method is_valid_unicode_identifier() -> bool ; qualifiers=const

Returns `true` if this string is a valid Unicode identifier.
A valid Unicode identifier must begin with a Unicode character of class `XID_Start` or `"_"`, and may contain Unicode characters of class `XID_Continue` in the other positions.

```text
                print("node_2d".is_valid_unicode_identifier())      # Prints true
                print("1st_method".is_valid_unicode_identifier())   # Prints false
                print("MyMethod#2".is_valid_unicode_identifier())   # Prints false
                print("állóképesség".is_valid_unicode_identifier()) # Prints true
                print("выносливость".is_valid_unicode_identifier()) # Prints true
                print("体力".is_valid_unicode_identifier())         # Prints true

```

See also `is_valid_ascii_identifier`.
**Note:** This method checks identifiers the same way as GDScript. See `TextServer.is_valid_identifier` for more advanced checks.

> method join(parts: PackedStringArray) -> String ; qualifiers=const

Returns the concatenation of `parts`' elements, with each element separated by the string calling this method. This method is the opposite of `split`.

```gdscript
                var fruits = ["Apple", "Orange", "Pear", "Kiwi"]

                print(", ".join(fruits))  # Prints "Apple, Orange, Pear, Kiwi"
                print("---".join(fruits)) # Prints "Apple---Orange---Pear---Kiwi"

```

```csharp
                string[] fruits = ["Apple", "Orange", "Pear", "Kiwi"];

                // In C#, this method is static.
                GD.Print(string.Join(", ", fruits));  // Prints "Apple, Orange, Pear, Kiwi"
                GD.Print(string.Join("---", fruits)); // Prints "Apple---Orange---Pear---Kiwi"

```

> method json_escape() -> String ; qualifiers=const

Returns a copy of the string with special characters escaped using the JSON standard. Because it closely matches the C standard, it is possible to use `c_unescape` to unescape the string, if necessary.

> method left(length: int) -> String ; qualifiers=const

Returns the first `length` characters from the beginning of the string. If `length` is negative, strips the last `length` characters from the string's end.

```text
                print("Hello World!".left(3))  # Prints "Hel"
                print("Hello World!".left(-4)) # Prints "Hello Wo"

```

> method length() -> int ; qualifiers=const

Returns the number of characters in the string. Empty strings (`""`) always return `0`. See also `is_empty`.

> method lpad(min_length: int, character: String = " ") -> String ; qualifiers=const

Formats the string to be at least `min_length` long by adding `character`s to the left of the string, if necessary. See also `rpad`.

> method lstrip(chars: String) -> String ; qualifiers=const

Removes a set of characters defined in `chars` from the string's beginning. See also `rstrip`.
**Note:** `chars` is not a prefix. Use `trim_prefix` to remove a single prefix, rather than a set of characters.

> method match(expr: String) -> bool ; qualifiers=const

Does a simple expression match (also called "glob" or "globbing"), where `*` matches zero or more arbitrary characters and `?` matches any single character except a period (`.`). An empty string or empty expression always evaluates to `false`.

> method matchn(expr: String) -> bool ; qualifiers=const

Does a simple **case-insensitive** expression match, where `*` matches zero or more arbitrary characters and `?` matches any single character except a period (`.`). An empty string or empty expression always evaluates to `false`.

> method md5_buffer() -> PackedByteArray ; qualifiers=const

Returns the [MD5 hash](https://en.wikipedia.org/wiki/MD5) of the string as a `PackedByteArray`.

> method md5_text() -> String ; qualifiers=const

Returns the [MD5 hash](https://en.wikipedia.org/wiki/MD5) of the string as another `String`.

> method naturalcasecmp_to(to: String) -> int ; qualifiers=const

Performs a **case-sensitive**, *natural order* comparison to another string. Returns `-1` if less than, `1` if greater than, or `0` if equal. "Less than" or "greater than" are determined by the [Unicode code points](https://en.wikipedia.org/wiki/List_of_Unicode_characters) of each string, which roughly matches the alphabetical order.
When used for sorting, natural order comparison orders sequences of numbers by the combined value of each digit as is often expected, instead of the single digit's value. A sorted sequence of numbered strings will be `["1", "2", "3", ...]`, not `["1", "10", "2", "3", ...]`.
With different string lengths, returns `1` if this string is longer than the `to` string, or `-1` if shorter. Note that the length of empty strings is *always* `0`.
To get a `bool` result from a string comparison, use the `==` operator instead. See also `naturalnocasecmp_to`, `filecasecmp_to`, and `nocasecmp_to`.

> method naturalnocasecmp_to(to: String) -> int ; qualifiers=const

Performs a **case-insensitive**, *natural order* comparison to another string. Returns `-1` if less than, `1` if greater than, or `0` if equal. "Less than" or "greater than" are determined by the [Unicode code points](https://en.wikipedia.org/wiki/List_of_Unicode_characters) of each string, which roughly matches the alphabetical order. Internally, lowercase characters are converted to uppercase for the comparison.
When used for sorting, natural order comparison orders sequences of numbers by the combined value of each digit as is often expected, instead of the single digit's value. A sorted sequence of numbered strings will be `["1", "2", "3", ...]`, not `["1", "10", "2", "3", ...]`.
With different string lengths, returns `1` if this string is longer than the `to` string, or `-1` if shorter. Note that the length of empty strings is *always* `0`.
To get a `bool` result from a string comparison, use the `==` operator instead. See also `naturalcasecmp_to`, `filenocasecmp_to`, and `casecmp_to`.

> method nocasecmp_to(to: String) -> int ; qualifiers=const

Performs a **case-insensitive** comparison to another string. Returns `-1` if less than, `1` if greater than, or `0` if equal. "Less than" or "greater than" are determined by the [Unicode code points](https://en.wikipedia.org/wiki/List_of_Unicode_characters) of each string, which roughly matches the alphabetical order. Internally, lowercase characters are converted to uppercase for the comparison.
With different string lengths, returns `1` if this string is longer than the `to` string, or `-1` if shorter. Note that the length of empty strings is *always* `0`.
To get a `bool` result from a string comparison, use the `==` operator instead. See also `casecmp_to`, `filenocasecmp_to`, and `naturalnocasecmp_to`.

> method pad_decimals(digits: int) -> String ; qualifiers=const

Formats the string representing a number to have an exact number of `digits` *after* the decimal point.

> method pad_zeros(digits: int) -> String ; qualifiers=const

Formats the string representing a number to have an exact number of `digits` *before* the decimal point.

> method path_join(path: String) -> String ; qualifiers=const

Concatenates `path` at the end of the string as a subpath, adding `/` if necessary.
**Example:** `"this/is".path_join("path") == "this/is/path"`.

> method remove_char(what: int) -> String ; qualifiers=const

Removes all occurrences of the Unicode character with code `what`. Faster version of `replace` when the key is only one character long and the replacement is `""`.

> method remove_chars(chars: String) -> String ; qualifiers=const

Removes all occurrences of the characters in `chars`. See also `remove_char`.

> method repeat(count: int) -> String ; qualifiers=const

Repeats this string a number of times. `count` needs to be greater than `0`. Otherwise, returns an empty string.

> method replace(what: String, forwhat: String) -> String ; qualifiers=const

Replaces all occurrences of `what` inside the string with the given `forwhat`.

> method replace_char(key: int, with: int) -> String ; qualifiers=const

Replaces all occurrences of the Unicode character with code `key` with the Unicode character with code `with`. Faster version of `replace` when the key is only one character long. To get a single character use `"X".unicode_at(0)` (note that some strings, like compound letters and emoji, can be composed of multiple unicode codepoints, and will not work with this method, use `length` to make sure).

> method replace_chars(keys: String, with: int) -> String ; qualifiers=const

Replaces any occurrence of the characters in `keys` with the Unicode character with code `with`. See also `replace_char`.

> method replacen(what: String, forwhat: String) -> String ; qualifiers=const

Replaces all **case-insensitive** occurrences of `what` inside the string with the given `forwhat`.

> method reverse() -> String ; qualifiers=const

Returns the copy of this string in reverse order. This operation works on unicode codepoints, rather than sequences of codepoints, and may break things like compound letters or emojis.

> method rfind(what: String, from: int = -1) -> int ; qualifiers=const

Returns the index of the **last** occurrence of `what` in this string, or `-1` if there are none. The search's start can be specified with `from`, continuing to the beginning of the string. This method is the reverse of `find`.
**Note:** A negative value of `from` is converted to a starting index by counting back from the last possible index with enough space to find `what`.
**Note:** A value of `from` that is greater than the last possible index with enough space to find `what` is considered out-of-bounds, and returns `-1`.

> method rfindn(what: String, from: int = -1) -> int ; qualifiers=const

Returns the index of the **last** **case-insensitive** occurrence of `what` in this string, or `-1` if there are none. The starting search index can be specified with `from`, continuing to the beginning of the string. This method is the reverse of `findn`.

> method right(length: int) -> String ; qualifiers=const

Returns the last `length` characters from the end of the string. If `length` is negative, strips the first `length` characters from the string's beginning.

```text
                print("Hello World!".right(3))  # Prints "ld!"
                print("Hello World!".right(-4)) # Prints "o World!"

```

> method rpad(min_length: int, character: String = " ") -> String ; qualifiers=const

Formats the string to be at least `min_length` long, by adding `character`s to the right of the string, if necessary. See also `lpad`.

> method rsplit(delimiter: String = "", allow_empty: bool = true, maxsplit: int = 0) -> PackedStringArray ; qualifiers=const

Splits the string using a `delimiter` and returns an array of the substrings, starting from the end of the string. The splits in the returned array appear in the same order as the original string. If `delimiter` is an empty string, each substring will be a single character.
If `allow_empty` is `false`, empty strings between adjacent delimiters are excluded from the array.
If `maxsplit` is greater than `0`, the number of splits may not exceed `maxsplit`. By default, the entire string is split, which is mostly identical to `split`.

```gdscript
                var some_string = "One,Two,Three,Four"
                var some_array = some_string.rsplit(",", true, 1)

                print(some_array.size()) # Prints 2
                print(some_array[0])     # Prints "One,Two,Three"
                print(some_array[1])     # Prints "Four"

```

```csharp
                // In C#, there is no String.RSplit() method.

```

> method rstrip(chars: String) -> String ; qualifiers=const

Removes a set of characters defined in `chars` from the string's end. See also `lstrip`.
**Note:** `chars` is not a suffix. Use `trim_suffix` to remove a single suffix, rather than a set of characters.

> method sha1_buffer() -> PackedByteArray ; qualifiers=const

Returns the [SHA-1](https://en.wikipedia.org/wiki/SHA-1) hash of the string as a `PackedByteArray`.

> method sha1_text() -> String ; qualifiers=const

Returns the [SHA-1](https://en.wikipedia.org/wiki/SHA-1) hash of the string as another `String`.

> method sha256_buffer() -> PackedByteArray ; qualifiers=const

Returns the [SHA-256](https://en.wikipedia.org/wiki/SHA-2) hash of the string as a `PackedByteArray`.

> method sha256_text() -> String ; qualifiers=const

Returns the [SHA-256](https://en.wikipedia.org/wiki/SHA-2) hash of the string as another `String`.

> method similarity(text: String) -> float ; qualifiers=const

Returns the similarity index ([Sørensen-Dice coefficient](https://en.wikipedia.org/wiki/S%C3%B8rensen%E2%80%93Dice_coefficient)) of this string compared to another. A result of `1.0` means totally similar, while `0.0` means totally dissimilar.

```text
                print("ABC123".similarity("ABC123")) # Prints 1.0
                print("ABC123".similarity("XYZ456")) # Prints 0.0
                print("ABC123".similarity("123ABC")) # Prints 0.8
                print("ABC123".similarity("abc123")) # Prints 0.4

```

> method simplify_path() -> String ; qualifiers=const

If the string is a valid file path, converts the string into a canonical path. This is the shortest possible path, without `"./"`, and all the unnecessary `".."` and `"/"`.

```text
                var simple_path = "./path/to///../file".simplify_path()
                print(simple_path) # Prints "path/file"

```

> method split(delimiter: String = "", allow_empty: bool = true, maxsplit: int = 0) -> PackedStringArray ; qualifiers=const

Splits the string using a `delimiter` and returns an array of the substrings. If `delimiter` is an empty string, each substring will be a single character. This method is the opposite of `join`.
If `allow_empty` is `false`, empty strings between adjacent delimiters are excluded from the array.
If `maxsplit` is greater than `0`, the number of splits may not exceed `maxsplit`. By default, the entire string is split.

```gdscript
                var some_array = "One,Two,Three,Four".split(",", true, 2)

                print(some_array.size()) # Prints 3
                print(some_array[0])     # Prints "One"
                print(some_array[1])     # Prints "Two"
                print(some_array[2])     # Prints "Three,Four"

```

```csharp
                // C#'s `Split()` does not support the `maxsplit` parameter.
                var someArray = "One,Two,Three".Split(",");

                GD.Print(someArray[0]); // Prints "One"
                GD.Print(someArray[1]); // Prints "Two"
                GD.Print(someArray[2]); // Prints "Three"

```

**Note:** If you only need one substring from the array, consider using `get_slice` which is faster. If you need to split strings with more complex rules, use the `RegEx` class instead.

> method split_floats(delimiter: String, allow_empty: bool = true) -> PackedFloat64Array ; qualifiers=const

Splits the string into floats by using a `delimiter` and returns a `PackedFloat64Array`.
If `allow_empty` is `false`, empty or invalid `float` conversions between adjacent delimiters are excluded.

```text
                var a = "1,2,4.5".split_floats(",")         # a is [1.0, 2.0, 4.5]
                var c = "1| ||4.5".split_floats("|")        # c is [1.0, 0.0, 0.0, 4.5]
                var b = "1| ||4.5".split_floats("|", false) # b is [1.0, 4.5]

```

> method strip_edges(left: bool = true, right: bool = true) -> String ; qualifiers=const

Strips all non-printable characters from the beginning and the end of the string. These include spaces, tabulations (`\t`), and newlines (`\n` `\r`).
If `left` is `false`, ignores the string's beginning. Likewise, if `right` is `false`, ignores the string's end.

> method strip_escapes() -> String ; qualifiers=const

Strips all escape characters from the string. These include all non-printable control characters of the first page of the ASCII table (values from 0 to 31), such as tabulation (`\t`) and newline (`\n`, `\r`) characters, but *not* spaces.

> method substr(from: int, len: int = -1) -> String ; qualifiers=const

Returns part of the string from the position `from` with length `len`. If `len` is `-1` (as by default), returns the rest of the string starting from the given position.

> method to_ascii_buffer() -> PackedByteArray ; qualifiers=const

Converts the string to an [ASCII](https://en.wikipedia.org/wiki/ASCII)/Latin-1 encoded `PackedByteArray`. This method is slightly faster than `to_utf8_buffer`, but replaces all unsupported characters with spaces. This is the inverse of `PackedByteArray.get_string_from_ascii`.

> method to_camel_case() -> String ; qualifiers=const

Returns the string converted to `camelCase`.

> method to_float() -> float ; qualifiers=const

Converts the string representing a decimal number into a `float`. This method stops on the first non-number character, except the first decimal point (`.`) and the exponent letter (`e`). See also `is_valid_float`.

```text
                var a = "12.35".to_float()  # a is 12.35
                var b = "1.2.3".to_float()  # b is 1.2
                var c = "12xy3".to_float()  # c is 12.0
                var d = "1e3".to_float()    # d is 1000.0
                var e = "Hello!".to_float() # e is 0.0

```

> method to_int() -> int ; qualifiers=const

Converts the string representing an integer number into an `int`. This method removes any non-number character and stops at the first decimal point (`.`). See also `is_valid_int`.

```text
                var a = "123".to_int()    # a is 123
                var b = "x1y2z3".to_int() # b is 123
                var c = "-1.2.3".to_int() # c is -1
                var d = "Hello!".to_int() # d is 0

```

> method to_kebab_case() -> String ; qualifiers=const

Returns the string converted to `kebab-case`.
**Note:** Numbers followed by a *single* letter are not separated in the conversion to keep some words (such as "2D") together.

```gdscript
                "Node2D".to_kebab_case()               # Returns "node-2d"
                "2nd place".to_kebab_case()            # Returns "2-nd-place"
                "Texture3DAssetFolder".to_kebab_case() # Returns "texture-3d-asset-folder"

```

```csharp
                "Node2D".ToKebabCase();               // Returns "node-2d"
                "2nd place".ToKebabCase();            // Returns "2-nd-place"
                "Texture3DAssetFolder".ToKebabCase(); // Returns "texture-3d-asset-folder"

```

> method to_lower() -> String ; qualifiers=const

Returns the string converted to `lowercase`.

> method to_multibyte_char_buffer(encoding: String = "") -> PackedByteArray ; qualifiers=const

Converts the string to system multibyte code page encoded `PackedByteArray`. If conversion fails, empty array is returned.
The values permitted for `encoding` are system dependent. If `encoding` is empty string, system default encoding is used.
- For Windows, see [Code Page Identifiers](https://learn.microsoft.com/en-us/windows/win32/Intl/code-page-identifiers) .NET names.
- For macOS and Linux/BSD, see `libiconv` library documentation and `iconv --list` for a list of supported encodings.

> method to_pascal_case() -> String ; qualifiers=const

Returns the string converted to `PascalCase`.

> method to_snake_case() -> String ; qualifiers=const

Returns the string converted to `snake_case`.
**Note:** Numbers followed by a *single* letter are not separated in the conversion to keep some words (such as "2D") together.

```gdscript
                "Node2D".to_snake_case()               # Returns "node_2d"
                "2nd place".to_snake_case()            # Returns "2_nd_place"
                "Texture3DAssetFolder".to_snake_case() # Returns "texture_3d_asset_folder"

```

```csharp
                "Node2D".ToSnakeCase();               // Returns "node_2d"
                "2nd place".ToSnakeCase();            // Returns "2_nd_place"
                "Texture3DAssetFolder".ToSnakeCase(); // Returns "texture_3d_asset_folder"

```

> method to_upper() -> String ; qualifiers=const

Returns the string converted to `UPPERCASE`.

> method to_utf8_buffer() -> PackedByteArray ; qualifiers=const

Converts the string to a [UTF-8](https://en.wikipedia.org/wiki/UTF-8) encoded `PackedByteArray`. This method is slightly slower than `to_ascii_buffer`, but supports all UTF-8 characters. For most cases, prefer using this method. This is the inverse of `PackedByteArray.get_string_from_utf8`.

> method to_utf16_buffer() -> PackedByteArray ; qualifiers=const

Converts the string to a [UTF-16](https://en.wikipedia.org/wiki/UTF-16) encoded `PackedByteArray`. This is the inverse of `PackedByteArray.get_string_from_utf16`.

> method to_utf32_buffer() -> PackedByteArray ; qualifiers=const

Converts the string to a [UTF-32](https://en.wikipedia.org/wiki/UTF-32) encoded `PackedByteArray`. This is the inverse of `PackedByteArray.get_string_from_utf32`.

> method to_wchar_buffer() -> PackedByteArray ; qualifiers=const

Converts the string to a [wide character](https://en.wikipedia.org/wiki/Wide_character) (`wchar_t`, UTF-16 on Windows, UTF-32 on other platforms) encoded `PackedByteArray`. This is the inverse of `PackedByteArray.get_string_from_wchar`.

> method trim_prefix(prefix: String) -> String ; qualifiers=const

Removes the given `prefix` from the start of the string, or returns the string unchanged.

> method trim_suffix(suffix: String) -> String ; qualifiers=const

Removes the given `suffix` from the end of the string, or returns the string unchanged.

> method unicode_at(at: int) -> int ; qualifiers=const

Returns the character code at position `at`.
See also `String.chr`, `@GDScript.char`, and `@GDScript.ord`.

> method uri_decode() -> String ; qualifiers=const

Decodes the string from its URL-encoded format. This method is meant to properly decode the parameters in a URL when receiving an HTTP request. See also `uri_encode`.

```gdscript
                var url = "$DOCS_URL/?highlight=Godot%20Engine%3%docs"
                print(url.uri_decode()) # Prints "$DOCS_URL/?highlight=Godot Engine:docs"

```

```csharp
                var url = "$DOCS_URL/?highlight=Godot%20Engine%3%docs"
                GD.Print(url.URIDecode()) // Prints "$DOCS_URL/?highlight=Godot Engine:docs"

```

**Note:** This method decodes `+` as space.

> method uri_encode() -> String ; qualifiers=const

Encodes the string to URL-friendly format. This method is meant to properly encode the parameters in a URL when sending an HTTP request. See also `uri_decode`.

```gdscript
                var prefix = "$DOCS_URL/?highlight="
                var url = prefix + "Godot Engine:docs".uri_encode()

                print(url) # Prints "$DOCS_URL/?highlight=Godot%20Engine%3%docs"

```

```csharp
                var prefix = "$DOCS_URL/?highlight=";
                var url = prefix + "Godot Engine:docs".URIEncode();

                GD.Print(url); // Prints "$DOCS_URL/?highlight=Godot%20Engine%3%docs"

```

> method uri_file_decode() -> String ; qualifiers=const

Decodes the file path from its URL-encoded format. Unlike `uri_decode` this method leaves `+` as is.

> method validate_filename() -> String ; qualifiers=const

Returns a copy of the string with all characters that are not allowed in `is_valid_filename` replaced with underscores.

> method validate_node_name() -> String ; qualifiers=const

Returns a copy of the string with all characters that are not allowed in `Node.name` (`.` `:` `@` `/` `"` `%`) replaced with underscores.

> method xml_escape(escape_quotes: bool = false) -> String ; qualifiers=const

Returns a copy of the string with special characters escaped using the XML standard. If `escape_quotes` is `true`, the single quote (`'`) and double quote (`"`) characters are also escaped.

> method xml_unescape() -> String ; qualifiers=const

Returns a copy of the string with escaped characters replaced by their meanings according to the XML standard.

## Operators

> operator !=(right: String) -> bool

Returns `true` if this `StringName` is not equivalent to the given `String`.

> operator !=(right: StringName) -> bool

Returns `true` if the `StringName` and `right` do not refer to the same name. Comparisons between `StringName`s are much faster than regular `String` comparisons.

> operator %(right: Variant) -> String

Formats the `StringName`, replacing the placeholders with one or more parameters, returning a `String`. To pass multiple parameters, `right` needs to be an `Array`.
For more information, see the [GDScript format strings]($DOCS_URL/tutorials/scripting/gdscript/gdscript_format_string.html) tutorial.
**Note:** In C#, this operator is not available. Instead, see [how to interpolate strings with "$"](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/tokens/interpolated).

> operator +(right: String) -> String

Appends `right` at the end of this `StringName`, returning a `String`. This is also known as a string concatenation.

> operator +(right: StringName) -> String

Appends `right` at the end of this `StringName`, returning a `String`. This is also known as a string concatenation.

> operator <(right: StringName) -> bool

Returns `true` if the left `StringName`'s pointer comes before `right`. Note that this will not match their [Unicode order](https://en.wikipedia.org/wiki/List_of_Unicode_characters).

> operator <=(right: StringName) -> bool

Returns `true` if the left `StringName`'s pointer comes before `right` or if they are the same. Note that this will not match their [Unicode order](https://en.wikipedia.org/wiki/List_of_Unicode_characters).

> operator ==(right: String) -> bool

Returns `true` if this `StringName` is equivalent to the given `String`.

> operator ==(right: StringName) -> bool

Returns `true` if the `StringName` and `right` refer to the same name. Comparisons between `StringName`s are much faster than regular `String` comparisons.

> operator >(right: StringName) -> bool

Returns `true` if the left `StringName`'s pointer comes after `right`. Note that this will not match their [Unicode order](https://en.wikipedia.org/wiki/List_of_Unicode_characters).

> operator >=(right: StringName) -> bool

Returns `true` if the left `StringName`'s pointer comes after `right` or if they are the same. Note that this will not match their [Unicode order](https://en.wikipedia.org/wiki/List_of_Unicode_characters).
