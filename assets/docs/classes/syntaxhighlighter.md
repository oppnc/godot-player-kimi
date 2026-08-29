# SyntaxHighlighter

> class SyntaxHighlighter
> inherits SyntaxHighlighter Resource

## Brief

Base class for syntax highlighters. Provides syntax highlighting data to a `TextEdit`.

## Description

Base class for syntax highlighters. Provides syntax highlighting data to a `TextEdit`. The associated `TextEdit` will call into the `SyntaxHighlighter` on an as-needed basis.
**Note:** A `SyntaxHighlighter` instance should not be used across multiple `TextEdit` nodes.

## Methods

> method _clear_highlighting_cache() -> void ; qualifiers=virtual

Virtual method which can be overridden to clear any local caches.

> method _get_line_syntax_highlighting(line: int) -> Dictionary ; qualifiers=virtual const

Virtual method which can be overridden to return syntax highlighting data.
See `get_line_syntax_highlighting` for more details.

> method _update_cache() -> void ; qualifiers=virtual

Virtual method which can be overridden to update any local caches.

> method clear_highlighting_cache() -> void

Clears all cached syntax highlighting data.
Then calls overridable method `_clear_highlighting_cache`.

> method get_line_syntax_highlighting(line: int) -> Dictionary

Returns the syntax highlighting data for the line at index `line`. If the line is not cached, calls `_get_line_syntax_highlighting` first to calculate the data.
Each entry is a column number containing a nested `Dictionary`. The column number denotes the start of a region, the region will end if another region is found, or at the end of the line. The nested `Dictionary` contains the data for that region. Currently only the key `"color"` is supported.
**Example:** Possible return value. This means columns `0` to `4` should be red, and columns `5` to the end of the line should be green:

```text
                {
                    0: {
                        "color": Color(1, 0, 0)
                    },
                    5: {
                        "color": Color(0, 1, 0)
                    }
                }

```

> method get_text_edit() -> TextEdit ; qualifiers=const

Returns the associated `TextEdit` node.

> method update_cache() -> void

Clears then updates the `SyntaxHighlighter` caches. Override `_update_cache` for a callback.
**Note:** This is called automatically when the associated `TextEdit` node, updates its own cache.
