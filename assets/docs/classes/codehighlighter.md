# CodeHighlighter

> class CodeHighlighter
> inherits CodeHighlighter SyntaxHighlighter

## Brief

A syntax highlighter intended for code.

## Description

By adjusting various properties of this resource, you can change the colors of strings, comments, numbers, and other text patterns inside a `TextEdit` control.

## Properties

> property color_regions : Dictionary ; default={} ; setter=set_color_regions ; getter=get_color_regions

Sets the color regions. All existing regions will be removed. The `Dictionary` key is the region start and end key, separated by a space. The value is the region color.

> property function_color : Color ; default=Color(0, 0, 0, 1) ; setter=set_function_color ; getter=get_function_color

Sets color for functions. A function is a non-keyword string followed by a '('.

> property keyword_colors : Dictionary ; default={} ; setter=set_keyword_colors ; getter=get_keyword_colors

Sets the keyword colors. All existing keywords will be removed. The `Dictionary` key is the keyword. The value is the keyword color.

> property member_keyword_colors : Dictionary ; default={} ; setter=set_member_keyword_colors ; getter=get_member_keyword_colors

Sets the member keyword colors. All existing member keyword will be removed. The `Dictionary` key is the member keyword. The value is the member keyword color.

> property member_variable_color : Color ; default=Color(0, 0, 0, 1) ; setter=set_member_variable_color ; getter=get_member_variable_color

Sets color for member variables. A member variable is non-keyword, non-function string proceeded with a '.'.

> property number_color : Color ; default=Color(0, 0, 0, 1) ; setter=set_number_color ; getter=get_number_color

Sets the color for numbers.

> property symbol_color : Color ; default=Color(0, 0, 0, 1) ; setter=set_symbol_color ; getter=get_symbol_color

Sets the color for symbols.

## Methods

> method add_color_region(start_key: String, end_key: String, color: Color, line_only: bool = false) -> void

Adds a color region (such as for comments or strings) from `start_key` to `end_key`. Both keys should be symbols, and `start_key` must not be shared with other delimiters.
If `line_only` is `true` or `end_key` is an empty `String`, the region does not carry over to the next line.

> method add_keyword_color(keyword: String, color: Color) -> void

Sets the color for a keyword.
The keyword cannot contain any symbols except '_'.

> method add_member_keyword_color(member_keyword: String, color: Color) -> void

Sets the color for a member keyword.
The member keyword cannot contain any symbols except '_'.
It will not be highlighted if preceded by a '.'.

> method clear_color_regions() -> void

Removes all color regions.

> method clear_keyword_colors() -> void

Removes all keywords.

> method clear_member_keyword_colors() -> void

Removes all member keywords.

> method get_keyword_color(keyword: String) -> Color ; qualifiers=const

Returns the color for a keyword.

> method get_member_keyword_color(member_keyword: String) -> Color ; qualifiers=const

Returns the color for a member keyword.

> method has_color_region(start_key: String) -> bool ; qualifiers=const

Returns `true` if the start key exists, else `false`.

> method has_keyword_color(keyword: String) -> bool ; qualifiers=const

Returns `true` if the keyword exists, else `false`.

> method has_member_keyword_color(member_keyword: String) -> bool ; qualifiers=const

Returns `true` if the member keyword exists, else `false`.

> method remove_color_region(start_key: String) -> void

Removes the color region that uses that start key.

> method remove_keyword_color(keyword: String) -> void

Removes the keyword.

> method remove_member_keyword_color(member_keyword: String) -> void

Removes the member keyword.
